Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERSPm-0005vC-36
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2005 11:40:23 +0100
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id j9HAkkZa010699
	for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2005 10:46:46 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005101714351828344
	for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2005 14:35:18 +0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Oct 2005 14:35:16 +0400
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A01495FB0@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I faced several issues with XIP on kernel 2.6.11.
I used Mainstone board and NOR flash with the only partition (non RWW
device).
First found issue of XIP was concerned with GCC optimization.
The function Do_write_buffer was inlined into upper function and as a
result loose __xipram attribute in case of default -Os compile option.
I reduced compile option to -O1 and it helped.

After resolving this issue I found another one halting.=20
The system halts with rather big probability on write and erase
operations (good way to reproduce it download file (of size ~1M) via
tftp on JFFS2 volume).
I used BDI debugger to investigate the issue and found that after
halting flash device was in READ_STATUS mode and write operation is not
complete. PC reg points to stuff in virtual memory region mapped to
FLASH.
I disabled for just a case FIQs, but it didn't help.
I really puzzled what code could interrupt write operation then IRQs and
FIQs are disabled.=20
I saw some improvement when I tried to invalidate all cache regions
before disabling interrupts. But halting is still high probable.=20

Also from time to time I see another issue.=20
I get kernel panic message of the view :
I added debug print just before BUG was called.=20
It looks very strange according to code chips_per_word =3D worwidth *
cfi_interleave / map_bankwidth. There is no way to get 6 !

