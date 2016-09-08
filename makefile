CC = gcc
CFLAGS = -g -Wall
#LD = ld

PROJECT = project-makefile-test
LDFLAGS = -lc

BIN_DIR = bin
BUILD_DIR = build
LIB_DIR = libs
INC_DIR = include
SRC_DIR = src

vpath %.h $(INC_DIR)
vpath %.c $(SRC_DIR)

USR_INC_FILES = -I$(INC_DIR) -I$(LIB_DIR)/$(INC_DIR)
USR_SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
USR_OBJS = $(addprefix $(BUILD_DIR)/,$(notdir $(USR_SRC_FILES:.c=.o)))

LIB_OBJS = $(wildcard $(LIB_DIR)/$(BUILD_DIR)/*.o)

all: libs $(BUILD_DIR) $(USR_OBJS) $(BIN_DIR)/$(PROJECT).bin

$(BIN_DIR)/$(PROJECT).bin:
	mkdir -p $(BIN_DIR)
	$(CC) $(LIB_OBJS) $(USR_OBJS) -o $@

$(BUILD_DIR)/%.o : %.c
	$(CC) -c $(CFLAGS) $(USR_INC_FILES) $< -o $@

$(BUILD_DIR):
	mkdir -p $@

libs:
	$(notdir $(MAKE)) -C $(LIB_DIR)

clean:
	rm -rf $(BUILD_DIR) $(LIB_DIR)/$(BUILD_DIR) $(BIN_DIR)

.PHONY: all libs clean
