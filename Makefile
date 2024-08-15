BUILD_DIR = build
EXE = game

compile: build
	cmake --build $(BUILD_DIR)

build:
	cmake -S . -B $(BUILD_DIR) -DCMAKE_EXPORT_COMPILE_COMMANDS=on

clean:
	rm -rf $(BUILD_DIR)

run: compile
	./$(BUILD_DIR)/bin/$(EXE)

all: run

