Received: from smtp-vbr3.xs4all.nl ([194.109.24.23])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HnUZj-00015p-ER
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 03:02:35 -0400
Received: from server01 (a80-126-23-145.adsl.xs4all.nl [80.126.23.145])
	by smtp-vbr3.xs4all.nl (8.13.8/8.13.8) with ESMTP id l4E72SS4007077
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 May 2007 09:02:29 +0200 (CEST) (envelope-from teun@adesys.nl)
Received: from 192.168.10.82 by server01 ([192.168.10.1] running VPOP3) with
	SMTP for <linux-mtd@lists.infradead.org>;
	Mon, 14 May 2007 09:02:28 +0200
From: "Teun Grinwis" <teun@adesys.nl>
To: "Mtd List" <linux-mtd@lists.infradead.org>
Subject: jffs2/mtd on flash Spansion S29GL064AR4
Date: Mon, 14 May 2007 09:02:31 +0200
Message-ID: <LOEGJDCFIFDBMCDIAOKDGENPCHAA.teun@adesys.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0049_01C79606.9ADA33B0"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0049_01C79606.9ADA33B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello all,

Can someone give hint where to start debug searching ??

I use uCLinux distribution 20060511 2.16.16-uc0 on custom MCF 5208 board.
With flash, Spansion S29GL064AR4. Debug for mtd, jffs2 set to noisy.

When I mount a mtdblock on jffs2 I got the following error:

See below.
Command: mount -t jffs2 /dev/mtdblock3 /mnt
Command:
Command:
Execution Finished, Exiting
mtdblock: read on "Romfs" at 0x3d400, size 0x200

MTD do_erase_oneblock(): ERASE 0x000a0000
*** ILLEGAL INSTRUCTION ***   FORMAT=4
Current process id is 9
BAD KERNEL TRAP: 00000000
PC: [<00000000>]
SR: 2718  SP: 402cfcec  a2: 40281770
d0: 00002710    d1: 00000001    d2: 00000000    d3: 400140f4
...........

I can run my image successful on Intec 5208EVB

My MTD partitions are as follows (btw i did not change flash name string):

------------------------
Am29BDD160G 2.5v flash device (2MB): Found 1 x16 devices at 0x0 in 16-bit
bank
 Amd/Fujitsu Extended Query Table at 0x0040
cfi_send_gen_cmd():,40 cmd=98 addr=00000055 base=00000000 build
addr=000000aa cm
d_val=00000008
cfi_send_gen_cmd():,41 cmd=f0 addr=00000000 base=00000000 build
addr=00000000 cm
d_val=00000040
cfi_send_gen_cmd():,42 cmd=ff addr=00000000 base=00000000 build
addr=00000000 cm
d_val=00000040
Using buffer write method
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

Creating 3 MTD partitions on "Am29BDD160G 2.5v flash device (2MB)":

0x00000000-0x00040000 : "dBUG (256K)"
mtd: Giving out device 2 to dBUG (256K)

0x00040000-0x000c0000 : "User FS (512K)"
mtd: Giving out device 3 to User FS (512K)

0x000c0000-0x00200000 : "Kernel + RootFS (1280K)"
mtd: Giving out device 4 to Kernel + RootFS (1280K)
m520xevb ram probe(0x40150020,de000,4): de000 at 40150020

m520xevb ram probe(0x40150020,de000,4): de000 at 40150020
do_map_probe(): name=map_ram <5>Creating 1 MTD partitions on "RAM":
0x00000000-0x000de000 : "Romfs"
mtd: Giving out device 5 to Romfs
init_m520x: Root filesystem maj:31 mtdblock:5
----------------------------

I mount jffs2 on "User FS", addresses 0x40000 - 0xc0000

I can run my image successful on the EVB see attached file Log_uclinux_evb.

I started all from a clean flash, erase flash, program dBUG, dn image.bin,
exec image.

When starting on EVB, jffs2 is initializing "User FS" by MTD
do_erase_oneblock,
MTD do_write_oneword(s) 0x..0 - 0x..a for all sectors in "User FS", startup
successful.

When starting on custom board *** ILLEGAL INSTRUCTION *** occurs after the
first
MTD do_erase_oneblock(), see attached file Log_uclinux_ads4010, startup
unsuccessful.

It seems that the error has something todo with (erase) timing ?? since in
call trace:
...
BUG: pdflush/9, lock held at task exit time!
 [403b6446] {alloc_super}
.. held by:           pdflush:    9 [402b2330, 115]
... acquired at:

After further investigation it seems that in
cfi_cmdset_0002.c:do_erase_oneblock,
the code execution does not reach: spin_unlock(chip->mutex).

Any suggestions, to proceed ???

Thanks in advance,

Teun Grinwis

------=_NextPart_000_0049_01C79606.9ADA33B0
Content-Type: application/octet-stream;
	name="Log_uclinux_evb"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Log_uclinux_evb"

