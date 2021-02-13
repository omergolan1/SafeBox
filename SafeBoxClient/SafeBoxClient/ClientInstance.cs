using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SafeBoxClient
{
    class ClientInstance 
    {
        public static client cl;
        public static string connect_string;

        public ClientInstance ()
        {
            cl = new client(4445, "127.0.0.1");
            connect_string = File.ReadAllText("Config.txt");
        }
    }
}
