#STM32F103 Makefile template

#compiler
CROSS_COMPILE = arm-none-eabi-
CC  = $(CROSS_COMPILE)gcc
AS  = $(CROSS_COMPILE)gcc -x assembler-with-cpp
CP  = $(CROSS_COMPILE)objcopy
AR  = $(CROSS_COMPILE)ar
SZ  = $(CROSS_COMPILE)size
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S


#chip compile flags
CHIP_SPEC = -mcpu=cortex-m3 -mthumb
CHIP_DEFS = -DSTM32F10X_MD -DUSE_STDPERIPH_DRIVER

PROJECT_NAME = stm32f103_led_demo

#compile output dir
BUILD_DIR = build

#source files
ASM_SOURCES = libs/CMSIS/startup/gcc_ride7/startup_stm32f10x_md.s
C_SOURCES = 
INCLUDES = 

# CMSIS
-include libs/CMSIS/module.mk 
# STM32F10x_StdPeriph_Driver
-include libs/STM32F10x_StdPeriph_Driver/module.mk

# user code
-include user/module.mk

# led
-include user/led/module.mk



# compiler flags
CFLAGS = $(CHIP_DEFS) $(CHIP_SPEC) $(INCLUDES) -Wall  -Wfatal-errors -MMD -fdata-sections -ffunction-sections
ASFLAGS = $(CFLAGS)

# link script
LDSCRIPT = STM32F103C8Tx_FLASH.ld
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(CHIP_SPEC) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(PROJECT_NAME).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(PROJECT_NAME).elf $(BUILD_DIR)/$(PROJECT_NAME).hex $(BUILD_DIR)/$(PROJECT_NAME).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(PROJECT_NAME).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

.PHONY: clean flash erase show
#######################################
# clean up
#######################################
clean:
	-rm -fR .dep $(BUILD_DIR)

flash:
	st-flash write $(BUILD_DIR)/$(TARGET).bin 0x8000000

erase:
	st-flash erase

show:
	@echo $(C_SOURCES)
  
#######################################
# dependencies
#######################################
-include $(shell mkdir .dep 2>/dev/null) $(wildcard .dep/*)
