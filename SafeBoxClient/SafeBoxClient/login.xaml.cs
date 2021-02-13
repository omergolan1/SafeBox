using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace SafeBoxClient
{
    /// <summary>
    /// Interaction logic for login.xaml
    /// </summary>
    public partial class login : Window
    {
        private bool showMenu = true;
        public login()
        {
            InitializeComponent();
        }


        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (showMenu)
                App.Current.MainWindow.Show();
        }

        private void Image_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (passBox.Password != "" && usernameBox.Text != "")
            {
                string message = dataProtocol.login.ToString("d") + " " + passBox.Password + " " + usernameBox.Text;
                string reciveData;
                reciveData = ClientInstance.cl.sendData(message);

                if (reciveData == "login successfully")
                {

                    userWindow uw = new userWindow();
                    uw.Show();

                    showMenu = false;
                    this.Close();
                }
            }
            else
                MessageBox.Show("fill both fields");
        }
    }
    
}
