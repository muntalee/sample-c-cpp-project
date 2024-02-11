# Simple C/C++ Project Setup

A command-line based `Makefile` setup for creating a C/C++ project. Simply edit
the `Makefile` in order to setup the project.

## Usage

### Adding Libraries

Ensure that for any project you make, if you are adding any libraries, you
**MUST** update these variables in the `Makefile`:

```Makefile
# DO NOT COPY AND PASTE this
# Find each variable inside the file and modify as such
BASE_PATHS ?= .
LIBS ?=  
LIB_FLAGS :=
```

**PLEASE NOTE**: For each directory you add under `LIBS`, make sure the folder
contains a `lib/` and `include/` directory.

### Other modifications

For any other modificiations, edit any of the other variables inside the
`Makefile` as you wish to do so.

## OS Specifics

### MacOS Users

If you're on MacOS, I recommend following the examples inside the comments of
the `Makefile`.

### Other OS Users

If you're on another OS, I recommend creating a `lib` directory in the project,
then adding your respected libraries inside it, that you look like this:

```Makefile
# example: assuming your project structure is this:
# ROOT_PROJECT_DIR/lib/sdl2/lib
# ROOT_PROJECT_DIR/lib/sdl2/include

# DO NOT COPY AND PASTE this
# Find each variable inside the file and modify as such
BASE_PATHS ?= lib
LIBS ?= sdl2
LIB_FLAGS := -lSDL2
```
## For Vim/Neovim Users

You may experience errors when programming, as well as no autocomplete in your
LSP. This can be fixed with a `compile_commands.json` under the root project
directory. You can create one through [this
link](https://texttoolkit.com/compilation-database-generator).

Copy the output of the following command below into the textbox and click
`Generate!`:

```bash
make -nw
```