uClinux/COLDFIRE(m520x)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
Built 1 zonelists
Kernel command line: console=3DttyS0,115200 rootfstype=3Dromfs
PID hash table entries: 128 (order: 7, 2048 bytes)
-->request_irq: nr=3D68 name=3DColdFire Timer
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory available: 30216k/32768k RAM, 0k/0k ROM (1060k kernel code, 155k =
data)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
io scheduler noop registered (default)
-->request_irq: nr=3D69 name=3DColdFire PIT2
MCF520x PIT2 driver ok
-->request_irq: nr=3D95 name=3DColdFire QSPI
MCF520x QSPI driver ok
ColdFire internal UART serial driver version 1.00
-->request_irq: nr=3D90 name=3DColdFire UART
ttyS0 at 0xfc060000 (irq =3D 90) is a builtin ColdFire UART
-->request_irq: nr=3D91 name=3DColdFire UART
ttyS1 at 0xfc064000 (irq =3D 91) is a builtin ColdFire UART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
FEC ENET Version 0.2
-->request_irq: nr=3D100 name=3Dfec(TXF)
-->request_irq: nr=3D101 name=3Dfec(TXB)
-->request_irq: nr=3D102 name=3Dfec(TXFIFO)
-->request_irq: nr=3D103 name=3Dfec(TXCR)
-->request_irq: nr=3D104 name=3Dfec(RXF)
-->request_irq: nr=3D105 name=3Dfec(RXB)
-->request_irq: nr=3D106 name=3Dfec(MII)
-->request_irq: nr=3D107 name=3Dfec(LC)
-->request_irq: nr=3D108 name=3Dfec(HBERR)
-->request_irq: nr=3D109 name=3Dfec(GRA)
-->request_irq: nr=3D110 name=3Dfec(EBERR)
-->request_irq: nr=3D111 name=3Dfec(BABT)
-->request_irq: nr=3D112 name=3Dfec(BABR)
fec: PHY @ 0x1, ID 0x20005c90 -- DP83848
eth0: ethernet 00:cf:52:08:cf:01
physmap flash device: 200000 at 0
do_map_probe(): name=3Dcfi_probe cfi_send_gen_cmd():,1 cmd=3Df0 =
addr=3D00000000 base=3D0
0000000 build addr=3D00000000 cmd_val=3D00000001
cfi_send_gen_cmd():,2 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000001
cfi_send_gen_cmd():,3 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cmd
_val=3D00000001
cfi_send_gen_cmd():,4 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000002
cfi_send_gen_cmd():,5 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000002
cfi_send_gen_cmd():,6 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cmd
_val=3D00000002
cfi_send_gen_cmd():,7 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000004
cfi_send_gen_cmd():,8 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000004
cfi_send_gen_cmd():,9 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000002a8 cmd
_val=3D00000004
cfi_send_gen_cmd():,10 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,11 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,12 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000002
cfi_send_gen_cmd():,13 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,14 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,15 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000004
cfi_send_gen_cmd():,16 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000000
cfi_send_gen_cmd():,17 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,18 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000001c
cfi_send_gen_cmd():,19 cmd=3D90 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,20 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
cfi_send_gen_cmd():,21 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
phys_mapped_flash: Found 1 x32 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
cfi_send_gen_cmd():,22 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000008
cfi_send_gen_cmd():,23 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
cfi_send_gen_cmd():,24 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
phys_mapped_flash: CFI does not contain boot bank location. Assuming =
top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available
RedBoot partition parsing not available
mtd: Giving out device 0 to phys_mapped_flash
uclinux[mtd]: RAM probe address=3D0x40150020 size=3D0xde000
do_map_probe(): name=3Dmap_ram <5>Creating 1 MTD partitions on "RAM":
0x00000000-0x000de000 : "ROMfs"
mtd: Giving out device 1 to ROMfs
uclinux[mtd]: set ROMfs to be root filesystem
m520xevb flash probe(0x0,200000,2): 200000 at 0
do_map_probe(): name=3Dcfi_probe cfi_send_gen_cmd():,25 cmd=3Df0 =
addr=3D00000000 base=3D
00000000 build addr=3D00000000 cmd_val=3D00000001
cfi_send_gen_cmd():,26 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000001
cfi_send_gen_cmd():,27 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000001
cfi_send_gen_cmd():,28 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,29 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,30 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000002
cfi_send_gen_cmd():,31 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,32 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,33 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000002a8 cm
d_val=3D00000004
cfi_send_gen_cmd():,34 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,35 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,36 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000002
cfi_send_gen_cmd():,37 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,38 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,39 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000004
cfi_send_gen_cmd():,40 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000000
cfi_send_gen_cmd():,41 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,42 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000001c
cfi_send_gen_cmd():,43 cmd=3D90 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,44 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
cfi_send_gen_cmd():,45 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
Am29BDD160G 2.5v flash device (2MB): Found 1 x32 devices at 0x0 in =
16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
cfi_send_gen_cmd():,46 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000008
cfi_send_gen_cmd():,47 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
hier stoppen
cfi_send_gen_cmd():,48 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
Am29BDD160G 2.5v flash device (2MB): CFI does not contain boot bank =
location. As
suming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 3 MTD partitions on "Am29BDD160G 2.5v flash device (2MB)":
0x00000000-0x00040000 : "dBUG (256K)"
mtd: Giving out device 2 to dBUG (256K)
0x00040000-0x000c0000 : "User FS (512K)"
mtd: Giving out device 3 to User FS (512K)
0x000c0000-0x00200000 : "Kernel + RootFS (1280K)"
mtd: Giving out device 4 to Kernel + RootFS (1280K)
m520xevb ram probe(0x40150020,de000,4): de000 at 40150020
do_map_probe(): name=3Dmap_ram <5>Creating 1 MTD partitions on "RAM":
0x00000000-0x000de000 : "Romfs"
mtd: Giving out device 5 to Romfs
init_m520x: Root filesystem maj:31 mtdblock:5=20
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
mtdblock_open
ok
mtdblock: read on "Romfs" at 0x0, size 0x200
mtdblock: read on "Romfs" at 0x200, size 0x200
VFS: Mounted root (romfs filesystem) readonly.
Freeing unused kernel memory: 52k freed (0x40134000 - 0x40140000)
mtdblock: read on "Romfs" at 0xd0c00, size 0x200
mtdblock: read on "Romfs" at 0xd0e00, size 0x200
mtdblock: read on "Romfs" at 0xd1000, size 0x200
mtdblock: read on "Romfs" at 0xd1200, size 0x200
mtdblock: read on "Romfs" at 0xd1400, size 0x200
mtdblock: read on "Romfs" at 0xd1600, size 0x200
mtdblock: read on "Romfs" at 0xd1800, size 0x200
mtdblock: read on "Romfs" at 0xd1a00, size 0x200
mtdblock: read on "Romfs" at 0xd5000, size 0x200
mtdblock: read on "Romfs" at 0xd5200, size 0x200
mtdblock: read on "Romfs" at 0xd5c00, size 0x200
mtdblock: read on "Romfs" at 0xd5e00, size 0x200
mtdblock: read on "Romfs" at 0xd6000, size 0x200
mtdblock: read on "Romfs" at 0xd6200, size 0x200
mtdblock: read on "Romfs" at 0xdd000, size 0x200
mtdblock: read on "Romfs" at 0xdd200, size 0x200
mtdblock: read on "Romfs" at 0xd1c00, size 0x200
mtdblock: read on "Romfs" at 0xd1e00, size 0x200
mtdblock: read on "Romfs" at 0xd2000, size 0x200
mtdblock: read on "Romfs" at 0xd2200, size 0x200
mtdblock: read on "Romfs" at 0xd2c00, size 0x200
mtdblock: read on "Romfs" at 0xd2e00, size 0x200
mtdblock: read on "Romfs" at 0xd3000, size 0x200
mtdblock: read on "Romfs" at 0xd3200, size 0x200
mtdblock: read on "Romfs" at 0x5c00, size 0x200
mtdblock: read on "Romfs" at 0x5e00, size 0x200
mtdblock: read on "Romfs" at 0x17800, size 0x200
mtdblock: read on "Romfs" at 0x17a00, size 0x200
mtdblock: read on "Romfs" at 0x23000, size 0x200
mtdblock: read on "Romfs" at 0x23200, size 0x200
mtdblock: read on "Romfs" at 0x23400, size 0x200
mtdblock: read on "Romfs" at 0x23600, size 0x200
mtdblock: read on "Romfs" at 0x23800, size 0x200
mtdblock: read on "Romfs" at 0x23a00, size 0x200
mtdblock: read on "Romfs" at 0x23c00, size 0x200
mtdblock: read on "Romfs" at 0x23e00, size 0x200
mtdblock: read on "Romfs" at 0x24000, size 0x200
mtdblock: read on "Romfs" at 0x24200, size 0x200
mtdblock: read on "Romfs" at 0x24400, size 0x200
mtdblock: read on "Romfs" at 0x24600, size 0x200
mtdblock: read on "Romfs" at 0x24800, size 0x200
mtdblock: read on "Romfs" at 0x24a00, size 0x200
mtdblock: read on "Romfs" at 0x24c00, size 0x200
mtdblock: read on "Romfs" at 0x24e00, size 0x200
mtdblock: read on "Romfs" at 0x25000, size 0x200
mtdblock: read on "Romfs" at 0x25200, size 0x200
mtdblock: read on "Romfs" at 0x25400, size 0x200
mtdblock: read on "Romfs" at 0x25600, size 0x200
mtdblock: read on "Romfs" at 0x25800, size 0x200
mtdblock: read on "Romfs" at 0x25a00, size 0x200
mtdblock: read on "Romfs" at 0x25c00, size 0x200
mtdblock: read on "Romfs" at 0x25e00, size 0x200
mtdblock: read on "Romfs" at 0x26000, size 0x200
mtdblock: read on "Romfs" at 0x26200, size 0x200
mtdblock: read on "Romfs" at 0x26400, size 0x200
mtdblock: read on "Romfs" at 0x26600, size 0x200
mtdblock: read on "Romfs" at 0x26800, size 0x200
mtdblock: read on "Romfs" at 0x26a00, size 0x200
mtdblock: read on "Romfs" at 0x26c00, size 0x200
mtdblock: read on "Romfs" at 0x26e00, size 0x200
mtdblock: read on "Romfs" at 0x27000, size 0x200
mtdblock: read on "Romfs" at 0x27200, size 0x200
mtdblock: read on "Romfs" at 0x27400, size 0x200
mtdblock: read on "Romfs" at 0x27600, size 0x200
mtdblock: read on "Romfs" at 0x27800, size 0x200
mtdblock: read on "Romfs" at 0x27a00, size 0x200
mtdblock: read on "Romfs" at 0x27c00, size 0x200
mtdblock: read on "Romfs" at 0x27e00, size 0x200
mtdblock: read on "Romfs" at 0x28000, size 0x200
mtdblock: read on "Romfs" at 0x28200, size 0x200
mtdblock: read on "Romfs" at 0x28400, size 0x200
mtdblock: read on "Romfs" at 0x28600, size 0x200
mtdblock: read on "Romfs" at 0x28800, size 0x200
mtdblock: read on "Romfs" at 0x28a00, size 0x200
mtdblock: read on "Romfs" at 0x28c00, size 0x200
mtdblock: read on "Romfs" at 0x28e00, size 0x200
mtdblock: read on "Romfs" at 0x29000, size 0x200
mtdblock: read on "Romfs" at 0x29200, size 0x200
mtdblock: read on "Romfs" at 0x29400, size 0x200
mtdblock: read on "Romfs" at 0x29600, size 0x200
mtdblock: read on "Romfs" at 0x29800, size 0x200
mtdblock: read on "Romfs" at 0x29a00, size 0x200
mtdblock: read on "Romfs" at 0x6000, size 0x200
mtdblock: read on "Romfs" at 0x6200, size 0x200
mtdblock: read on "Romfs" at 0x6400, size 0x200
mtdblock: read on "Romfs" at 0x6600, size 0x200
mtdblock: read on "Romfs" at 0x6800, size 0x200
mtdblock: read on "Romfs" at 0x6a00, size 0x200
mtdblock: read on "Romfs" at 0x6c00, size 0x200
mtdblock: read on "Romfs" at 0x6e00, size 0x200
mtdblock: read on "Romfs" at 0x7000, size 0x200
mtdblock: read on "Romfs" at 0x7200, size 0x200
mtdblock: read on "Romfs" at 0x7400, size 0x200
mtdblock: read on "Romfs" at 0x7600, size 0x200
mtdblock: read on "Romfs" at 0x7800, size 0x200
mtdblock: read on "Romfs" at 0x7a00, size 0x200
mtdblock: read on "Romfs" at 0x7c00, size 0x200
mtdblock: read on "Romfs" at 0x7e00, size 0x200
mtdblock: read on "Romfs" at 0x8000, size 0x200
mtdblock: read on "Romfs" at 0x8200, size 0x200
mtdblock: read on "Romfs" at 0x8400, size 0x200
mtdblock: read on "Romfs" at 0x8600, size 0x200
mtdblock: read on "Romfs" at 0x8800, size 0x200
mtdblock: read on "Romfs" at 0x8a00, size 0x200
mtdblock: read on "Romfs" at 0x8c00, size 0x200
mtdblock: read on "Romfs" at 0x8e00, size 0x200
mtdblock: read on "Romfs" at 0x9000, size 0x200
mtdblock: read on "Romfs" at 0x9200, size 0x200
mtdblock: read on "Romfs" at 0x9400, size 0x200
mtdblock: read on "Romfs" at 0x9600, size 0x200
mtdblock: read on "Romfs" at 0x9800, size 0x200
mtdblock: read on "Romfs" at 0x9a00, size 0x200
mtdblock: read on "Romfs" at 0x9c00, size 0x200
mtdblock: read on "Romfs" at 0x9e00, size 0x200
mtdblock: read on "Romfs" at 0xa000, size 0x200
mtdblock: read on "Romfs" at 0xa200, size 0x200
mtdblock: read on "Romfs" at 0xa400, size 0x200
mtdblock: read on "Romfs" at 0xa600, size 0x200
mtdblock: read on "Romfs" at 0xa800, size 0x200
mtdblock: read on "Romfs" at 0xaa00, size 0x200
mtdblock: read on "Romfs" at 0xac00, size 0x200
mtdblock: read on "Romfs" at 0xae00, size 0x200
mtdblock: read on "Romfs" at 0xb000, size 0x200
mtdblock: read on "Romfs" at 0xb200, size 0x200
mtdblock: read on "Romfs" at 0xb400, size 0x200
mtdblock: read on "Romfs" at 0xb600, size 0x200
mtdblock: read on "Romfs" at 0xb800, size 0x200
mtdblock: read on "Romfs" at 0xba00, size 0x200
mtdblock: read on "Romfs" at 0xbc00, size 0x200
mtdblock: read on "Romfs" at 0xbe00, size 0x200
mtdblock: read on "Romfs" at 0xc000, size 0x200
mtdblock: read on "Romfs" at 0xc200, size 0x200
mtdblock: read on "Romfs" at 0xc400, size 0x200
mtdblock: read on "Romfs" at 0xc600, size 0x200
mtdblock: read on "Romfs" at 0xc800, size 0x200
mtdblock: read on "Romfs" at 0xca00, size 0x200
mtdblock: read on "Romfs" at 0xcc00, size 0x200
mtdblock: read on "Romfs" at 0xce00, size 0x200
mtdblock: read on "Romfs" at 0xd000, size 0x200
mtdblock: read on "Romfs" at 0xd200, size 0x200
mtdblock: read on "Romfs" at 0xd400, size 0x200
mtdblock: read on "Romfs" at 0xd600, size 0x200
mtdblock: read on "Romfs" at 0xd800, size 0x200
mtdblock: read on "Romfs" at 0xda00, size 0x200
mtdblock: read on "Romfs" at 0xdc00, size 0x200
mtdblock: read on "Romfs" at 0xde00, size 0x200
mtdblock: read on "Romfs" at 0xe000, size 0x200
mtdblock: read on "Romfs" at 0xe200, size 0x200
mtdblock: read on "Romfs" at 0xe400, size 0x200
mtdblock: read on "Romfs" at 0xe600, size 0x200
mtdblock: read on "Romfs" at 0xe800, size 0x200
mtdblock: read on "Romfs" at 0xea00, size 0x200
mtdblock: read on "Romfs" at 0xec00, size 0x200
mtdblock: read on "Romfs" at 0xee00, size 0x200
mtdblock: read on "Romfs" at 0xf000, size 0x200
mtdblock: read on "Romfs" at 0xf200, size 0x200
mtdblock: read on "Romfs" at 0xf400, size 0x200
mtdblock: read on "Romfs" at 0xf600, size 0x200
mtdblock: read on "Romfs" at 0xf800, size 0x200
mtdblock: read on "Romfs" at 0xfa00, size 0x200
mtdblock: read on "Romfs" at 0xfc00, size 0x200
mtdblock: read on "Romfs" at 0xfe00, size 0x200
mtdblock: read on "Romfs" at 0x10000, size 0x200
mtdblock: read on "Romfs" at 0x10200, size 0x200
mtdblock: read on "Romfs" at 0x10400, size 0x200
mtdblock: read on "Romfs" at 0x10600, size 0x200
mtdblock: read on "Romfs" at 0x10800, size 0x200
mtdblock: read on "Romfs" at 0x10a00, size 0x200
mtdblock: read on "Romfs" at 0x10c00, size 0x200
mtdblock: read on "Romfs" at 0x10e00, size 0x200
mtdblock: read on "Romfs" at 0x11000, size 0x200
mtdblock: read on "Romfs" at 0x11200, size 0x200
mtdblock: read on "Romfs" at 0x11400, size 0x200
mtdblock: read on "Romfs" at 0x11600, size 0x200
mtdblock: read on "Romfs" at 0x11800, size 0x200
mtdblock: read on "Romfs" at 0x11a00, size 0x200
mtdblock: read on "Romfs" at 0x11c00, size 0x200
mtdblock: read on "Romfs" at 0x11e00, size 0x200
mtdblock: read on "Romfs" at 0x12000, size 0x200
mtdblock: read on "Romfs" at 0x12200, size 0x200
mtdblock: read on "Romfs" at 0x12400, size 0x200
mtdblock: read on "Romfs" at 0x12600, size 0x200
mtdblock: read on "Romfs" at 0x12800, size 0x200
mtdblock: read on "Romfs" at 0x12a00, size 0x200
mtdblock: read on "Romfs" at 0x12c00, size 0x200
mtdblock: read on "Romfs" at 0x12e00, size 0x200
mtdblock: read on "Romfs" at 0x13000, size 0x200
mtdblock: read on "Romfs" at 0x13200, size 0x200
mtdblock: read on "Romfs" at 0x13400, size 0x200
mtdblock: read on "Romfs" at 0x13600, size 0x200
mtdblock: read on "Romfs" at 0x13800, size 0x200
mtdblock: read on "Romfs" at 0x13a00, size 0x200
mtdblock: read on "Romfs" at 0x13c00, size 0x200
mtdblock: read on "Romfs" at 0x13e00, size 0x200
mtdblock: read on "Romfs" at 0x14000, size 0x200
mtdblock: read on "Romfs" at 0x14200, size 0x200
mtdblock: read on "Romfs" at 0x14400, size 0x200
mtdblock: read on "Romfs" at 0x14600, size 0x200
mtdblock: read on "Romfs" at 0x14800, size 0x200
mtdblock: read on "Romfs" at 0x14a00, size 0x200
mtdblock: read on "Romfs" at 0x14c00, size 0x200
mtdblock: read on "Romfs" at 0x14e00, size 0x200
mtdblock: read on "Romfs" at 0x15000, size 0x200
mtdblock: read on "Romfs" at 0x15200, size 0x200
mtdblock: read on "Romfs" at 0x15400, size 0x200
mtdblock: read on "Romfs" at 0x15600, size 0x200
mtdblock: read on "Romfs" at 0x15800, size 0x200
mtdblock: read on "Romfs" at 0x15a00, size 0x200
mtdblock: read on "Romfs" at 0x15c00, size 0x200
mtdblock: read on "Romfs" at 0x15e00, size 0x200
mtdblock: read on "Romfs" at 0x16000, size 0x200
mtdblock: read on "Romfs" at 0x16200, size 0x200
mtdblock: read on "Romfs" at 0x16400, size 0x200
mtdblock: read on "Romfs" at 0x16600, size 0x200
mtdblock: read on "Romfs" at 0x16800, size 0x200
mtdblock: read on "Romfs" at 0x16a00, size 0x200
mtdblock: read on "Romfs" at 0x16c00, size 0x200
mtdblock: read on "Romfs" at 0x16e00, size 0x200
mtdblock: read on "Romfs" at 0x17000, size 0x200
mtdblock: read on "Romfs" at 0x17200, size 0x200
mtdblock: read on "Romfs" at 0x17400, size 0x200
mtdblock: read on "Romfs" at 0x17600, size 0x200
Shell invoked to run file: /etc/rc
Command: hostname uClinux_Adesys
mtdblock: read on "Romfs" at 0x36c00, size 0x200
mtdblock: read on "Romfs" at 0x36e00, size 0x200
mtdblock: read on "Romfs" at 0x37000, size 0x200
mtdblock: read on "Romfs" at 0x37200, size 0x200
mtdblock: read on "Romfs" at 0x3d000, size 0x200
mtdblock: read on "Romfs" at 0x3d200, size 0x200
mtdblock: read on "Romfs" at 0x45800, size 0x200
mtdblock: read on "Romfs" at 0x45a00, size 0x200
mtdblock: read on "Romfs" at 0x54000, size 0x200
mtdblock: read on "Romfs" at 0x54200, size 0x200
mtdblock: read on "Romfs" at 0x59c00, size 0x200
mtdblock: read on "Romfs" at 0x59e00, size 0x200
mtdblock: read on "Romfs" at 0x61800, size 0x200
mtdblock: read on "Romfs" at 0x61a00, size 0x200
mtdblock: read on "Romfs" at 0x6a400, size 0x200
mtdblock: read on "Romfs" at 0x6a600, size 0x200
mtdblock: read on "Romfs" at 0x7dc00, size 0x200
mtdblock: read on "Romfs" at 0x7de00, size 0x200
mtdblock: read on "Romfs" at 0x83400, size 0x200
mtdblock: read on "Romfs" at 0x83600, size 0x200
mtdblock: read on "Romfs" at 0x92400, size 0x200
mtdblock: read on "Romfs" at 0x92600, size 0x200
mtdblock: read on "Romfs" at 0x99000, size 0x200
mtdblock: read on "Romfs" at 0x99200, size 0x200
mtdblock: read on "Romfs" at 0x99400, size 0x200
mtdblock: read on "Romfs" at 0x99600, size 0x200
mtdblock: read on "Romfs" at 0xa9000, size 0x200
mtdblock: read on "Romfs" at 0xa9200, size 0x200
mtdblock: read on "Romfs" at 0xafc00, size 0x200
mtdblock: read on "Romfs" at 0xafe00, size 0x200
mtdblock: read on "Romfs" at 0xc6000, size 0x200
mtdblock: read on "Romfs" at 0xc6200, size 0x200
Command: /bin/expand /etc/ramfs.img /dev/ram1
mtdblock: read on "Romfs" at 0x7e000, size 0x200
mtdblock: read on "Romfs" at 0x7e200, size 0x200
mtdblock: read on "Romfs" at 0x7e400, size 0x200
mtdblock: read on "Romfs" at 0x7e600, size 0x200
mtdblock: read on "Romfs" at 0x7e800, size 0x200
mtdblock: read on "Romfs" at 0x7ea00, size 0x200
mtdblock: read on "Romfs" at 0x7ec00, size 0x200
mtdblock: read on "Romfs" at 0x7ee00, size 0x200
mtdblock: read on "Romfs" at 0x7f000, size 0x200
mtdblock: read on "Romfs" at 0x7f200, size 0x200
mtdblock: read on "Romfs" at 0x7f400, size 0x200
mtdblock: read on "Romfs" at 0x7f600, size 0x200
mtdblock: read on "Romfs" at 0x7f800, size 0x200
mtdblock: read on "Romfs" at 0x7fa00, size 0x200
mtdblock: read on "Romfs" at 0x7fc00, size 0x200
mtdblock: read on "Romfs" at 0x7fe00, size 0x200
mtdblock: read on "Romfs" at 0x80000, size 0x200
mtdblock: read on "Romfs" at 0x80200, size 0x200
mtdblock: read on "Romfs" at 0x80400, size 0x200
mtdblock: read on "Romfs" at 0x80600, size 0x200
mtdblock: read on "Romfs" at 0x80800, size 0x200
mtdblock: read on "Romfs" at 0x80a00, size 0x200
mtdblock: read on "Romfs" at 0x80c00, size 0x200
mtdblock: read on "Romfs" at 0x80e00, size 0x200
mtdblock: read on "Romfs" at 0x81000, size 0x200
mtdblock: read on "Romfs" at 0x81200, size 0x200
mtdblock: read on "Romfs" at 0x81400, size 0x200
mtdblock: read on "Romfs" at 0x81600, size 0x200
mtdblock: read on "Romfs" at 0x81800, size 0x200
mtdblock: read on "Romfs" at 0x81a00, size 0x200
mtdblock: read on "Romfs" at 0x81c00, size 0x200
mtdblock: read on "Romfs" at 0x81e00, size 0x200
mtdblock: read on "Romfs" at 0x82000, size 0x200
mtdblock: read on "Romfs" at 0x82200, size 0x200
mtdblock: read on "Romfs" at 0x82400, size 0x200
mtdblock: read on "Romfs" at 0x82600, size 0x200
mtdblock: read on "Romfs" at 0x82800, size 0x200
mtdblock: read on "Romfs" at 0x82a00, size 0x200
mtdblock: read on "Romfs" at 0x82c00, size 0x200
mtdblock: read on "Romfs" at 0x82e00, size 0x200
mtdblock: read on "Romfs" at 0x83000, size 0x200
mtdblock: read on "Romfs" at 0x83200, size 0x200
mtdblock: read on "Romfs" at 0xd2400, size 0x200
mtdblock: read on "Romfs" at 0xd2600, size 0x200
mtdblock: read on "Romfs" at 0xd2800, size 0x200
mtdblock: read on "Romfs" at 0xd2a00, size 0x200
Command: mount -t proc proc /proc
mtdblock: read on "Romfs" at 0xc6400, size 0x200
mtdblock: read on "Romfs" at 0xc6600, size 0x200
mtdblock: read on "Romfs" at 0xc6800, size 0x200
mtdblock: read on "Romfs" at 0xc6a00, size 0x200
mtdblock: read on "Romfs" at 0xc6c00, size 0x200
mtdblock: read on "Romfs" at 0xc6e00, size 0x200
mtdblock: read on "Romfs" at 0xc7000, size 0x200
mtdblock: read on "Romfs" at 0xc7200, size 0x200
mtdblock: read on "Romfs" at 0xc7400, size 0x200
mtdblock: read on "Romfs" at 0xc7600, size 0x200
mtdblock: read on "Romfs" at 0xc7800, size 0x200
mtdblock: read on "Romfs" at 0xc7a00, size 0x200
mtdblock: read on "Romfs" at 0xc7c00, size 0x200
mtdblock: read on "Romfs" at 0xc7e00, size 0x200
mtdblock: read on "Romfs" at 0xc8000, size 0x200
mtdblock: read on "Romfs" at 0xc8200, size 0x200
mtdblock: read on "Romfs" at 0xc8400, size 0x200
mtdblock: read on "Romfs" at 0xc8600, size 0x200
mtdblock: read on "Romfs" at 0xc8800, size 0x200
mtdblock: read on "Romfs" at 0xc8a00, size 0x200
mtdblock: read on "Romfs" at 0xc8c00, size 0x200
mtdblock: read on "Romfs" at 0xc8e00, size 0x200
mtdblock: read on "Romfs" at 0xc9000, size 0x200
mtdblock: read on "Romfs" at 0xc9200, size 0x200
mtdblock: read on "Romfs" at 0xc9400, size 0x200
mtdblock: read on "Romfs" at 0xc9600, size 0x200
mtdblock: read on "Romfs" at 0xc9800, size 0x200
mtdblock: read on "Romfs" at 0xc9a00, size 0x200
mtdblock: read on "Romfs" at 0xc9c00, size 0x200
mtdblock: read on "Romfs" at 0xc9e00, size 0x200
mtdblock: read on "Romfs" at 0xca000, size 0x200
mtdblock: read on "Romfs" at 0xca200, size 0x200
mtdblock: read on "Romfs" at 0xca400, size 0x200
mtdblock: read on "Romfs" at 0xca600, size 0x200
mtdblock: read on "Romfs" at 0xca800, size 0x200
mtdblock: read on "Romfs" at 0xcaa00, size 0x200
mtdblock: read on "Romfs" at 0xcac00, size 0x200
mtdblock: read on "Romfs" at 0xcae00, size 0x200
mtdblock: read on "Romfs" at 0xcb000, size 0x200
mtdblock: read on "Romfs" at 0xcb200, size 0x200
mtdblock: read on "Romfs" at 0xcb400, size 0x200
mtdblock: read on "Romfs" at 0xcb600, size 0x200
mtdblock: read on "Romfs" at 0xcb800, size 0x200
mtdblock: read on "Romfs" at 0xcba00, size 0x200
mtdblock: read on "Romfs" at 0xcbc00, size 0x200
mtdblock: read on "Romfs" at 0xcbe00, size 0x200
mtdblock: read on "Romfs" at 0xcc000, size 0x200
mtdblock: read on "Romfs" at 0xcc200, size 0x200
mtdblock: read on "Romfs" at 0xcc400, size 0x200
mtdblock: read on "Romfs" at 0xcc600, size 0x200
mtdblock: read on "Romfs" at 0xcc800, size 0x200
mtdblock: read on "Romfs" at 0xcca00, size 0x200
mtdblock: read on "Romfs" at 0xccc00, size 0x200
mtdblock: read on "Romfs" at 0xcce00, size 0x200
mtdblock: read on "Romfs" at 0xcd000, size 0x200
mtdblock: read on "Romfs" at 0xcd200, size 0x200
mtdblock: read on "Romfs" at 0xcd400, size 0x200
mtdblock: read on "Romfs" at 0xcd600, size 0x200
mtdblock: read on "Romfs" at 0xcd800, size 0x200
mtdblock: read on "Romfs" at 0xcda00, size 0x200
mtdblock: read on "Romfs" at 0xcdc00, size 0x200
mtdblock: read on "Romfs" at 0xcde00, size 0x200
mtdblock: read on "Romfs" at 0xce000, size 0x200
mtdblock: read on "Romfs" at 0xce200, size 0x200
mtdblock: read on "Romfs" at 0xce400, size 0x200
mtdblock: read on "Romfs" at 0xce600, size 0x200
mtdblock: read on "Romfs" at 0xce800, size 0x200
mtdblock: read on "Romfs" at 0xcea00, size 0x200
mtdblock: read on "Romfs" at 0xcec00, size 0x200
mtdblock: read on "Romfs" at 0xcee00, size 0x200
mtdblock: read on "Romfs" at 0xcf000, size 0x200
mtdblock: read on "Romfs" at 0xcf200, size 0x200
mtdblock: read on "Romfs" at 0xcf400, size 0x200
mtdblock: read on "Romfs" at 0xcf600, size 0x200
mtdblock: read on "Romfs" at 0xcf800, size 0x200
mtdblock: read on "Romfs" at 0xcfa00, size 0x200
mtdblock: read on "Romfs" at 0xcfc00, size 0x200
mtdblock: read on "Romfs" at 0xcfe00, size 0x200
mtdblock: read on "Romfs" at 0xd0000, size 0x200
mtdblock: read on "Romfs" at 0xd0200, size 0x200
mtdblock: read on "Romfs" at 0xd0400, size 0x200
mtdblock: read on "Romfs" at 0xd0600, size 0x200
mtdblock: read on "Romfs" at 0xd0800, size 0x200
mtdblock: read on "Romfs" at 0xd0a00, size 0x200
Command: mount -t ext2 /dev/ram1 /var
Command: mkdir /var/tmp
Command: mkdir /var/log
Command: mkdir /var/run
Command: mkdir /var/lock
Command: mkdir /var/empty
Command: mkdir /var/dhcpc
Command: cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "phys_mapped_flash"
mtd1: 000de000 00001000 "ROMfs"
mtd2: 00040000 00010000 "dBUG (256K)"
mtd3: 00080000 00010000 "User FS (512K)"
mtd4: 00140000 00010000 "Kernel + RootFS (1280K)"
mtd5: 000de000 00001000 "Romfs"
Command: mount -t jffs2 /dev/mtdblock3 /mnt
Command:=20
Command:=20
Execution Finished, Exiting

