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
    /// Interaction logic for delUser.xaml
    /// </summary>
    public partial class delUser : Window
    {
        public delUser()
        {
            InitializeComponent();
        }


        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            App.Current.MainWindow.Show();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (passwordBox.Password != "" && usernameBox.Text != "")
            {
                string message = dataProtocol.deleteUser.ToString("d") + " " + passwordBox.Password + " " + usernameBox.Text;
                string reciveData;
                reciveData = ClientInstance.cl.sendData(message);
                if (reciveData == "user delete successfully")
                {
                    this.Close();
                    App.Current.MainWindow.Show();
                }
            }
            else
                MessageBox.Show("fill both fields");
        }
    }
}
