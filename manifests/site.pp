
node default {

        nginx::vhost::createwebsite { "web1site" :
               domain => "site1.puppet.pandu.in",
               root  =>  "/home/ubuntu/site1"
          }

        nginx::vhost::createwebsite { "web2site" :
                domain => "site2.puppet.pandu.in",
                root  => "/home/ubuntu/site2"
         }

     $servers =[

         {
          ip_address => '127.0.0.1',
          hostname => 'site1.puppet.pandu.in'
         },
         {
          ip_address => '127.0.0.1',
          hostname => 'site2.puppet.pandu.in'
         }
      ]
     class { 'nginx::etchosts' :
                servername => $servers
        }
}

