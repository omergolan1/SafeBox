using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SafeBoxClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 

    

    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
            ClientInstance  cl = new ClientInstance ();

        }



        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (client.ServerExist)
            {
                string message = "closeCON";
                byte[] data = Encoding.ASCII.GetBytes(message);
                try
                {
                    client.socket.Send(data);
                }
                catch
                {
                    MessageBox.Show("server closed");
                }
                client.socket.Close();
            }
        }

        private void LoginIMGBTN_MouseDown(object sender, MouseButtonEventArgs e)
        {
            login r = new login();
            r.Show();
            this.Hide();
        }

        private void RegisterIMGBTN_MouseDown(object sender, MouseButtonEventArgs e)
        {
            register r = new register();
            r.Show();
            this.Hide();
        }

        private void DeleteUserBTN_MouseDown(object sender, MouseButtonEventArgs e)
        {
            delUser u = new delUser();
            u.Show();
            this.Hide();
        }
    }
}
