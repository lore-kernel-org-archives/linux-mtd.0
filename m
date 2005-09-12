Received: from mail03.solnet.ch ([212.101.4.137])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEpGJ-000276-1A
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 10:26:41 -0400
Message-ID: <43258B3B.7060405@intefo.ch>
Date: Mon, 12 Sep 2005 16:05:47 +0200
From: Simon Kallweit <simon.kallweit@intefo.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------050109030607060804010802"
Cc: 
Subject: Bugreport: JFFS2 + EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050109030607060804010802
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello

This is a bug report concerning the erase-block-summary (EBS) feature:

We're using JFFS2 as our root filesystem on our embedded device. Our 
device is a custom hardware based around a Hynix ARM H7202 processor. 
We're using Intel Strata Flash (NOR). See any of the attached kernel log 
files for more information.

JFFS2 works fine so far (without EBS). We hope to improve the mount time 
with the EBS feature. We're currently using the 2.6.13 kernel, and I 
patched the MTD subsystem with a current version of the MTD CVS 
(09-09-2005). The patched kernel boots happily when EBS is disable, both 
with sumtool-processed images and with normal non-processed images. (see 
without-ebs-with-sumtool.txt and without-ebs-without-sumtool.txt logfiles).

As soon as I enable EBS I get a kernel panic (see 
with-ebs-with-sumtool.txt logfile). I'm pretty sure that the image is 
not corrupt, as the first two tests with EBS disable show. Also, I'm 
using a script to upload new kernel and rootfs images. So there should 
not have been anything gone wrong during the copy process!

Here are the steps I used to build the root filesystem:

mkfs.jffs2 -p 6291456 -d ./rootfs -e 128KiB -l -v -U -D 
./devicetable.txt -o ./rootfs.tmp
sumtool -i ./rootfs.tmp -o ./rootfs.img -e 128KiB -l -v

If you need more information, just let me know.

Best regards,
Simon Kallweit


--------------050109030607060804010802
Content-Type: text/plain;
 name="with-ebs-with-sumtool.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="with-ebs-with-sumtool.txt"

