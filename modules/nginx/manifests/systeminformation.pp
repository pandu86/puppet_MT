
# nginx class to gather system information

class nginx::systeminformation {

        $systeminformationdata = [
                {
                    metric => $::puppetversion,
                    description => " puppet version of the server "
                },
                {
                    metric => $::rubyplatform,
                    description => " ruby Platform "
                },
                {
                    metric => $::kernelmajversion,
                    description => " kernel maj version of the server "
                },
                {
                    metric => $::kernelrelease,
                    description => "kernel release of the server "
                }
        ]
}
