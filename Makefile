all : qemu-intf.h qemu-intf.c fmod-intf.h fmod-intf.c

qemu-intf.h qemu-intf.c : org.ffgpu.qemu.xml
	gdbus-codegen --output-directory $(PWD) --generate-c-code qemu-intf --c-namespace ffgpu --interface-prefix org.ffgpu $<

fmod-intf.h fmod-intf.c: org.ffgpu.fmod.xml
	gdbus-codegen --output-directory $(PWD) --generate-c-code fmod-intf --c-namespace ffgpu --interface-prefix org.ffgpu $<

clean :
	rm -f qemu-intf.h qemu-intf.c fmod-intf.h fmod-intf.c
