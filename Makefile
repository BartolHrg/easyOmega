

obj-m += main.o
obj-m += hook.o

all:
	make -C /lib/module/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build \M=$(PWD) clean