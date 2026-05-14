## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]
      set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports { EnableWrite }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { EnableWrite }]
set_property PACKAGE_PIN V16 [get_ports { video_source_switch }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { video_source_switch }]
set_property PACKAGE_PIN W16 [get_ports { stream_select[0] }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { stream_select[0] }]
set_property PACKAGE_PIN W17 [get_ports { stream_select[1] }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { stream_select[1] }]
set_property PACKAGE_PIN W15 [get_ports { stream_select[2] }]		
	set_property IOSTANDARD LVCMOS33 [get_ports { stream_select[2] }]
set_property PACKAGE_PIN V15 [get_ports { filter_options[0] }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { filter_options[0] }]
set_property PACKAGE_PIN W14 [get_ports { filter_options[1] }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { filter_options[1] }]
set_property PACKAGE_PIN W13 [get_ports { filter_options[2] }]				
	set_property IOSTANDARD LVCMOS33 [get_ports { filter_options[2] }]
set_property PACKAGE_PIN V2 [get_ports { replay_video }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { replay_video }]
set_property PACKAGE_PIN T3 [get_ports { text_or_graphics_mode }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { text_or_graphics_mode }]
set_property PACKAGE_PIN T2 [get_ports { camera_refresh_rate }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { camera_refresh_rate }]
set_property PACKAGE_PIN R3 [get_ports { ov7670_drive[0] }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { ov7670_drive[0] }]
set_property PACKAGE_PIN W2 [get_ports {ov7670_drive[1] }]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_drive[1] }]
#set_property PACKAGE_PIN U1 [get_ports {in_port[13]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {in_port[13]}]
#set_property PACKAGE_PIN T1 [get_ports boot_mode]					
	#set_property IOSTANDARD LVCMOS33 [ get_ports boot_mode]
set_property PACKAGE_PIN R2 [get_ports { camera_configured }]        
      set_property IOSTANDARD LVCMOS33 [get_ports { camera_configured }]