Linux version 2.6.13-hnx-obu (simon@simon) (gcc version 3.3.2) #6 Mon Sep 12 11:55:47 CEST 2005
CPU: ARM720T [41807202] revision 2 (ARMv4T)
Machine: Hynix HMS30C7202
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: root=/dev/mtdblock4 rootfstype=jffs2 console=ttyS1,115200
Trying to install chained handler for IRQ16
PID hash table entries: 256 (order: 8, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 32MB = 32MB total
Memory: 30104KB available (1838K code, 337K data, 72K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Software Watchdog Timer: 0.07 initialized. soft_noboot=0 soft_margin=60 sec (nowayout= 0)
h7202 PS/2 port driver
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
ttyS0 at MMIO 0x80020000 (irq = 8) is a 16550A
ttyS1 at MMIO 0x80021000 (irq = 9) is a 16550A
ttyS2 at MMIO 0x8002d000 (irq = 10) is a 16550A
ttyS3 at MMIO 0x8002e000 (irq = 11) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
nbd: registered device at major 43
PPP generic driver version 2.4.2
PPP BSD Compression module registered
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
H720x-MTD probing 16bit FLASH
H720X Flash Bank 1: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 6 MTD partitions on "H720X Flash Bank 1":
0x00000000-0x00040000 : "U-Boot"
0x00040000-0x00080000 : "Env"
0x00080000-0x00100000 : "Reserve1"
0x00100000-0x00200000 : "Kernel"
0x00200000-0x00800000 : "RootJFFS2"
0x00800000-0x01000000 : "Reserve2"
H720x-MTD probing 16bit FLASH
H720X Flash Bank 2: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 2 MTD partitions on "H720X Flash Bank 2":
0x00000000-0x00100000 : "LogfileLRUC"
0x00100000-0x01000000 : "DataJFFS2"
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x002a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x002c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x002e0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0030000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0030001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00300000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0032000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0032001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00320000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0034000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0034001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00340000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0036000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0036001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00360000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0038000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0038001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00380000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x003e0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0040000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0040001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00400024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00400000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0042000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0042001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00420000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0044000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0044001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00440000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0046000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0046001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00460024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00460000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0048000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0048001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00480024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00480000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004a0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x004a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x004c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004e0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x004e0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0050000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0050001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00500024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00500000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0052000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0052001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00520024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00520000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0054000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0054001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00540024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00540000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0056000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0056001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00560024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00560000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0058000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0058001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00580024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00580000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x005a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005c0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x005c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0000: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0004: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0008: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e000c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0010: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0014: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0018: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e001c: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0020: 0x00b0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0024: 0x00b0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x005e0000 is not formatted. It will be erased
Eep. Child "tripgui" (ino #467) of dir ino #311 doesn't exist!
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00063c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x0005cc. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00055c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x0004ec. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00047c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00040c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00039c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00032c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x0002bc. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00023c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x0001cc. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00015c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x0000ec. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00007c. But it must have been OK earlier.
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x00000c. But it must have been OK earlier.
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K
Warning: unable to open an initial console.
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.

--------------050109030607060804010802
Content-Type: text/plain;
 name="without-ebs-with-sumtool.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="without-ebs-with-sumtool.txt"

Linux version 2.6.13-hnx-obu (simon@simon) (gcc version 3.3.2) #9 Mon Sep 12 15:18:03 CEST 2005
CPU: ARM720T [41807202] revision 2 (ARMv4T)
Machine: Hynix HMS30C7202
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: root=/dev/mtdblock4 rootfstype=jffs2 console=ttyS1,115200
Trying to install chained handler for IRQ16
PID hash table entries: 256 (order: 8, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 32MB = 32MB total
Memory: 30116KB available (1826K code, 338K data, 72K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Software Watchdog Timer: 0.07 initialized. soft_noboot=0 soft_margin=60 sec (nowayout= 0)
h7202 PS/2 port driver
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
ttyS0 at MMIO 0x80020000 (irq = 8) is a 16550A
ttyS1 at MMIO 0x80021000 (irq = 9) is a 16550A
ttyS2 at MMIO 0x8002d000 (irq = 10) is a 16550A
ttyS3 at MMIO 0x8002e000 (irq = 11) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
nbd: registered device at major 43
PPP generic driver version 2.4.2
PPP BSD Compression module registered
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
H720x-MTD probing 16bit FLASH
H720X Flash Bank 1: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 6 MTD partitions on "H720X Flash Bank 1":
0x00000000-0x00040000 : "U-Boot"
0x00040000-0x00080000 : "Env"
0x00080000-0x00100000 : "Reserve1"
0x00100000-0x00200000 : "Kernel"
0x00200000-0x00800000 : "RootJFFS2"
0x00800000-0x01000000 : "Reserve2"
H720x-MTD probing 16bit FLASH
H720X Flash Bank 2: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 2 MTD partitions on "H720X Flash Bank 2":
0x00000000-0x00100000 : "LogfileLRUC"
0x00100000-0x01000000 : "DataJFFS2"
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Unknown but compatible feature node (0x2006) found at offset 0x0001e864
Unknown but compatible feature node (0x2006) found at offset 0x0003ed50
Unknown but compatible feature node (0x2006) found at offset 0x0005df6c
Unknown but compatible feature node (0x2006) found at offset 0x0007d960
Unknown but compatible feature node (0x2006) found at offset 0x0009ea94
Unknown but compatible feature node (0x2006) found at offset 0x000bef4c
Unknown but compatible feature node (0x2006) found at offset 0x000df2a4
Unknown but compatible feature node (0x2006) found at offset 0x000fefb8
Unknown but compatible feature node (0x2006) found at offset 0x0011e7b0
Unknown but compatible feature node (0x2006) found at offset 0x0013ddbc
Unknown but compatible feature node (0x2006) found at offset 0x0015e9e0
Unknown but compatible feature node (0x2006) found at offset 0x0017efac
Unknown but compatible feature node (0x2006) found at offset 0x0019ea94
Unknown but compatible feature node (0x2006) found at offset 0x001beb08
Unknown but compatible feature node (0x2006) found at offset 0x001dd5a8
Unknown but compatible feature node (0x2006) found at offset 0x001fe348
Unknown but compatible feature node (0x2006) found at offset 0x0021ec1c
Unknown but compatible feature node (0x2006) found at offset 0x0023e834
Unknown but compatible feature node (0x2006) found at offset 0x0025ef6c
Unknown but compatible feature node (0x2006) found at offset 0x0027ea24
Unknown but compatible feature node (0x2006) found at offset 0x0029eed8
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K

Starting init process ...
Remounting root filesystem ...
Mounting other filesystems ...
Setting up loopback device 127.0.0.1 ...
Starting syslogd ...
Loading modules ...
 

--------------050109030607060804010802
Content-Type: text/plain;
 name="without-ebs-without-sumtool.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="without-ebs-without-sumtool.txt"

Linux version 2.6.13-hnx-obu (simon@simon) (gcc version 3.3.2) #9 Mon Sep 12 15:18:03 CEST 2005
CPU: ARM720T [41807202] revision 2 (ARMv4T)
Machine: Hynix HMS30C7202
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists
Kernel command line: root=/dev/mtdblock4 rootfstype=jffs2 console=ttyS1,115200
Trying to install chained handler for IRQ16
PID hash table entries: 256 (order: 8, 4096 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 32MB = 32MB total
Memory: 30116KB available (1826K code, 338K data, 72K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Software Watchdog Timer: 0.07 initialized. soft_noboot=0 soft_margin=60 sec (nowayout= 0)
h7202 PS/2 port driver
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
ttyS0 at MMIO 0x80020000 (irq = 8) is a 16550A
ttyS1 at MMIO 0x80021000 (irq = 9) is a 16550A
ttyS2 at MMIO 0x8002d000 (irq = 10) is a 16550A
ttyS3 at MMIO 0x8002e000 (irq = 11) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
loop: loaded (max 8 devices)
nbd: registered device at major 43
PPP generic driver version 2.4.2
PPP BSD Compression module registered
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
H720x-MTD probing 16bit FLASH
H720X Flash Bank 1: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 6 MTD partitions on "H720X Flash Bank 1":
0x00000000-0x00040000 : "U-Boot"
0x00040000-0x00080000 : "Env"
0x00080000-0x00100000 : "Reserve1"
0x00100000-0x00200000 : "Kernel"
0x00200000-0x00800000 : "RootJFFS2"
0x00800000-0x01000000 : "Reserve2"
H720x-MTD probing 16bit FLASH
H720X Flash Bank 2: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Using builtin partition table
Creating 2 MTD partitions on "H720X Flash Bank 2":
0x00000000-0x00100000 : "LogfileLRUC"
0x00100000-0x01000000 : "DataJFFS2"
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K

Starting init process ...
Remounting root filesystem ...
Mounting other filesystems ...
Setting up loopback device 127.0.0.1 ...
Starting syslogd ...

--------------050109030607060804010802--
