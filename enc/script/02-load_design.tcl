#################################
# LOAD DESIGN
#################################


### DESIGN SETUP ################################################
#
# Set top module name:
set TOP_LEVEL_MODULE	"Controller_FIR"
#
#################################################################


# Load Design (synthesized gate-level netlist):
set init_verilog ../syn/netlist/${TOP_LEVEL_MODULE}_gl.v

# Define preCTS timing constraints (.sdc file generated by synthesis):
create_constraint_mode -name timing_constraints -sdc_files ../syn/netlist/${TOP_LEVEL_MODULE}_timing.sdc

# Init Design:
init_design

# Fit on screen:
fit

# Check design:
checkDesign -all

# Save the Design:
saveDesign designs/${TOP_LEVEL_MODULE}_loaded.enc
