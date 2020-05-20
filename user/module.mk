USER_SRC = user

#source file
C_SOURCES += $(USER_SRC)/main.c
C_SOURCES += $(USER_SRC)/stm32f10x_it.c

#header
INCLUDES += -I$(USER_SRC)
