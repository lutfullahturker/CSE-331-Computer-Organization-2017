transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Education/CSE-331\ \ Bilgisayar\ Organizasyonu/Project\ 2/141044050_restored {D:/Education/CSE-331  Bilgisayar Organizasyonu/Project 2/141044050_restored/mips_core.v}
vlog -vlog01compat -work work +incdir+D:/Education/CSE-331\ \ Bilgisayar\ Organizasyonu/Project\ 2/141044050_restored {D:/Education/CSE-331  Bilgisayar Organizasyonu/Project 2/141044050_restored/mips_registers.v}

