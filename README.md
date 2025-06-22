# 64-bit-floating-point-Arithmetic-Unit-with-Instruction-Data-Memory-using-verilog
This repository contains the design and implementation of a **64-bit Floating Point Arithmetic Unit (FPU)** compliant with the **IEEE-754 standard**, developed using **Verilog **. It performs high-precision arithmetic operations—**addition, subtraction, multiplication, and division**—with gate-level modeling for the arithmetic unit and behavioral modeling for memory and control components.

The project is verified through simulation in **Xilinx Vivado** and demonstrates a architecture suitable for hardware synthesis and educational purposes.

---

## Project Overview

The design consists of the following key components:

- **Instruction Memory** (16-bit): Stores instructions specifying the operation and address of operands.
- **Data Memory** (128-bit): Stores two 64-bit floating-point operands (Operand A and Operand B).
- **Program Counter (PC)**: An 8-bit counter that auto-increments and supports synchronous reset.
- **Arithmetic Unit**: Implements IEEE-754 arithmetic logic using gate-level modeling.
- **Testbench**: Validates correct functioning of arithmetic operations, memory access, and instruction decoding.

---

## Instruction Format

Each instruction is 16 bits wide and structured as follows:

- **Bits [15:3]** – 13-bit Data Memory Address
- **Bit [2]** – Reserved for future operations or extensions
- **Bits [1:0]** – Operation Code:
  - `00` – Addition
  - `01` – Subtraction
  - `10` – Multiplication
  - `11` – Division

The format enables simple decoding logic and leaves space for scalability in future revisions.

---

## Arithmetic Unit

The arithmetic unit performs all four operations using **gate-level modeling** and adheres to IEEE-754 standards. Key features include:

- **Exponent Alignment** for operand normalization
- **Mantissa Operation Logic** specific to each arithmetic function
- **Normalization & Rounding** of the final result
- **Support for Special Cases** like zero, infinity, and denormalized numbers (partial)

This low-level design enables a clear understanding of floating-point arithmetic at the logic gate level.

---

## Supporting Modules

While the arithmetic operations are implemented using gate-level modeling, the following supporting modules are written behaviorally:

- **Instruction Memory & Data Memory** – Efficient data storage and access
- **Program Counter** – Behavioral model with auto-increment and synchronous reset

These modules handle data flow and instruction processing in coordination with the arithmetic unit.

---

## Simulation and Testing

The design is simulated using **Vivado 2024.2**, ensuring correctness and module integration. The testbench verifies:

- Proper execution of Add, Sub, Mul, and Div operations
- Correct instruction decoding and data retrieval
- Functional program counter with expected reset and increment behavior
- Synchronization between memory, instruction cycle and arithmetic unit

