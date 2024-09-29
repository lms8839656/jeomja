onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix ascii /tb_top/din
add wave -noupdate /tb_top/clk
add wave -noupdate /tb_top/rst
add wave -noupdate /tb_top/G
add wave -noupdate /tb_top/brout
add wave -noupdate /tb_top/valid
add wave -noupdate /tb_top/DUT/C0/ps
add wave -noupdate /tb_top/DUT/T0/clk
add wave -noupdate /tb_top/DUT/T0/rst
add wave -noupdate /tb_top/DUT/T0/initerinc
add wave -noupdate /tb_top/DUT/T0/outiterinc
add wave -noupdate /tb_top/DUT/T0/brin
add wave -noupdate /tb_top/DUT/T0/out
add wave -noupdate -radix unsigned /tb_top/DUT/T0/initer
add wave -noupdate -radix unsigned /tb_top/DUT/T0/outiter
add wave -noupdate /tb_top/DUT/T0/R0
add wave -noupdate /tb_top/DUT/T0/R1
add wave -noupdate /tb_top/DUT/T0/R2
add wave -noupdate /tb_top/DUT/T0/R3
add wave -noupdate /tb_top/DUT/T0/R4
add wave -noupdate /tb_top/DUT/T0/R5
add wave -noupdate /tb_top/DUT/T0/R6
add wave -noupdate /tb_top/DUT/T0/R7
add wave -noupdate /tb_top/DUT/T0/R8
add wave -noupdate {/tb_top/DUT/T0/dclk[1]}
add wave -noupdate /tb_top/DUT/T0/R9
add wave -noupdate {/tb_top/DUT/T0/dclk[0]}
add wave -noupdate -expand /tb_top/DUT/T0/dclk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3542 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {2327 ns} {4965 ns}

