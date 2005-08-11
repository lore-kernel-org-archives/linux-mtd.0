Received: from mx3.mail.ru ([194.67.23.149])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3DAD-0005Te-2Y
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 09:32:11 -0400
Received: from [213.148.1.228] (port=48029 helo=[192.168.0.37])
	by mx3.mail.ru with asmtp id 1E3DA9-000Bfb-00
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 17:32:01 +0400
Message-ID: <42FB5384.2090804@mail.ru>
Date: Thu, 11 Aug 2005 17:32:52 +0400
From: Alex Karev <lineum@mail.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: jffs2 root  filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems that problem gone with upgrading to 2.6. kernel.
Thanks to all, and my apologize for distraction. 2.4. kernel was wish of 
our customer, but now we have strong arguments to debate about 2.6 :-)

Now we are trying to make root file system on nand, and here come some 
mysterious debug output while booting which we can't interpreter.

The operation order was:
1.    flash_eraseall -j /dev/mtdN
2.    mount -t jffs2 /dev/mtblockN /mnt
3.     ... copy root fs files to /mnt
4.     umount /mnt
5.    verification and mount umount test -> all ok.


we also was playing with mkfs.jffs2 and nandwrite, but failed even to 
mount files ytem.
mkfs.jffs2 -e 0x4000 -l -r ... -o ...
nandwrite -j /dev/mtdN img

where N = [0,1];



While booting  we have:

Loading kernel..............................Ready.
Linux version 2.6.12.4 (alex@slack-srv) (gcc version 3.3.4) #1 Thu Aug 11 14:57:31 MSD 2005
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009d800 (usable)
 BIOS-e820: 000000000009d800 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000008000000 (usable)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
128MB LOWMEM available.
DMI not present.
Allocating PCI resources starting at 08000000 (gap: 08000000:f7f00000)
Built 1 zonelists
Kernel command line: BOOT_IMAGE=kernel root=/dev/mtdblock0 rootfs=jffs2 vag=0x315 console=ttyS0,115200n8 console=tty1
Initializing CPU#0
PID hash table entries: 1024 (order: 10, 16384 bytes)
Detected 199.618 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 125704k/131072k available (2217k kernel code, 4912k reserved, 945k data, 168k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Mount-cache hash table entries: 512
CPU: Rise iDragon
CPU: Rise iDragon stepping 01
Checking 'hlt' instruction... OK.
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xff6cc, last bus=0
PCI: Using configuration type 1
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
PCI: Probing PCI hardware
PCI: Probing PCI hardware (bus 00)
PCI: Ignoring BAR0-3 of IDE controller 0000:00:0d.0
audit: initializing netlink socket (disabled)
audit(1123793271.425:0): initialized
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
vga16fb: mapped to 0xc00a0000
Console: switching to colour frame buffer device 80x30
fb0: VGA16 VGA frame buffer device
Non-volatile memory driver v1.2
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
Serial: 8250/16550 driver $Revision: 1.90 $ 48 ports, IRQ sharing enabled
ÿttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
natsemi dp8381x driver, version 1.07+LK1.0.17, Sep 27, 2002
  originally by Donald Becker <becker@scyld.com>
  http://www.scyld.com/network/natsemi.html
  2.4.x kernel port by Jeff Garzik, Tjeerd Mulder
natsemi eth0: NatSemi DP8381[56] at 0xfa000000 (0000:00:17.0), 00:08:b3:00:00:1e, IRQ 10, port TP.
natsemi eth1: NatSemi DP8381[56] at 0xfa001000 (0000:00:18.0), 00:08:b3:00:00:1f, IRQ 10, port TP.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
hdc: SAMSUNG CF/ATA, CFA DISK drive
ide1 at 0x170-0x177,0x376 on irq 15
hdc: max request size: 128KiB
hdc: 254208 sectors (130 MB) w/0KiB Cache, CHS=993/8/32
hdc: cache flushes not supported
 hdc: hdc1 hdc2
Flash driver build on Aug 11 2005 at 14:42:17
Reseting flash control register
NAND device: Manufacturer ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MiB 3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 339 at 0x0054c000
Bad eraseblock 683 at 0x00aac000
Bad eraseblock 999 at 0x00f9c000
Using static partition definition
Creating 2 MTD partitions on "NAND 16MiB 3,3V 8-bit":
0x00000000-0x00800000 : "Nand Flash MAIN"
mtd: Giving out device 0 to Nand Flash MAIN
0x00800000-0x01000000 : "Nand Flash JFFS"
mtd: Giving out device 1 to Nand Flash JFFS
Return happy
usbmon: debugs is not available
USB Universal Host Controller Interface driver v2.2
usbcore: registered new driver usblp
drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.01:USB HID core driver
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
ip_conntrack version 2.1 (1024 buckets, 8192 max) - 212 bytes per conntrack
input: AT Translated Set 2 keyboard on isa0060/serio0
ip_tables: (C) 2000-2002 Netfilter core team
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
arp_tables: (C) 2002 David S. Miller
NET: Registered protocol family 1
NET: Registered protocol family 17
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
input: GenPS/2 Genius Wheel Mouse on isa0060/serio1
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mtdblock_open
ok
nand_read_ecc: Failed ECC read, page 0x00002a60
nand_read_ecc: Failed ECC read, page 0x00002a60
end_request: I/O error, dev mtdblock0, sector 10848
UDF-fs: No VRS found
mtdblock_release
ok
Kernel panic - not syncing: VFS: U



UDF filesytem not compiled into the kernel.
