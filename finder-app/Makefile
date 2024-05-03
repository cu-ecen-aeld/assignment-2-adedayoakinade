# Define the compiler and compiler flags
CC ?= $(CROSS_COMPILE)gcc
CFLAGS ?= -Wall -Wextra

# Define the target executable
TARGET = writer

# Define the source files
SOURCES = writer.c

# Define the object files
OBJECTS = $(SOURCES:.c=.o)

# Default target: build the application
all: $(TARGET)

# Build the application
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(TARGET)

# Compile the source files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target: remove the application and object files
clean:
	rm -f $(TARGET) $(OBJECTS)

# Cross-compilation support
ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
# Additional flags or settings for cross-compilation
CFLAGS += --static
else
# Settings for native compilation
endif

# Print the compiler being used
print-compiler:
	@echo "Using compiler: $(CC)"