
ezom-objs := main.o hook.o 

obj-m += ezom.o


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build \M=$(PWD) clean