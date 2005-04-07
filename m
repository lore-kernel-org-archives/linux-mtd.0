Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJTbX-0007wB-Gq
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 05:47:17 -0400
Received: by wproxy.gmail.com with SMTP id 57so417116wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2005 02:47:17 -0700 (PDT)
Message-ID: <c2bc1f405040702476af04972@mail.gmail.com>
Date: Thu, 7 Apr 2005 17:47:17 +0800
From: zheng wei <jeanwelly@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Subject: Error found when mounting a NANDFlash block as yaffs
Reply-To: zheng wei <jeanwelly@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I can't figure out what caused this error? Any comments are welcome.

linux command line is: "noinitrd root=3D/dev/mtdblock/3 init=3D/linuxrc
console=3Dtty"MACH_TYPE =3D 193
NOW, Booting Linux......
Uncompressing Linux........................................................=
.
do.Linux version 2.4.18-rmk7-pxa1 (root@localhost.localdomain) (gcc
version 2.95.24CPU: ARM/CIRRUS Arm920Tsid(wb) revision 0
Machine: Samsung-SMDK2410
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: noinitrd root=3D/dev/mtdblock/3 init=3D/linuxrc consol=
e=3DttyS0
DEBUG: timer count 15626
Console: colour dummy device 80x30
Calibrating delay loop... 99.94 BogoMIPS
Memory: 64MB =3D 64MB total
Memory: 62540KB available (1416K code, 434K data, 76K init)
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
CPU clock =3D 200.000 Mhz, HCLK =3D 100.000 Mhz, PCLK =3D 50.000 Mhz
Initializing S3C2410 buffer pool for DMA workaround
S3C2410 USB Controller Core Initialized
eth0: cs8900 rev K(3.3 Volts) found at 0xd0000300
cs89x0 media RJ-45, IRQ 37
get_random_bytes called before random driver initialization
usbctl: Opened for usb-eth
usbctl: Started for usb-eth
Starting kswapd
devfs: v1.10 (20020120) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
ttyS%d0 at I/O 0x50000000 (irq =3D 52) is a S3C2410
ttyS%d1 at I/O 0x50004000 (irq =3D 55) is a S3C2410
ttyS%d2 at I/O 0x50008000 (irq =3D 58) is a S3C2410
Console: switching to colour frame buffer device 30x40
Installed S3C2410 frame buffer
pty: 256 Unix98 ptys configured
s3c2410-ts initialized
S3C2410 Real Time Clock Driver v0.1
block: 128 slots per queue, batch=3D32
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=3D=
xx
loop: loaded (max 8 devices)
SCSI subsystem driver Revision: 1.00
scsi0 : SCSI host adapter emulation for IDE ATAPI devices
UDA1341 audio driver initialized
flash device information ec 76
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V)
Creating 5 MTD partitions on "NAND 64MiB 3,3V":
0x00000000-0x00020000 : "loader"
0x00020000-0x00030000 : "param"
0x00030000-0x001f0000 : "kernel"
0x00200000-0x00400000 : "root"
0x00400000-0x03ef8000 : "usr"
this is the result of add_mtd_partitions 0
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb-ohci.c: USB OHCI at membase 0xe9000000, IRQ 26
usb.c: new USB bus registered, assigned bus number 1
hub.c: USB hub found
port #1 suspened!
port #0 alived!
hub.c: 1 port detected
usb.c: registered new driver usblp
printer.c: v0.8:USB Printer Device Class driver
Initializing USB Mass Storage driver...
usb.c: registered new driver usb-storage
USB Mass Storage support registered.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
zw:Read first block, super.magic is28cd3d45
VFS: Mounted root (cramfs filesystem).
Mounted devfs on /dev
Freeing init memory: 76K
zw: mount /etc as ramfs
zw: re-create the /etc/mtab entries
zw: /bin/mount -f -t cramfs -o remount,ro /dev/mtdblock/3 /
zw: /sbin/insmod -f /lib/yaffs.o
zw: /bin/mount -t yaffs /dev/mtdblock/4 /usr
yaffs: dev is 7940 name is "1f:04"
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
4
pgd =3D c3eb4000
*pgd =3D 00000000, *pmd =3D 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c4886b70>]    lr : [<c4886940>]    Not tainted
sp : c3ebbbc4  ip : c3dac65c  fp : c3ebbbd0
r10: 0000c6a4  r9 : 00000004  r8 : 00000635
r7 : c3e12000  r6 : c3ebbbf4  r5 : c3dac640  r4 : c3ddc5dc
r3 : 00000000  r2 : c3ddc630  r1 : c3dac640  r0 : c3ddc5dc
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000317F  Table: 33EB4000  DAC: 00000015
Process mount (pid: 18, stackpage=3Dc3ebb000)
Stack: (0xc3ebbbb4 to 0xc3ebc000)
bba0:                                              c4886940 c4886b70 200000=
13
bbc0: ffffffff c3ebbe2c c3ebbbd4 c4886940 c4886b1c 00000001 00000636 c3ebbb=
ec
bbe0: c3e2b1a0 00000000 00000001 ffd00000 c1e4030b 00000001 00000102 6f70ff=
ff
bc00: 2e726577 006c6d78 00000000 00000000 00000000 00000000 00000000 000000=
00
bc20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bc40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bc60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bc80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bca0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bcc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bce0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 ffff00=
00
bd00: 000081ed 00000000 00000000 4cfa5e7d 4cfa5e7d 4cfa5e7d 00000000 ffffff=
ff
bd20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bd40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bd60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bd80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bda0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bdc0: 00000000 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffff=
ff
bde0: ffffffff ffffffff ffffffff ffffffff ffffffff ffd00000 030bffff e457a9=
66
be00: c3fff3c1 00000000 000041b6 c3e12000 c0374c00 00000200 00000000 c48892=
58
be20: c3ebbe48 c3ebbe30 c48873a4 c4886350 00000000 c3e12000 00000d14 c3ebbe=
70
be40: c3ebbe4c c4881a64 c488710c c0374c00 c0374c44 c039b160 00001f04 ffffff=
ea
be60: 00000000 c3ebbe80 c3ebbe74 c4881bb4 c48817ec c3ebbed8 c3ebbe84 c00500=
e8
be80: c4881b9c c3ebbe94 00000003 c3e13000 c4889414 c3e4ab20 c02ee360 c3e040=
00
bea0: c02ee3e0 c3e04000 00000009 00000001 00000000 c02ee3e0 c4889414 c3e130=
00
bec0: c3e04000 c3e05000 c3e04000 c3ebbefc c3ebbedc c00506f0 c004fec0 c3ebbf=
2c
bee0: 00000000 c3ebbf2c 00000000 c039c000 c3ebbf20 c3ebbf00 c0062bf0 c00506=
3c
bf00: 00000000 00000000 c3ebbf2c 00000000 c039c000 c3ebbf70 c3ebbf24 c0062f=
44
bf20: c0062bdc c3e04000 c3e13000 c3ebd1c0 c02ee320 c3e13000 00001000 000010=
00
bf40: 00000009 00000001 00000000 00000000 0204de50 c039c000 c0ed0000 c3eba0=
00
bf60: bfffffbe c3ebbfa4 c3ebbf74 c0062ffc c0062df0 c3e13000 c3e13000 c3e040=
00
bf80: c3e05000 0204fe88 00000000 c0ed0000 00000015 c001b7c4 00000000 c3ebbf=
a8
bfa0: c001b640 c0062f70 0204fe88 c0021728 0204de50 0204fe78 bfffffbe c0ed00=
00
bfc0: 0204fe88 00000000 c0ed0000 00000000 0204fe78 00000000 bfffffbe bffffe=
e8
bfe0: 4009eb90 bffff8a4 0201e178 4009eb9c 60000010 0204de50 00000000 000420=
00
Backtrace:
Function entered at [<c4886b0c>] from [<c4886940>]
Function entered at [<c4886340>] from [<c48873a4>]
Function entered at [<c48870fc>] from [<c4881a64>]
 r6 =3D 00000D14  r5 =3D C3E12000  r4 =3D 00000000
