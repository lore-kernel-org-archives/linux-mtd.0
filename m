Received: from mail.grid-net.com ([97.65.115.2])
 by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1R6YjX-0000VL-G9
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2011 02:09:53 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----_=_NextPart_001_01CC78CC.B3FDA35C"
Subject: CONFIG_MTD_NAND_VERIFY_WRITE and GPMI NAND patch kernel panic.
Message-ID: <C7A5B00EFC707A46AB67997D02152167010F585E@mx1.grid-net.com>
From: "Subodh Nijsure" <snijsure@grid-net.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 22 Sep 2011 02:09:54 -0000

This is a multi-part message in MIME format.

------_=_NextPart_001_01CC78CC.B3FDA35C
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello,

I have been testing the GPMI NAND patch on iMX28 based platform.

My git tree  based on =
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git and I have applied =
patches that Huang Shijie had emailed out ( ref: =
http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896219539&w=3D2 )

I see following kernel panic, if I have kernel compiled with option, =
CONFIG_MTD_NAND_VERIFY_WRITE=3Dy.
Unfortunately I don't have another non iMX28 hardware to try if this is =
CONFIG_MTD_NAND_VERIFY_WRITE option issue or the GPMI NAND that is =
causing this.

However if I turn off this flag, everything works fine. Has anyone seen =
issue when using VERIFY_WRITE option on other platforms?=20

If you have iMX28 based platform and are testing Huang's patchset would =
you mind turning on VERIFY_WRITE option and see if you get same results?

I am not familiar with MTD source code in long time, but I will =
familiarize myself with this code and see if I find something, would =
appreciate any pointer on any debug flags to turn on.

Kernel trace back when using VERIFY_WRITE option:

