From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Mon, 10 Mar 2003 20:50:10 -0500
Subject: Unexpected problems in rebuilding kernel
Message-ID: <000201c2e770$8d71e400$e3c8580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This is a multi-part message in MIME format.

------=_NextPart_000_0003_01C2E746.A49BDC00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello from Gregg C Levine
Something new to report. I am now working my way through the kernel
rebuilding, and it is failing on a specific point. I am posting it, as
a text file attachment. Basically the process decides to abort
complaining about a macro, in the jffs file system. This is a patched
2.4.20 kernel, after running a the patchin.sh script from the patches
directory.
-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )




------=_NextPart_000_0003_01C2E746.A49BDC00
Content-Type: text/plain;
	name="errors.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="errors.txt"

Script started on Mon Mar 10 20:43:11 2003
root at drwho4:/usr/src/linux-2.4.20# make modules=0D
make -C  kernel CFLAGS=3D"-D__KERNEL__ -I/usr/src/linux-2.4.20/include =
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing =
-fno-common -pipe -mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE =
-DMODVERSIONS -include =
/usr/src/linux-2.4.20/include/linux/modversions.h" MAKING_MODULES=3D1 =
modules=0D
make[1]: Entering directory `/usr/src/linux-2.4.20/kernel'=0D
make[1]: Nothing to be done for `modules'.=0D
make[1]: Leaving directory `/usr/src/linux-2.4.20/kernel'=0D
make -C  drivers CFLAGS=3D"-D__KERNEL__ -I/usr/src/linux-2.4.20/include =
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing =
-fno-common -pipe -mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE =
-DMODVERSIONS -include =
/usr/src/linux-2.4.20/include/linux/modversions.h" MAKING_MODULES=3D1 =
modules=0D
make[1]: Entering directory `/usr/src/linux-2.4.20/drivers'=0D
make -C block modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/block'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/block'=0D
make -C cdrom modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/cdrom'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/cdrom'=0D
make -C char modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/char'=0D
make -C drm modules=0D
make[3]: Entering directory `/usr/src/linux-2.4.20/drivers/char/drm'=0D
ld -m elf_i386 -r -o tdfx.o tdfx_drv.o =0D
ld -m elf_i386 -r -o r128.o r128_drv.o r128_cce.o r128_state.o =0D
ld -m elf_i386 -r -o radeon.o radeon_drv.o radeon_cp.o radeon_state.o =
=0D
ld -m elf_i386 -r -o i810.o i810_drv.o i810_dma.o =0D
ld -m elf_i386 -r -o i830.o i830_drv.o i830_dma.o =0D
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/char/drm'=0D
make -C joystick modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/char/joystick'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/char/joystick'=0D
make -C pcmcia modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/char/pcmcia'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/char/pcmcia'=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/char'=0D
make -C hotplug modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/hotplug'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/hotplug'=0D
make -C ide modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/ide'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/ide'=0D
make -C input modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/input'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/input'=0D
make -C md modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/md'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/md'=0D
make -C media modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/media'=0D
make -C radio modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/media/radio'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/media/radio'=0D
make -C video modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/media/video'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/media/video'=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/media'=0D
make -C misc modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/misc'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/misc'=0D
make -C mtd modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/mtd'=0D
ld -m elf_i386 -r -o nftl.o nftlcore.o nftlmount.o=0D
make -C chips modules=0D
make[3]: Entering directory `/usr/src/linux-2.4.20/drivers/mtd/chips'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/mtd/chips'=0D
make -C devices modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/mtd/devices'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/mtd/devices'=0D
make -C maps modules=0D
make[3]: Entering directory `/usr/src/linux-2.4.20/drivers/mtd/maps'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/mtd/maps'=0D
make -C nand modules=0D
make[3]: Entering directory `/usr/src/linux-2.4.20/drivers/mtd/nand'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/mtd/nand'=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/mtd'=0D
make -C net modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/net'=0D
make -C tokenring modules=0D
make[3]: Entering directory =
`/usr/src/linux-2.4.20/drivers/net/tokenring'=0D
make[3]: Nothing to be done for `modules'.=0D
make[3]: Leaving directory =
`/usr/src/linux-2.4.20/drivers/net/tokenring'=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/net'=0D
make -C parport modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/parport'=0D
ld -m elf_i386 -r -o parport.o share.o ieee1284.o ieee1284_ops.o init.o =
procfs.o daisy.o probe.o=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/parport'=0D
make -C pcmcia modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/pcmcia'=0D
ld -m elf_i386  -r -o pcmcia_core.o cistpl.o rsrc_mgr.o bulkmem.o =
cs.o=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/pcmcia'=0D
make -C pnp modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/pnp'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/pnp'=0D
make -C sound modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/sound'=0D
ld -m elf_i386 -r -o soundcore.o sound_core.o sound_firmware.o=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/sound'=0D
make -C usb modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/usb'=0D
ld -m elf_i386 -r -o usbcore.o usb.o usb-debug.o hub.o devio.o inode.o =
drivers.o devices.o hcd.o=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/usb'=0D
make -C video modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/drivers/video'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/video'=0D
make[1]: Leaving directory `/usr/src/linux-2.4.20/drivers'=0D
make -C  mm CFLAGS=3D"-D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall =
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common =
-pipe -mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE =
-DMODVERSIONS -include =
/usr/src/linux-2.4.20/include/linux/modversions.h" MAKING_MODULES=3D1 =
modules=0D
make[1]: Entering directory `/usr/src/linux-2.4.20/mm'=0D
make[1]: Nothing to be done for `modules'.=0D
make[1]: Leaving directory `/usr/src/linux-2.4.20/mm'=0D
make -C  fs CFLAGS=3D"-D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall =
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common =
-pipe -mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE =
-DMODVERSIONS -include =
/usr/src/linux-2.4.20/include/linux/modversions.h" MAKING_MODULES=3D1 =
modules=0D
make[1]: Entering directory `/usr/src/linux-2.4.20/fs'=0D
make -C coda modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/fs/coda'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/fs/coda'=0D
make -C cramfs modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/fs/cramfs'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/fs/cramfs'=0D
make -C fat modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/fs/fat'=0D
make[2]: Nothing to be done for `modules'.=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/fs/fat'=0D
make -C jffs modules=0D
make[2]: Entering directory `/usr/src/linux-2.4.20/fs/jffs'=0D
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall =
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common =
-pipe -mpreferred-stack-boundary=3D2 -march=3Di586 -DMODULE =
-DMODVERSIONS -include /usr/src/linux-2.4.20/include/linux/modversions.h =
 -nostdinc -iwithprefix include -DKBUILD_BASENAME=3Dintrep  -c -o =
intrep.o intrep.c=0D
intrep.c:3355: arguments given to macro `recalc_sigpending'=0D
make[2]: *** [intrep.o] Error 1=0D
make[2]: Leaving directory `/usr/src/linux-2.4.20/fs/jffs'=0D
make[1]: *** [_modsubdir_jffs] Error 2=0D
make[1]: Leaving directory `/usr/src/linux-2.4.20/fs'=0D
make: *** [_mod_fs] Error 2=0D
root at drwho4:/usr/src/linux-2.4.20# exirt=08 =08=08 =08t
Script done on Mon Mar 10 20:45:11 2003

------=_NextPart_000_0003_01C2E746.A49BDC00--
