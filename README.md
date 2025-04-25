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
        ├── test.prog                  # .bin file used
├── /DMEM
        ├── DMEM.v                     # Verilog implementation of the DMEM module
        ├── DMEM_tb.v                  # Verilog testbench for DMEM using Verilator
        ├── a.out                      # Execute file
        ├── Makefile                   # Makefile to automate build and simulation process
        ├── DMEM.vcd                   # (Generated) VCD waveform file
        ├── test.data                  # binary file
        ├── test.o                     # .bin file
└── README.md
```

  ## View Waveform ##
        `make all`
 ## Instruction Set ##
   ![image](https://github.com/user-attachments/assets/8618a86c-a70c-4ef1-8984-68b8e973a6cd) \
   Source : (https://five-embeddev.com/riscv-user-isa-manual/Priv-v1.12/instr-table.html )


  ## DataPath ##
  ![image](https://github.com/user-attachments/assets/c50c9c13-ff4e-4365-94fc-7e6216ceea13)

  
