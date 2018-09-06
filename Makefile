# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: revan-wy <revan-wy@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/08/07 23:03:34 by revan-wy          #+#    #+#              #
#    Updated: 2018/09/06 22:31:02 by revan-wy         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf
CC = gcc
FLAGS = -Wall -Wextra -Werror
COMP = $(CC) $(FLAGS)
FDF_H = -I ./
FRAMEWORK = -framework OpenGL \
			-framework AppKit
LIBFT_H = -I ./libft/
LIBS = -L./libft -lft \
	   -lmlx
SRC = wolf.c

OBJ := $(SRC:%.c=%.o)

all: $(NAME)

makelibft:
	make -C ./libft

$(NAME): makelibft $(OBJ)
	$(COMP) $(OBJ) $(LIBS) -o $(NAME) $(FRAMEWORK)

%.o: %.c
	$(COMP) -c $< $(LIBFT_H) $(FDF_H) -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
