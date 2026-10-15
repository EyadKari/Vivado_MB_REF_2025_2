package require uuid
package require md5
package require fileutil

report_timing -file $outputname
set MAC [ exec ip link | grep ether | cut -d\  -f6 ]
set IPADDR [ exec ip addr | grep "inet " | grep -v "127." | cut -d\  -f6 ]
if { [ file exists "${BINARY_PATH}" ] } {
	set dbs [ file size "${BINARY_PATH}" ]
} else {
	error "ERROR: ${BINARY_PATH}  does not exist. Aborting report generation."
}

set rp [ open $outputname a ]
puts $rp "LINKADDR $MAC"
puts $rp "IPADDR $IPADDR"
close $rp
set sfp [ open $outputname r ]
set text [ read $sfp ]
close $sfp
set lindex [ string first "| Host" $text 0 ]
set lindex [ string first ":" $text $lindex ]
set rindex [ string first " " $text $lindex+2 ]
set HST [ string range $text $lindex $rindex-1 ]
set lindex [ string first "| Date" $text 0 ]
set lindex [ string first ":" $text $lindex ]
set systemTime [clock seconds]
set systemYear [clock format $systemTime -format {%Y}]
set rindex [ string first "${systemYear}" $text $lindex+2 ]
set DTE [ string range $text $lindex $rindex+3 ]
set fp [ open $outputname a+ ]
puts $fp "HSTDTE $HST $DTE"
puts $fp "DBS: $dbs"
close $fp
report_utilization -file $outputname -append


set fp [ open $outputname r+ ]
set rep_data [ read $fp ]
set cs [md5::md5 -hex $rep_data]
puts $fp "CHKSMDV"
puts $fp $cs
close $fp
