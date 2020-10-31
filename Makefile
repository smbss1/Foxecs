##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## make an executable
##

CC = g++

NAME	= foxecs
SRC_DIR = src

SRC = $(shell find $(SRC_DIR) -name '*.cpp')
OBJ = $(SRC:%.cpp=%.o)

CFLAGS += -std=c++17 -W -Wall -Wextra $(if $(DEBUG),-g3) $(if $(DEBUG),-DDEBUG)
LDFLAGS =
INC_FLAGS = -Iinclude

all: lib

lib: $(OBJ)
	@ar -rc lib$(NAME).a $(OBJ)

%.o: %.cpp
	@$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@
	@echo "\033[1;32mCompiled \033[1;37m'$<'\033[m"

.PHONY: clean
clean:
	@$(RM) -r $(OBJ)

.PHONY: fclean
fclean: clean
	@$(RM) -r vgcore*

.PHONY: re
re: fclean all

example: fclean lib
	make -SC example
