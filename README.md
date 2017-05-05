# puppet_MT
puppet code 

This ia an Nginx Module which installed the Nginx
And create a Two Nginx websites which automates the changing of /etc/host files.
and create two html files index.html and systeminformation.html to retrive
system information

To check result in agent curl with the websitename to see the result
> curl site1.puppet.pandu.in
> curl site2.puppet.pandu.in
> curl site1.puppet.pandu.in/systeminformation.html
> curl site2.puppet.pandu.in/systeminformation.html

