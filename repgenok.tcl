label .l1 -text "Report-Generierung erfolgreich." -font {-size 18}
button .b1 -text "OK" -command "destroy ." -font {-size 18}

# Put them in the window in row order
grid .l1 -row 0
grid .b1 -row 1
