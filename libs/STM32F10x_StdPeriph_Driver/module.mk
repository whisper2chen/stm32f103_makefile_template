FWLIB_SRC = libs/STM32F10x_StdPeriph_Driver

#source file
C_SOURCES += $(FWLIB_SRC)/src/misc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_adc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_bkp.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_can.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_cec.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_crc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_dac.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_dbgmcu.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_dma.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_exti.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_flash.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_fsmc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_gpio.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_i2c.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_iwdg.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_pwr.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_rcc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_rtc.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_sdio.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_spi.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_tim.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_usart.c
C_SOURCES += $(FWLIB_SRC)/src/stm32f10x_wwdg.c

#header
INCLUDES += -I$(FWLIB_SRC)/inc
