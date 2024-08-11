CXX = g++
OUTPUT = out
SRC =  src/main.cpp
# add other source files like so:
# SRC += $(wildcard external/imgui/*.cpp)
# SRC += $(wildcard external/imgui-sfml/*.cpp)
OBJ_DIR = obj
OBJ = $(SRC:%.cpp=$(OBJ_DIR)/%.o)

# our compiler flags
CXXFLAGS = -std=c++20 -O3 -Wno-unused-result -Iinclude
# add external include dirs
# example:
# CXXFLAGS += -I/opt/homebrew/include -Iexternal/imgui -Iexternal/imgui-sfml

# our linker flags
LDFLAGS =
# add external linkers
# example:
# LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio

# specific configs for macos
ifeq ($(shell uname -s), Darwin)
	# example:
	# LDFLAGS += -L/opt/homebrew/lib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
	# CXXFLAGS += -I/opt/homebrew/include -Iexternal/imgui -Iexternal/imgui-sfml
endif

# specific configs for linux
ifeq ($(shell uname -s), Linux)
	# LDFLAGS += -ldl -lpthread -lGL
endif


.PHONY: all clean run

all: $(OBJ_DIR) $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(CXX) $^ -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $< -o $@ $(CXXFLAGS)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR) $(OUTPUT) .cache .DS_Store

run: all
	./$(OUTPUT)