Function entered at [<c48817dc>] from [<c4881bb4>]
Function entered at [<c4881b8c>] from [<c00500e8>]
Function entered at [<c004feb0>] from [<c00506f0>]
Function entered at [<c005062c>] from [<c0062bf0>]
 r8 =3D C039C000  r7 =3D 00000000  r6 =3D C3EBBF2C  r5 =3D 00000000
 r4 =3D C3EBBF2C
Function entered at [<c0062bcc>] from [<c0062f44>]
 r8 =3D C039C000  r7 =3D 00000000  r6 =3D C3EBBF2C  r5 =3D 00000000
 r4 =3D 00000000
Function entered at [<c0062de0>] from [<c0062ffc>]
Function entered at [<c0062f60>] from [<c001b640>]
 r8 =3D C001B7C4  r7 =3D 00000015  r6 =3D C0ED0000  r5 =3D 00000000
 r4 =3D 0204FE88
Code: e581c01c e58cc004 e5903054 e2802054 (e583c004)
Segmentation fault
zw: exec /sbin/init
console=3D/dev/co.sole
init started:  BusyBox v0.60.3 (2002.05.13-08:36+0000) multi-c=E9=B5=AFl bi=
nary
Starting pid 21, console /dev/console: '/etc/init.d/rcS'
exec: /usr/etc/rc.local: No such file or dire=E9=B9=B4ory
Waiting for enter to start '/bin/sh' (pid 24, terminal /dev/console)
                                                                           =
    =20
Please press Enter to activate this console.


--=20
---------
jeanwelly
Email:  jeanwelly@gmail.com
China