## LEDs
set_property PACKAGE_PIN U16 [get_ports { state_machine_status[0] }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { state_machine_status[0] }]
set_property PACKAGE_PIN E19 [get_ports {state_machine_status[1]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[1]}]
set_property PACKAGE_PIN U19 [get_ports {state_machine_status[2]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[2]}]
set_property PACKAGE_PIN V19 [get_ports {state_machine_status[3]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[3]}]
set_property PACKAGE_PIN W18 [get_ports {state_machine_status[4]}]		
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[4]}]
set_property PACKAGE_PIN U15 [get_ports {state_machine_status[5]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[5]}]
set_property PACKAGE_PIN U14 [get_ports {state_machine_status[6]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[6]}]
set_property PACKAGE_PIN V14 [get_ports {state_machine_status[7]}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[7]}]		
set_property PACKAGE_PIN V13 [get_ports {state_machine_status[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[8]}]
set_property PACKAGE_PIN V3 [get_ports {state_machine_status[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[9]}]
set_property PACKAGE_PIN W3 [get_ports {state_machine_status[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[10]}]
set_property PACKAGE_PIN U3 [get_ports {state_machine_status[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[11]}]
set_property PACKAGE_PIN P3 [get_ports {state_machine_status[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {state_machine_status[12]}]
#set_property PACKAGE_PIN N3 [get_ports {out_port[13]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {out_port[13]}]
#set_property PACKAGE_PIN P1 [get_ports {out_port[14]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {out_port[14]}]
#set_property PACKAGE_PIN L1 [get_ports {out_port[15]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {out_port[15]}]
	
	
##7 segment display
#set_property PACKAGE_PIN W7 [get_ports {Segments[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[0]}]
#set_property PACKAGE_PIN W6 [get_ports {Segments[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[1]}]
#set_property PACKAGE_PIN U8 [get_ports {Segments[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[2]}]
#set_property PACKAGE_PIN V8 [get_ports {Segments[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[3]}]
#set_property PACKAGE_PIN U5 [get_ports {Segments[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[4]}]
#set_property PACKAGE_PIN V5 [get_ports {Segments[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[5]}]
#set_property PACKAGE_PIN U7 [get_ports {Segments[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {Segments[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

#set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
#set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
#set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
#set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports { configure_camera }]
	set_property IOSTANDARD LVCMOS33 [get_ports { configure_camera }]
#set_property PACKAGE_PIN T18 [get_ports { reset_state_machine }]						
	#set_property IOSTANDARD LVCMOS33 [get_ports { reset_state_machine }]
#set_property PACKAGE_PIN W19 [get_ports { ButtonUp }]					
	#set_property IOSTANDARD LVCMOS33 [get_ports { ButtonUp }]
#set_property PACKAGE_PIN T17 [get_ports { previous_picture_button }]					
	#set_property IOSTANDARD LVCMOS33 [get_ports { previous_picture_button }]
#set_property PACKAGE_PIN U17 [get_ports { next_picture_button }]					
	#set_property IOSTANDARD LVCMOS33 [get_ports { next_picture_button }]
 


##Pmod Header JA
##Sch name = JA1
#set_property PACKAGE_PIN J1 [get_ports {JA[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
##Sch name = JA2
#set_property PACKAGE_PIN L2 [get_ports {JA[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
##Sch name = JA3
#set_property PACKAGE_PIN J2 [get_ports {JA[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports {JA[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
#set_property PACKAGE_PIN H1 [get_ports {JA[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
##Sch name = JA8
#set_property PACKAGE_PIN K2 [get_ports {JA[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]



##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {ov7670_reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_reset}]
##Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {ov7670_pwdn}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_pwdn}]
##Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {ov7670_pclk}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_pclk}]
##Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {ov7670_siod}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_siod}]
##Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {ov7670_vsync}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_vsync}]
##Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {ov7670_href}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_href}]
##Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {ov7670_sioc}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_sioc}]
##Sch name = JB10 
set_property PACKAGE_PIN C16 [get_ports {ov7670_xclk}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_xclk}]
 


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports { ov7670_data[0] }]
	set_property IOSTANDARD LVCMOS33 [get_ports { ov7670_data[0] }]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports { ov7670_data[1] }]				
	set_property IOSTANDARD LVCMOS33 [get_ports { ov7670_data[1] }]
##Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports {ov7670_data[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[2]}]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {ov7670_data[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[3]}]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {ov7670_data[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[4]}]
##Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {ov7670_data[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[5]}]
##Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports {ov7670_data[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[6]}]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports {ov7670_data[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ov7670_data[7]}]


##Pmod Header JXADC
##Sch name = XA1_P
#set_property PACKAGE_PIN J3 [get_ports {JXADC[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[0]}]
##Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {JXADC[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[1]}]
##Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {JXADC[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[2]}]
##Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {JXADC[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[3]}]
##Sch name = XA1_N
#set_property PACKAGE_PIN K3 [get_ports {JXADC[4]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[4]}]
##Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {JXADC[5]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[5]}]
##Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {JXADC[6]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[6]}]
##Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {JXADC[7]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[7]}]



##VGA Connector
set_property PACKAGE_PIN G19 [get_ports vga_red[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_red[0]]
set_property PACKAGE_PIN H19 [get_ports vga_red[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_red[1]]
set_property PACKAGE_PIN J19 [get_ports vga_red[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_red[2]]
set_property PACKAGE_PIN N19 [get_ports vga_red[3]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_red[3]]
set_property PACKAGE_PIN N18 [get_ports vga_blue[0]]
   set_property IOSTANDARD LVCMOS33 [get_ports vga_blue[0]]
set_property PACKAGE_PIN L18 [get_ports vga_blue[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_blue[1]]
set_property PACKAGE_PIN K18 [get_ports vga_blue[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_blue[2]]
set_property PACKAGE_PIN J18 [get_ports vga_blue[3]]
   set_property IOSTANDARD LVCMOS33 [get_ports vga_blue[3]]
set_property PACKAGE_PIN J17 [get_ports vga_green[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_green[0]]
set_property PACKAGE_PIN H17 [get_ports vga_green[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_green[1]]
set_property PACKAGE_PIN G17 [get_ports vga_green[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_green[2]]
set_property PACKAGE_PIN D17 [get_ports vga_green[3]]
    set_property IOSTANDARD LVCMOS33 [get_ports vga_green[3]]
set_property PACKAGE_PIN P19 [get_ports h_sync_signal]
   set_property IOSTANDARD LVCMOS33 [get_ports h_sync_signal]
set_property PACKAGE_PIN R19 [get_ports v_sync_signal]
   set_property IOSTANDARD LVCMOS33 [get_ports v_sync_signal]


##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports RsRx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#set_property PACKAGE_PIN A18 [get_ports RsTx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsTx]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]						
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]					
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
	#set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
set_property PACKAGE_PIN D18 [get_ports { QSPI_SDI }]	
	set_property IOSTANDARD LVCMOS33 [get_ports { QSPI_SDI }]
set_property PACKAGE_PIN D19 [get_ports { QSPI_SDO }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { QSPI_SDO }]
set_property PACKAGE_PIN G18 [get_ports { QSPI_WP }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { QSPI_WP }]
set_property PACKAGE_PIN F18 [get_ports { QSPI_HLD }]			
	set_property IOSTANDARD LVCMOS33 [get_ports { QSPI_HLD }]
set_property PACKAGE_PIN K19 [get_ports { QSPI_CS }]					
	set_property IOSTANDARD LVCMOS33 [get_ports { QSPI_CS }]
