Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=ocean.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BouGD-0006w8-Kr
	for linux-mtd@lists.infradead.org; Sun, 25 Jul 2004 21:26:40 -0400
Received: from [203.26.222.199] (unknown [203.26.222.199])
	by ocean.magtech.com.au (Postfix) with ESMTP id 4A9F640AA432
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jul 2004 11:26:31 +1000 (EST)
Message-ID: <41045DC7.9010106@magellan-technology.com>
Date: Mon, 26 Jul 2004 11:26:31 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <011d01c470f4$012c7b40$6400a8c0@BDENSONLAPTOP>
In-Reply-To: <011d01c470f4$012c7b40$6400a8c0@BDENSONLAPTOP>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: problems with mtd on atmel dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brock Denson wrote:
> I am having problems with the flash on my at91rm9200dk board with
> linux-2.4.26-vrs1 and the at91-03052004 patch.  

You have my sympathy. We just started working on the same development board and 
have just solved (most of) these problems (with other problems pending!).

Just to check that we are both on the same page:

* You downloaded a vanilla 2.4.26 kernel from kernel.org
* you applied the vrs-1 patch
* then you applied the at91-03052004 patch
* cd /usr/src/linux-2.4.26-vrs1
* from the CD, copy over the mkimage *script* from the old "rmk" directory that 
came with your development kit
* from the CD, copy over and setup the arm cross-compile environment. e.g. 
/usr/local/arm/2.95.3/bin/arm-linux- etc ...
* from the CD, copy over and setup the uboot "mkimage" *binary*. e.g.
/usr/local/uboot/mkimage. I can't remember, you may need to compile this.
* edit mkimage to use these directories
* edit Makefile to say:
...
ARCH := arm
...
CROSS_COMPILE   = /usr/local/arm/2.95.3/bin/arm-linux-
...
* # make at91rm9200dk_config
* # make xconfig
* # make dep
* # ./mkimage


> Creating 3 MTD partitions on "Atmel AT45DB642":
> 0x00000000-0x00010000 : "bootloader"
> 0x00010000-0x000d0000 : "kernel"
> mtd: partition "kernel" doesn't start on an erase block boundary -- force
> read-only
> 0x000d0000-0x00840000 : "filesystem"
> mtd: partition "filesystem" doesn't start on an erase block boundary --
> force read-only
> ...

First of all. All partitions must be a multiple of: 0x420 bytes, or 1056 bytes 
because this is the erase block size of the device. e.g. you want a 1000000 
byte partition, then specify either: 998976 bytes or 1000032 bytes. You can 
edit the file "at91_dataflash.c" to change these partitions, but a MUCH easier 
way is to use boot arguments.

you will need: CONFIG_MTD_CMDLINE_PARTS=y set in .config

e.g. our bootargs from UBOOT are:

setenv bootargs root=/dev/mtdblock/0 console=ttyS0,115200,mem=32M 
mtdparts=dataflash0:-(part1)

As we no longer use the ramdisk image your bootargs would probably be:

setenv bootargs root=/dev/ram rx initrd=0x21100000,6000000 ramdisk_size=15360 
console=ttyS0,115200,mem=32M mtdparts=dataflash0:1047552(kernel 
image)ro,-(the_rest)

This gives you a read only partition in the beginning of the dataflash, to 
protect the kernel image you probably have stored there, and then defines the 
rest of the dataflash as a single large partition. Note the 1056 byte alignment.

> If I do a ls dev/mtdblock I see:
> 0	1	2
> Which I assume are the three partitions on the dataflash device, but I can
> not mount them with mount -t jffs2 /dev/mtdblock/0 /mnt.  I get a permission
> denied error.

Most likely you don't have all the right MTD stuff configured in the kernel. 
See end of the email for my .config settings. We stopped using JFFS2 as a 
filing system because of problems creating a larger than 3.3MB kernel (see my 
previous postings on this topic). JFFS works fine as a filing system on the 
dataflash and we are now mounting the dataflash as a root partition. There are 
fixes to the JFFS2 problem, but we can't work it out yet.

When you use "eraseall", don't format as JFFS2, apparantly this is done 
automatically when you mount it.

e.g.
# mkdir /mnt/0
# eraseall /dev/mtd/0
# mount -t jffs2 /dev/mtdblock/0 /mnt/0


> I don't see any listing at all for the parallel flash.  Can someone point me
> in the right direction on how to solve this problem?

The parallel flash contains the uboot loader and you really don't want to touch 
this because it's a pain having to reflash it. I would recommend storing your 
kernel in this chip and using uboot to retrieve it from here at boot time.

HINT: If you accidentally erase uboot:

You will have to to de-solder a resistor from the board. Look under the board, 
below the JTAG/ICE interface socket and you will see the "BOOT MODE SELECT" 
resistor (R159 I think). We desoldered this resistor, added a 2pin SIP header, 
made a jumper (with the resistor included) to select between parallel flash 
booting and using the CPU's own bootstrapping program. You need the resistor in 
the jumper because otherwise the reset button won't work anymore - this didn't 
take us long to figure out.

regards,

Aras


[root@localhost linux-2.4.26-vrs1]# grep MTD .config
# Memory Technology Devices (MTD)
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_EDB7312 is not set
# CONFIG_MTD_IMPA7 is not set
# CONFIG_MTD_CEIVA is not set
# Self-contained MTD device drivers
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_AT91_DATAFLASH=y
CONFIG_MTD_AT91_DATAFLASH_CARD=y
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_AT91_SMARTMEDIA=y

[root@localhost linux-2.4.26-vrs1]# grep -i jffs .config
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=0

CONFIG_JFFS_PROC_FS=y[root@localhost linux-2.4.26-vrs1]# grep -i NAND .config
# NAND Flash Device Drivers
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=y

[root@localhost linux-2.4.26-vrs1]# grep -i CFI .config
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
[root@localhost linux-2.4.26-vrs1]#
# CONFIG_JFFS2_FS is not set

from dmesg:
...
Found AT91 i2c
AT91 SPI driver loaded
at91_dataflash: Atmel AT45DB642 detected [spi0] (8650752 bytes)
Creating 1 MTD partitions on "Atmel AT45DB642":
0x00000000-0x00840000 : "part1"
SmartMedia card inserted.
No NAND device found!!!
...


from uboot: I download my kernel image each time over the network. This is a 
fast and easy way to develop. You need to set up a tftp server though. The 
"mkimage" script in the kernel directory will try to copy the kernel image over 
to a tftp directory, you may need to edit this script.

Uboot> printenv
baudrate=115200
net2knl=tftp 21000000 uImage
net2rd=tftp 21100000 ramdisk-rmk7
boot=bootm 21000000
knl2ram=cp.b 10030000 21000000 c0000
knl2flash=cp.b 21000000 10030000 c0000
ethaddr=12:34:56:78:99:aa
filesize=5591e6
ipaddr=203.26.222.191
serverip=203.26.222.3
test2=run net2knl; run net2rd; run boot
bootdelay=1
test3=run net2knl; run boot
bootcmd=run test3
bootargs=root=/dev/mtdblock/0 console=ttyS0,115200,mem=32M 
mtdparts=dataflash0:-(part1)

Environment size: 447/8188 bytes
Uboot>
