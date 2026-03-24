

---

# 4-Bit BCD Adder (Verilog)

This project implements a **4-bit Binary Coded Decimal (BCD) Adder** in Verilog. Unlike a standard binary adder, this module ensures that the output remains in a valid BCD format (0–9 per digit) by applying a correction factor when the sum exceeds 9.

## 📌 Project Overview
In BCD representation, each decimal digit is mapped to a 4-bit binary number. However, 4 bits can represent up to 15 ($1111_2$). Since decimal digits only go up to 9, the values 10 through 15 are "invalid." 

This adder performs binary addition and automatically converts the result back into BCD by detecting invalid states and adding a correction value of **6** ($0110_2$).

## 🚀 Prerequisites
* **Knowledge:** Basic understanding of Verilog HDL, combinational logic, and BCD arithmetic.
* **Tools:** Any Verilog simulator (e.g., Vivado, ModelSim, Icarus Verilog, or EDA Playground).

## 🛠 Hardware Logic
The module follows these logical steps:
1.  **Binary Addition:** Adds `a + b + cin` to get a 5-bit temporary sum.
2.  **Detection:** Checks if the temporary sum is greater than 9.
3.  **Correction:** * If **Sum > 9**: Add 6 to the units place and set the tens place to `1`.
    * If **Sum ≤ 9**: Keep the sum as is and set the tens place to `0`.

### Logic Table
| Decimal Sum | Binary Result | Correction (+6) | BCD Tens | BCD Units |
| :--- | :--- | :--- | :--- | :--- |
| 7 | `00111` | No | `0000` | `0111` |
| 13 | `01101` | Yes | `0001` | `0011` |
| 19 | `10011` | Yes | `0001` | `1001` |

## 📂 File Structure
* `bcd_adder_4bit.v`: The core design module.
* `bcd_adder_4bit_tb.v`: Testbench to verify the addition logic with various cases.

## 🔌 Module Ports

| Port Name | Direction | Width | Description |
| :--- | :--- | :--- | :--- |
| `a` | Input | 4-bit | First BCD digit (0-9) |
| `b` | Input | 4-bit | Second BCD digit (0-9) |
| `cin` | Input | 1-bit | Carry-in |
| `bcd_out` | Output | 8-bit | Final result: `[7:4]` is Tens, `[3:0]` is Units |

## 💻 How to Run
1.  **Clone the repository** or copy the `.v` files to your workspace.
2.  **Compile the files:**
    ```bash
    iverilog -o bcd_sim bcd_adder_4bit.v bcd_adder_4bit_tb.v
    ```
3.  **Run the simulation:**
    ```bash
    vvp bcd_sim
    ```
4.  **View Waves:** If you have GTKWave installed, you can view the timing diagrams to verify the transitions.

## 🧪 Simulation Results
The testbench validates the following:
* **Normal Case:** $5 + 2 = 07$
* **Correction Case:** $9 + 6 = 15$
* **Max Case:** $9 + 9 + 1 = 19$

---
