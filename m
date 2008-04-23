Received: from mail179.messagelabs.com ([85.158.139.35])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jogts-0006z4-Qw
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 15:28:49 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 powerfail ? 
Date: Wed, 23 Apr 2008 17:26:51 +0200
Message-ID: <1531E53627F1F749B4FE809BF2A4EB674AF845@WETMEX10.loepfe.com>
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,
=20
Trying to get a system running with nand and JFFS2 but...
=20
I seem to have problems with POWERFAILURE(S).
=20

I'm using=20
AT91SAM9260 CPU
Nand Flash (Samsung NAND 256MiB 3,3V 8-bit)
Kernel Linux version 2.6.24.latest-AT91-maxim-patches


All seems to go quite well, but from time to time after pressing the =
RESET button (of powerfail), I get CRC-errors , the numer of warnings =
increments typically each time I powerfail.
=20
JFFS2 notice: (791) check_node_data: wrong data CRC in data node at =
0x01062120: read 0xfac2f85a, calculated 0x9ac0c6d1.
JFFS2 notice: (791) check_node_data: wrong data CRC in data node at =
0x002b9bf0: read 0x9f182fab, calculated 0x4ad20e5f.
JFFS2 notice: (791) check_node_data: wrong data CRC in data node at =
0x002b5d60: read 0x79a2a9d8, calculated 0x35234c9a.
=20
=20
=20
Any hints or tips ... that can help me in finding the problem ?
=20

Note: /tmp os mounted on tmpfs=20
=20
# mount
rootfs on / type rootfs (rw)
/dev/root on / type jffs2 (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw)
tmpfs on /tmp type tmpfs (rw)
=20
=20
=20

Kind regards,
Noel Vellemans
=20
=20
=20
<< BOOTLOG>
=20
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
Clocks: CPU 198 MHz, master 99 MHz, main 18.432 MHz
CPU0: D VIVT write-back cache
CPU0: I cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
CPU0: D cache: 8192 bytes, associativity 4, 32 byte lines, 64 sets
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: =
16256
Kernel command line: mem=3D64M console=3DttyS0,115200n8 =
root=3D/dev/mtdblock4 rw noinitrd rootfstype=3Djffs2
AT91: 96 gpio irqs in 3 banks
PID hash table entries: 256 (order: 8, 1024 bytes)
Console: colour dummy device 80x30
console [ttyS0] enabled
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 64MB =3D 64MB total
Memory: 62220KB available (2352K code, 179K data, 112K init)
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
net_namespace: 64 bytes
NET: Registered protocol family 16
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 2, 16384 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
NetWinder Floating Point Emulator V0.97 (double precision)
JFFS2 version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler anticipatory registered (default)
atmel_usart.0: ttyS0 at MMIO 0xfefff200 (irq =3D 1) is a ATMEL_SERIAL
atmel_usart.1: ttyS1 at MMIO 0xfffb0000 (irq =3D 6) is a ATMEL_SERIAL
atmel_usart.2: ttyS2 at MMIO 0xfffb4000 (irq =3D 7) is a ATMEL_SERIAL
RAMDISK driver initialized: 16 RAM disks of 15360K size 1024 blocksize
loop: module loaded
MACB_mii_bus: probed
eth0: Atmel MACB at 0xfffc4000 irq 21 (aa:22:33:44:55:ee)
eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=3Dffffffff:00, =
irq=3D-1)
Driver 'sd' needs updating - please use bus_type methods
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB =
3,3V 8-bit)
Creating 8 MTD partitions on "NAND 256MiB 3,3V 8-bit":
0x00000000-0x00020000 : "Bootstrap   (PART0)"
0x00020000-0x00060000 : "U-Boot      (PART1)"
0x00060000-0x00080000 : "U-Boot-env  (PART2)"
0x00100000-0x00900000 : "Kernel      (PART3)"
0x00900000-0x02900000 : "Fs          (PART4)"
usbmon: debugfs is not available
at91_ohci at91_ohci: AT91 OHCI
at91_ohci at91_ohci: new USB bus registered, assigned bus number 1
at91_ohci at91_ohci: irq 20, io mem 0x00500000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usb usb1: Product: AT91 OHCI
usb usb1: Manufacturer: Linux 2.6.24.4 ohci_hcd
usb usb1: SerialNumber: at91
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial support registered for =
generic
usbcore: registered new interface driver usbserial_generic
drivers/usb/serial/usb-serial.c: USB Serial Driver core
udc: at91_udc version 3 May 2006
mice: PS/2 mouse device common for all mice
i2c /dev entries driver
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
Empty flash at 0x002abd34 ends at 0x002ac000
Empty flash at 0x002b6620 ends at 0x002b6800
Empty flash at 0x002ba55c ends at 0x002ba800
Empty flash at 0x002bd754 ends at 0x002bd800
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 112K
JFFS2 notice: (1) check_node_data: wrong data CRC in data node at =
0x002bcf84: read 0x33a387d7, calculated 0xcaaf3d68.
Initializing random number generator... done.
=20
<< END-BOOTLOG>>
=20

Kind regards,
Noel Vellemans
