# Matrix-Operations
Here’s a clear description and breakdown of your project:

---

## **Matrix Calculator Project**

### **Introduction**
The Matrix Calculator project is a console-based application built in Assembly Language using the **Irvine32 library**. This project provides users with essential matrix operations, including addition, subtraction, multiplication, and display functionalities for 2x2 and 3x3 matrices. The project is intended to help students and developers understand how to manipulate matrices and perform mathematical operations using assembly language.

---

### **Objective**
The main goal of this project is to:
1. Build an interactive program in assembly language to handle basic matrix operations.
2. Understand and implement array-like structures in Assembly.
3. Learn to interact with users via input and output using the Irvine32 library.
4. Strengthen understanding of low-level programming by implementing logical operations on matrices.

---

### **Features and Functionalities**

1. **Input Matrices**
   - Users can input elements for **Matrix 1** and **Matrix 2**.
   - Matrix sizes supported: **2x2** and **3x3**.
   - Validates the matrix size input to ensure only 2 or 3 is accepted.

2. **Display Matrices**
   - Users can view Matrix 1 and Matrix 2 after entering their elements.

3. **Matrix Addition**
   - Adds the corresponding elements of two matrices.
   - Supports both 2x2 and 3x3 matrices.

4. **Matrix Subtraction**
   - Subtracts the corresponding elements of two matrices.
   - Supports both 2x2 and 3x3 matrices.

5. **Matrix Multiplication**
   - Multiplies two matrices according to standard matrix multiplication rules.
   - Supports both 2x2 and 3x3 matrices.

6. **Error Handling**
   - Displays error messages for invalid matrix sizes or menu options.
   - Guides the user back to the main menu if an error occurs.

7. **User-Friendly Menu**
   - A menu-driven interface allowing users to navigate through various operations easily.
   - Provides options to exit the program gracefully.

8. **Exiting the Program**
   - An option to terminate the program is provided with a user-friendly message.

---

### **Program Flow**

1. The program begins with a **Menu Display** listing all available operations.
2. The user selects an option by entering the corresponding number.
3. Depending on the user’s choice:
   - **Matrix Input** is taken.
   - **Matrix Display** is shown.
   - Mathematical operations are performed and results are displayed.
4. After each operation, the program returns to the main menu until the user selects **Exit**.

---

### **How to Run the Project in Visual Studio**

1. **Setup Irvine32 Library**
   - Download the **Irvine32** library from [kipirvine.com](http://kipirvine.com/).
   - Configure the library in Visual Studio:
     - Add `Irvine32.lib` to your project dependencies.
     - Place the `Irvine32.inc` file in your project folder.
     - Ensure that the `Kernel32.lib` is linked correctly in your project.

2. **Create a New Project**
   - Open Visual Studio.
   - Create a new **Win32 Console Application**.
   - Ensure that the project type is set to **Empty Project**.

3. **Add the Code**
   - Create a new file with a `.asm` extension (e.g., `MatrixCalculator.asm`).
   - Copy and paste the provided assembly code into the file.

4. **Set the Entry Point**
   - In your project properties:
     - Go to **Linker > System > SubSystem** and set it to `Console`.
     - Set the entry point to `main`.

5. **Build and Run**
   - Build the project to ensure there are no syntax errors.
   - Run the project and interact with the menu in the console.

---

### **Project Structure**

- **Menu System:** A user-friendly menu to guide operations.
- **Input Handling:** Accepts and stores matrix data in memory.
- **Matrix Operations:**
  - Addition, Subtraction, and Multiplication for both 2x2 and 3x3 matrices.
- **Output:** Display results in a readable matrix format.

---

### **Conclusion**
The Matrix Calculator is a simple yet powerful project that demonstrates the capability of assembly language to perform mathematical computations. By integrating input, processing, and output functionalities, it provides users with an interactive console-based calculator that performs essential matrix operations. This project is an excellent way to explore the basics of assembly programming and learn to implement structured logic at a low level.

---
