#!/usr/bin/tclsh

namespace eval andy {

set aa ppppppp
set str " sysDescr.0"
}
namespace eval shit {
    variable a fuck
}

proc shit::ok { } {
variable a
puts $andy::aa
set cmd "snmpget -v2c -c private 192.168.3.53"
append cmd $andy::str
eval $cmd

}

shit::ok
