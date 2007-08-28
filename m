Received: from mis011-2.exch011.intermedia.net ([64.78.21.129])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQ8ej-0005nL-8z
	for linux-mtd@lists.infradead.org; Tue, 28 Aug 2007 17:31:31 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: mtd_debug info crashes on at91rm9200 cpu with 64MB Spansion flash.
Date: Tue, 28 Aug 2007 14:31:07 -0700
Message-ID: <406A31B117F2734987636D6CCC93EE3C0217E360@ehost011-3.exch011.intermedia.net>
From: "Leonid" <Leonid@a-k-a.net>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:

I'm running Linux 2.6.16 on Atmel at91rm9200 ARM9 cpu. The board has
Spansion S29GL512N MirrorBitTM Flash (64MB). I use u-boot as bootloader
and it sees flash just fine, can write and read on it. CFI information,
printed by u-boot, is attached in the end of this message.

When I boot up Linux, it also extracts all CFI information alright:

physmap flash device: 800000 at 10000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision: 8
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 1 sectors per group
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 8
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: 8 word page
  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
  Top/Bottom Boot Block: Uniform, Top WP (5)
phys_mapped_flash: CFI does not contain boot bank location =
(bootloc=3D5).
Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
10 cmdlinepart partitions found on MTD device phys_mapped_flash Creating
10 MTD partitions on "phys_mapped_flash":
0x00000000-0x00080000 : "boot"
0x00080000-0x000a0000 : "bootenv"
0x000a0000-0x000c0000 : "config"
0x000c0000-0x00140000 : "fpga_1"
0x00140000-0x001c0000 : "fpga_2"
0x001c0000-0x00200000 : "testscript"
0x00200000-0x00240000 : "image"
0x00240000-0x002c0000 : "debuglogs"
0x002c0000-0x003c0000 : "jffs2_fs"
0x003c0000-0x03fc0000 : "spare"

Flash address space is available - I can read this memory (not using
mtd_read(), just direct memory access).

However any mtd_debug operation fails, even simple info:

-bash-2.05b# mtd_debug info /dev/mtd0
mtd.type =3D MTDUnable to handle kernel NULL pointer dereference at
virtual address 00000000 pgd =3D c0cf0000 [00000000] *pgd=3D21b6f031,
*pte=3D00000000, *ppte=3D00000000 Internal error: Oops: 17 [#1] Modules
linked in:
CPU: 0
PC is at __wake_up_common+0x28/0x7c
LR is at __init_begin+0x3fff8000/0x2c
pc : [<c00334bc>]    lr : [<00000000>]    Not tainted
sp : c1329e8c  ip : c1329eb8  fp : c1329eb4
r10: 00000003  r9 : 00000000  r8 : 00000000
r7 : c1329ee4  r6 : c03e1bf4  r5 : c03e1c0c  r4 : 00000001
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c03e1bf4
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 20CF0000  DAC: 00000015 Process mtd_debug
(pid: 1159, stack limit =3D 0xc1328198)
Stack: (0xc1329e8c to 0xc132a000)
9e80:                            60000013 c03e1c0c 00000000 c1329ee4
c03e1ba0
9ea0: c1328000 00000000 c1329ecc c1329eb8 c003353c c00334a4 00000000
c03e1ba0
9ec0: c1329f18 c1329ed0 c016566c c0033520 00000000 c0365820 c003347c
00000000
9ee0: 00000000 00000000 c0365820 c003347c 00000000 00000000 c1cc6a00
00000010
9f00: c198f068 c1990e68 c0312e20 c1329f28 c1329f1c c015c850 c0165578
c1329f3c
9f20: c1329f2c c015d8c4 c015c844 c133a0e0 c1329f60 c1329f40 c006fac8
c015d8ac
9f40: c133a0e0 00000000 c03c1e40 00000006 c0021e64 c1329f70 c1329f64
c006fbcc
9f60: c006fa34 c1329f8c c1329f74 c006e17c c006fba8 c03c1e40 c133a0e0
bef00ca8
9f80: c1329fa4 c1329f90 c006e20c c006e114 00000000 00000003 00000000
c1329fa8
9fa0: c0021cc0 c006e198 00000000 00000003 00000003 0000000e 40150460
00000000
9fc0: 00000000 00000003 bef00ca8 bef00bc4 00000001 4014f024 00000000
00009074
9fe0: 00000000 bef00b74 000034a4 400d9030 60000010 00000003 00000001
00000001
Backtrace:
[<c0033494>] (__wake_up_common+0x0/0x7c) from [<c003353c>]
(__wake_up+0x2c/0x34)
[<c0033510>] (__wake_up+0x0/0x34) from [<c016566c>]
(cfi_amdstd_sync+0x104/0x11c)
 r4 =3D C03E1BA0
[<c0165568>] (cfi_amdstd_sync+0x0/0x11c) from [<c015c850>]
(part_sync+0x1c/0x20)
 r8 =3D C0312E20  r7 =3D C1990E68  r6 =3D C198F068  r5 =3D 00000010
 r4 =3D C1CC6A00
[<c015c834>] (part_sync+0x0/0x20) from [<c015d8c4>]
(mtd_close+0x28/0x38)
[<c015d89c>] (mtd_close+0x0/0x38) from [<c006fac8>] (__fput+0xa4/0x174)
 r4 =3D C133A0E0
[<c006fa24>] (__fput+0x0/0x174) from [<c006fbcc>] (fput+0x34/0x38)
 r8 =3D C0021E64  r7 =3D 00000006  r6 =3D C03C1E40  r5 =3D 00000000
 r4 =3D C133A0E0
[<c006fb98>] (fput+0x0/0x38) from [<c006e17c>] (filp_close+0x78/0x84)
[<c006e104>] (filp_close+0x0/0x84) from [<c006e20c>]
(sys_close+0x84/0x88)
 r6 =3D BEF00CA8  r5 =3D C133A0E0  r4 =3D C03C1E40 [<c006e188>]
(sys_close+0x0/0x88) from [<c0021cc0>]
(ret_fast_syscall+0x0/0x2c)
 r5 =3D 00000003  r4 =3D 00000000
Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)  _NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH mtd.size =3D 524288 (512K) mtd.erasesize =
=3D
131072 (128K) mtd.oobblock =3D 0 mtd.oobsize =3D 0 mtd.ecctype =3D
MTD_ECC_NONE regions =3D 0

