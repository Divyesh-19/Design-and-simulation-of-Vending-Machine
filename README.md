# 🥤 Vending Machine – Verilog HDL Based Digital Design

This project demonstrates the **design, simulation, and synthesis of a digital vending machine** using **Verilog HDL**, developed as part of a digital systems course at DAIICT under the guidance of **Prof. Rutu Parekh**.

## 📌 Project Overview

The vending machine:

- Accepts coins of ₹5 and ₹10 only.
- Dispenses four different items priced at ₹15, ₹20, ₹25, and ₹30.
- Returns the balance if excess coins are inserted.
- Operates entirely on a **Finite State Machine (FSM)** that manages item selection, payment tracking, change return, and item dispensing.

The machine resets after each successful transaction, making it ready for the next user.

---

## ⚙️ Features

- **Dual FSM Architecture**  
  - **Item Selection FSM**: Takes a 2-bit input to select one of four items.  
  - **Payment & Dispensing FSM**: Tracks the balance, compares with the item cost, dispenses the item, and returns change if needed.

- **Simulation & Testing**  
  - Simulated using **EDA Playground** for logic validation and waveform analysis.  
  - Synthesized using **Qflow** to generate RTL schematics, FSM diagrams, and gate-level netlists.

---

## 🧠 FSM Highlights

| State | Balance (₹) | Action |
|-------|--------------|--------|
| S0    | 0            | Initial state |
| S5    | 5            | Wait for more input |
| S10   | 10           | Wait for more input |
| S15   | 15           | Dispense Item-1 if selected |
| S20   | 20           | Dispense Item-2 or return change if overpaid |
| S25   | 25           | Dispense Item-3 or return change |
| S30   | 30           | Dispense Item-4 or return change |
| S35   | 35           | Return change and reset |

---

## 🧾 Verilog Module

### Inputs
- `clk` – Clock signal
- `reset` – System reset
- `item[1:0]` – Item selector input
- `five`, `ten` – Coin input signals

### Outputs
- `out` – Indicates successful item dispense
- `five_change` – Indicates return of ₹5 as change

### Internal Logic
- FSM transitions between states based on coin inputs.
- Dispenses the item when the balance meets/exceeds the item cost.
- Returns ₹5 if overpaid and resets to initial state.

---

## 🔬 Tools Used

- **EDA Playground** – For writing, simulating, and debugging Verilog code
- **Qflow** – For RTL synthesis and generating gate-level schematics

---

## 🚀 Future Enhancements

- Support for additional coin/note denominations
- Dynamic or programmable item pricing
- Multiple item selection in one transaction
- LCD display for user interaction
- Item availability detection and stock tracking
- Password-protected maintenance mode
- Real-time logging and remote monitoring

---

## 👥 Contributors

- **Divyesh Ramani** – [202201241@daiict.ac.in](mailto:202201241@daiict.ac.in)  
- **Dhriti Goenka** – [202201041@daiict.ac.in](mailto:202201041@daiict.ac.in)

---

## 📚 References

- R. Sati, V. Mishra, and G. Verma, *Simulation of Vending Machine Design using Verilog HDL*, ASIANCON 2022.  
- M. A. Qureshi et al., *Design and implementation of vending machine using Verilog HDL*, 2011.  
- M. H. Fuad et al., *Design of a Vending Machine Using Verilog HDL and Implementation in Genus & Encounter*.
