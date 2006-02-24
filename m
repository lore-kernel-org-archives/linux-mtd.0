Received: from nproxy.gmail.com ([64.233.182.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FCeeR-0003iI-DR
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 10:14:38 -0500
Received: by nproxy.gmail.com with SMTP id n28so285602nfc
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Feb 2006 07:14:32 -0800 (PST)
Message-ID: <d0cf8c90602240714g69b0bcf5y47dba43e25fb139c@mail.gmail.com>
Date: Fri, 24 Feb 2006 23:14:31 +0800
From: "Kein Yuan" <kein.yuan@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Strange problem with JFFS2/MTD on Linux 2.6.9 ith Intel J3 Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on a PXA270 based paltform with Intel J3 Flash on Linux
2.6.9.  I am sure that jffs2 image was written into the correct place
and verified by md5chk command in blob, but somehow kernel can detect
flash, can dump out the context correctly but failed to mount  the
flash partition as my root filesystem.  Can anybody here give me some
hints?    The boot log was pasted as below:


blob> boot

Starting kernel ...

Uncompressing Linux........................................................=
...........................
done, booting the kernel.
Linux version 2.6.9-intc1 (root@localhost.localdomain) (gcc version
3.4.3) #1 Fri Feb 24 23:03:21 EST 2006
CPU: XScale-PXA270 [69054117] revision 7 (ARMv5TE)
CPU: D undefined 5 cache
CPU: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Machine: Panther platform based on PXA270
Memory policy: ECC disabled, Data cache writeback
Run Mode clock: 208.00MHz (*16)
Turbo Mode clock: 520.00MHz (*2.5, active)
Memory clock: 104.00MHz (/2)
System bus clock: 208.00MHz
Built 1 zonelists
Kernel command line: root=3D/dev/mtdblock2 rootfstype=3Djffs2
ip=3D192.168.3.100:192.168.3.1::255.255.255.0::usb0:on
console=3DttyS0,115200 mem=3D8M
PID hash table entries: 64 (order: 6, 1024 bytes)
Console: colour dummy device 80x30
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 8MB =3D 8MB total
Memory: 5380KB available (2131K code, 439K data, 96K init)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
NET: Registered protocol family 16
SCSI subsystem initialized
Linux Kernel Card Services
  options:  none
usbcore: registered new driver hub
NET: Registered protocol family 23
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
pxa2xx-fb pxa2xx-fb: Invalid resolution or bit depth
pxa2xx-fb: probe of pxa2xx-fb failed with error -22
Base framebuffer not initialized, failed to load overlay driver!
SA1100 Real Time Clock driver v1.00
SA1100/PXA2xx Watchdog Timer: timer margin 60 sec
ttyS0 at MMIO 0x40100000 (irq =3D 22) is a FFUART
ttyS1 at MMIO 0x40200000 (irq =3D 21) is a BTUART
ttyS2 at MMIO 0x40700000 (irq =3D 20) is a STUART
Linux video capture interface: v1.00
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=3D=
xx
Using anticipatory io scheduler
Probing Intel PXA27x On-Chip ROM at physical address 0x00000000
(32-bit bankwidth)
Intel PXA27x On-Chip ROM: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
  Feature/Command Support:      00CE
     - Chip Erase:              unsupported
     - Suspend Erase:           supported
     - Suspend Program:         supported
     - Legacy Lock/Unlock:      supported
     - Queued Erase:            unsupported
     - Instant block lock:      unsupported
     - Protection Bits:         supported
     - Page-mode read:          supported
     - Synchronous read:        unsupported
     - Simultaneous operations: unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0001
     - Lock Bit Active:      yes
     - Valid Bit Active:     no
  Vcc Logic Supply Optimum Program/Erase Voltage: 3.3 V
cfi_cmdset_0001: Erase suspend on write enabled
Using word write method
No RedBoot partition table detected in Intel PXA27x On-Chip ROM
cmdlinepart partition parsing not available
Using static partitions on Intel PXA27x On-Chip ROM
Creating 3 MTD partitions on "Intel PXA27x On-Chip ROM":
0x00000000-0x00040000 : "Bootloader"
0x00040000-0x00240000 : "Kernel"
0x00240000-0x01240000 : "Filesystem"


<  -- Below is the output from the code to dump the first  0x100 bytes
of the file system partition and the context is the same as in the
Flash, also the same as the jffs2 image>

0xc1340000: 0xe0011985 0x0000002c 0xe0f1565f 0x00000001
0xc1340010: 0x00000000 0x00000002 0x41c00ce5 0x00000404
0xc1340020: 0x79dcb46e 0x37b02647 0x746f6f72 0xe0021985
0xc1340030: 0x00000044 0x98f7fb1d 0x00000002 0x00000001
0xc1340040: 0x000041ed 0x00000000 0x00000000 0x41c00ce5
0xc1340050: 0x41c00ce5 0x41c00ce5 0x00000000 0x00000000
0xc1340060: 0x00000000 0x00000000 0x00000000 0x36e8747a
0xc1340070: 0xe0011985 0x0000002c 0xe0f1565f 0x00000001

0xc1340080: 0x00000001 0x00000003 0x41a6db22 0x00000404
0xc1340090: 0x8cbbf632 0x0a945b28 0x636f7270 0xe0021985
0xc13400a0: 0x00000044 0x98f7fb1d 0x00000003 0x00000001
0xc13400b0: 0x000041ed 0x00000000 0x00000000 0x41a6db22
0xc13400c0: 0x41a6db22 0x41a6db22 0x00000000 0x00000000
0xc13400d0: 0x00000000 0x00000000 0x00000000 0xb763ee60
0xc13400e0: 0xe0011985 0x0000002b 0x7d266ee6 0x00000001
0xc13400f0: 0x00000002 0x00000004 0x41a6db22 0x00000403
Setting port 3 power failed.
drivers/usb/host/ohci-pxa.c: ohci_hcd (PXA) at 0xf8000000, irq 3

pxa-ohci pxa-ohci: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
usbcore: registered new driver cdc_acm
drivers/usb/class/cdc-acm.c: v0.23:USB Abstract Control Model driver
for USB modems and ISDN adapters
Initializing USB Mass Storage driver...
usbcore: registered new driver usb-storage
USB Mass Storage support registered.
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
pxa27x_udc: version 23-Sep-2004
usb0: Ethernet Gadget, version: St Patrick's Day 2004
usb0: using pxa27x_udc, OUT Bulk-out-2 IN Bulk-in-1
usb0: MAC 4a:4a:28:c8:ff:ec
mice: PS/2 mouse device common for all mice
enable_irq(18) unbalanced from c001685c
I2C: Adding PXA i2c adapter.
I2C: Successfully added bus
I2C: PXA algorithm module loaded.
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 1024)
NET: Registered protocol family 1
IP-Config: Complete:
      device=3Dusb0, addr=3D192.168.3.100, mask=3D255.255.255.0, gw=3D255.2=
55.255.255,
     host=3D192.168.3.100, domain=3D, nis-domain=3D(none),
     bootserver=3D192.168.3.1, rootserver=3D192.168.3.1, rootpath=3D
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00037ef4:
0x9f54 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003f070:
0xf960 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0x085c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
0x1860 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000d2bb4:
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0012a370:
0x006e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240004:
0x8db9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a7c34:
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0004:
0x0006 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340004:
0x5ea8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380004:
0x3000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004:
0x0064 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003ea734:
0x0013 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00440004:
0xa748 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c6f84:
0x963b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c8614:
0x6172 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00548098:
0x4340 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x006c9e38:
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00940004:
0x870c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x009b6844:
0xb65c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00004:
0x073c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a65810:
0x8f40 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a839c0:
0x0336 instead
Empty flash at 0x00c27e80 ends at 0x00c27e84
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c424dc:
0x0063 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d00004:
0x00d0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d0812c:
0xff8c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d14f3c:
0xff48 instead
Empty flash at 0x00d83624 ends at 0x00d8362c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00e40004:
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00e4b5c8:
0x0fcc instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00f40004:
0x9008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00ff6cb0:
0x8f40 instead
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 64
VFS: Cannot open root device "mtdblock2" or unknown-block(31,2)
Please append a correct "root=3D" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(3=
1,2)
