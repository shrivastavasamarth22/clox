# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -O2 -Iinclude
LDFLAGS = 

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

# Target executable
TARGET = clox

# Source files and objects
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)

# Default target
all: $(BUILD_DIR) $(TARGET)

# Create build directory
$(BUILD_DIR):
	mkdir $(BUILD_DIR) 2>nul || echo.

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compile source files to object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	del /Q $(BUILD_DIR)\*.o $(TARGET).exe 2>nul || echo.
	rmdir $(BUILD_DIR) 2>nul || echo.

# Rebuild everything
rebuild: clean all

# Install (copy to a system directory, modify as needed)
install: $(TARGET)
	copy $(TARGET).exe C:\usr\local\bin\ 2>nul || echo "Install location not available"

# Debug build with debug symbols
debug: CFLAGS += -g -DDEBUG
debug: $(TARGET)

# Release build with optimizations
release: CFLAGS += -O3 -DNDEBUG
release: clean $(TARGET)

# Show help
help:
	@echo Available targets:
	@echo   all      - Build the project (default)
	@echo   clean    - Remove build artifacts
	@echo   rebuild  - Clean and build
	@echo   debug    - Build with debug symbols
	@echo   release  - Build optimized release version
	@echo   install  - Install executable
	@echo   help     - Show this help

# Phony targets
.PHONY: all clean rebuild install debug release help