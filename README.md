# Simple C/C++ starter

1. [Quick start](#quick-start)
   - [Requirements](#requirements)
   - [Compiling and running](#compiling-and-running)
2. [Options](#options)
   - [Initial section](#initial-section)
   - [Advanced section](#advanced-section)

## Quick start

### Requirements

- Being on a unix like system
  - Only tested on linux, but should also work on mac and BSD
  - Possible also works with MinGW
- A c/c++ compiler
  - Tested with gcc and clang
  - System's default compiler will be sued unless specified otherwise
- make
  - Tested on GNU make, but should work with any

### Compiling and running

- Compile the code by running `make` for fully optimised "release" build or
  `make debug` for the debug build.
- Compiled executable is called `build/app`. You can run it directly with
  `./build/app` or with `make run`
  - Name of the executable can be changed, see [options](#Options) below.
- By default only `src/main.cpp` will be compiled
- To remove all build files run `make clean`
- Configuration options are available below

## Options

- Options are changed by changing values of variables in `config.mk` or by
  directly changing `Makefile`

### Initial section

- `LANGUAGE`

  - Possible values: c, c++
  - Sets project language to c or c++

- `STANDARD_VERSION`

  - Possible values for c++: 98, 03, 11, 14, 17, 20
  - Possible value for c: 89, 99, 11
  - Sets the language standard. 17 or 20 is recommended if supported by the
    compiler.

- `WARNINGS_AS_ERRORS`

  - Possible values: any value = true, no value = false
  - If compiler generates warnings should they be treated as errors (i.e. should
    they stop compilation).

- `EXECUTABLE`

  - Possible values: can be any combination of letters and numbers. Can't be
    empty.
  - Name of the executable.

- `FILES`

  - Possible values: List of source files separated by spaces relative to the
    root directly of the project.
  - Source files to be compiled, such as .c, .cpp, .cc, .cxx or .c++

- `HEADERS`

  - Possible values: List of header files separated by spaces.
  - Header files, such as .h, .hpp, .hh, .hxx, .h++. These will not be compiled.

- `DEFINITIONS`

  - Possible values: space separated list of preprocessor definitions
    - A definition can consist of: a letter followed by any number of letters,
      numbers and single underscores.
    - Upper case by convention.
    - optionally followed by `=` to give the definition a value
  - All definitions which should be available in the program.

- `LIBRARIES`

  - Possible values: name of a library (not including `lib` or `.a`)
    - E.g. `libgit2.a` becomes `git2`
  - A list of libraries to link against

### Advanced section

There is nothing particularly advanced about this section, it just contains less
common options.

- `NEED_COMPILE_COMMANDS`

  - Possible values: any value = true, no value = false
  - If you use a tool that relies on `compile_commands.json` to work, enable
    this option.
    - E.g. ccls language server or clang-tidy static analyser

- `COMPILER`

  - Possible values: path to the compiler or no value to use system default.
    - gcc or g++ is the default on Linux based systems
    - clang/clang++ is the default on BSD and MacOS
  - This options needs to be compatible with the chosen language
    - g++ or clang++ for c++
    - gcc or clang for c

- `BUILD_DIR`

  - Possible values: Output directory where executable will be placed after
    compilation
    - **Has to end with a backslash** (`/`)
    - Use `./` for project root directory (not recommended)
    - Cannot be empty
  - If directory does not exist it will be created
