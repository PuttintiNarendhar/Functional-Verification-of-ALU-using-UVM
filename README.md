# Functional Verification of Memory-Mapped USART Controller Using UVM

This repository contains a complete, production-ready Universal Verification Methodology (UVM) environment designed to verify the functional correctness of a memory-mapped *USART/UART Peripheral Register Block*. 

The verification environment tests the register map configurations, read/write permissions, address decoding logic, and hardware-controlled status flag clearance.

---

## 🏗️ UVM Testbench Hierarchy

The testbench structure follows strict UVM guidelines, featuring an isolated environment, verification components, and transactional tracking layers:

```text
uvm_top
 └── my_test
      └── my_env
           ├── my_agent
           │    ├── my_sequencer
           │    ├── my_driver (Drives dut_if via virtual interface)
           │    └── my_monitor
           └── my_scoreboard (Validates expected vs. actual register reads)
```

### Component Breakdown
* *Top-Level (testbench.sv)*: Instantiates the Device Under Test (DUT), the physical interface, and invokes run_test().
* *Interface (dut_if)*: Implements synchronous timing constraints via a dedicated clocking block (cb) alongside an isolated DUTPORT modport definition.
* *Driver (my_driver.svh)*: Converts dynamic sequences into cycle-accurate bus operations via non-blocking pin actions (<=) scheduled through the interface clocking block.
* *Scoreboard (my_scoreboard.svh)*: Implements an internal associative array reference model to predict and self-check real-time hardware values.

---

## 🗺️ Register Map & Address Space

The module decodes a 32-bit address bus with a base address configuration of *24'h40004C*. The verified internal register offsets include:

| Register Name | Offset Address | Description |
|:---|:---|:---|
| *CR1* | 8'h00 | Control Register 1 |
| *CR2* | 8'h04 | Control Register 2 |
| *RQR* | 8'h18 | Request Register |
| *ISR* | 8'h1C | Interrupt & Status Register |
| *ICR* | 8'h20 | Interrupt Flag Clear Register |
| *RDR* | 8'h24 | Receive Data Register |
| *TDR* | 8'h28 | Transmit Data Register |

---

## 📝 Verification Plan

To ensure 100% functionality of the register map, the testbench implements a comprehensive test matrix focusing on peripheral register boundary conditions:

* *Register Reset Verification*: Confirms that a hardware assertion on reset synchronously initializes all internal configuration registers (cr1, cr2, tdr, rdr) back to 32'h0.
* *Read-After-Write (RAW) Integrity*: Validates that random 32-bit patterns written to read-write registers (CR1, CR2) match the values extracted during subsequent read commands.
* *Hardware Self-Clear Logic Verification*: Tests the specialized clearing mechanics:
  * Writing a 1 to bit 6 of ICR clears the TC (Transmission Complete) flag in ISR.
  * Writing a 1 to bit 3 of RQR or reading from RDR successfully clears the RXNE (Receive Not Empty) flag.
* *Address Boundary Testing*: Assures that any transactions targeting unmapped address blocks outside the 24'h40004c space return tri-state data ('hz) and are securely blocked from altering internal states.

---

## 📊 Functional Coverage Targets

Verification completeness is measured utilizing systemic covergroups looking for explicit cross-coverage matrix configurations:

* *Address Distribution*: Coverpoints monitor the address bus to ensure 100% hit rates across all mapped addresses (8'h00 through 8'h28).
* *Command Interleaving*: A cross-coverage metric between cmd (Read/Write) and addr to guarantee every register has undergone full bidirectional transaction configurations.
* *Field Bit-Mask Coverage*: Tracks specific conditional bits, explicitly validating state tracking for bit-clearing flags (ICR and RQR).

---

## 💻 How to Run the Simulation

### Option 1: EDA Playground
1. Open the source files on [EDA Playground](https://edaplayground.com).
2. Set the *Tools & Simulators* dropdown to a system-compatible tool supporting UVM (e.g., Aldec Riviera-PRO or Siemens Questa).
3. Ensure the *UVM / OVM* option checkbox is checked.
4. Click *Run* to execute the testbench.

### Option 2: Command Line (Questa / ModelSim)
If executing locally via simulation terminal scripts:
bash
./run.sh


---

## 📬 Contact / Contribution
Developed as a demonstration of structured functional hardware verification using SystemVerilog and UVM. Feel free to open an issue or pull request to add additional test sequences!
