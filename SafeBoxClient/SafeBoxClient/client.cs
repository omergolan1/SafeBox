using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace SafeBoxClient
{


    class client 
    {
        public static Socket socket;
        private int port;
        private IPEndPoint ipPoint;
        public static bool ServerExist=true;
        public static string filePath2func;

        public delegate void FileEventHandler(object soruce, EventArgs args);

        public event FileEventHandler ChangeFileEvent;

        public client(int port, string ip)
        {
            this.port= Convert.ToInt32(port);
            this.ipPoint= new IPEndPoint(IPAddress.Parse(ip), port);
            socket= new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            ServerExist = true;
            try
            {
                socket.Connect(ipPoint);
            }
            catch
            {
                ServerExist = false;
                MessageBox.Show("server dont exists");
                Environment.Exit(0);
            }

        }
        public string sendData(string message)
        {
            try
            {
                byte[] data = Encoding.ASCII.GetBytes(message);
                socket.Send(data);

                //server send
                StringBuilder builder = new StringBuilder();
                int bytes = 0;

                do
                {
                    bytes = socket.Receive(data, data.Length, 0);
                    builder.Append(Encoding.ASCII.GetString(data, 0, bytes));
                }
                while (socket.Available > 0);
                if (message != dataProtocol.refPage.ToString("d"))
                    MessageBox.Show(builder.ToString());
                return builder.ToString();
            }
            catch 
            {
                ServerExist = false;
                MessageBox.Show("send data error");
                return "NaN";
            }
        }
        public void downloadFile(string filename, string filePath)
        {

            byte[] data = Encoding.ASCII.GetBytes(dataProtocol.sendfile.ToString("d")+" " + @"..\40\x.PNG");
            socket.Send(data);
            filePath2func = filePath;

            using (var output = File.Create(filePath2func))
            {
                StringBuilder builder = new StringBuilder();

                var buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = socket.Receive(buffer, buffer.Length, 0)) > 0)
                {
                    builder.Append(Encoding.ASCII.GetString(buffer, 0, bytesRead));
                    if (builder.ToString() == "empty file")
                        break;

                    int indexOfend = builder.ToString().IndexOf("endofthefile");

                    if (builder.ToString().Substring(indexOfend == -1 ? 0 : indexOfend) == "endofthefile")
                    {

                        output.Write(buffer, 0, bytesRead - 12);
                        break;
                    }
                    else
                        output.Write(buffer, 0, bytesRead);
                    builder.Append(Encoding.ASCII.GetString(buffer, 0, bytesRead));

                }

                OnendOftransferFile();
            }


            //Thread move1 = new Thread(dfileTheard);
            //move1.Start();


        }

        public void UploadFile(string filename, string filePath)
        {
            var buffer = new byte[1024];

            byte[] data = Encoding.ASCII.GetBytes(dataProtocol.uploadfile.ToString("d") + " " + filename);
            socket.Send(data);



            //server send
            StringBuilder builder = new StringBuilder();
            int bytes = 0;

            do
            {
                bytes = socket.Receive(data, data.Length, 0);
                builder.Append(Encoding.ASCII.GetString(data, 0, bytes));
            }
            while (socket.Available > 0);

           
            if (builder.ToString() == "upload successfully")
            {
                socket.SendFile(filePath);
                byte[] d = Encoding.ASCII.GetBytes("endofthefile");
                socket.Send(d);
            }
            if (builder.ToString() == "there 9 files in the folder, delete some files")
            {
                MessageBox.Show(builder.ToString());
                OnendOftransferFile();
            }
            else
            {
                do
                {
                    bytes = socket.Receive(data, data.Length, 0);
                    builder.Append(Encoding.ASCII.GetString(data, 0, bytes));
                }
                while (socket.Available > 0);
                if (builder.ToString() == "upload successfully end upload")
                {
                    MessageBox.Show(builder.ToString());
                    OnendOftransferFile();
                }
                else if (builder.ToString() == "upload successfully overLengh")
                {
                    MessageBox.Show(builder.ToString());
                    OnendOftransferFile();
                }
            }

        }




        //public void dfileTheard()
        //{
        //    using (var output = File.Create(filePath2func))
        //    {
        //        StringBuilder builder = new StringBuilder();

        //        var buffer = new byte[1024];
        //        int bytesRead;
        //        while ((bytesRead = socket.Receive(buffer, buffer.Length, 0)) > 0)
        //        {
        //            builder.Append(Encoding.ASCII.GetString(buffer, 0, bytesRead));
        //            if (builder.ToString() == "empty file")
        //                break;

        //            int indexOfend = builder.ToString().IndexOf("endofthefile");
                    
        //            if (builder.ToString().Substring(indexOfend==-1?0: indexOfend) == "endofthefile")
        //            {
                        
        //                output.Write(buffer, 0, bytesRead-12);
        //                break;
        //            }
        //            else
        //                output.Write(buffer, 0, bytesRead);
        //            builder.Append(Encoding.ASCII.GetString(buffer, 0, bytesRead));

        //        }

        //        OnendOftransferFile();
        //    }


            
        //}
        protected virtual void OnendOftransferFile()
        {
            if (ChangeFileEvent != null)
            {
                ChangeFileEvent(this, EventArgs.Empty);
            }
        }
    }
}
