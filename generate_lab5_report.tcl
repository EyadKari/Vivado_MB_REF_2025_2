set script_path [file normalize [info script]]
set script_folder [file dirname $script_path]
set old_folder [ pwd ]
cd $script_folder

# change if you used different project names and paths
set BINARY_NAMES [ glob -nocomplain "vitis_project/*apsm*/Debug/*apsm*.elf" ]
set BINARY_PATH [ lindex $BINARY_NAMES 0 ] 

variable outputname
set outputname "Lab5_NACHNAME_MNUMMER.labrpt"
file delete $outputname

source -notrace repgen.tcl
if [file exists $outputname] {
    exec wish repgenok.tcl -name Erfolg &
}

cd $old_folder
