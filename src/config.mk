# Lines starting with '#' are comments.

# Explicitly specify which files to compile
SOURCES = \
	main.c \
	submodule-dir-example/src/batt.c \
	submodule-dir-example/src/estimation.c

# Options that get passed to the C compiler
CFLAGS = -Isubmodule-dir-example/src
