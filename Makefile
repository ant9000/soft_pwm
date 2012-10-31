CROSS_COMPILE=arm-linux-gnueabi-

ifneq ($(KERNELRELEASE),)
obj-m       := soft_pwm.o

else
PWD  := $(shell pwd)
KDIR ?= $(PWD)/../linux-2.6.38/

modules:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions modules.order Module.symvers

.PHONY: modules clean

endif
