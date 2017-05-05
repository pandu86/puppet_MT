# nginx class for modifying hosts file

class nginx::etchosts($servername) {

        file { "/etc/hosts" :
                content => template("nginx/hosts.erb"),
          }
}
