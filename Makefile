# Optional: add your base path to where your libraries are
# Example: BASE_PATHS := /opt/homebrew/Cellar
BASE_PATHS ?= .

# Optional: add library paths within base path
# Ensure that for each directory contains a 'include/' and 'lib/'
# with its respective libraries.
# Example: LIBS := sdl2/2.30.0
LIBS ?=  

INCLUDES := -Iinclude
LINKER_FLAGS :=

# Function to add library paths only if they exist
define add_library
    ifneq ($(wildcard $(BASE_PATHS)/$1/include),)
        INCLUDES += -I$(BASE_PATHS)/$1/include
    endif
    ifneq ($(wildcard $(BASE_PATHS)/$1/lib),)
        LINKER_FLAGS += -L$(BASE_PATHS)/$1/lib
    endif
endef

# Call the function for each library only if LIBS is not empty
ifneq ($(strip $(LIBS)),)
    $(foreach lib,$(LIBS),$(eval $(call add_library,$(lib))))
endif

# Compile-specific commands
CC := g++
CFLAGS := -Wall -ldl -lpthread -lm

# Define your library flags here
# Example: LIB_FLAGS := -lSDL2
LIB_FLAGS :=

OS := $(shell uname)
ifeq ($(OS),Darwin)
    # Mac OS X specific commands
endif

ifeq ($(OS),Linux)
    # Linux specific commands
endif

ifeq ($(OS),WindowsNT)
    # Windows specific commands
endif

SRCS := $(wildcard src/*.cpp)

# Change this to what you want your output name to be
OUTPUT := my_program

.PHONY: build clean

build: $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) $^ -o build/$(OUTPUT) $(LINKER_FLAGS) $(LIB_FLAGS)

run: build
	./build/$(OUTPUT)

clean:
	rm -rf build/*
