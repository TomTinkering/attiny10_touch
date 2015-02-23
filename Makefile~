#  Project Settings
PROJECT=attiny10_touch
# target is attiny10
PROG   := usbasp
MCU    := attiny10
F_CPU  := 8000000

AVR_PATH = /opt/cross/avr

CC      = $(AVR_PATH)/bin/avr-gcc
CXX     = $(AVR_PATH)/bin/avr-c++
OBJCOPY = $(AVR_PATH)/bin/avr-objcopy
OBJDUMP = $(AVR_PATH)/bin/avr-objdump
SIZE    = $(AVR_PATH)/bin/avr-size
REMOVE = rm -f

# list all include directories here
INCLUDE_DIRS = ./ 
#INCLUDE_DIRS += ./ 

# list all c and c++ source directories here

SRC_DIRS = ./
#SRC_DIRS += ./ 

# list all assembly source directories here
ASM_DIRS = $(SRC_DIRS)

# current makefile directory
MAKE_DIR = $(notdir $(shell pwd))

#generate lists of source files based on directory listings
C_SRC = $(wildcard $(addsuffix *.c,$(SRC_DIRS)))
CPP_SRC = $(wildcard $(addsuffix *.cpp,$(SRC_DIRS)))
ASM_SRC = $(wildcard $(addsuffix *.s,$(ASM_DIRS)))
ASM_SRC += $(wildcard $(addsuffix *.S,$(ASM_DIRS)))

# define the output directory for the object files
OBJ_OUTPUT_DIR = build
BIN_OUTPUT_DIR = $(OBJ_OUTPUT_DIR)/bin

# define the C object filenames to generate
OBJECT_NAMES = $(notdir $(C_SRC:.c=.o))
PREPROC_NAMES = $(notdir $(C_SRC:.c=.ppc))
ASM_NAMES = $(notdir $(C_SRC:.c=.asm))
OBJECT_NAMES += $(notdir $(CPP_SRC:.cpp=.o))
OBJECT_NAMES += $(notdir $(ASM_SRC:.s=.o))

# add the output path to all the object names
OBJECTS = $(patsubst %.o, $(OBJ_OUTPUT_DIR)/%.o, $(OBJECT_NAMES))
PREPROCS = $(patsubst %.ppc, $(OBJ_OUTPUT_DIR)/%.ppc, $(PREPROC_NAMES))
ASM_FILES = $(patsubst %.asm, $(OBJ_OUTPUT_DIR)/%.asm, $(ASM_NAMES))

# build a search list for make dependencies
vpath %.c $(SRC_DIRS)
vpath %.cpp $(SRC_DIRS)
vpath %.s $(ASM_DIRS)
vpath %.S $(ASM_DIRS)
vpath %.h $(INCLUDE_DIRS)
vpath %.o $(OBJ_OUTPUT_DIR)

# define any directories containing header files other than /usr/include
INCLUDES = $(addprefix -I,$(INCLUDE_DIRS)) 

COMMONFLAGS = -ftree-ter -g -Os -funsigned-char -funsigned-bitfields 
COMMONFLAGS += -fpack-struct -fshort-enums -DF_CPU=$(F_CPU) -mmcu=$(MCU)

CFLAGS = -std=gnu99 $(COMMONFLAGS) -Wstrict-prototypes  
CFLAGS += -Wa,-adhlns=$(<:.c=.lst)

CXXFLAGS = -std=gnu++11 $(COMMONFLAGS) -fno-exceptions 
CXXFLAGS += -fno-rtti -Wa,-adhlns=$(<:.cc=.lst) 

ASFLAGS = -Wa,-adhlns=$(<:.S=.lst),-gstabs
LDFLAGS = -Wl,-Map=$(TARGET).map,--cref

AVRDUDE = avrdude -c $(PROG) -p $(MCU)
AVRDUDE_WRITE_FLASH = -U flash:w:$(BIN_OUTPUT_DIR)/$(TARGET).hex

#########################################################################

all:: begin cc_version printvar clean preproc assemble $(PROJECT).hex size end

pre:: begin cc_version printvar preproc end

asm:: begin cc_version printvar assemble end

$(PROJECT).hex:$(PROJECT).elf
	$(OBJCOPY) -O ihex -R .eeprom $(BIN_OUTPUT_DIR)/$< $(BIN_OUTPUT_DIR)/$@
 	
$(PROJECT).elf:$(notdir $(OBJECTS))
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJECTS) --output $(BIN_OUTPUT_DIR)/$@
 	 
flash: $(BIN_OUTPUT_DIR)/$(PROJECT).hex
	$(AVRDUDE) $(AVRDUDE_WRITE_FLASH)

preproc : $(notdir $(PREPROCS))
	echo "Preprocessing done.."
	
assemble : $(notdir $(ASM_FILES))
	echo "Assembling done.."
	
.PHONY: check
check:
	$(AVRDUDE)	
	
.PHONY: size
size:
	@echo
	@echo "---------- program size ----------"
	$(SIZE) $(BIN_OUTPUT_DIR)/$(PROJECT).elf	

.PHONY: clean
clean:
	$(REMOVE) $(OBJ_OUTPUT_DIR)/*.*
	$(REMOVE) $(BIN_OUTPUT_DIR)/*.*
	
# Eye Candy
.PHONY begin: 
begin: 
	@echo
	@echo "---------- begin ----------"

.PHONY end:
end:
	@echo
	@echo "----------- end -----------"

.PHONY sdcc_version: 
cc_version: 
	@echo
	@$(CC) --version
	
.PHONY:printvar
printvar: 
	@echo $(OBJECTS)
	

#########################################################################
#  Default rules to compile .c and .cpp file to .rel
#  and assemble .s files to .rel


# General rule for compiling C source files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)
	
# General rule for compiling CC source files
%.o: %.cc
	$(CC) $(CXXFLAGS) $(INCLUDES) -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)

# General rules for compiling assembly source files
%.o: %.s
	$(CC) $(ALL_ASFLAGS) -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)

%.o: %.S
	$(CC) $(ALL_ASFLAGS) -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)

# Show preprocessor output (don't build object)
%.ppc: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -E -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)
	
%.asm: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -S -c $< -o $(OBJ_OUTPUT_DIR)/$(notdir $@)

#########################################################################	