Sash command shell (version 1.1.1)
/> mtdblock: read on "Romfs" at 0x3d400, size 0x200
mtdblock: read on "Romfs" at 0x3d600, size 0x200
mtdblock: read on "Romfs" at 0x3d800, size 0x200
mtdblock: read on "Romfs" at 0x3da00, size 0x200
mtdblock: read on "Romfs" at 0x3dc00, size 0x200
mtdblock: read on "Romfs" at 0x3de00, size 0x200
mtdblock: read on "Romfs" at 0x3e000, size 0x200
mtdblock: read on "Romfs" at 0x3e200, size 0x200
mtdblock: read on "Romfs" at 0x3e400, size 0x200
mtdblock: read on "Romfs" at 0x3e600, size 0x200
mtdblock: read on "Romfs" at 0x3e800, size 0x200
mtdblock: read on "Romfs" at 0x3ea00, size 0x200
mtdblock: read on "Romfs" at 0x3ec00, size 0x200
mtdblock: read on "Romfs" at 0x3ee00, size 0x200
mtdblock: read on "Romfs" at 0x3f000, size 0x200
mtdblock: read on "Romfs" at 0x3f200, size 0x200
mtdblock: read on "Romfs" at 0x3f400, size 0x200
mtdblock: read on "Romfs" at 0x3f600, size 0x200
mtdblock: read on "Romfs" at 0x3f800, size 0x200
mtdblock: read on "Romfs" at 0x3fa00, size 0x200
mtdblock: read on "Romfs" at 0x3fc00, size 0x200
mtdblock: read on "Romfs" at 0x3fe00, size 0x200
mtdblock: read on "Romfs" at 0x40000, size 0x200
mtdblock: read on "Romfs" at 0x40200, size 0x200
mtdblock: read on "Romfs" at 0x40400, size 0x200
mtdblock: read on "Romfs" at 0x40600, size 0x200
mtdblock: read on "Romfs" at 0x40800, size 0x200
mtdblock: read on "Romfs" at 0x40a00, size 0x200
mtdblock: read on "Romfs" at 0x40c00, size 0x200
mtdblock: read on "Romfs" at 0x40e00, size 0x200
mtdblock: read on "Romfs" at 0x41000, size 0x200
mtdblock: read on "Romfs" at 0x41200, size 0x200
mtdblock: read on "Romfs" at 0x41400, size 0x200
mtdblock: read on "Romfs" at 0x41600, size 0x200
mtdblock: read on "Romfs" at 0x41800, size 0x200
mtdblock: read on "Romfs" at 0x41a00, size 0x200
mtdblock: read on "Romfs" at 0x41c00, size 0x200
mtdblock: read on "Romfs" at 0x41e00, size 0x200
mtdblock: read on "Romfs" at 0x42000, size 0x200
mtdblock: read on "Romfs" at 0x42200, size 0x200
mtdblock: read on "Romfs" at 0x42400, size 0x200
mtdblock: read on "Romfs" at 0x42600, size 0x200
mtdblock: read on "Romfs" at 0x42800, size 0x200
mtdblock: read on "Romfs" at 0x42a00, size 0x200
mtdblock: read on "Romfs" at 0x42c00, size 0x200
mtdblock: read on "Romfs" at 0x42e00, size 0x200
mtdblock: read on "Romfs" at 0x43000, size 0x200
mtdblock: read on "Romfs" at 0x43200, size 0x200
mtdblock: read on "Romfs" at 0x43400, size 0x200
mtdblock: read on "Romfs" at 0x43600, size 0x200
mtdblock: read on "Romfs" at 0x43800, size 0x200
mtdblock: read on "Romfs" at 0x43a00, size 0x200
mtdblock: read on "Romfs" at 0x43c00, size 0x200
mtdblock: read on "Romfs" at 0x43e00, size 0x200
mtdblock: read on "Romfs" at 0x44000, size 0x200
mtdblock: read on "Romfs" at 0x44200, size 0x200
mtdblock: read on "Romfs" at 0x44400, size 0x200
mtdblock: read on "Romfs" at 0x44600, size 0x200
mtdblock: read on "Romfs" at 0x44800, size 0x200
mtdblock: read on "Romfs" at 0x44a00, size 0x200
mtdblock: read on "Romfs" at 0x44c00, size 0x200
mtdblock: read on "Romfs" at 0x44e00, size 0x200
mtdblock: read on "Romfs" at 0x45000, size 0x200
mtdblock: read on "Romfs" at 0x45200, size 0x200
mtdblock: read on "Romfs" at 0x45400, size 0x200
mtdblock: read on "Romfs" at 0x45600, size 0x200
mtdblock: read on "Romfs" at 0xd3400, size 0x200
mtdblock: read on "Romfs" at 0xd3600, size 0x200
mtdblock: read on "Romfs" at 0xd3800, size 0x200
mtdblock: read on "Romfs" at 0xd3a00, size 0x200
mtdblock: read on "Romfs" at 0xd3c00, size 0x200
mtdblock: read on "Romfs" at 0xd3e00, size 0x200
mtdblock: read on "Romfs" at 0xd4000, size 0x200
mtdblock: read on "Romfs" at 0xd4200, size 0x200
mtdblock: read on "Romfs" at 0xd4400, size 0x200
mtdblock: read on "Romfs" at 0xd4600, size 0x200
mtdblock: read on "Romfs" at 0xd4800, size 0x200
mtdblock: read on "Romfs" at 0xd4a00, size 0x200
mtdblock: read on "Romfs" at 0xd4c00, size 0x200
mtdblock: read on "Romfs" at 0xd4e00, size 0x200
MTD do_erase_oneblock(): ERASE 0x000a0000
cfi_send_gen_cmd():,49 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,50 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
cfi_send_gen_cmd():,51 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,52 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,53 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x000a0000(0x00001985)
cfi_send_gen_cmd():,54 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,55 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,56 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000a0002(0x00002003)
cfi_send_gen_cmd():,57 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,58 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,59 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000a0004(0x00000000)
cfi_send_gen_cmd():,60 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,61 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,62 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000a0006(0x0000000c)
cfi_send_gen_cmd():,63 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,64 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,65 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000a0008(0x0000f060)
cfi_send_gen_cmd():,66 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,67 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,68 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000a000a(0x0000dc98)
cfi_send_gen_cmd():,69 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,70 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,71 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00090000
cfi_send_gen_cmd():,72 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,73 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
cfi_send_gen_cmd():,74 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,75 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,76 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00090000(0x00001985)
cfi_send_gen_cmd():,77 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,78 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,79 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00090002(0x00002003)
cfi_send_gen_cmd():,80 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,81 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,82 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00090004(0x00000000)
cfi_send_gen_cmd():,83 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,84 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,85 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00090006(0x0000000c)
cfi_send_gen_cmd():,86 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,87 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,88 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00090008(0x0000f060)
cfi_send_gen_cmd():,89 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,90 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,91 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0009000a(0x0000dc98)
cfi_send_gen_cmd():,92 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,93 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D0000ffff
cfi_send_gen_cmd():,94 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00080000
cfi_send_gen_cmd():,95 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,96 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
cfi_send_gen_cmd():,97 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,98 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 cm
d_val=3D00000010
cfi_send_gen_cmd():,99 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 cm
d_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00080000(0x00001985)
cfi_send_gen_cmd():,100 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,101 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,102 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00080002(0x00002003)
cfi_send_gen_cmd():,103 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,104 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,105 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00080004(0x00000000)
cfi_send_gen_cmd():,106 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,107 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,108 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00080006(0x0000000c)
cfi_send_gen_cmd():,109 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,110 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,111 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00080008(0x0000f060)
cfi_send_gen_cmd():,112 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,113 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,114 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0008000a(0x0000dc98)
cfi_send_gen_cmd():,115 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,116 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,117 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00070000
cfi_send_gen_cmd():,118 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,119 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
cfi_send_gen_cmd():,120 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,121 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,122 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00070000(0x00001985)
cfi_send_gen_cmd():,123 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,124 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,125 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00070002(0x00002003)
cfi_send_gen_cmd():,126 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,127 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,128 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00070004(0x00000000)
cfi_send_gen_cmd():,129 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,130 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,131 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00070006(0x0000000c)
cfi_send_gen_cmd():,132 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,133 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,134 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00070008(0x0000f060)
cfi_send_gen_cmd():,135 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,136 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,137 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0007000a(0x0000dc98)
cfi_send_gen_cmd():,138 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,139 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,140 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00060000
cfi_send_gen_cmd():,141 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,142 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
cfi_send_gen_cmd():,143 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,144 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,145 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00060000(0x00001985)
cfi_send_gen_cmd():,146 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,147 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,148 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00060002(0x00002003)
cfi_send_gen_cmd():,149 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,150 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,151 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00060004(0x00000000)
cfi_send_gen_cmd():,152 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,153 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,154 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00060006(0x0000000c)
cfi_send_gen_cmd():,155 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,156 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,157 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00060008(0x0000f060)
cfi_send_gen_cmd():,158 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,159 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,160 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0006000a(0x0000dc98)
cfi_send_gen_cmd():,161 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,162 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,163 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00050000
cfi_send_gen_cmd():,164 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,165 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
cfi_send_gen_cmd():,166 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,167 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,168 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00050000(0x00001985)
cfi_send_gen_cmd():,169 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,170 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,171 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00050002(0x00002003)
cfi_send_gen_cmd():,172 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,173 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,174 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00050004(0x00000000)
cfi_send_gen_cmd():,175 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,176 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,177 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00050006(0x0000000c)
cfi_send_gen_cmd():,178 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,179 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,180 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00050008(0x0000f060)
cfi_send_gen_cmd():,181 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,182 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,183 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0005000a(0x0000dc98)
cfi_send_gen_cmd():,184 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,185 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,186 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x00040000
cfi_send_gen_cmd():,187 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,188 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
cfi_send_gen_cmd():,189 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,190 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,191 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x00040000(0x00001985)
cfi_send_gen_cmd():,192 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,193 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,194 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00040002(0x00002003)
cfi_send_gen_cmd():,195 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,196 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,197 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00040004(0x00000000)
cfi_send_gen_cmd():,198 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,199 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,200 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00040006(0x0000000c)
cfi_send_gen_cmd():,201 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,202 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,203 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x00040008(0x0000f060)
cfi_send_gen_cmd():,204 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,205 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,206 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x0004000a(0x0000dc98)
cfi_send_gen_cmd():,207 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,208 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,209 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_erase_oneblock(): ERASE 0x000b0000
cfi_send_gen_cmd():,210 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,211 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
cfi_send_gen_cmd():,212 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,213 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D00000010
cfi_send_gen_cmd():,214 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D00000010
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
MTD do_write_oneword(): WRITE 0x000b0000(0x00001985)
cfi_send_gen_cmd():,215 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,216 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,217 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000b0002(0x00002003)
cfi_send_gen_cmd():,218 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,219 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,220 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000b0004(0x00000000)
cfi_send_gen_cmd():,221 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,222 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,223 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000b0006(0x0000000c)
cfi_send_gen_cmd():,224 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,225 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,226 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000b0008(0x0000f060)
cfi_send_gen_cmd():,227 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,228 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,229 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
MTD do_write_oneword(): WRITE 0x000b000a(0x0000dc98)
cfi_send_gen_cmd():,230 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff
cfi_send_gen_cmd():,231 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000aa8 c
md_val=3D0000ffff
cfi_send_gen_cmd():,232 cmd=3Da0 addr=3D00000555 base=3D00000000 build =
addr=3D00001554 c
md_val=3D0000ffff

