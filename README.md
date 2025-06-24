
# 🧩 Sudoku Game (Assembly Language)

This is a fully functional **Sudoku game implemented in x86 Assembly Language** using NASM. It features puzzle generation, input validation, game state updates, and an interactive console interface. A low-level yet high-impact project showcasing the power of assembly in building real applications.

---

## 🎮 Features

- 9x9 Sudoku board interface in console
- Input handling via keyboard (row, column, value)
- Validity checks for:
  - Row conflicts
  - Column conflicts
  - 3x3 grid conflicts
- Real-time board updates
- Game completion detection
- Clear screen, undo, and restart support (via key mappings)
- Optimized data structures using registers and memory-efficient logic

---

## 🧠 Concepts & Skills Used

- x88 Assembly (NASM syntax)
- Interrupt-driven input/output (INT 21h)
- 2D board storage and memory manipulation
- Conditional branching, loops, subroutines
- Low-level debugging and flow control
- Game logic design at the register level

---

## 🖥️ How to Run

### 🛠 Requirements

- NASM (Netwide Assembler)
- DOSBox or a 16-bit emulator like DOSemu / Emu8086 / PCSPIM

### 🔧 Steps

```bash
nasm -f bin sudoku.asm -o sudoku.com
````

Then run using DOSBox:

```bash
DOSBox
mount c /path/to/folder
c:
sudoku.com
```

---

## 📁 File Structure

```
sudoku/
├─ sudoku.asm         → Full source code
├─ README.md          → This file
```

---


## 🤓 Why Assembly?

Building a Sudoku game in Assembly is a great challenge that:

* Sharpens low-level thinking
* Reinforces how memory, stacks, and input/output work
* Strengthens algorithm implementation under real constraints

---

## 📫 Contact

Made with bits & logic by **Abdullah Iqbal**
[LinkedIn](https://www.linkedin.com/in/muhammad-abdullah-iqbal-a42b5b301)
Email: [abdullahiqbal27122004@gmail.com](mailto:abdullahiqbal27122004@gmail.com)
GitHub: [abdullahiqbal2610](https://github.com/abdullahiqbal2610)

---

*Last updated: June 2025*


