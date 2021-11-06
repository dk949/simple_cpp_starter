# change to LANGUAGE=c to compile c
LANGUAGE=c++

# Version of the language
STANDARD_VERSION=14

# Set to any value to treat all warnings as errors
WARNINGS_AS_ERRORS=1

# Name of the executable
EXECUTABLE=app

# All source files (e.g. .c, .cpp, .cc, .cxx, .c++)
FILES=src/main.cpp

# All header files (e.g. .h, .hpp, .hh, .hxx, .h++)
HEADERS=

# Definitions
# e.g. DEFINITIONS=SOME_DEF ANOTHER_DEF=3
DEFINITIONS=

# Libraries to link against
# E.g. LIBRARIES=m pthread
LIBRARIES=



#     _       _                               _    ____            _   _
#    / \   __| |_   ____ _ _ __   ___ ___  __| |  / ___|  ___  ___| |_(_) ___  _ __
#   / _ \ / _` \ \ / / _` | '_ \ / __/ _ \/ _` |  \___ \ / _ \/ __| __| |/ _ \| '_ \
#  / ___ \ (_| |\ V / (_| | | | | (_|  __/ (_| |   ___) |  __/ (__| |_| | (_) | | | |
# /_/   \_\__,_| \_/ \__,_|_| |_|\___\___|\__,_|  |____/ \___|\___|\__|_|\___/|_| |_|


# Set to 1 if you need to generate compile_commands.json (e.g. to use ccls with vim). Requires jq
NEED_COMPILE_COMMANDS=1

# Leave blank to use the default compiler. Has to match the language (g++ for c++ gcc for c)
COMPILER=

# Directory in which executable will be placed. **MAKE SURE TO PUT BACKSLASH (/) AT THE END OF THE PATH**. Use ./ for current dir
BUILD_DIR=build/
