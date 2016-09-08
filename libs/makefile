CC = gcc
CFLAGS = -g -Wall

BUILD_DIR = build
LIB_DIR = libs
INC_DIR = include

vpath %.h include
vpath %.c src

USR_INC_FILES = -I$(INC_DIR)
USR_SRC_FILES = $(wildcard src/*.c)
USR_OBJS = $(addprefix $(BUILD_DIR)/,$(notdir $(USR_SRC_FILES:.c=.o)))

all: $(BUILD_DIR) $(USR_OBJS)

$(BUILD_DIR)/%.o : %.c
	$(CC) -c $(CFLAGS) $(USR_INC_FILES) $< -o $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)
