USER_LED_SRC = user/led

#source file
C_SOURCES += $(USER_LED_SRC)/bsp_led.c

#header
INCLUDES += -I$(USER_LED_SRC)
