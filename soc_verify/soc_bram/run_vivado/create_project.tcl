create_project -force loongson ./project -part xc7a200tfbg676-1

# Add conventional sources
add_files -scan_for_includes [glob -nocomplain ../rtl/*.v]
add_files -scan_for_includes [glob -nocomplain ../rtl/*/*.v]

# Add IPs
add_files -quiet [glob -nocomplain ../rtl/xilinx_ip/*/*.xci]

# Add simulation files
add_files -fileset sim_1 ../testbench/mycpu_tb.v

# Add myCPU
add_files -scan_for_includes ../../../myCPU

# Add constraints
add_files -fileset constrs_1 -quiet ./constraints

set_property -name "top" -value "tb_top" -objects  [get_filesets sim_1]
set_property -name "xsim.simulate.log_all_signals" -value "1" -objects [get_filesets sim_1]