2005-10-15 17:49:58 | cfi_interleave =3D 2 worwidth =3D 4 map_bankwidth =
=3D 4
chips_per_word =3D 6 cmd =3D 0x80.
2005-10-15 17:49:58 | kernel BUG at include/linux/mtd/cfi.h:304!
2005-10-15 17:49:58 | Unable to handle kernel NULL pointer dereference
at virtual address 00000000
2005-10-15 17:49:58 | pgd =3D c0004000
2005-10-15 17:49:58 | [00000000] *pgd=3D00000000
2005-10-15 17:49:58 | Internal error: Oops: 817 [#1]
2005-10-15 17:49:58 | Modules linked in:
2005-10-15 17:49:58 | CPU: 0
2005-10-15 17:49:58 | PC is at __bug+0x48/0x5c
2005-10-15 17:49:58 | LR is at 0x1
2005-10-15 17:49:58 | pc : [<bf097a94>]    lr : [<00000001>]    Tainted:
P    =20
2005-10-15 17:49:58 | sp : c02c5d30  ip : 00000000  fp : c02c5d40
2005-10-15 17:49:58 | r10: 00000001  r9 : 01500000  r8 : c0025390
2005-10-15 17:49:58 | r7 : c0025390  r6 : 00000002  r5 : 00000006  r4 :
00000000
2005-10-15 17:49:58 | r3 : 00000000  r2 : 00000000  r1 : 000012b7  r0 :
00000001
2005-10-15 17:49:58 | Flags: nZCv  IRQs off  FIQs on  Mode SVC_32
Segment kernel
2005-10-15 17:49:58 | Control: 397F  Table: A3AB4000  DAC: 00000017
2005-10-15 17:49:58 | Process swapper (pid: 684, stack limit =3D
0xc02c41a4)
2005-10-15 17:49:58 | Stack: (0xc02c5d30 to 0xc02c6000)
2005-10-15 17:49:58 | 5d20:                                     000000d0
c02c5e10 c02c5d44 c00212a8=20
2005-10-15 17:49:58 | 5d40: bf097a58 00000000 00c000c0 00000012 00000004
00800080 c01655c0 c026c4a0=20
2005-10-15 17:49:58 | 5d60: 00001e89 c026c4d8 00000000 00800080 00800080
00000000 00000000 00700070=20
2005-10-15 17:49:58 | 5d80: 00000000 00ff00ff c02c5e10 c02c5d98 60000013
00400040 00c000c0 00400040=20
2005-10-15 17:49:58 | 5da0: 00800080 00800080 00800080 00c000c0 00800080
00700070 00b000b0 00800080=20
2005-10-15 17:49:58 | 5dc0: 00000000 c02bad00 bf0a54a0 00000000 00000000
00000000 c02bad00 bf0a54a0=20
2005-10-15 17:49:58 | 5de0: 00000000 00000000 c02c5e70 00000002 c026c4d8
c0025390 00011789 c0025390=20
2005-10-15 17:49:58 | 5e00: 01500000 c02c5ed8 c02c5e14 c0024444 c00207f8
00800080 c0113cd8 00800080=20
2005-10-15 17:49:58 | 5e20: 00000000 00000000 00000003 00800080 00000000
c026c4a0 00040000 c026c4a0=20
2005-10-15 17:49:58 | 5e40: c3e51dec 014c0000 c026c4d8 003a003a 00700070
00020002 00800080 00020002=20
2005-10-15 17:49:58 | 5e60: 00000000 00800080 00800080 00000000 00000000
00d000d0 00200020 00500050=20
2005-10-15 17:49:58 | 5e80: 00800080 00000000 00000000 c02bad00 bf0a54a0
00000000 00000000 00000000=20
2005-10-15 17:49:58 | 5ea0: c02bad00 bf0a54a0 00000000 00000000 00040000
01500000 00000000 00000001=20
2005-10-15 17:49:58 | 5ec0: 01500000 00000000 c0272440 c02c5f18 c02c5edc
bf19d194 c0023980 00000000=20
2005-10-15 17:49:58 | 5ee0: 00000001 c026c4a0 c0025390 c0023974 c02c5fa4
c02c5f64 c02c5f48 c02c5fa4=20
2005-10-15 17:49:58 | 5f00: c01e11a8 00000000 00000000 c02c5f34 c02c5f1c
bf19fd00 bf19cf60 00040000=20
2005-10-15 17:49:58 | 5f20: 00000000 c02bba00 c02c5f44 c02c5f38 bf19466c
bf19fcdc c02c5f94 c02c5f48=20
2005-10-15 17:49:58 | 5f40: bf198348 bf194620 c02c5f48 c02c5f48 00000000
c02bad00 bf0a54a0 00000000=20
2005-10-15 17:49:58 | 5f60: 00000000 00000000 c02bad00 bf0a54a0 00000000
00000000 c0373d80 00000001=20
2005-10-15 17:49:58 | 5f80: c0373d60 c0373d80 c02c5ff4 c02c5f98 bf1972d8
bf1982cc c02c5fa0 c3e51ddc=20
2005-10-15 17:49:58 | 5fa0: 00000010 c02bba00 01500000 00040000 ffffffff
00000000 00000000 00000000=20
2005-10-15 17:49:58 | 5fc0: 00000000 bf19829c c02c5f48 00000000 00000000
00000000 00000000 00000000=20
2005-10-15 17:49:58 | 5fe0: 00000000 00000000 00000000 c02c5ff8 bf0ab1b4
bf197084 f098cb36 4f7d3d2b=20
2005-10-15 17:49:58 | Backtrace:=20
2005-10-15 17:49:58 | [<bf097a4c>] (__bug+0x0/0x5c) from [<c00212a8>]
(0xc00212a8)
2005-10-15 17:49:58 |  r4 =3D 000000D0=20
2005-10-15 17:49:58 | [<c00207ec>] (0xc00207ec) from [<c0024444>]
(0xc0024444)
2005-10-15 17:49:58 | [<c0023974>] (0xc0023974) from [<bf19d194>]
(cfi_varsize_frob+0x240/0x2cc)
2005-10-15 17:49:58 | [<bf19cf54>] (cfi_varsize_frob+0x0/0x2cc) from
[<bf19fd00>] (cfi_intelext_erase_varsize+0x30/0x58)
2005-10-15 17:49:58 | [<bf19fcd0>] (cfi_intelext_erase_varsize+0x0/0x58)
from [<bf19466c>] (part_erase+0x58/0x5c)
2005-10-15 17:49:58 |  r4 =3D C02BBA00=20
2005-10-15 17:49:58 | Code: eb004527 e59f0014 eb004525 e3a03000
(e5833000)=20


I'm really suspect that that kernel panic and halting has the same root.
Then flash is in READ_ARRAY mode and due to unknown reason an exception
appears we get kernel_panic in another case we get halting.

Has anyone seen something looking like that ?
What may cause access to flash in case of executing write or erase when
interrupts are disabled?

Platform: mainstone 2 with CPU PXA270 and different nor flash devices
with one partition.=20
