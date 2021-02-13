import re
import threading
from socket import *
import pymysql
import os
import shutil
import time

# connect to the sql server
try:
    conn = pymysql.connect(host="remotemysql.com", user="LIrQaCVahQ", password="WqODbD6X4v", db="LIrQaCVahQ")
    mycursor = conn.cursor()
except:
    print("sql error")

try:
    server = socket(AF_INET, SOCK_STREAM)
    server.bind(("0.0.0.0", 4445))
    server.listen(5)
except:
    print("connection error")


# WqODbD6X4v

def get_size(path):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            # skip if it is symbolic link
            if not os.path.islink(fp):
                total_size += os.path.getsize(fp)

    return total_size


def login(username, password):
    """
    check if the username and the password place in the database
    :param username:
    :param password:
    :return: id and message to the client
    """
    Ltrue = False
    id = ""
    mycursor.execute("SELECT * FROM users")
    myresult = mycursor.fetchall()

    for x in myresult:




        if x[1] == username and x[2] == password:
            id = x[0]
            Ltrue = True
    if Ltrue:
        return id, "login successfully"
    else:
        return "NaN", "wrong password or username"


def register(username, password):
    """
    create new user in the data base
    :param username:
    :param password:
    :return: if the user allready exsit in the database return "user exist" else return login successfully
    """
    userExist = False
    mycursor.execute("SELECT * FROM users")
    myresult = mycursor.fetchall()
    for x in myresult:
        if x[1] == username:
            userExist = True
    if userExist:
        return "user exist"
    else:
        sql = ("INSERT INTO users (username, pass) VALUES (%s, %s)")
        val = (username, password)
        mycursor.execute(sql, val)
        conn.commit()
        os.system(r"md C:\Cyber\SafeBoxOnlline\\" + str(mycursor.lastrowid))
        return "register successfully"


def deleteUser(username, password):
    """
    delete user from the database
    :param username:
    :param password:
    :return: wrong password or username or delete successfully
    """
    delBool = False
    mycursor.execute("SELECT * FROM users")
    myresult = mycursor.fetchall()
    for x in myresult:
        if x[1] == username and x[2] == password:
            try:
                shutil.rmtree(r"C:\Cyber\SafeBoxOnlline\\" + str(x[0]))
            except:
                print("file not found")
            delBool = True
    if delBool:
        sql = "DELETE FROM users WHERE username = %s"
        adr = (username,)
        mycursor.execute(sql, adr)
        conn.commit()
        return "user delete successfully"
    else:
        return "wrong password or username"


def fileTransferToClient(id, filename, client):
    """
    transfer the selected file to the client
    :param id: id of the user=user folder
    :param filename: name of the file
    :param client:
    :return:
    """
    path = (r"C:\Cyber\SafeBoxOnlline\\" + id + r"\\" + filename)
    size = os.path.getsize(path)
    if size == 0:
        client.send(b"empty file")
    else:
        with open(path, "rb") as f:
            file_data = f.read(1024)
            while (file_data):
                client.send(file_data)
                file_data = f.read(1024)
            client.send(b'endofthefile')


def fileTransferToServer(id, filename, client):
    """
transfer the selected file to the server from the client
    :param id: id of the user=user folder
    :param filename: name of the file
    :param client:
    :return:
    """
    path = (r"C:\Cyber\SafeBoxOnlline\\" + id + r"\\" + filename)
    files_and_directories = os.listdir(r"C:\Cyber\SafeBoxOnlline\\" + id)
    if len(files_and_directories) == 9:
        client.send(b'there 9 files in the folder, delete some files')
    else:
        client.send(b'upload successfully')
        with open(path, "wb") as f:
            while True:
                data = (client.recv(1024))
                if data[-12:] == b'endofthefile':
                    f.write(data[:-12])
                    break
                else:
                    f.write(data)

            print("file upload secssfuly")

        if (get_size(r"C:\Cyber\SafeBoxOnlline\\" + id)>500000000 ):
            os.remove(r"C:\Cyber\SafeBoxOnlline\\" + id + r"\\" + filename)
            client.send(b' overLengh')
        else:
            client.send(b' end upload')




def deleteFile(id, filename):
    """
    delete the selected file from the server
    :param id: id of the user- folder name
    :param filename:
    :return:
    """
    try:

        os.remove(r"C:\Cyber\SafeBoxOnlline\\" + id + r"\\" + filename)
        return "delete file successfully"
    except:
        return "delete file problem"


def refreshP(id):
    """
    refresh the page with the files in the client
    :param id: id: id of the user- folder name
    :return: list of files else return NaN(no files)
    """
    if id != "NaN":
        files_and_directories = os.listdir(r"C:\Cyber\SafeBoxOnlline\\" + id)
        files = " ".join(files_and_directories)
        if files == "":
            return "NaN"

        return files+" "+str(get_size(r"C:\Cyber\SafeBoxOnlline\\" + id))

    else:
        return "NaN"



def clinetCon(client, addr):
    """
    main server connection to the clients call with theards
    :param client:
    :param addr:
    :return:
    """

    data = ""
    id = "NaN"
    try:
        while True:
            data = client.recv(1024)
            data = data.decode()

            if data == "closeCON":
                print(str(addr[0]) + " disconnect")
                break
            elif data[0] == "1":  # register
                delimiterData = data.split()
                regInfo = (register(delimiterData[2], delimiterData[1]))
                print(str(addr[0]) + " " + regInfo)
                client.send(regInfo.encode())
            elif data[0] == "2":  # login
                delimiterData = data.split()
                id, message = (login(delimiterData[2], delimiterData[1]))
                id = str(id)
                print(str(addr[0]) + " " + message)
                client.send(message.encode())

            elif data[0] == "3":  # delete user
                delimiterData = data.split()
                delInfo = (deleteUser(delimiterData[2], delimiterData[1]))
                print(str(addr[0]) + " " + delInfo)
                client.send(delInfo.encode())
            elif data[0] == "4":  # refreshP
                client.send(refreshP(id).encode())

            elif data[0] == "5":  # send file
                delimiterData = data.split()
                print("[+] Sending file... to :" + addr[0])
                fileTransferToClient(id, delimiterData[1], client)
                print("file send")
            elif data[0] == "6":  # get file
                delimiterData = data.split()
                fileTransferToServer(id, delimiterData[1], client)
            elif data[0] == "7":  # delete file
                delimiterData = data.split()
                delInfo = (deleteFile(id, delimiterData[1]))
                print(str(addr[0]) + " " + delInfo)
                client.send(delInfo.encode())
        client.close()
    except Exception as e:
        print(e)


while True:
    print("waiting for connection...")
    client, addr = server.accept()
    print("connect from: " + str(addr[0]))
    t = threading.Thread(target=clinetCon, args=(client, addr))
    t.start()
