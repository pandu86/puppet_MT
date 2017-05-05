# manage an Nginx virtual host

class nginx::vhost($domain='UNSET' ,$root='UNSET') {

 # cretae the default parent root once
   $default_parent_root = "/home/ubuntu/nginxsites-puppet"
   $dir_tree = [ "$default_parent_root" ]
   file { $dir_tree :
        owner => 'ubuntu',
        group => 'ubuntu',
        ensure => 'directory',
        mode   => '777',
    }

   define createwebsite ( $domain="UNSET" ,$root='UNSET') {

         include nginx

        # default value overrides

          if $domain == 'UNSET' {
                $vhost_domain = $name
            } else {
                $vhost_domain = $domain
           }

        if $root == 'UNSET' {
              $vhost_root = "$default_parent_root/${name}"
          } else {
            $vhost_root = $root
          }

        #creating the virtual host conf file out of the template in nginx/templates directory

        file { "/etc/nginx/sites-available/${vhost_domain}.conf":
                content => template('nginx/vhost.erb'),
                require => Package['nginx'],
                notify  => Exec['reload nginx'],
          }

        #Enabling the site by creating a symbloic link

        file { "/etc/nginx/sites-enabled/${vhost_domain}.conf":
                ensure  => link,
                target  => "/etc/nginx/sites-available/${vhost_domain}.conf",
                require => File["/etc/nginx/sites-available/${vhost_domain}.conf"],
                notify  => Exec['reload nginx'],
            }

        addStaticFiles{ "staticfile-${vhost_root}hs" :
                default_parent_root => $default_parent_root,
                vhost_root => $vhost_root,
                vhost_domain => $vhost_domain
        }
    }

     define addStaticFiles( $default_parent_root , $vhost_root , $vhost_domain ) {

        include nginx::systeminformation

        $dir_tree = [  "$vhost_root" ]
         file { $dir_tree :
                owner  => 'ubuntu',
                group  => 'ubuntu',
                ensure => 'directory',
                mode   => '777',
          }
          ->   # this arrow ensures that the dir structure is created first
          file { ["$vhost_root/index.html"]:
                  owner  => 'ubuntu',
                  group  => 'ubuntu',
                  source => "puppet:///modules/nginx/${vhost_domain}/index-html",
                  mode   => '755',
           } 
	   ->
          file { [ "$vhost_root/systeminformation.html"] :
                 content => template("nginx/systeminformation.erb"),
           }


      }



}
