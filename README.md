  # Computer_Architecture_Lab

Design Intruction Memory and Data Memory block of RISC_V Single Cycle .

This repo using Icarus Verilog and GTKWave to simulate the Verilog design .

 ## Project Structure
   /RISCV_Single_Cycle<br/>
  ├──/IMEM<br/>
        ├── IMEM.v                     # Verilog implementation of the IMEM module<br/>
        ├── IMEM_tb.v                  # Verilog testbench for IMEM using Verilator<br/>
        ├── a.out                      # Execute file<br/>
        ├── Makefile                   # Makefile to automate build and simulation process<br/>
        ├── IMEM.vcd                   # (Generated) VCD waveform file<br/>
  ├── /DMEM<br/>
        ├── DMEM.v                     # Verilog implementation of the DMEM module<br/>
        ├── DMEM_tb.v                  # Verilog testbench for DMEM using Verilator<br/>
        ├── a.out                      # Execute file<br/>
        ├── Makefile                   # Makefile to automate build and simulation process<br/>
        ├── DMEM.vcd                   # (Generated) VCD waveform file<br/>
  └── README.md<br/>

  ## View Waveform  
        `make all`
  
