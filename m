Received: from mx0b-00176a03.pphosted.com ([67.231.157.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5z7i-0000BS-5d
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 17:31:07 +0000
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
 by m0048206.ppops.net-00176a03. (8.16.0.11/8.16.0.11) with SMTP id
 u4QHRLSR023150
 for <linux-mtd@lists.infradead.org>; Thu, 26 May 2016 13:30:44 -0400
From: "Barbier, Renaud (Abaco Systems, Non-GE)" <Renaud.Barbier@ge.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
Date: Thu, 26 May 2016 17:30:31 +0000
Message-ID: <7F6493595BCD744E896E5FE2800ADF6472BAAB0C@LONURLNA21.e2k.ad.ge.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I am running Broadcom 53346 with integratedARM cpu on  Linux 4.0.0 and get =
the message=20
m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
followed by a crash

when mounting the spi nor (m25p80 spi32766.0: n25q256a)

What would be the cause of this read failure?


Cheers,
 Renaud

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The crash output if needed:
[root@openware]# mount -t ubifs ubi0:boot /mnt
UBIFS: background thread "ubifs_bgt0_0" started, PID 673
m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
d
pgd =3D c0004000
[0000000d] *pgd=3D00000000
Internal error: Oops: 17 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 669 Comm: ubi_bgt0d Not tainted 4.0.0-owc+ #22
Hardware name: RM927RC
task: cbca4c00 ti: cbccc000 task.ti: cbccc000
PC is at spi_nor_read+0x2c/0x274
LR is at 0x0
pc : [<c0266c58>]    lr : [<00000000>]    psr: 600f0013
sp : cbccdc60  ip : 00000000  fp : cbccdc94
r10: cc8ff000  r9 : 00000000  r8 : 00000040
r7 : 00000000  r6 : 00220000  r5 : 00000000  r4 : cca51c14
r3 : 00000000  r2 : 0c8ea000  r1 : 00000000  r0 : ffffffed
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 6cc6c04a  DAC: 00000015
Process ubi_bgt0d (pid: 669, stack limit =3D 0xcbccc190)
Stack: (0xcbccdc60 to 0xcbcce000)
dc60: 00000003 00000001 cbccdc84 cbccdc78 cc93d000 00000000 00000000 000000=
40
dc80: 00180000 00000000 cbccdccc cbccdc98 c023c880 c0266c38 00000040 cbccdd=
2c
dca0: cbccddb8 cbccc028 01960000 00000000 00000004 00000000 cc93d000 cbccdd=
b8
dcc0: cbccdd04 cbccdcd0 c0239fb4 c023c840 00000040 cbccdd2c cbccddb8 cbccdd=
10
dce0: cca22648 cc8ff000 00000040 00000004 00000000 0000000a cbccdd5c cbccdd=
08
dd00: c027201c c0239f40 00000040 cbccdd2c cbccddb8 cbccdd10 cbccdd64 cca226=
94
dd20: 000a0000 00000000 cbccdd48 00000000 c05111bc cc8ff000 cbccddb8 000a00=
00
dd40: cc8ff000 0000000a 00000000 00000040 cbccdd9c cbccdd60 c02724d4 c0271f=
8c
dd60: 00000040 00000100 00000000 00000000 cbccdddc cc8ff000 0000000a 000a00=
00
dd80: 00000000 0000000c 00000000 0000000a cbccde5c cbccdda0 c02728fc c02724=
94
dda0: c0511230 c0516080 cbccdd80 cbccc000 cbccdddc 00000000 000000ff 000000=
00
ddc0: c05118b0 00000000 00000000 0000000b cbccddf4 cbccdde0 c001dc6c c005c7=
e8
dde0: 000068c7 c05118b0 cbccde1c cbccddf8 c0051e4c c001dbdc cbccde48 fee201=
0c
de00: 00000063 c0525238 cbccde48 fee20100 cbccde44 cbccde20 c00086d4 c0051d=
c8
de20: c027482c c0274608 600f0013 ffffffff cbccde7c 0000000c cc8ff000 000000=
00
de40: 0000000a cbd4ee34 0000000c 00000000 cbccde8c cbccde60 c0273908 c02728=
d4
de60: 00000000 cc8ff000 cc8ff000 cbd4ee38 ccb8c140 cbd4ee34 0000000c 000000=
00
de80: cbccded4 cbccde90 c0274628 c0273728 cc8b401c cbca4c00 00000000 1211a5=
8c
dea0: cbca4e8c 0c8ea000 cbccdecc ccb8c100 cbd4ee28 00000000 00000008 000000=
0a
dec0: 00000000 cc8ff000 cbccdf0c cbccded8 c027482c c02745a0 c03d460c cbccc0=
00
dee0: cc8ffd10 ccb8c100 cc8ff000 cc8ffd2c cc8ffd10 cc8ffd6c 00000000 000000=
00
df00: cbccdf2c cbccdf10 c0273ee8 c02747ac cc8ff000 cc8ffd10 cbccc000 c054ea=
c0
df20: cbccdf5c cbccdf30 c0276310 c0273e50 00000000 00000000 00000000 ccb7f9=
40
df40: cc8ff000 c02761cc 00000000 00000000 cbccdfac cbccdf60 c003386c c02761=
d8
df60: 00000000 00000000 00000000 cc8ff000 00000000 00000000 cbccdf78 cbccdf=
78
df80: 00000000 00000000 cbccdf88 cbccdf88 ccb7f940 c0033788 00000000 000000=
00
dfa0: 00000000 cbccdfb0 c0009900 c0033794 00000000 00000000 00000000 000000=
00
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 000000=
00
Backtrace:
[<c0266c2c>] (spi_nor_read) from [<c023c880>] (part_read+0x4c/0x94)
 r9:00000000 r8:00180000 r7:00000040 r6:00000000 r5:00000000 r4:cc93d000
[<c023c834>] (part_read) from [<c0239fb4>] (mtd_read+0x80/0xb4)
 r9:cbccddb8 r8:cc93d000 r7:00000000 r6:00000004 r5:00000000 r4:01960000
[<c0239f34>] (mtd_read) from [<c027201c>] (ubi_io_read+0x9c/0x310)
 r8:0000000a r7:00000000 r6:00000004 r5:00000040 r4:cc8ff000
[<c0271f80>] (ubi_io_read) from [<c02724d4>] (ubi_io_read_ec_hdr+0x4c/0x220=
)
 r10:00000040 r9:00000000 r8:0000000a r7:cc8ff000 r6:000a0000 r5:cbccddb8
 r4:cc8ff000
[<c0272488>] (ubi_io_read_ec_hdr) from [<c02728fc>] (nor_erase_prepare+0x34=
/0x1)
 r10:0000000a r9:00000000 r8:0000000c r7:00000000 r6:000a0000 r5:0000000a
 r4:cc8ff000
[<c02728c8>] (nor_erase_prepare) from [<c0273908>] (ubi_io_sync_erase+0x1ec=
/0x2)
 r9:00000000 r8:0000000c r7:cbd4ee34 r6:0000000a r5:00000000 r4:cc8ff000
[<c027371c>] (ubi_io_sync_erase) from [<c0274628>] (sync_erase.isra.12+0x94=
/0x2)
 r9:00000000 r8:0000000c r7:cbd4ee34 r6:ccb8c140 r5:cbd4ee38 r4:cc8ff000
[<c0274594>] (sync_erase.isra.12) from [<c027482c>] (erase_worker+0x8c/0x51=
8)
 r10:cc8ff000 r9:00000000 r8:0000000a r7:00000008 r6:00000000 r5:cbd4ee28
 r4:ccb8c100
[<c02747a0>] (erase_worker) from [<c0273ee8>] (do_work+0xa4/0x134)
 r10:00000000 r9:00000000 r8:cc8ffd6c r7:cc8ffd10 r6:cc8ffd2c r5:cc8ff000
 r4:ccb8c100
[<c0273e44>] (do_work) from [<c0276310>] (ubi_thread+0x144/0x1e0)
 r7:c054eac0 r6:cbccc000 r5:cc8ffd10 r4:cc8ff000
[<c02761cc>] (ubi_thread) from [<c003386c>] (kthread+0xe4/0xfc)
 r9:00000000 r8:00000000 r7:c02761cc r6:cc8ff000 r5:ccb7f940 r4:00000000
[<c0033788>] (kthread) from [<c0009900>] (ret_from_fork+0x14/0x34)
 r7:00000000 r6:00000000 r5:c0033788 r4:ccb7f940
Code: e59b8004 e1a00004 ebffffc8 e3a01000 (e5909020)
---[ end trace a219755da14e86e6 ]---