formatting eraseblock 0 [   31.830000] Unable to handle kernel NULL =
pointer dereference at virtual address 00000000
ubifo[   31.840000] pgd =3D c3a64000
ubiformat: formatting e, *ppte=3D00000000raseblock 2 --  0 % compock 1 =
--  0 % complete  , *pte=3D00000000
lete  [   31.860000] Internal error: Oops: 17 [#1]
[   31.860000] Modules linked in:
[   31.860000] CPU: 0    Not tainted  =
(3.1.0-rc2-amp-10076-g3fefe97-dirty #8)
[   31.860000] PC is at nand_verify_buf+0x74/0xc4
[   31.860000] LR is at console_unlock+0x174/0x210
[   31.860000] pc : [<c02e63e8>]    lr : [<c0025b64>]    psr: 20000013
[   31.860000] sp : c3a55d98  ip : c3a55cb8  fp : c3a55db4
[   31.860000] r10: 00000800  r9 : 00000000  r8 : c3920878
[   31.860000] r7 : 00002880  r6 : c3a06000  r5 : 00000800  r4 : =
c3920878
[   31.860000] r3 : c05f7d34  r2 : 00000055  r1 : 00000000  r0 : =
00000000
[   31.860000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  =
Segment user
[   31.860000] Control: 0005317f  Table: 43a64000  DAC: 00000015
[   31.860000] Process ubiformat (pid: 61, stack limit =3D 0xc3a54270)
[   31.860000] Stack: (0xc3a55d98 to 0xc3a56000)
[   31.860000] 5d80:                                                     =
  c3920878 c3920a98
[   31.860000] 5da0: c3a06000 00002880 c3a55ddc c3a55db8 c02e61c8 =
c02e6384 c3a55ddc c3a55dc8
[   31.860000] 5dc0: 01440000 00000800 c3a55e60 c3920a98 c3a55e54 =
c3a55de0 c02e7460 c02e6124
[   31.860000] 5de0: 00000000 00000000 c029c620 c3a06000 00000000 =
c3811000 0ffe0000 00000000
[   31.860000] 5e00: c39d3000 00000000 00002880 00002880 0000003f =
00000000 00001000 00000040
[   31.860000] 5e20: 00000000 c3a06000 00000000 00000800 c3920a98 =
01440000 00000000 01569fa8
[   31.860000] 5e40: 00000000 c3a4dfe0 c3a55e9c c3a55e58 c02e77e4 =
c02e72a8 c3a55e60 00000000
[   31.860000] 5e60: c39d89e0 00000800 00000000 00001000 c3a55eac =
c3a55e80 c3a06000 00000000
[   31.860000] 5e80: 00040000 00000000 00000800 c3a55f70 c3a55ecc =
c3a55ea0 c02cab14 c02e774c
[   31.860000] 5ea0: 00000800 c3a55f08 c3a06000 00000800 c39b0c00 =
00000800 00000800 c39b0c00
[   31.860000] 5ec0: c3a55f3c c3a55ed0 c02ce21c c02caa8c 00000800 =
c3a55f08 c3a06000 c020c8c4
[   31.860000] 5ee0: c3a06000 c3a54000 00000003 00040000 00000000 =
c3a5c300 c3a55f3c c3a55f08
[   31.860000] 5f00: c00f2874 c020c050 00000000 00000800 c0282084 =
c3a5c300 00000800 01569fa8
[   31.860000] 5f20: c3a55f70 c3a54000 c3a54000 00000000 c3a55f6c =
c3a55f40 c00f3498 c02ce120
[   31.860000] 5f40: 00040000 00000000 00040000 00000000 c3a5c300 =
00000800 01569fa8 00000000
[   31.860000] 5f60: c3a55fa4 c3a55f70 c00f3654 c00f33e8 00040000 =
00000000 00000000 00000000
[   31.860000] 5f80: ffffffff 00040000 beb57a40 00020000 00000004 =
c0009148 00000000 c3a55fa8
[   31.860000] 5fa0: c0008f00 c00f3618 00040000 beb57a40 00000003 =
01569fa8 00000800 00000800
[   31.860000] 5fc0: 00040000 beb57a40 00020000 00000004 00000000 =
00000800 00000002 00000003
[   31.860000] 5fe0: 00000000 beb57980 0000e140 4013babc 60000010 =
00000003 00000000 00000000
[   31.860000] Backtrace:=20
[   31.860000] [<c02e6374>] (nand_verify_buf+0x0/0xc4) from [<c02e61c8>] =
(nand_write_page+0xb4/0x110)
[   31.860000]  r7:00002880 r6:c3a06000 r5:c3920a98 r4:c3920878
[   31.860000] [<c02e6114>] (nand_write_page+0x0/0x110) from =
[<c02e7460>] (nand_do_write_ops+0x1c8/0x3b8)
[   31.860000]  r7:c3920a98 r6:c3a55e60 r5:00000800 r4:01440000
[   31.860000] [<c02e7298>] (nand_do_write_ops+0x0/0x3b8) from =
[<c02e77e4>] (nand_write+0xa8/0xc4)
[   31.860000] [<c02e773c>] (nand_write+0x0/0xc4) from [<c02cab14>] =
(part_write+0x98/0xbc)
[   31.860000]  r7:c3a55f70 r6:00000800 r5:00000000 r4:00040000
[   31.860000] [<c02caa7c>] (part_write+0x0/0xbc) from [<c02ce21c>] =
(mtd_write+0x10c/0x244)
[   31.860000]  r6:c39b0c00 r5:00000800 r4:00000800
[   31.860000] [<c02ce110>] (mtd_write+0x0/0x244) from [<c00f3498>] =
(vfs_write+0xc0/0x190)
[   31.860000] [<c00f33d8>] (vfs_write+0x0/0x190) from [<c00f3654>] =
(sys_write+0x4c/0x7c)
[   31.860000] [<c00f3608>] (sys_write+0x0/0x7c) from [<c0008f00>] =
(ret_fast_syscall+0x0/0x2c)
[   31.860000]  r8:c0009148 r7:00000004 r6:00020000 r5:beb57a40 =
r4:00040000
[   31.860000] Code: e3550000 da00000d e5940000 e5d62000 (e5d03000)=20
[   32.200000] ---[ end trace db93856cc48a0e71 ]---
[   32.210000] Kernel panic - not syncing: Fatal exception
[   32.210000] Backtrace:=20
[   32.220000] [<c000c98c>] (dump_backtrace+0x0/0x114) from [<c044e99c>] =
(dump_stack+0x20/0x24)
[   32.220000]  r7:c02e63ea r6:c3a54000 r5:00000001 r4:00000001
[   32.230000] [<c044e97c>] (dump_stack+0x0/0x24) from [<c044ea08>] =
(panic+0x68/0x1b8)
[   32.240000] [<c044e9a0>] (panic+0x0/0x1b8) from [<c000cd1c>] =
(die+0x27c/0x308)
[   32.250000]  r3:c0624b28 r2:00000001 r1:000032bb r0:c053fedc
[   32.250000] [<c000caa0>] (die+0x0/0x308) from [<c0010130>] =
(__do_kernel_fault+0x74/0x94)
[   32.260000] [<c00100bc>] (__do_kernel_fault+0x0/0x94) from =
[<c0452cc4>] (do_page_fault+0xb4/0x35c)
[   32.270000]  r9:00000000 r8:00010000 r7:c39ee480 r6:00000000 =
r5:c3a55d50
[   32.280000] r4:c3a4acb8
[   32.280000] [<c0452c10>] (do_page_fault+0x0/0x35c) from [<c0008658>] =
(do_DataAbort+0x44/0xa8)
[   32.290000] [<c0008614>] (do_DataAbort+0x0/0xa8) from [<c0451298>] =
(__dabt_svc+0x38/0x60)
[   32.300000] Exception stack(0xc3a55d50 to 0xc3a55d98)
[   32.300000] 5d40:                                     00000000 =
00000000 00000055 c05f7d34
[   32.310000] 5d60: c3920878 00000800 c3a06000 00002880 c3920878 =
00000000 00000800 c3a55db4
[   32.320000] 5d80: c3a55cb8 c3a55d98 c0025b64 c02e63e8 20000013 =
ffffffff
[   32.320000]  r8:c3920878 r7:c3a55d84 r6:ffffffff r5:20000013 =
r4:c02e63e8
[   32.330000] [<c02e6374>] (nand_verify_buf+0x0/0xc4) from [<c02e61c8>] =
(nand_write_page+0xb4/0x110)
[   32.340000]  r7:00002880 r6:c3a06000 r5:c3920a98 r4:c3920878
[   32.350000] [<c02e6114>] (nand_write_page+0x0/0x110) from =
[<c02e7460>] (nand_do_write_ops+0x1c8/0x3b8)
[   32.360000]  r7:c3920a98 r6:c3a55e60 r5:00000800 r4:01440000
[   32.360000] [<c02e7298>] (nand_do_write_ops+0x0/0x3b8) from =
[<c02e77e4>] (nand_write+0xa8/0xc4)
[   32.370000] [<c02e773c>] (nand_write+0x0/0xc4) from [<c02cab14>] =
(part_write+0x98/0xbc)
[   32.380000]  r7:c3a55f70 r6:00000800 r5:00000000 r4:00040000
[   32.380000] [<c02caa7c>] (part_write+0x0/0xbc) from [<c02ce21c>] =
(mtd_write+0x10c/0x244)
[   32.390000]  r6:c39b0c00 r5:00000800 r4:00000800
[   32.400000] [<c02ce110>] (mtd_write+0x0/0x244) from [<c00f3498>] =
(vfs_write+0xc0/0x190)
[   32.400000] [<c00f33d8>] (vfs_write+0x0/0x190) from [<c00f3654>] =
(sys_write+0x4c/0x7c)
[   32.410000] [<c00f3608>] (sys_write+0x0/0x7c) from [<c0008f00>] =
(ret_fast_syscall+0x0/0x2c)
[   32.420000]  r8:c0009148 r7:00000004 r6:00020000 r5:beb57a40 =
r4:00040000

-Subodh Nijsure


------_=_NextPart_001_01CC78CC.B3FDA35C
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7654.12">
<TITLE>CONFIG_MTD_NAND_VERIFY_WRITE and GPMI NAND patch kernel =
panic.</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>

<P><FONT SIZE=3D2>Hello,<BR>
<BR>
I have been testing the GPMI NAND patch on iMX28 based platform.<BR>
<BR>
My git tree&nbsp; based on =
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git and I have applied =
patches that Huang Shijie had emailed out ( ref: <A =
HREF=3D"http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896219539&w=3D2"=
>http://marc.info/?l=3Dlinux-arm-kernel&m=3D131416896219539&w=3D2</A> =
)<BR>
<BR>
I see following kernel panic, if I have kernel compiled with option, =
CONFIG_MTD_NAND_VERIFY_WRITE=3Dy.<BR>
Unfortunately I don't have another non iMX28 hardware to try if this is =
CONFIG_MTD_NAND_VERIFY_WRITE option issue or the GPMI NAND that is =
causing this.<BR>
<BR>
However if I turn off this flag, everything works fine. Has anyone seen =
issue when using VERIFY_WRITE option on other platforms?<BR>
<BR>
If you have iMX28 based platform and are testing Huang's patchset would =
you mind turning on VERIFY_WRITE option and see if you get same =
results?<BR>
<BR>
I am not familiar with MTD source code in long time, but I will =
familiarize myself with this code and see if I find something, would =
appreciate any pointer on any debug flags to turn on.<BR>
<BR>
Kernel trace back when using VERIFY_WRITE option:<BR>
<BR>
formatting eraseblock 0 [&nbsp;&nbsp; 31.830000] Unable to handle kernel =
NULL pointer dereference at virtual address 00000000<BR>
ubifo[&nbsp;&nbsp; 31.840000] pgd =3D c3a64000<BR>
ubiformat: formatting e, *ppte=3D00000000raseblock 2 --&nbsp; 0 % =
compock 1 --&nbsp; 0 % complete&nbsp; , *pte=3D00000000<BR>
lete&nbsp; [&nbsp;&nbsp; 31.860000] Internal error: Oops: 17 [#1]<BR>
[&nbsp;&nbsp; 31.860000] Modules linked in:<BR>
[&nbsp;&nbsp; 31.860000] CPU: 0&nbsp;&nbsp;&nbsp; Not tainted&nbsp; =
(3.1.0-rc2-amp-10076-g3fefe97-dirty #8)<BR>
[&nbsp;&nbsp; 31.860000] PC is at nand_verify_buf+0x74/0xc4<BR>
[&nbsp;&nbsp; 31.860000] LR is at console_unlock+0x174/0x210<BR>
[&nbsp;&nbsp; 31.860000] pc : [&lt;c02e63e8&gt;]&nbsp;&nbsp;&nbsp; lr : =
[&lt;c0025b64&gt;]&nbsp;&nbsp;&nbsp; psr: 20000013<BR>
[&nbsp;&nbsp; 31.860000] sp : c3a55d98&nbsp; ip : c3a55cb8&nbsp; fp : =
c3a55db4<BR>
[&nbsp;&nbsp; 31.860000] r10: 00000800&nbsp; r9 : 00000000&nbsp; r8 : =
c3920878<BR>
[&nbsp;&nbsp; 31.860000] r7 : 00002880&nbsp; r6 : c3a06000&nbsp; r5 : =
00000800&nbsp; r4 : c3920878<BR>
[&nbsp;&nbsp; 31.860000] r3 : c05f7d34&nbsp; r2 : 00000055&nbsp; r1 : =
00000000&nbsp; r0 : 00000000<BR>
[&nbsp;&nbsp; 31.860000] Flags: nzCv&nbsp; IRQs on&nbsp; FIQs on&nbsp; =
Mode SVC_32&nbsp; ISA ARM&nbsp; Segment user<BR>
[&nbsp;&nbsp; 31.860000] Control: 0005317f&nbsp; Table: 43a64000&nbsp; =
DAC: 00000015<BR>
[&nbsp;&nbsp; 31.860000] Process ubiformat (pid: 61, stack limit =3D =
0xc3a54270)<BR>
[&nbsp;&nbsp; 31.860000] Stack: (0xc3a55d98 to 0xc3a56000)<BR>
[&nbsp;&nbsp; 31.860000] =
5d80:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c3920878 c3920a98<BR>
[&nbsp;&nbsp; 31.860000] 5da0: c3a06000 00002880 c3a55ddc c3a55db8 =
c02e61c8 c02e6384 c3a55ddc c3a55dc8<BR>
[&nbsp;&nbsp; 31.860000] 5dc0: 01440000 00000800 c3a55e60 c3920a98 =
c3a55e54 c3a55de0 c02e7460 c02e6124<BR>
[&nbsp;&nbsp; 31.860000] 5de0: 00000000 00000000 c029c620 c3a06000 =
00000000 c3811000 0ffe0000 00000000<BR>
[&nbsp;&nbsp; 31.860000] 5e00: c39d3000 00000000 00002880 00002880 =
0000003f 00000000 00001000 00000040<BR>
[&nbsp;&nbsp; 31.860000] 5e20: 00000000 c3a06000 00000000 00000800 =
c3920a98 01440000 00000000 01569fa8<BR>
[&nbsp;&nbsp; 31.860000] 5e40: 00000000 c3a4dfe0 c3a55e9c c3a55e58 =
c02e77e4 c02e72a8 c3a55e60 00000000<BR>
[&nbsp;&nbsp; 31.860000] 5e60: c39d89e0 00000800 00000000 00001000 =
c3a55eac c3a55e80 c3a06000 00000000<BR>
[&nbsp;&nbsp; 31.860000] 5e80: 00040000 00000000 00000800 c3a55f70 =
c3a55ecc c3a55ea0 c02cab14 c02e774c<BR>
[&nbsp;&nbsp; 31.860000] 5ea0: 00000800 c3a55f08 c3a06000 00000800 =
c39b0c00 00000800 00000800 c39b0c00<BR>
[&nbsp;&nbsp; 31.860000] 5ec0: c3a55f3c c3a55ed0 c02ce21c c02caa8c =
00000800 c3a55f08 c3a06000 c020c8c4<BR>
[&nbsp;&nbsp; 31.860000] 5ee0: c3a06000 c3a54000 00000003 00040000 =
00000000 c3a5c300 c3a55f3c c3a55f08<BR>
[&nbsp;&nbsp; 31.860000] 5f00: c00f2874 c020c050 00000000 00000800 =
c0282084 c3a5c300 00000800 01569fa8<BR>
[&nbsp;&nbsp; 31.860000] 5f20: c3a55f70 c3a54000 c3a54000 00000000 =
c3a55f6c c3a55f40 c00f3498 c02ce120<BR>
[&nbsp;&nbsp; 31.860000] 5f40: 00040000 00000000 00040000 00000000 =
c3a5c300 00000800 01569fa8 00000000<BR>
[&nbsp;&nbsp; 31.860000] 5f60: c3a55fa4 c3a55f70 c00f3654 c00f33e8 =
00040000 00000000 00000000 00000000<BR>
[&nbsp;&nbsp; 31.860000] 5f80: ffffffff 00040000 beb57a40 00020000 =
00000004 c0009148 00000000 c3a55fa8<BR>
[&nbsp;&nbsp; 31.860000] 5fa0: c0008f00 c00f3618 00040000 beb57a40 =
00000003 01569fa8 00000800 00000800<BR>
[&nbsp;&nbsp; 31.860000] 5fc0: 00040000 beb57a40 00020000 00000004 =
00000000 00000800 00000002 00000003<BR>
[&nbsp;&nbsp; 31.860000] 5fe0: 00000000 beb57980 0000e140 4013babc =
60000010 00000003 00000000 00000000<BR>
[&nbsp;&nbsp; 31.860000] Backtrace:<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02e6374&gt;] (nand_verify_buf+0x0/0xc4) =
from [&lt;c02e61c8&gt;] (nand_write_page+0xb4/0x110)<BR>
[&nbsp;&nbsp; 31.860000]&nbsp; r7:00002880 r6:c3a06000 r5:c3920a98 =
r4:c3920878<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02e6114&gt;] (nand_write_page+0x0/0x110) =
from [&lt;c02e7460&gt;] (nand_do_write_ops+0x1c8/0x3b8)<BR>
[&nbsp;&nbsp; 31.860000]&nbsp; r7:c3920a98 r6:c3a55e60 r5:00000800 =
r4:01440000<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02e7298&gt;] =
(nand_do_write_ops+0x0/0x3b8) from [&lt;c02e77e4&gt;] =
(nand_write+0xa8/0xc4)<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02e773c&gt;] (nand_write+0x0/0xc4) from =
[&lt;c02cab14&gt;] (part_write+0x98/0xbc)<BR>
[&nbsp;&nbsp; 31.860000]&nbsp; r7:c3a55f70 r6:00000800 r5:00000000 =
r4:00040000<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02caa7c&gt;] (part_write+0x0/0xbc) from =
[&lt;c02ce21c&gt;] (mtd_write+0x10c/0x244)<BR>
[&nbsp;&nbsp; 31.860000]&nbsp; r6:c39b0c00 r5:00000800 r4:00000800<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c02ce110&gt;] (mtd_write+0x0/0x244) from =
[&lt;c00f3498&gt;] (vfs_write+0xc0/0x190)<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c00f33d8&gt;] (vfs_write+0x0/0x190) from =
[&lt;c00f3654&gt;] (sys_write+0x4c/0x7c)<BR>
[&nbsp;&nbsp; 31.860000] [&lt;c00f3608&gt;] (sys_write+0x0/0x7c) from =
[&lt;c0008f00&gt;] (ret_fast_syscall+0x0/0x2c)<BR>
[&nbsp;&nbsp; 31.860000]&nbsp; r8:c0009148 r7:00000004 r6:00020000 =
r5:beb57a40 r4:00040000<BR>
[&nbsp;&nbsp; 31.860000] Code: e3550000 da00000d e5940000 e5d62000 =
(e5d03000)<BR>
[&nbsp;&nbsp; 32.200000] ---[ end trace db93856cc48a0e71 ]---<BR>
[&nbsp;&nbsp; 32.210000] Kernel panic - not syncing: Fatal exception<BR>
[&nbsp;&nbsp; 32.210000] Backtrace:<BR>
[&nbsp;&nbsp; 32.220000] [&lt;c000c98c&gt;] (dump_backtrace+0x0/0x114) =
from [&lt;c044e99c&gt;] (dump_stack+0x20/0x24)<BR>
[&nbsp;&nbsp; 32.220000]&nbsp; r7:c02e63ea r6:c3a54000 r5:00000001 =
r4:00000001<BR>
[&nbsp;&nbsp; 32.230000] [&lt;c044e97c&gt;] (dump_stack+0x0/0x24) from =
[&lt;c044ea08&gt;] (panic+0x68/0x1b8)<BR>
[&nbsp;&nbsp; 32.240000] [&lt;c044e9a0&gt;] (panic+0x0/0x1b8) from =
[&lt;c000cd1c&gt;] (die+0x27c/0x308)<BR>
[&nbsp;&nbsp; 32.250000]&nbsp; r3:c0624b28 r2:00000001 r1:000032bb =
r0:c053fedc<BR>
[&nbsp;&nbsp; 32.250000] [&lt;c000caa0&gt;] (die+0x0/0x308) from =
[&lt;c0010130&gt;] (__do_kernel_fault+0x74/0x94)<BR>
[&nbsp;&nbsp; 32.260000] [&lt;c00100bc&gt;] (__do_kernel_fault+0x0/0x94) =
from [&lt;c0452cc4&gt;] (do_page_fault+0xb4/0x35c)<BR>
[&nbsp;&nbsp; 32.270000]&nbsp; r9:00000000 r8:00010000 r7:c39ee480 =
r6:00000000 r5:c3a55d50<BR>
[&nbsp;&nbsp; 32.280000] r4:c3a4acb8<BR>
[&nbsp;&nbsp; 32.280000] [&lt;c0452c10&gt;] (do_page_fault+0x0/0x35c) =
from [&lt;c0008658&gt;] (do_DataAbort+0x44/0xa8)<BR>
[&nbsp;&nbsp; 32.290000] [&lt;c0008614&gt;] (do_DataAbort+0x0/0xa8) from =
[&lt;c0451298&gt;] (__dabt_svc+0x38/0x60)<BR>
[&nbsp;&nbsp; 32.300000] Exception stack(0xc3a55d50 to 0xc3a55d98)<BR>
[&nbsp;&nbsp; 32.300000] =
5d40:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 00000000 00000000 00000055 c05f7d34<BR>
[&nbsp;&nbsp; 32.310000] 5d60: c3920878 00000800 c3a06000 00002880 =
c3920878 00000000 00000800 c3a55db4<BR>
[&nbsp;&nbsp; 32.320000] 5d80: c3a55cb8 c3a55d98 c0025b64 c02e63e8 =
20000013 ffffffff<BR>
[&nbsp;&nbsp; 32.320000]&nbsp; r8:c3920878 r7:c3a55d84 r6:ffffffff =
r5:20000013 r4:c02e63e8<BR>
[&nbsp;&nbsp; 32.330000] [&lt;c02e6374&gt;] (nand_verify_buf+0x0/0xc4) =
from [&lt;c02e61c8&gt;] (nand_write_page+0xb4/0x110)<BR>
[&nbsp;&nbsp; 32.340000]&nbsp; r7:00002880 r6:c3a06000 r5:c3920a98 =
r4:c3920878<BR>
[&nbsp;&nbsp; 32.350000] [&lt;c02e6114&gt;] (nand_write_page+0x0/0x110) =
from [&lt;c02e7460&gt;] (nand_do_write_ops+0x1c8/0x3b8)<BR>
[&nbsp;&nbsp; 32.360000]&nbsp; r7:c3920a98 r6:c3a55e60 r5:00000800 =
r4:01440000<BR>
[&nbsp;&nbsp; 32.360000] [&lt;c02e7298&gt;] =
(nand_do_write_ops+0x0/0x3b8) from [&lt;c02e77e4&gt;] =
(nand_write+0xa8/0xc4)<BR>
[&nbsp;&nbsp; 32.370000] [&lt;c02e773c&gt;] (nand_write+0x0/0xc4) from =
[&lt;c02cab14&gt;] (part_write+0x98/0xbc)<BR>
[&nbsp;&nbsp; 32.380000]&nbsp; r7:c3a55f70 r6:00000800 r5:00000000 =
r4:00040000<BR>
[&nbsp;&nbsp; 32.380000] [&lt;c02caa7c&gt;] (part_write+0x0/0xbc) from =
[&lt;c02ce21c&gt;] (mtd_write+0x10c/0x244)<BR>
[&nbsp;&nbsp; 32.390000]&nbsp; r6:c39b0c00 r5:00000800 r4:00000800<BR>
[&nbsp;&nbsp; 32.400000] [&lt;c02ce110&gt;] (mtd_write+0x0/0x244) from =
[&lt;c00f3498&gt;] (vfs_write+0xc0/0x190)<BR>
[&nbsp;&nbsp; 32.400000] [&lt;c00f33d8&gt;] (vfs_write+0x0/0x190) from =
[&lt;c00f3654&gt;] (sys_write+0x4c/0x7c)<BR>
[&nbsp;&nbsp; 32.410000] [&lt;c00f3608&gt;] (sys_write+0x0/0x7c) from =
[&lt;c0008f00&gt;] (ret_fast_syscall+0x0/0x2c)<BR>
[&nbsp;&nbsp; 32.420000]&nbsp; r8:c0009148 r7:00000004 r6:00020000 =
r5:beb57a40 r4:00040000<BR>
<BR>
-Subodh Nijsure<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01CC78CC.B3FDA35C--
