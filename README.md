# CLox - A Bytecode Interpreter for the Lox Programming Language

<div align="center">

![C](https://img.shields.io/badge/c-%2300599C.svg?style=for-the-badge&logo=c&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

*A tree-walk interpreter implementation of the Lox programming language in C*

</div>

## 🚀 Overview

CLox is a bytecode virtual machine implementation of the Lox programming language, written in C. This project demonstrates the fundamentals of language implementation, including lexical analysis, parsing, compilation to bytecode, and virtual machine execution.

## ✨ Features

- **Complete Lexical Analysis** - Tokenizes Lox source code with support for all language constructs
- **Pratt Parser** - Efficient recursive descent parser with operator precedence
- **Bytecode Compilation** - Compiles Lox source to compact bytecode instructions
- **Stack-based VM** - Fast virtual machine with stack-based execution model
- **Dynamic Typing** - Support for numbers, booleans, strings, and nil values
- **Arithmetic Operations** - Full support for `+`, `-`, `*`, `/` operations
- **Comparison Operations** - Equality and relational operators (`==`, `!=`, `<`, `>`, `<=`, `>=`)
- **String Concatenation** - Automatic string concatenation with `+` operator
- **Memory Management** - Custom memory allocator with object lifecycle management
- **Debug Output** - Optional disassembly and execution tracing

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     Scanner     │───▶│    Compiler     │───▶│   Virtual VM    │
│   (Tokenizer)   │    │    (Parser)     │    │   (Executor)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
    Token Stream            Bytecode Chunk          Stack Machine
```

### Core Components

| Component | Purpose | Location |
|-----------|---------|----------|
| **Scanner** | Lexical analysis and tokenization | [`src/scanner.c`](src/scanner.c) |
| **Compiler** | Parsing and bytecode generation | [`src/compiler.c`](src/compiler.c) |
| **VM** | Bytecode execution engine | [`src/vm.c`](src/vm.c) |
| **Chunk** | Bytecode storage and management | [`src/chunk.c`](src/chunk.c) |
| **Value** | Dynamic value system | [`src/value.c`](src/value.c) |
| **Object** | Object system for strings | [`src/object.c`](src/object.c) |
| **Memory** | Memory management utilities | [`src/memory.c`](src/memory.c) |
| **Debug** | Disassembly and debugging tools | [`src/debug.c`](src/debug.c) |

## 🛠️ Building

### Prerequisites

- GCC compiler with C99 support
- Make (or compatible build system)
- Windows environment (current Makefile targets Windows)

### Build Commands

```bash
# Build the project
make

# Build with debug symbols
make debug

# Build optimized release version
make release

# Clean build artifacts
make clean

# Rebuild from scratch
make rebuild
```

### Build Targets

- `all` - Default build (equivalent to `make`)
- `debug` - Build with debug symbols and DEBUG flag
- `release` - Optimized build with `-O3` and NDEBUG
- `clean` - Remove all build artifacts
- `rebuild` - Clean and rebuild
- `install` - Install to system directory

## 🚀 Usage

### Interactive REPL

```bash
./clox
> 1 + 2 * 3
7
> "Hello, " + "World!"
Hello, World!
> true == false
false
```

### File Execution

```bash
./clox script.lox
```

### Example Lox Code

```javascript
// Numbers and arithmetic
42 + 3.14159 * 2

// String operations
"Hello" + " " + "World"

// Boolean logic
true and false or !nil

// Comparisons
10 > 5 and 3 <= 7
```

## 📊 Supported Operations

### Arithmetic
- `+` Addition (numbers) / Concatenation (strings)
- `-` Subtraction / Unary negation
- `*` Multiplication
- `/` Division

### Comparison
- `==` Equality
- `!=` Inequality  
- `<` Less than
- `<=` Less than or equal
- `>` Greater than
- `>=` Greater than or equal

### Logical
- `!` Logical NOT
- Truthiness: `false` and `nil` are falsy, everything else is truthy

### Data Types
- **Numbers**: Double-precision floating point
- **Strings**: Dynamically allocated, garbage collected
- **Booleans**: `true` and `false`
- **Nil**: Represents absence of value

## 🐛 Debug Features

The interpreter includes comprehensive debugging capabilities:

```c
#define DEBUG_PRINT_CODE      // Disassemble compiled bytecode
#define DEBUG_TRACE_EXECUTION // Trace VM execution step-by-step
```

Enable these flags in [`include/common.h`](include/common.h) to see:
- Bytecode disassembly
- Stack state during execution
- Instruction-by-instruction tracing

## 📁 Project Structure

```
clox/
├── src/                    # Source files
│   ├── main.c             # Entry point and REPL
│   ├── scanner.c          # Lexical analyzer
│   ├── compiler.c         # Parser and compiler
│   ├── vm.c               # Virtual machine
│   ├── chunk.c            # Bytecode storage
│   ├── value.c            # Value system
│   ├── object.c           # Object management
│   ├── memory.c           # Memory allocation
│   └── debug.c            # Debugging utilities
├── include/               # Header files
│   ├── *.h               # Public interfaces
├── build/                 # Compiled object files
├── Makefile              # Build configuration
└── README.md             # This file
```

## 🔧 Implementation Details

### Virtual Machine Design
- **Stack-based execution** for simplicity and efficiency
- **Bytecode instructions** for compact representation
- **Constant pool** for literal values
- **Line number tracking** for error reporting

### Memory Management
- **Custom allocator** with [`reallocate()`](src/memory.c) function
- **Object linked list** for garbage collection preparation
- **Dynamic arrays** with automatic growth
- **RAII-style** resource management

### Error Handling
- **Compile-time errors** with precise location reporting
- **Runtime errors** with stack trace information
- **Panic mode recovery** in parser for error resilience

## 🤝 Contributing

Contributions are welcome! Areas for improvement:

- [ ] Additional operators (modulo, bitwise operations)
- [ ] Control flow statements (if/else, loops)
- [ ] Functions and closures
- [ ] Classes and inheritance
- [ ] Standard library functions
- [ ] Garbage collection
- [ ] Optimization passes

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

This implementation follows the design patterns and architecture described in ["Crafting Interpreters"](https://craftinginterpreters.com/) by Robert Nystrom, adapted for educational purposes.

---

<div align="center">
<i>Built with ❤️ and lots of ☕</i>
</div>