/>=20
/>=20
/>=20
/>=20
/>=20

------=_NextPart_000_0049_01C79606.9ADA33B0
Content-Type: application/octet-stream;
	name="Log_uclinux_ads4010"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Log_uclinux_ads4010"

uClinux/COLDFIRE(m520x)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
Built 1 zonelists
Kernel command line: console=3DttyS0,115200 rootfstype=3Dromfs
PID hash table entries: 128 (order: 7, 2048 bytes)
-->request_irq: nr=3D68 name=3DColdFire Timer
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory available: 30216k/32768k RAM, 0k/0k ROM (1060k kernel code, 155k =
data)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
io scheduler noop registered (default)
-->request_irq: nr=3D69 name=3DColdFire PIT2
MCF520x PIT2 driver ok
-->request_irq: nr=3D95 name=3DColdFire QSPI
MCF520x QSPI driver ok
ColdFire internal UART serial driver version 1.00
-->request_irq: nr=3D90 name=3DColdFire UART
ttyS0 at 0xfc060000 (irq =3D 90) is a builtin ColdFire UART
-->request_irq: nr=3D91 name=3DColdFire UART
ttyS1 at 0xfc064000 (irq =3D 91) is a builtin ColdFire UART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
FEC ENET Version 0.2
-->request_irq: nr=3D100 name=3Dfec(TXF)
-->request_irq: nr=3D101 name=3Dfec(TXB)
-->request_irq: nr=3D102 name=3Dfec(TXFIFO)
-->request_irq: nr=3D103 name=3Dfec(TXCR)
-->request_irq: nr=3D104 name=3Dfec(RXF)
-->request_irq: nr=3D105 name=3Dfec(RXB)
-->request_irq: nr=3D106 name=3Dfec(MII)
-->request_irq: nr=3D107 name=3Dfec(LC)
-->request_irq: nr=3D108 name=3Dfec(HBERR)
-->request_irq: nr=3D109 name=3Dfec(GRA)
-->request_irq: nr=3D110 name=3Dfec(EBERR)
-->request_irq: nr=3D111 name=3Dfec(BABT)
-->request_irq: nr=3D112 name=3Dfec(BABR)
fec: PHY @ 0x1, ID 0x20005c90 -- DP83848
eth0: ethernet 00:cf:52:08:cf:01
physmap flash device: 200000 at 0
do_map_probe(): name=3Dcfi_probe cfi_send_gen_cmd():,1 cmd=3Df0 =
addr=3D00000000 base=3D0
0000000 build addr=3D00000000 cmd_val=3D00000001
cfi_send_gen_cmd():,2 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000001
cfi_send_gen_cmd():,3 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cmd
_val=3D00000001
cfi_send_gen_cmd():,4 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000002
cfi_send_gen_cmd():,5 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000002
cfi_send_gen_cmd():,6 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cmd
_val=3D00000002
cfi_send_gen_cmd():,7 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000004
cfi_send_gen_cmd():,8 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cmd
_val=3D00000004
cfi_send_gen_cmd():,9 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000002a8 cmd
_val=3D00000004
cfi_send_gen_cmd():,10 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,11 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,12 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000002
cfi_send_gen_cmd():,13 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000001
cfi_send_gen_cmd():,14 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D0000001c
cfi_send_gen_cmd():,15 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,16 cmd=3D90 addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D0000001c
cfi_send_gen_cmd():,17 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
cfi_send_gen_cmd():,18 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
cfi_send_gen_cmd():,19 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000008
cfi_send_gen_cmd():,20 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
cfi_send_gen_cmd():,21 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
Using buffer write method
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
cmdlinepart partition parsing not available
RedBoot partition parsing not available
mtd: Giving out device 0 to phys_mapped_flash
uclinux[mtd]: RAM probe address=3D0x40150020 size=3D0xde000
do_map_probe(): name=3Dmap_ram <5>Creating 1 MTD partitions on "RAM":
0x00000000-0x000de000 : "ROMfs"
mtd: Giving out device 1 to ROMfs
uclinux[mtd]: set ROMfs to be root filesystem
m520xevb flash probe(0x0,200000,2): 200000 at 0
do_map_probe(): name=3Dcfi_probe cfi_send_gen_cmd():,22 cmd=3Df0 =
addr=3D00000000 base=3D
00000000 build addr=3D00000000 cmd_val=3D00000001
cfi_send_gen_cmd():,23 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000001
cfi_send_gen_cmd():,24 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000001
cfi_send_gen_cmd():,25 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,26 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,27 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D00000154 cm
d_val=3D00000002
cfi_send_gen_cmd():,28 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,29 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000004
cfi_send_gen_cmd():,30 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000002a8 cm
d_val=3D00000004
cfi_send_gen_cmd():,31 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,32 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000002
cfi_send_gen_cmd():,33 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000002
cfi_send_gen_cmd():,34 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000001
cfi_send_gen_cmd():,35 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D0000001c
cfi_send_gen_cmd():,36 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000554 cm
d_val=3D0000001c
cfi_send_gen_cmd():,37 cmd=3D90 addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D0000001c
cfi_send_gen_cmd():,38 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
cfi_send_gen_cmd():,39 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D0000001c
Am29BDD160G 2.5v flash device (2MB): Found 1 x16 devices at 0x0 in =
16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
cfi_send_gen_cmd():,40 cmd=3D98 addr=3D00000055 base=3D00000000 build =
addr=3D000000aa cm
d_val=3D00000008
cfi_send_gen_cmd():,41 cmd=3Df0 addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
cfi_send_gen_cmd():,42 cmd=3Dff addr=3D00000000 base=3D00000000 build =
addr=3D00000000 cm
d_val=3D00000040
Using buffer write method
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 3 MTD partitions on "Am29BDD160G 2.5v flash device (2MB)":
0x00000000-0x00040000 : "dBUG (256K)"
mtd: Giving out device 2 to dBUG (256K)
0x00040000-0x000c0000 : "User FS (512K)"
mtd: Giving out device 3 to User FS (512K)
0x000c0000-0x00200000 : "Kernel + RootFS (1280K)"
mtd: Giving out device 4 to Kernel + RootFS (1280K)
m520xevb ram probe(0x40150020,de000,4): de000 at 40150020
do_map_probe(): name=3Dmap_ram <5>Creating 1 MTD partitions on "RAM":
0x00000000-0x000de000 : "Romfs"
mtd: Giving out device 5 to Romfs
init_m520x: Root filesystem maj:31 mtdblock:5=20
NET: Registered protocol family 2
IP route cache hash table entries: 512 (order: -1, 2048 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
mtdblock_open
ok
mtdblock: read on "Romfs" at 0x0, size 0x200
mtdblock: read on "Romfs" at 0x200, size 0x200
VFS: Mounted root (romfs filesystem) readonly.
Freeing unused kernel memory: 52k freed (0x40134000 - 0x40140000)
mtdblock: read on "Romfs" at 0xd0c00, size 0x200
mtdblock: read on "Romfs" at 0xd0e00, size 0x200
mtdblock: read on "Romfs" at 0xd1000, size 0x200
mtdblock: read on "Romfs" at 0xd1200, size 0x200
mtdblock: read on "Romfs" at 0xd1400, size 0x200
mtdblock: read on "Romfs" at 0xd1600, size 0x200
mtdblock: read on "Romfs" at 0xd1800, size 0x200
mtdblock: read on "Romfs" at 0xd1a00, size 0x200
mtdblock: read on "Romfs" at 0xd5000, size 0x200
mtdblock: read on "Romfs" at 0xd5200, size 0x200
mtdblock: read on "Romfs" at 0xd5c00, size 0x200
mtdblock: read on "Romfs" at 0xd5e00, size 0x200
mtdblock: read on "Romfs" at 0xd6000, size 0x200
mtdblock: read on "Romfs" at 0xd6200, size 0x200
mtdblock: read on "Romfs" at 0xdd000, size 0x200
mtdblock: read on "Romfs" at 0xdd200, size 0x200
mtdblock: read on "Romfs" at 0xd1c00, size 0x200
mtdblock: read on "Romfs" at 0xd1e00, size 0x200
mtdblock: read on "Romfs" at 0xd2000, size 0x200
mtdblock: read on "Romfs" at 0xd2200, size 0x200
mtdblock: read on "Romfs" at 0xd2c00, size 0x200
mtdblock: read on "Romfs" at 0xd2e00, size 0x200
mtdblock: read on "Romfs" at 0xd3000, size 0x200
mtdblock: read on "Romfs" at 0xd3200, size 0x200
mtdblock: read on "Romfs" at 0x5c00, size 0x200
mtdblock: read on "Romfs" at 0x5e00, size 0x200
mtdblock: read on "Romfs" at 0x17800, size 0x200
mtdblock: read on "Romfs" at 0x17a00, size 0x200
mtdblock: read on "Romfs" at 0x23000, size 0x200
mtdblock: read on "Romfs" at 0x23200, size 0x200
mtdblock: read on "Romfs" at 0x23400, size 0x200
mtdblock: read on "Romfs" at 0x23600, size 0x200
mtdblock: read on "Romfs" at 0x23800, size 0x200
mtdblock: read on "Romfs" at 0x23a00, size 0x200
mtdblock: read on "Romfs" at 0x23c00, size 0x200
mtdblock: read on "Romfs" at 0x23e00, size 0x200
mtdblock: read on "Romfs" at 0x24000, size 0x200
mtdblock: read on "Romfs" at 0x24200, size 0x200
mtdblock: read on "Romfs" at 0x24400, size 0x200
mtdblock: read on "Romfs" at 0x24600, size 0x200
mtdblock: read on "Romfs" at 0x24800, size 0x200
mtdblock: read on "Romfs" at 0x24a00, size 0x200
mtdblock: read on "Romfs" at 0x24c00, size 0x200
mtdblock: read on "Romfs" at 0x24e00, size 0x200
mtdblock: read on "Romfs" at 0x25000, size 0x200
mtdblock: read on "Romfs" at 0x25200, size 0x200
mtdblock: read on "Romfs" at 0x25400, size 0x200
mtdblock: read on "Romfs" at 0x25600, size 0x200
mtdblock: read on "Romfs" at 0x25800, size 0x200
mtdblock: read on "Romfs" at 0x25a00, size 0x200
mtdblock: read on "Romfs" at 0x25c00, size 0x200
mtdblock: read on "Romfs" at 0x25e00, size 0x200
mtdblock: read on "Romfs" at 0x26000, size 0x200
mtdblock: read on "Romfs" at 0x26200, size 0x200
mtdblock: read on "Romfs" at 0x26400, size 0x200
mtdblock: read on "Romfs" at 0x26600, size 0x200
mtdblock: read on "Romfs" at 0x26800, size 0x200
mtdblock: read on "Romfs" at 0x26a00, size 0x200
mtdblock: read on "Romfs" at 0x26c00, size 0x200
mtdblock: read on "Romfs" at 0x26e00, size 0x200
mtdblock: read on "Romfs" at 0x27000, size 0x200
mtdblock: read on "Romfs" at 0x27200, size 0x200
mtdblock: read on "Romfs" at 0x27400, size 0x200
mtdblock: read on "Romfs" at 0x27600, size 0x200
mtdblock: read on "Romfs" at 0x27800, size 0x200
mtdblock: read on "Romfs" at 0x27a00, size 0x200
mtdblock: read on "Romfs" at 0x27c00, size 0x200
mtdblock: read on "Romfs" at 0x27e00, size 0x200
mtdblock: read on "Romfs" at 0x28000, size 0x200
mtdblock: read on "Romfs" at 0x28200, size 0x200
mtdblock: read on "Romfs" at 0x28400, size 0x200
mtdblock: read on "Romfs" at 0x28600, size 0x200
mtdblock: read on "Romfs" at 0x28800, size 0x200
mtdblock: read on "Romfs" at 0x28a00, size 0x200
mtdblock: read on "Romfs" at 0x28c00, size 0x200
mtdblock: read on "Romfs" at 0x28e00, size 0x200
mtdblock: read on "Romfs" at 0x29000, size 0x200
mtdblock: read on "Romfs" at 0x29200, size 0x200
mtdblock: read on "Romfs" at 0x29400, size 0x200
mtdblock: read on "Romfs" at 0x29600, size 0x200
mtdblock: read on "Romfs" at 0x29800, size 0x200
mtdblock: read on "Romfs" at 0x29a00, size 0x200
mtdblock: read on "Romfs" at 0x6000, size 0x200
mtdblock: read on "Romfs" at 0x6200, size 0x200
mtdblock: read on "Romfs" at 0x6400, size 0x200
mtdblock: read on "Romfs" at 0x6600, size 0x200
mtdblock: read on "Romfs" at 0x6800, size 0x200
mtdblock: read on "Romfs" at 0x6a00, size 0x200
mtdblock: read on "Romfs" at 0x6c00, size 0x200
mtdblock: read on "Romfs" at 0x6e00, size 0x200
mtdblock: read on "Romfs" at 0x7000, size 0x200
mtdblock: read on "Romfs" at 0x7200, size 0x200
mtdblock: read on "Romfs" at 0x7400, size 0x200
mtdblock: read on "Romfs" at 0x7600, size 0x200
mtdblock: read on "Romfs" at 0x7800, size 0x200
mtdblock: read on "Romfs" at 0x7a00, size 0x200
mtdblock: read on "Romfs" at 0x7c00, size 0x200
mtdblock: read on "Romfs" at 0x7e00, size 0x200
mtdblock: read on "Romfs" at 0x8000, size 0x200
mtdblock: read on "Romfs" at 0x8200, size 0x200
mtdblock: read on "Romfs" at 0x8400, size 0x200
mtdblock: read on "Romfs" at 0x8600, size 0x200
mtdblock: read on "Romfs" at 0x8800, size 0x200
mtdblock: read on "Romfs" at 0x8a00, size 0x200
mtdblock: read on "Romfs" at 0x8c00, size 0x200
mtdblock: read on "Romfs" at 0x8e00, size 0x200
mtdblock: read on "Romfs" at 0x9000, size 0x200
mtdblock: read on "Romfs" at 0x9200, size 0x200
mtdblock: read on "Romfs" at 0x9400, size 0x200
mtdblock: read on "Romfs" at 0x9600, size 0x200
mtdblock: read on "Romfs" at 0x9800, size 0x200
mtdblock: read on "Romfs" at 0x9a00, size 0x200
mtdblock: read on "Romfs" at 0x9c00, size 0x200
mtdblock: read on "Romfs" at 0x9e00, size 0x200
mtdblock: read on "Romfs" at 0xa000, size 0x200
mtdblock: read on "Romfs" at 0xa200, size 0x200
mtdblock: read on "Romfs" at 0xa400, size 0x200
mtdblock: read on "Romfs" at 0xa600, size 0x200
mtdblock: read on "Romfs" at 0xa800, size 0x200
mtdblock: read on "Romfs" at 0xaa00, size 0x200
mtdblock: read on "Romfs" at 0xac00, size 0x200
mtdblock: read on "Romfs" at 0xae00, size 0x200
mtdblock: read on "Romfs" at 0xb000, size 0x200
mtdblock: read on "Romfs" at 0xb200, size 0x200
mtdblock: read on "Romfs" at 0xb400, size 0x200
mtdblock: read on "Romfs" at 0xb600, size 0x200
mtdblock: read on "Romfs" at 0xb800, size 0x200
mtdblock: read on "Romfs" at 0xba00, size 0x200
mtdblock: read on "Romfs" at 0xbc00, size 0x200
mtdblock: read on "Romfs" at 0xbe00, size 0x200
mtdblock: read on "Romfs" at 0xc000, size 0x200
mtdblock: read on "Romfs" at 0xc200, size 0x200
mtdblock: read on "Romfs" at 0xc400, size 0x200
mtdblock: read on "Romfs" at 0xc600, size 0x200
mtdblock: read on "Romfs" at 0xc800, size 0x200
mtdblock: read on "Romfs" at 0xca00, size 0x200
mtdblock: read on "Romfs" at 0xcc00, size 0x200
mtdblock: read on "Romfs" at 0xce00, size 0x200
mtdblock: read on "Romfs" at 0xd000, size 0x200
mtdblock: read on "Romfs" at 0xd200, size 0x200
mtdblock: read on "Romfs" at 0xd400, size 0x200
mtdblock: read on "Romfs" at 0xd600, size 0x200
mtdblock: read on "Romfs" at 0xd800, size 0x200
mtdblock: read on "Romfs" at 0xda00, size 0x200
mtdblock: read on "Romfs" at 0xdc00, size 0x200
mtdblock: read on "Romfs" at 0xde00, size 0x200
mtdblock: read on "Romfs" at 0xe000, size 0x200
mtdblock: read on "Romfs" at 0xe200, size 0x200
mtdblock: read on "Romfs" at 0xe400, size 0x200
mtdblock: read on "Romfs" at 0xe600, size 0x200
mtdblock: read on "Romfs" at 0xe800, size 0x200
mtdblock: read on "Romfs" at 0xea00, size 0x200
mtdblock: read on "Romfs" at 0xec00, size 0x200
mtdblock: read on "Romfs" at 0xee00, size 0x200
mtdblock: read on "Romfs" at 0xf000, size 0x200
mtdblock: read on "Romfs" at 0xf200, size 0x200
mtdblock: read on "Romfs" at 0xf400, size 0x200
mtdblock: read on "Romfs" at 0xf600, size 0x200
mtdblock: read on "Romfs" at 0xf800, size 0x200
mtdblock: read on "Romfs" at 0xfa00, size 0x200
mtdblock: read on "Romfs" at 0xfc00, size 0x200
mtdblock: read on "Romfs" at 0xfe00, size 0x200
mtdblock: read on "Romfs" at 0x10000, size 0x200
mtdblock: read on "Romfs" at 0x10200, size 0x200
mtdblock: read on "Romfs" at 0x10400, size 0x200
mtdblock: read on "Romfs" at 0x10600, size 0x200
mtdblock: read on "Romfs" at 0x10800, size 0x200
mtdblock: read on "Romfs" at 0x10a00, size 0x200
mtdblock: read on "Romfs" at 0x10c00, size 0x200
mtdblock: read on "Romfs" at 0x10e00, size 0x200
mtdblock: read on "Romfs" at 0x11000, size 0x200
mtdblock: read on "Romfs" at 0x11200, size 0x200
mtdblock: read on "Romfs" at 0x11400, size 0x200
mtdblock: read on "Romfs" at 0x11600, size 0x200
mtdblock: read on "Romfs" at 0x11800, size 0x200
mtdblock: read on "Romfs" at 0x11a00, size 0x200
mtdblock: read on "Romfs" at 0x11c00, size 0x200
mtdblock: read on "Romfs" at 0x11e00, size 0x200
mtdblock: read on "Romfs" at 0x12000, size 0x200
mtdblock: read on "Romfs" at 0x12200, size 0x200
mtdblock: read on "Romfs" at 0x12400, size 0x200
mtdblock: read on "Romfs" at 0x12600, size 0x200
mtdblock: read on "Romfs" at 0x12800, size 0x200
mtdblock: read on "Romfs" at 0x12a00, size 0x200
mtdblock: read on "Romfs" at 0x12c00, size 0x200
mtdblock: read on "Romfs" at 0x12e00, size 0x200
mtdblock: read on "Romfs" at 0x13000, size 0x200
mtdblock: read on "Romfs" at 0x13200, size 0x200
mtdblock: read on "Romfs" at 0x13400, size 0x200
mtdblock: read on "Romfs" at 0x13600, size 0x200
mtdblock: read on "Romfs" at 0x13800, size 0x200
mtdblock: read on "Romfs" at 0x13a00, size 0x200
mtdblock: read on "Romfs" at 0x13c00, size 0x200
mtdblock: read on "Romfs" at 0x13e00, size 0x200
mtdblock: read on "Romfs" at 0x14000, size 0x200
mtdblock: read on "Romfs" at 0x14200, size 0x200
mtdblock: read on "Romfs" at 0x14400, size 0x200
mtdblock: read on "Romfs" at 0x14600, size 0x200
mtdblock: read on "Romfs" at 0x14800, size 0x200
mtdblock: read on "Romfs" at 0x14a00, size 0x200
mtdblock: read on "Romfs" at 0x14c00, size 0x200
mtdblock: read on "Romfs" at 0x14e00, size 0x200
mtdblock: read on "Romfs" at 0x15000, size 0x200
mtdblock: read on "Romfs" at 0x15200, size 0x200
mtdblock: read on "Romfs" at 0x15400, size 0x200
mtdblock: read on "Romfs" at 0x15600, size 0x200
mtdblock: read on "Romfs" at 0x15800, size 0x200
mtdblock: read on "Romfs" at 0x15a00, size 0x200
mtdblock: read on "Romfs" at 0x15c00, size 0x200
mtdblock: read on "Romfs" at 0x15e00, size 0x200
mtdblock: read on "Romfs" at 0x16000, size 0x200
mtdblock: read on "Romfs" at 0x16200, size 0x200
mtdblock: read on "Romfs" at 0x16400, size 0x200
mtdblock: read on "Romfs" at 0x16600, size 0x200
mtdblock: read on "Romfs" at 0x16800, size 0x200
mtdblock: read on "Romfs" at 0x16a00, size 0x200
mtdblock: read on "Romfs" at 0x16c00, size 0x200
mtdblock: read on "Romfs" at 0x16e00, size 0x200
mtdblock: read on "Romfs" at 0x17000, size 0x200
mtdblock: read on "Romfs" at 0x17200, size 0x200
mtdblock: read on "Romfs" at 0x17400, size 0x200
mtdblock: read on "Romfs" at 0x17600, size 0x200
Shell invoked to run file: /etc/rc
Command: hostname uClinux_Adesys
mtdblock: read on "Romfs" at 0x36c00, size 0x200
mtdblock: read on "Romfs" at 0x36e00, size 0x200
mtdblock: read on "Romfs" at 0x37000, size 0x200
mtdblock: read on "Romfs" at 0x37200, size 0x200
mtdblock: read on "Romfs" at 0x3d000, size 0x200
mtdblock: read on "Romfs" at 0x3d200, size 0x200
mtdblock: read on "Romfs" at 0x45800, size 0x200
mtdblock: read on "Romfs" at 0x45a00, size 0x200
mtdblock: read on "Romfs" at 0x54000, size 0x200
mtdblock: read on "Romfs" at 0x54200, size 0x200
mtdblock: read on "Romfs" at 0x59c00, size 0x200
mtdblock: read on "Romfs" at 0x59e00, size 0x200
mtdblock: read on "Romfs" at 0x61800, size 0x200
mtdblock: read on "Romfs" at 0x61a00, size 0x200
mtdblock: read on "Romfs" at 0x6a400, size 0x200
mtdblock: read on "Romfs" at 0x6a600, size 0x200
mtdblock: read on "Romfs" at 0x7dc00, size 0x200
mtdblock: read on "Romfs" at 0x7de00, size 0x200
mtdblock: read on "Romfs" at 0x83400, size 0x200
mtdblock: read on "Romfs" at 0x83600, size 0x200
mtdblock: read on "Romfs" at 0x92400, size 0x200
mtdblock: read on "Romfs" at 0x92600, size 0x200
mtdblock: read on "Romfs" at 0x99000, size 0x200
mtdblock: read on "Romfs" at 0x99200, size 0x200
mtdblock: read on "Romfs" at 0x99400, size 0x200
mtdblock: read on "Romfs" at 0x99600, size 0x200
mtdblock: read on "Romfs" at 0xa9000, size 0x200
mtdblock: read on "Romfs" at 0xa9200, size 0x200
mtdblock: read on "Romfs" at 0xafc00, size 0x200
mtdblock: read on "Romfs" at 0xafe00, size 0x200
mtdblock: read on "Romfs" at 0xc6000, size 0x200
mtdblock: read on "Romfs" at 0xc6200, size 0x200
Command: /bin/expand /etc/ramfs.img /dev/ram1
mtdblock: read on "Romfs" at 0x7e000, size 0x200
mtdblock: read on "Romfs" at 0x7e200, size 0x200
mtdblock: read on "Romfs" at 0x7e400, size 0x200
mtdblock: read on "Romfs" at 0x7e600, size 0x200
mtdblock: read on "Romfs" at 0x7e800, size 0x200
mtdblock: read on "Romfs" at 0x7ea00, size 0x200
mtdblock: read on "Romfs" at 0x7ec00, size 0x200
mtdblock: read on "Romfs" at 0x7ee00, size 0x200
mtdblock: read on "Romfs" at 0x7f000, size 0x200
mtdblock: read on "Romfs" at 0x7f200, size 0x200
mtdblock: read on "Romfs" at 0x7f400, size 0x200
mtdblock: read on "Romfs" at 0x7f600, size 0x200
mtdblock: read on "Romfs" at 0x7f800, size 0x200
mtdblock: read on "Romfs" at 0x7fa00, size 0x200
mtdblock: read on "Romfs" at 0x7fc00, size 0x200
mtdblock: read on "Romfs" at 0x7fe00, size 0x200
mtdblock: read on "Romfs" at 0x80000, size 0x200
mtdblock: read on "Romfs" at 0x80200, size 0x200
mtdblock: read on "Romfs" at 0x80400, size 0x200
mtdblock: read on "Romfs" at 0x80600, size 0x200
mtdblock: read on "Romfs" at 0x80800, size 0x200
mtdblock: read on "Romfs" at 0x80a00, size 0x200
mtdblock: read on "Romfs" at 0x80c00, size 0x200
mtdblock: read on "Romfs" at 0x80e00, size 0x200
mtdblock: read on "Romfs" at 0x81000, size 0x200
mtdblock: read on "Romfs" at 0x81200, size 0x200
mtdblock: read on "Romfs" at 0x81400, size 0x200
mtdblock: read on "Romfs" at 0x81600, size 0x200
mtdblock: read on "Romfs" at 0x81800, size 0x200
mtdblock: read on "Romfs" at 0x81a00, size 0x200
mtdblock: read on "Romfs" at 0x81c00, size 0x200
mtdblock: read on "Romfs" at 0x81e00, size 0x200
mtdblock: read on "Romfs" at 0x82000, size 0x200
mtdblock: read on "Romfs" at 0x82200, size 0x200
mtdblock: read on "Romfs" at 0x82400, size 0x200
mtdblock: read on "Romfs" at 0x82600, size 0x200
mtdblock: read on "Romfs" at 0x82800, size 0x200
mtdblock: read on "Romfs" at 0x82a00, size 0x200
mtdblock: read on "Romfs" at 0x82c00, size 0x200
mtdblock: read on "Romfs" at 0x82e00, size 0x200
mtdblock: read on "Romfs" at 0x83000, size 0x200
mtdblock: read on "Romfs" at 0x83200, size 0x200
mtdblock: read on "Romfs" at 0xd2400, size 0x200
mtdblock: read on "Romfs" at 0xd2600, size 0x200
mtdblock: read on "Romfs" at 0xd2800, size 0x200
mtdblock: read on "Romfs" at 0xd2a00, size 0x200
Command: mount -t proc proc /proc
mtdblock: read on "Romfs" at 0xc6400, size 0x200
mtdblock: read on "Romfs" at 0xc6600, size 0x200
mtdblock: read on "Romfs" at 0xc6800, size 0x200
mtdblock: read on "Romfs" at 0xc6a00, size 0x200
mtdblock: read on "Romfs" at 0xc6c00, size 0x200
mtdblock: read on "Romfs" at 0xc6e00, size 0x200
mtdblock: read on "Romfs" at 0xc7000, size 0x200
mtdblock: read on "Romfs" at 0xc7200, size 0x200
mtdblock: read on "Romfs" at 0xc7400, size 0x200
mtdblock: read on "Romfs" at 0xc7600, size 0x200
mtdblock: read on "Romfs" at 0xc7800, size 0x200
mtdblock: read on "Romfs" at 0xc7a00, size 0x200
mtdblock: read on "Romfs" at 0xc7c00, size 0x200
mtdblock: read on "Romfs" at 0xc7e00, size 0x200
mtdblock: read on "Romfs" at 0xc8000, size 0x200
mtdblock: read on "Romfs" at 0xc8200, size 0x200
mtdblock: read on "Romfs" at 0xc8400, size 0x200
mtdblock: read on "Romfs" at 0xc8600, size 0x200
mtdblock: read on "Romfs" at 0xc8800, size 0x200
mtdblock: read on "Romfs" at 0xc8a00, size 0x200
mtdblock: read on "Romfs" at 0xc8c00, size 0x200
mtdblock: read on "Romfs" at 0xc8e00, size 0x200
mtdblock: read on "Romfs" at 0xc9000, size 0x200
mtdblock: read on "Romfs" at 0xc9200, size 0x200
mtdblock: read on "Romfs" at 0xc9400, size 0x200
mtdblock: read on "Romfs" at 0xc9600, size 0x200
mtdblock: read on "Romfs" at 0xc9800, size 0x200
mtdblock: read on "Romfs" at 0xc9a00, size 0x200
mtdblock: read on "Romfs" at 0xc9c00, size 0x200
mtdblock: read on "Romfs" at 0xc9e00, size 0x200
mtdblock: read on "Romfs" at 0xca000, size 0x200
mtdblock: read on "Romfs" at 0xca200, size 0x200
mtdblock: read on "Romfs" at 0xca400, size 0x200
mtdblock: read on "Romfs" at 0xca600, size 0x200
mtdblock: read on "Romfs" at 0xca800, size 0x200
mtdblock: read on "Romfs" at 0xcaa00, size 0x200
mtdblock: read on "Romfs" at 0xcac00, size 0x200
mtdblock: read on "Romfs" at 0xcae00, size 0x200
mtdblock: read on "Romfs" at 0xcb000, size 0x200
mtdblock: read on "Romfs" at 0xcb200, size 0x200
mtdblock: read on "Romfs" at 0xcb400, size 0x200
mtdblock: read on "Romfs" at 0xcb600, size 0x200
mtdblock: read on "Romfs" at 0xcb800, size 0x200
mtdblock: read on "Romfs" at 0xcba00, size 0x200
mtdblock: read on "Romfs" at 0xcbc00, size 0x200
mtdblock: read on "Romfs" at 0xcbe00, size 0x200
mtdblock: read on "Romfs" at 0xcc000, size 0x200
mtdblock: read on "Romfs" at 0xcc200, size 0x200
mtdblock: read on "Romfs" at 0xcc400, size 0x200
mtdblock: read on "Romfs" at 0xcc600, size 0x200
mtdblock: read on "Romfs" at 0xcc800, size 0x200
mtdblock: read on "Romfs" at 0xcca00, size 0x200
mtdblock: read on "Romfs" at 0xccc00, size 0x200
mtdblock: read on "Romfs" at 0xcce00, size 0x200
mtdblock: read on "Romfs" at 0xcd000, size 0x200
mtdblock: read on "Romfs" at 0xcd200, size 0x200
mtdblock: read on "Romfs" at 0xcd400, size 0x200
mtdblock: read on "Romfs" at 0xcd600, size 0x200
mtdblock: read on "Romfs" at 0xcd800, size 0x200
mtdblock: read on "Romfs" at 0xcda00, size 0x200
mtdblock: read on "Romfs" at 0xcdc00, size 0x200
mtdblock: read on "Romfs" at 0xcde00, size 0x200
mtdblock: read on "Romfs" at 0xce000, size 0x200
mtdblock: read on "Romfs" at 0xce200, size 0x200
mtdblock: read on "Romfs" at 0xce400, size 0x200
mtdblock: read on "Romfs" at 0xce600, size 0x200
mtdblock: read on "Romfs" at 0xce800, size 0x200
mtdblock: read on "Romfs" at 0xcea00, size 0x200
mtdblock: read on "Romfs" at 0xcec00, size 0x200
mtdblock: read on "Romfs" at 0xcee00, size 0x200
mtdblock: read on "Romfs" at 0xcf000, size 0x200
mtdblock: read on "Romfs" at 0xcf200, size 0x200
mtdblock: read on "Romfs" at 0xcf400, size 0x200
mtdblock: read on "Romfs" at 0xcf600, size 0x200
mtdblock: read on "Romfs" at 0xcf800, size 0x200
mtdblock: read on "Romfs" at 0xcfa00, size 0x200
mtdblock: read on "Romfs" at 0xcfc00, size 0x200
mtdblock: read on "Romfs" at 0xcfe00, size 0x200
mtdblock: read on "Romfs" at 0xd0000, size 0x200
mtdblock: read on "Romfs" at 0xd0200, size 0x200
mtdblock: read on "Romfs" at 0xd0400, size 0x200
mtdblock: read on "Romfs" at 0xd0600, size 0x200
mtdblock: read on "Romfs" at 0xd0800, size 0x200
mtdblock: read on "Romfs" at 0xd0a00, size 0x200
Command: mount -t ext2 /dev/ram1 /var
Command: mkdir /var/tmp
Command: mkdir /var/log
Command: mkdir /var/run
Command: mkdir /var/lock
Command: mkdir /var/empty
Command: mkdir /var/dhcpc
Command: cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "phys_mapped_flash"
mtd1: 000de000 00001000 "ROMfs"
mtd2: 00040000 00010000 "dBUG (256K)"
mtd3: 00080000 00010000 "User FS (512K)"
mtd4: 00140000 00010000 "Kernel + RootFS (1280K)"
mtd5: 000de000 00001000 "Romfs"
Command: mount -t jffs2 /dev/mtdblock3 /mnt
Command:=20
Command:=20
Execution Finished, Exiting
mtdblock: read on "Romfs" at 0x3d400, size 0x200
mtdblock: read on "Romfs" at 0x3d600, size 0x200
mtdblock: read on "Romfs" at 0x3d800, size 0x200
mtdblock: read on "Romfs" at 0x3da00, size 0x200
mtdblock: read on "Romfs" at 0x3dc00, size 0x200
mtdblock: read on "Romfs" at 0x3de00, size 0x200
mtdblock: read on "Romfs" at 0x3e000, size 0x200
mtdblock: read on "Romfs" at 0x3e200, size 0x200
mtdblock: read on "Romfs" at 0x3e400, size 0x200
mtdblock: read on "Romfs" at 0x3e600, size 0x200
mtdblock: read on "Romfs" at 0x3e800, size 0x200
mtdblock: read on "Romfs" at 0x3ea00, size 0x200
mtdblock: read on "Romfs" at 0x3ec00, size 0x200
mtdblock: read on "Romfs" at 0x3ee00, size 0x200
mtdblock: read on "Romfs" at 0x3f000, size 0x200
mtdblock: read on "Romfs" at 0x3f200, size 0x200
mtdblock: read on "Romfs" at 0x3f400, size 0x200
mtdblock: read on "Romfs" at 0x3f600, size 0x200
mtdblock: read on "Romfs" at 0x3f800, size 0x200
mtdblock: read on "Romfs" at 0x3fa00, size 0x200
mtdblock: read on "Romfs" at 0x3fc00, size 0x200
mtdblock: read on "Romfs" at 0x3fe00, size 0x200
mtdblock: read on "Romfs" at 0x40000, size 0x200
mtdblock: read on "Romfs" at 0x40200, size 0x200
mtdblock: read on "Romfs" at 0x40400, size 0x200
mtdblock: read on "Romfs" at 0x40600, size 0x200
mtdblock: read on "Romfs" at 0x40800, size 0x200
mtdblock: read on "Romfs" at 0x40a00, size 0x200
mtdblock: read on "Romfs" at 0x40c00, size 0x200
mtdblock: read on "Romfs" at 0x40e00, size 0x200
mtdblock: read on "Romfs" at 0x41000, size 0x200
mtdblock: read on "Romfs" at 0x41200, size 0x200
mtdblock: read on "Romfs" at 0x41400, size 0x200
mtdblock: read on "Romfs" at 0x41600, size 0x200
mtdblock: read on "Romfs" at 0x41800, size 0x200
mtdblock: read on "Romfs" at 0x41a00, size 0x200
mtdblock: read on "Romfs" at 0x41c00, size 0x200
mtdblock: read on "Romfs" at 0x41e00, size 0x200
mtdblock: read on "Romfs" at 0x42000, size 0x200
mtdblock: read on "Romfs" at 0x42200, size 0x200
mtdblock: read on "Romfs" at 0x42400, size 0x200
mtdblock: read on "Romfs" at 0x42600, size 0x200
mtdblock: read on "Romfs" at 0x42800, size 0x200
mtdblock: read on "Romfs" at 0x42a00, size 0x200
mtdblock: read on "Romfs" at 0x42c00, size 0x200
mtdblock: read on "Romfs" at 0x42e00, size 0x200
mtdblock: read on "Romfs" at 0x43000, size 0x200
mtdblock: read on "Romfs" at 0x43200, size 0x200
mtdblock: read on "Romfs" at 0x43400, size 0x200
mtdblock: read on "Romfs" at 0x43600, size 0x200
mtdblock: read on "Romfs" at 0x43800, size 0x200
mtdblock: read on "Romfs" at 0x43a00, size 0x200
mtdblock: read on "Romfs" at 0x43c00, size 0x200
mtdblock: read on "Romfs" at 0x43e00, size 0x200
mtdblock: read on "Romfs" at 0x44000, size 0x200
mtdblock: read on "Romfs" at 0x44200, size 0x200
mtdblock: read on "Romfs" at 0x44400, size 0x200
mtdblock: read on "Romfs" at 0x44600, size 0x200
mtdblock: read on "Romfs" at 0x44800, size 0x200
mtdblock: read on "Romfs" at 0x44a00, size 0x200
mtdblock: read on "Romfs" at 0x44c00, size 0x200
mtdblock: read on "Romfs" at 0x44e00, size 0x200
mtdblock: read on "Romfs" at 0x45000, size 0x200
mtdblock: read on "Romfs" at 0x45200, size 0x200
mtdblock: read on "Romfs" at 0x45400, size 0x200
mtdblock: read on "Romfs" at 0x45600, size 0x200

Sash command shell (version 1.1.1)
/> mtdblock: read on "Romfs" at 0xd3400, size 0x200
mtdblock: read on "Romfs" at 0xd3600, size 0x200
mtdblock: read on "Romfs" at 0xd3800, size 0x200
mtdblock: read on "Romfs" at 0xd3a00, size 0x200
mtdblock: read on "Romfs" at 0xd3c00, size 0x200
mtdblock: read on "Romfs" at 0xd3e00, size 0x200
mtdblock: read on "Romfs" at 0xd4000, size 0x200
mtdblock: read on "Romfs" at 0xd4200, size 0x200
mtdblock: read on "Romfs" at 0xd4400, size 0x200
mtdblock: read on "Romfs" at 0xd4600, size 0x200
mtdblock: read on "Romfs" at 0xd4800, size 0x200
mtdblock: read on "Romfs" at 0xd4a00, size 0x200
mtdblock: read on "Romfs" at 0xd4c00, size 0x200
mtdblock: read on "Romfs" at 0xd4e00, size 0x200
MTD do_erase_oneblock(): ERASE 0x000a0000
cfi_send_gen_cmd():,43 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D00000010
cfi_send_gen_cmd():,44 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000554 cm
d_val=3D00000010
cfi_send_gen_cmd():,45 cmd=3D80 addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D00000010
cfi_send_gen_cmd():,46 cmd=3Daa addr=3D00000555 base=3D00000000 build =
addr=3D00000aaa cm
d_val=3D00000010
cfi_send_gen_cmd():,47 cmd=3D55 addr=3D000002aa base=3D00000000 build =
addr=3D00000554 cm
d_val=3D00000010
hier stoppen
MTD do_erase_oneblock(): enter for loop...
MTD do_erase_oneblock(): chip ready.
*** ILLEGAL INSTRUCTION ***   FORMAT=3D4
Current process id is 9
BAD KERNEL TRAP: 00000000
PC: [<00000000>]
SR: 2718  SP: 402cfcec  a2: 40281770
d0: 00002710    d1: 00000001    d2: 00000000    d3: 400140f4
d4: 00000001    d5: 00000000    a0: 00000000    a1: 4012fca8
Process pdflush (pid: 9, stackpage=3D402b3330)
Stack from 402cfcec:<0>
       <0> 00000001<0> 00000000<0> 400140f4<0> 00000001<0> 00000000<0> =
00000000<
0> 4012fca8<0> 40281770<0>
       <0> 00002710<0> ffffffff<0> 00000000<0> 40102718<0> 00000000<0> =
40024d1a<
0> fffffff4<0> 00000003<0>
       <0> 00000000<0> 00000000<0> 00002010<0> 0000000c<0> 00000000<0> =
ffffffff<
0> 00000008<0> 40027f5e<0>
       <0> 40281756<0> 402cfd70<0> 40024d66<0> 40281770<0> 00000003<0> =
00000001<
0> 00000000<0> 00000000<0>
       <0> 00000003<0> 4012fca8<0> 400c0294<0> 40281770<0> 00000003<0> =
00000001<
0> 00000000<0> 00000003<0>
       <0> 0000000c<0> 00000000<0> ffff94f5<0> 40281720<0> 0000ffff<0> =
400c2224<
0> 4012fca8<0> 40281756<0>
Call Trace:<0>
       <0> [<40024cc6>]<0> [<40024cc6>]<0> [<400bf1f4>]<0> =
[<40027f5e>]<0>
       <0> [<400c2354>]<0> [<400c1dca>]<0> [<400bbb66>]<0> =
[<4008989c>]<0>
       <0> [<4010d8ba>]<0> [<400410f8>]<0> [<4003a404>]<0> =
[<40027f6e>]<0>
       <0> [<4011b674>]<0> [<4008040a>]<0> [<4011b674>]<0> =
[<40115df3>]<0>
       <0> [<4008b262>]<0> [<4011fbd6>]<0> [<4004f33e>]<0> =
[<40040898>]<0>
       <0> [<4010d8ba>]<0> [<400410f8>]<0> [<400411e6>]<0> =
[<400366f0>]<0>
       <0> [<40024dd4>]<0> [<4004084e>]<0> [<400367be>]<0> =
[<400367e8>]<0>
       <0> [<40020b56>]<0>
Badness in do_exit at kernel/exit.c:802
Stack from 402cfbc8:<0>
       <0> 402cfbd8<0> 402cfce0<0> 40029936<0> 401149b2<0> 4010fcce<0> =
40114c7b<
0> 00000322<0> 0000000c<0>
       <0> 400140f4<0> 00000001<0> 40027f5e<0> 402cfcec<0> 000a0000<0> =
40281756<
0> 402cfce0<0> 400140f4<0>
       <0> 00000001<0> 4002304c<0> 0000000b<0> 00000000<0> 402d0000<0> =
4011457a<
0> 402b24ce<0> 00000009<0>
       <0> 402b3330<0> 40027f5e<0> 402cfcec<0> 4002314c<0> 40114612<0> =
402cfcec<
0> 00000000<0> 401145f5<0>
       <0> 00000009<0> 00000000<0> 40281770<0> 40281720<0> 40023188<0> =
402cfcec<
0> 0000000a<0> 000091f6<0>
       <0> 00009203<0> 4012edb4<0> 40027f5e<0> 4002793e<0> 4012edb4<0> =
401466ca<
0> 0000000d<0> 00009203<0>
Call Trace:<0>
       <0> [<40027954>]<0> [<400279bc>]<0> [<400b53c6>]<0> =
[<4002793e>]<0>
       <0> [<40027954>]<0> [<400279bc>]<0> [<400208ec>]<0> =
[<40102718>]<0>
       <0> [<40024d1a>]<0> [<40027f5e>]<0> [<40024d66>]<0> =
[<400c0294>]<0>
       <0> [<400c2224>]<0> [<40024cc6>]<0> [<40024cc6>]<0> =
[<400bf1f4>]<0>
       <0> [<40027f5e>]<0> [<400c2354>]<0> [<400c1dca>]<0> =
[<400bbb66>]<0>
       <0> [<4008989c>]<0> [<4010d8ba>]<0> [<400410f8>]<0> =
[<4003a404>]<0>
       <0> [<40027f6e>]<0> [<4011b674>]<0> [<4008040a>]<0> =
[<4011b674>]<0>
       <0> [<40115df3>]<0> [<4008b262>]<0> [<4011fbd6>]<0> =
[<4004f33e>]<0>
       <0> [<40040898>]<0> [<4010d8ba>]<0> [<400410f8>]<0> =
[<400411e6>]<0>
       <0> [<400366f0>]<0> [<40024dd4>]<0> [<4004084e>]<0> =
[<400367be>]<0>
       <0> [<400367e8>]<0> [<40020b56>]<0>
BUG: pdflush/9, lock held at task exit time!
 [403b6446] {alloc_super}
.. held by:           pdflush:    9 [402b2330, 115]
... acquired at:              =20
/>=20

------=_NextPart_000_0049_01C79606.9ADA33B0--
