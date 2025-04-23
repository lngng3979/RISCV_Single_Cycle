  # Computer_Architecture_Lab

Design Intruction Memory and Data Memory block of RISC_V Single Cycle .

This repo using Icarus Verilog and GTKWave to simulate the Verilog design .

  **Project Structure**
 ```/RISCV_Single_Cycle
├──/IMEM
        ├── IMEM.v                     # Verilog implementation of the IMEM module
        ├── IMEM_tb.v                  # Verilog testbench for IMEM using Verilator
        ├── a.out                      # Execute file
        ├── Makefile                   # Makefile to automate build and simulation process
        ├── IMEM.vcd                   # (Generated) VCD waveform file
├── /DMEM
        ├── DMEM.v                     # Verilog implementation of the DMEM module
        ├── DMEM_tb.v                  # Verilog testbench for DMEM using Verilator
        ├── a.out                      # Execute file
        ├── Makefile                   # Makefile to automate build and simulation process
        ├── DMEM.vcd                   # (Generated) VCD waveform file
└── README.md
```

  **View Waveform **
        `make all`
  
