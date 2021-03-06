#!/bin/tcl
# this is the user interface to start running one or more test suits

# -tester		str				mandatory		default: null
# -prjname		str				mandatory		default: null
# -tsname		str				mandatory		default: null
# -tclist		list			optional		default: all
# runTestSuit -tester markw -prjname ion2011august -tsname testsuit_vlan -tclist 1,2,4-8

source ./api/loader/loader.tcl

#runTestSuit -tester markw -prjname ion2011august -tsname testsuit_example -tclist 1-4

#source ./testsuits/ion2011august/testsuit_mac/testsuit_mac_para.tcl
	set ::sutIpAddr 192.168.0.61
	set ::sutSlot 16
	set ::portNo 4
	set ::sutP1 1
	set ::sutP2 2
	set ::sutP3 3
	set ::vlanid 10
	set ::ixiaIpAddr 192.168.1.22
	set ::ixiaPort1 2,1
	set ::ixiaPort2 2,2
	set ::ixiaPort3 3,3
	
	set ::ixiaMac1 "01 00 5e 00 00 05"
	set ::ixiaMac2 "00 00 00 00 00 02"
	set ::ixiaMac3 "00 00 00 00 5e 05"
	set ::ixiaFrameSize 100
	set ::ixiaSendRate 100
	set ::ixiaRunTime 1
	set ::testerName fieldt
	
	set ::ratePercentage 30
	set ::rateCount 10
   # login -ipaddr  $::sutIpAddr -sutname $::sutSlot
    #login IXIA
	connect_ixia -ipaddr $::ixiaIpAddr -portlist $::ixiaPort2,ixiap2 -alias allport -loginname andyIxia
	puts "start config_portprop"
	config_portprop -alias ixiap2 -autonego enable -phymode fiber
	puts "stop config_portprop"
	puts "start config_frame"
	config_frame -alias ixiap2 -frametype ethernetii -vlanmode none -srcmac $::ixiaMac3 -dstmac $::ixiaMac1 -srcip 192.168.3.66 -dstip 225.0.0.5 -igmptype v2report -groupip 228.0.0.9
	puts "stop config_frame"

	#config_portprop -alias ixiap2 -autonego enable -phymode copper
	#config_portprop -alias ixiap3 -autonego enable -phymode copper
	
	#config_frame -alias ixiap2 -srcmac $::ixiaMac2 -dstmac $::ixiaMac3 -framesize $::ixiaFrameSize
	config_stream -alias ixiap2 -sendmode stopstrm  -pktperbst 1 -ratemode fps -fpsrate 1
	#config_frame -alias ixiap1 -vlanmode none -srcmac "33 00 00 00 05 08" -dstmac $::ixiaMac1 -framesize $::ixiaFrameSize
	send_traffic -alias ixiap2 -actiontype start
	send_traffic -alias ixiap2 -actiontype start
	send_traffic -alias ixiap2 -actiontype start
	send_traffic -alias ixiap2 -actiontype start
