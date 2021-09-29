
obj-m += ezom.o

ezom-objs := ./src/main.o ./src/hook.o 


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean