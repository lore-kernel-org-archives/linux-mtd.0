Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVAcI-0001iG-8g
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 10:51:54 -0400
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org
Date: Tue, 1 Jun 2004 17:01:18 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200406011701.18523.dk.dbox2@gmx.net>
Subject: mtd and 2.6.5_linuxppc (mvista) kernel does not boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I patched the 2.6.5_linuxppc kernel from mvista linuxppc-2.5 tree with the 
current jffs2/mtd code and built an image with the mkfs.jffs2 from utils.
mkfs.jffs2 options i used:
mkfs.jffs2 -b -e 131072 -p -o jffs2.img -r cdkflash/jffs2/

I built a cramfs (kernel) + jffs2 (root) image. Here is the partition table:
0x00000000-0x00120000 : "DreamBOX cramfs"
0x00120000-0x007c0000 : "DreamBOX jffs2"
0x007c0000-0x00800000 : "DreamBOX OpenBIOS"
0x00000000-0x007c0000 : "DreamBOX (w/o bootloader)"
0x00000000-0x00800000 : "DreamBOX (w/ bootloader)"

Partition size and offset in the flash is ok, as it works with jffs2 from 
2.6.5_linuxppc kernel.

Kernel compiled with following jffs2 configuration:
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_NAND is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_LZO is not set
# CONFIG_JFFS2_LZARI is not set
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=y
# CONFIG_JFFS2_CMODE_SIZE is not set
CONFIG_JFFS2_PROC=y

My problem is now, that the image does not boot with newer jffs2/mtd patch. 
Here is the log output:


loaded at:     00500000 00619204
relocated to:  00400000 00519204
board data at: 00516128 00516174
relocated to:  00405474 004054C0
zimage at:     004059E0 0051574D
avail ram:     0051A000 02000000

Linux/PPC load: console=ttyS0,115200 root=/dev/mtdblock1 rw rootfstype=jffs2
Uncompressing Linux...done.
Now booting the kernel
Linux version 2.6.5 (xyz@xyz) (gcc version 3.2.3) #2 Tue Jun 1 09:33:18 CEST 
2004
On node 0 totalpages: 8192
  DMA zone: 8192 pages, LIFO batch:2
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Built 1 zonelists
Kernel command line: console=ttyS0,115200 root=/dev/mtdblock1 rw 
rootfstype=jffs2
PID hash table entries: 256 (order 8: 2048 bytes)
Console: colour dummy device 80x25
Memory: 29768k available (1956k kernel code, 576k data, 80k init, 0k highmem)
Calibrating delay loop... 250.88 BogoMIPS
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Serial: 8250/16550 driver $Revision: 1.90 $ 7 ports, IRQ sharing disabled
ttyS0 at MMIO 0x0 (irq = 20) is a 16550A
ttyS1 at MMIO 0x0 (irq = 21) is a 16550A
ttyS2 at MMIO 0x0 (irq = 31) is a 16550A
loop: loaded (max 8 devices)
smc91111.c:v1.0saa 08/22/01 by Daris A Nevil (dnevil@snmc.com)
eth%d: SMC91C11xFD(r:1) at 0xc306a300 IRQ:28
MEM:8192b NOWAIT:0  ADDR 00:09:34:00:28:94
irq 28 setup to non-critical
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
OCP ide ver:2.0
IBM STB04xxx IDE driver version 2.0
mapped 400f0000 to c306c000
OCP ide: waiting for drive spinupioports for drive 0 @ c0286ad0
..Drive spun up
Probing IDE interface ide0...
hda: Maxtor 4D040H2, ATA DISK drive
irq 25 setup to non-critical
Using anticipatory io scheduler
ide0 at 0xc306c1f8-0xc306c1ff,0xc306c1f6 on irq 25
hda: max request size: 128KiB
hda: 80043264 sectors (40982 MB) w/2048KiB Cache, CHS=65535/16/63, UDMA(33)
 /dev/ide/host0/bus0/target0/lun0: p1
dreambox: flash mapping: 800000 at 7f800000
DreamBOX rev3+: Found 1 x16 devices at 0x0 in 16-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
disable flash VPP
Creating 5 MTD partitions on "DreamBOX rev3+":
0x00000000-0x00120000 : "DreamBOX cramfs"
0x00120000-0x007c0000 : "DreamBOX jffs2"
0x007c0000-0x00800000 : "DreamBOX OpenBIOS"
0x00000000-0x007c0000 : "DreamBOX (w/o bootloader)"
0x00000000-0x00800000 : "DreamBOX (w/ bootloader)"
USB #0 at 0xe0010000
irq 18 setup to non-critical
drivers/usb/host/ohci-ocp.c: ohci_hcd (OCP) at 0xe0010000, irq 18

ocp_usb 7: new USB bus registered, assigned bus number 1
usb usb1: Product: OCP OHCI
usb usb1: Manufacturer: Linux 2.6.5 ohci_hcd
usb usb1: SerialNumber: ocp
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
drivers/usb/core/usb.c: registered new driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
IBM IIC driver v2.0
irq 9 setup to non-critical
ibm-iic0: clckdiv = 6
ibm-iic0: init
ibm-iic0: using standard (100 kHz) mode
irq 10 setup to non-critical
ibm-iic1: clckdiv = 6
ibm-iic1: init
ibm-iic1: using standard (100 kHz) mode
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET: Registered protocol family 1
NET: Registered protocol family 17
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x0089 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x0051 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x0059 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000038: 0x0036 
instead
Further such events for this erase block will not be printed
Empty flash at 0x0000010c ends at 0x00000110
Empty flash at 0x0000030c ends at 0x00000310
Empty flash at 0x0000050c ends at 0x00000510
Empty flash at 0x0000070c ends at 0x00000710
Empty flash at 0x0000090c ends at 0x00000910
Empty flash at 0x00000b0c ends at 0x00000b10
Empty flash at 0x00000d0c ends at 0x00000d10
Empty flash at 0x00000f0c ends at 0x00000f10
Empty flash at 0x0000110c ends at 0x00001110
Empty flash at 0x0000130c ends at 0x00001310
Empty flash at 0x0000150c ends at 0x00001510
Empty flash at 0x0000170c ends at 0x00001710
Empty flash at 0x0000190c ends at 0x00001910
Empty flash at 0x00001b0c ends at 0x00001b10
Empty flash at 0x00001d0c ends at 0x00001d10
Empty flash at 0x00001f0c ends at 0x00001f10
Empty flash at 0x0000210c ends at 0x00002110
Empty flash at 0x0000230c ends at 0x00002310
Empty flash at 0x0000250c ends at 0x00002510
Empty flash at 0x0000270c ends at 0x00002710
Empty flash at 0x0000290c ends at 0x00002910
Empty flash at 0x00002b0c ends at 0x00002b10
Empty flash at 0x00002d0c ends at 0x00002d10
Empty flash at 0x00002f0c ends at 0x00002f10
Empty flash at 0x0000310c ends at 0x00003110
Empty flash at 0x0000330c ends at 0x00003310
Empty flash at 0x0000350c ends at 0x00003510
Empty flash at 0x0000370c ends at 0x00003710
Empty flash at 0x0000390c ends at 0x00003910
Empty flash at 0x00003b0c ends at 0x00003b10
Empty flash at 0x00003d0c ends at 0x00003d10
Empty flash at 0x00003f0c ends at 0x00003f10
Empty flash at 0x0000410c ends at 0x00004110
Empty flash at 0x0000430c ends at 0x00004310
Empty flash at 0x0000450c ends at 0x00004510
Empty flash at 0x0000470c ends at 0x00004710
Empty flash at 0x0000490c ends at 0x00004910
Empty flash at 0x00004b0c ends at 0x00004b10
Empty flash at 0x00004d0c ends at 0x00004d10
Empty flash at 0x00004f0c ends at 0x00004f10
Empty flash at 0x0000510c ends at 0x00005110
Empty flash at 0x0000530c ends at 0x00005310
Empty flash at 0x0000550c ends at 0x00005510
Empty flash at 0x0000570c ends at 0x00005710
Empty flash at 0x0000590c ends at 0x00005910
Empty flash at 0x00005b0c ends at 0x00005b10
Empty flash at 0x00005d0c ends at 0x00005d10
Empty flash at 0x00005f0c ends at 0x00005f10
Empty flash at 0x0000610c ends at 0x00006110
Empty flash at 0x0000630c ends at 0x00006310
usb 1-1: new full speed USB device using address 2
Empty flash at 0x0000650c ends at 0x00006510
Empty flash at 0x0000670c ends at 0x00006710
Empty flash at 0x0000690c ends at 0x00006910
Empty flash at 0x00006b0c ends at 0x00006b10
Empty flash at 0x00006d0c ends at 0x00006d10
Empty flash at 0x00006f0c ends at 0x00006f10
Empty flash at 0x0000710c ends at 0x00007110
Empty flash at 0x0000730c ends at 0x00007310
Empty flash at 0x0000750c ends at 0x00007510
Empty flash at 0x0000770c ends at 0x00007710
usb 1-1: Product: USB Embedded Hub
Empty flash at 0x0000790c ends at 0x00007910
Empty flash at 0x00007b0c ends at 0x00007b10
usb 1-1: Manufacturer: Leading Driver Co.,LTD.
Empty flash at 0x00007d0c ends at 0x00007d10
hub 1-1:1.0: USB hub found
Empty flash at 0x00007f0c ends at 0x00007f10
hub 1-1:1.0: 2 ports detected
Empty flash at 0x0000810c ends at 0x00008110
Empty flash at 0x0000830c ends at 0x00008310
Empty flash at 0x0000850c ends at 0x00008510
Empty flash at 0x0000870c ends at 0x00008710
Empty flash at 0x0000890c ends at 0x00008910
Empty flash at 0x00008b0c ends at 0x00008b10
Empty flash at 0x00008d0c ends at 0x00008d10
Empty flash at 0x00008f0c ends at 0x00008f10
Empty flash at 0x0000910c ends at 0x00009110
Empty flash at 0x0000930c ends at 0x00009310
Empty flash at 0x0000950c ends at 0x00009510
Empty flash at 0x0000970c ends at 0x00009710
Empty flash at 0x0000990c ends at 0x00009910
Empty flash at 0x00009b0c ends at 0x00009b10
Empty flash at 0x00009d0c ends at 0x00009d10
Empty flash at 0x00009f0c ends at 0x00009f10
Empty flash at 0x0000a10c ends at 0x0000a110
Empty flash at 0x0000a30c ends at 0x0000a310
Empty flash at 0x0000a50c ends at 0x0000a510
Empty flash at 0x0000a70c ends at 0x0000a710
Empty flash at 0x0000a90c ends at 0x0000a910
Empty flash at 0x0000ab0c ends at 0x0000ab10
Empty flash at 0x0000ad0c ends at 0x0000ad10
Empty flash at 0x0000af0c ends at 0x0000af10
Empty flash at 0x0000b10c ends at 0x0000b110
Empty flash at 0x0000b30c ends at 0x0000b310
Empty flash at 0x0000b50c ends at 0x0000b510
Empty flash at 0x0000b70c ends at 0x0000b710
Empty flash at 0x0000b90c ends at 0x0000b910
Empty flash at 0x0000bb0c ends at 0x0000bb10
Empty flash at 0x0000bd0c ends at 0x0000bd10
Empty flash at 0x0000bf0c ends at 0x0000bf10
Empty flash at 0x0000c10c ends at 0x0000c110
Empty flash at 0x0000c30c ends at 0x0000c310
Empty flash at 0x0000c50c ends at 0x0000c510
Empty flash at 0x0000c70c ends at 0x0000c710
Empty flash at 0x0000c90c ends at 0x0000c910
Empty flash at 0x0000cb0c ends at 0x0000cb10
Empty flash at 0x0000cd0c ends at 0x0000cd10
Empty flash at 0x0000cf0c ends at 0x0000cf10
Empty flash at 0x0000d10c ends at 0x0000d110
Empty flash at 0x0000d30c ends at 0x0000d310
Empty flash at 0x0000d50c ends at 0x0000d510
Empty flash at 0x0000d70c ends at 0x0000d710
Empty flash at 0x0000d90c ends at 0x0000d910
Empty flash at 0x0000db0c ends at 0x0000db10
Empty flash at 0x0000dd0c ends at 0x0000dd10
Empty flash at 0x0000df0c ends at 0x0000df10
Empty flash at 0x0000e10c ends at 0x0000e110
Empty flash at 0x0000e30c ends at 0x0000e310
Empty flash at 0x0000e50c ends at 0x0000e510
Empty flash at 0x0000e70c ends at 0x0000e710
Empty flash at 0x0000e90c ends at 0x0000e910
Empty flash at 0x0000eb0c ends at 0x0000eb10
Empty flash at 0x0000ed0c ends at 0x0000ed10
Empty flash at 0x0000ef0c ends at 0x0000ef10
Empty flash at 0x0000f10c ends at 0x0000f110
Empty flash at 0x0000f30c ends at 0x0000f310
Empty flash at 0x0000f50c ends at 0x0000f510
Empty flash at 0x0000f70c ends at 0x0000f710
usb 1-1.1: new full speed USB device using address 3
Empty flash at 0x0000f90c ends at 0x0000f910
Empty flash at 0x0000fb0c ends at 0x0000fb10
Empty flash at 0x0000fd0c ends at 0x0000fd10
Empty flash at 0x0000ff0c ends at 0x0000ff10
Empty flash at 0x0001010c ends at 0x00010110
Empty flash at 0x0001030c ends at 0x00010310
Empty flash at 0x0001050c ends at 0x00010510
Empty flash at 0x0001070c ends at 0x00010710
Empty flash at 0x0001090c ends at 0x00010910
Empty flash at 0x00010b0c ends at 0x00010b10
usb 1-1.1: Product: USB Mass Storage Device
Empty flash at 0x00010d0c ends at 0x00010d10
Empty flash at 0x00010f0c ends at 0x00010f10
usb 1-1.1: Manufacturer: Leading Driver Co.,LTD.
Empty flash at 0x0001110c ends at 0x00011110


Does anybody know what's the problem here? Thanks for help in advance!

greets dkey
