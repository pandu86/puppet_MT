#Manage Nginx installed if it is not avaliable

class nginx {
        package { 'nginx': ensure => installed }

        service { 'nginx':
           ensure => running,
           enable => true,
           require => Package['nginx']
        }

        exec { 'reload nginx' :
            command  => '/usr/sbin/service nginx reload',
            require  => Package['nginx'],
            refreshonly => true,
         }
}
