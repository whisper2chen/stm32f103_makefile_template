CMSIS_SRC = libs/CMSIS

#source file
C_SOURCES += $(CMSIS_SRC)/core_cm3.c
C_SOURCES += $(CMSIS_SRC)/system_stm32f10x.c

#header
INCLUDES += -I$(CMSIS_SRC)