Segmentation fault

What can be the problem?

Thanks,

Leonid.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
U-boot flash CFI info:

flash detect cfi
fwc addr 10000000 cmd 0 0 8bit x 8 bit
fwc addr 10000055 cmd 98 98 8bit x 8 bit is=3D cmd 51(Q) addr 10000010 =
is=3D
fe 51 fwc addr 10000555 cmd 98 98 8bit x 8 bit is=3D cmd 51(Q) addr
10000010 is=3D fe 51 fwc addr 10000000 cmd 0 0000 16bit x 8 bit fwc addr
100000aa cmd 98 9898 16bit x 8 bit is=3D cmd 51(Q) addr 10000020 is=3D =
0051
5151 fwc addr 10000aaa cmd 98 9898 16bit x 8 bit is=3D cmd 51(Q) addr
10000020 is=3D 0051 5151 fwc addr 10000000 cmd 0 0000 16bit x 16 bit fwc
addr 100000aa cmd 98 0098 16bit x 16 bit is=3D cmd 51(Q) addr 10000020 =
is=3D
0051 0051 is=3D cmd 52(R) addr 10000022 is=3D 0052 0052 is=3D cmd 59(Y) =
addr
10000024 is=3D 0059 0059 ushort addr is at 10000050 info->portwidth =3D =
2
addr[0] =3D 0x2 addr[1] =3D 0x0 addr[2] =3D 0x0 addr[3] =3D 0x0 retval =
=3D 0x2
device interface is 2 found port 2 chip 2 port 16 bits chip 16 bits
ushort addr is at 10000026 info->portwidth =3D 2 addr[0] =3D 0x2 addr[1] =
=3D
0x0 addr[2] =3D 0x0 addr[3] =3D 0x0 retval =3D 0x2 fwc addr 10000000 cmd =
f0
00f0 16bit x 16 bit fwc addr 10000aaa cmd aa 00aa 16bit x 16 bit fwc
addr 10000554 cmd 55 0055 16bit x 16 bit fwc addr 10000aaa cmd 90 0090
16bit x 16 bit fwc addr 10000000 cmd f0 00f0 16bit x 16 bit fwc addr
100000aa cmd 98 0098 16bit x 16 bit ushort addr is at 1000002a
info->portwidth =3D 2 addr[0] =3D 0x40 addr[1] =3D 0x0 addr[2] =3D 0x0 =
addr[3] =3D
0x0 retval =3D 0x40 10000020 : 51 00 52 00 59 00 02 00 00 00 40 00 00 00
00 00 Q.R.Y.....@.....
10000030 : 00 00 00 00 00 00 27 00 36 00 00 00 00 00 07 00
......'.6.......
10000040 : 07 00 0a 00 00 00 03 00 05 00 04 00 00 00 1a 00
................
10000050 : 02 00 00 00 05 00 00 00 01 00 ff 00 01 00 00 00
................
10000060 : 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
10000070 : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................
10000080 : 50 00 52 00 49 00 31 00 33 00 10 00 02 00 01 00
P.R.I.1.3.......
10000090 : 00 00 08 00 00 00 00 00 02 00 b5 00 c5 00 05 00
................
manufacturer is 2
manufacturer id is 0x1
device id is 0x7e
device id2 is 0x2301
cfi version is 0x3133
size_ratio 1 port 16 bits chip 16 bits
found 1 erase regions
long addr is at 1000005a info->portwidth =3D 2 addr[0] =3D 0xff addr[1] =
=3D
0x0 addr[2] =3D 0x1 addr[3] =3D 0x0 addr[4] =3D 0x0 addr[5] =3D 0x0 =
addr[6] =3D
0x2 addr[7] =3D 0x0 erase_region_count =3D 512 erase_region_size =3D =
131072
ushort addr is at 10000054 info->portwidth =3D 2 addr[0] =3D 0x5 addr[1] =
=3D
0x0 addr[2] =3D 0x0 addr[3] =3D 0x0 retval =3D 0x5 fwc addr 10000000 cmd =
f0
00f0 16bit x 16 bit
Flash: 64 MB
