
node "ip-172-31-15-72.us-west-2.compute.internal" {
    file { '/tmp/mastersuccess.txt' :
         ensure => present,
	 mode => 0644,
	 content => "Hay i am from master ,| IP Address: ${ipaddress_eth0} \n PuppetVersion : ${puppetversion} \n Rubbyplatform : ${rubyplatform} \n Kernal mj version : ${kernelmajversion} \n Kernal Release : ${kernelrelease} "

 	}
}

