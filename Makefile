include config.mk

# Check if using c++
ifeq ($(LANGUAGE),c++)
  IS_CXX=1
else
  IS_CXX=
endif

# Set compiler accordingly
ifneq ($(COMPILER),)
	CC=$(COMPILER)
else ifeq ($(IS_CXX),1)
	CC=/usr/bin/c++
else
	CC=/usr/bin/cc
endif

EXE=$(BUILD_DIR)$(EXECUTABLE)

# Set language standard
STD=-std=$(LANGUAGE)$(STANDARD_VERSION)

# Warnings valid for both c and c++
CWARN=\
	  -Wall \
	  -Wextra \
	  -Wshadow \
	  -Wcast-align \
	  -Wunused \
	  -Wpedantic \
	  -Wconversion \
	  -Wsign-conversion \
	  -Wnull-dereference \
	  -Wdouble-promotion \
	  -Wformat=2 \
	  -Wmisleading-indentation \
	  -Wduplicated-cond \
	  -Wduplicated-branches \
	  -Wlogical-op \
	  -Wno-unknown-warning-option

# Warnings valid only for c++
CXXWARN=\
		-Wnon-virtual-dtor \
		-Wold-style-cast \
		-Woverloaded-virtual\
		-Wuseless-cast

CFLAGS=\
		-flto \
		-fdiagnostics-color=auto \

DBGFLAGS=\
		 -g \
		 -Og \
		 -lg \
		 -fsanitize=address,leak

BUILDFLAGS=-O3 -DNDEBUG

# Adding warnings as errors if requested
WARN=$(CWARN) $(if $(IS_CXX), $(CXXWARN),) $(if $(WARNINGS_AS_ERRORS), -Werror,)

# Adding defninitions. prepending -D to the definitions from confog.mk
DEFS=-D_DEFAULT_SOURCE $(addprefix -D, $(DEFINITIONS))
LIBS=$(addprefix -l, $(LIBRARIES))

FLAGS=$(CFLAGS) $(LIBS) $(STD) $(WARN) $(DEFS) $(LIBS)

BUILDCMD=$(CC) -o $(EXE) $(FILES) $(FLAGS)


# executable used to create compile_commands.json

ifneq ($(NEED_COMPILE_COMMANDS),)
	COMPILE_COMMANDS_EXE=tools/runjq $(BUILDCMD)
endif


all: $(EXE)

clean:
	rm -f $(EXE) compile_commands.json


$(EXE): $(FILES) $(HEADERS)
	mkdir -p $(BUILD_DIR)
	$(shell $(COMPILE_COMMANDS_EXE))
	$(BUILDCMD) $(BUILDFLAGS)

debug: $(FILES)
	mkdir -p $(BUILD_DIR)
	$(shell $(COMPILE_COMMANDS_EXE))
	$(BUILDCMD) $(DBGFLAGS)

run: $(EXE)
	./$(EXE)

.PHONY: all clean run
