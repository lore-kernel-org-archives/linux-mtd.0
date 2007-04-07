Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HZzu6-0000wU-Bk
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 21:39:47 -0400
Received: from archite by server37.tchmachines.com with local (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1HZzto-00023J-Bc
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 21:39:28 -0400
Message-ID: <33622.69.30.123.186.1175909968.squirrel@architechnical.net>
Date: Fri, 6 Apr 2007 18:39:28 -0700 (PDT)
Subject: OneNAND kernel oops in onenand_write_bufferram
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When trying to copy a jffs2 image to a OneNAND partition using either
nandwrite or cp I get a kernel oops and nothing is written.  The jffs2
image isn't padded but does have the correct erase block size.  I've tried
using many permutations of kernel 2.6.18, 2.6.20, Kyungmin's git, Artem's
git, and mtd-utils (both mkfs.jffs2 and nandwrite) 1.0.0, 1.0.1, and from
the git.  I'm also unlocking the chip by hand using u-boot before starting
the kernel.

We've discovered that although we're shipping with rev "B" of the OneNAND
we're currently developing with rev "M", and we've fixed one known voltage
issue on the reset line (thank you Kyungmin Park!!).  Samsung has been
working with us to resolve the issue but we're fast approaching a
deadline, so any suggestions from someone who's seen this are greatly
appreciated.

The oops is below:
Bad mode in data abort handler detected: mode ABT_32
Internal error: Oops - bad mode: 0 [#1]
Modules linked in: rfcomm hidp l2cap bluetooth vfat fat lq_spi pxa2xx_spi
CPU: 0
PC is at 0xffff000c
LR is at 0xffffffff
pc : [<ffff000c>]    lr : [<ffffffff>]    Not tainted
sp : c3c6fdb0  ip : ffffffff  fp : c3c6fe38
r10: c4871000  r9 : 00000000  r8 : ffffffff
r7 : ffffffff  r6 : ffffffff  r5 : ffffffff  r4 : ffffffff
r3 : ffffffff  r2 : 00000760  r1 : c4871020  r0 : cb000c20
Flags: nzCv  IRQs off  FIQs on  Mode ABT_32  Segment kernel
Control: 397F
Table: A2C78000  DAC: 00000017
Process mtdblockd (pid: 153, stack limit = 0xc3c6e258)
Stack: (0xc3c6fdb0 to 0xc3c70000)
fda0:                                     cb000c20 c4871020 00000760 ffffffff
fdc0: ffffffff ffffffff ffffffff ffffffff ffffffff 00000000 c4871000 c3c6fe38
fde0: ffffffff c3c6fdb0 ffffffff ffff000c 20000097 ffffffff 00000800 cb000c00
fe00: c3d03ac4 00000000 cb000c00 00000800 c014fc70 00000800 c3d03a00 00180000
fe20: 00000000 c4871000 00020000 c3c6fe7c c3c6fe3c c01504a8 c014fbdc 00000800
fe40: 00000800 00000000 00000000 00000000 c3d03ac4 00000000 00000000 00020000
fe60: 00180000 00000000 00000000 00020000 c3c6fea8 c3c6fe80 c01457fc c0150324
fe80: c3c6feb8 c4871000 00000000 c3c6e000 c03ca2a0 c3c6fed8 c3c6febc c3c6ff44
fea0: c3c6feac c0148230 c0145750 c3c6feb8 c4871000 c4871000 00000000 c3c6febc
fec0: c3c6febc 00000000 c3c73ac0 c003d5c0 00000000 00000000 00000000 c3c73ac0
fee0: c003d5c0 00100100 00200200 c03ca2a0 00000000 00020000 ffffffff c22ac1a0
ff00: c03a3c00 0000001d 00004000 c01480e8 c3c6febc c2272108 c22ac1a0 c3ff94e0
ff20: 00000200 00020000 00020000 00020000 c03ca2a0 c22e1000 c3c6ff58 c3c6ff48
ff40: c0148294 c0148118 c3ff94e0 c3c6ff98 c3c6ff5c c01484e4 c014826c c22e1000
ff60: 00000100 00000000 00000200 c3c6ff78 00000008 c2272164 c22e1000 00000100
ff80: c0294a08 c3c6e000 c3c5d1a0 c3c6fff4 c3c6ff9c c01477a8 c01483dc c3c5d1b0
ffa0: c03a3c00 00000000 c3c73ac0 c003d5c0 00000000 00000000 00000000 c3c73ac0
ffc0: c003d5c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffe0: 00000000 00000000 00000000 c3c6fff8 c00431fc c01475a8 ffffffff ffffffff
Backtrace:
[<c014fbd0>] (onenand_write_bufferram+0x0/0xac) from [<c01504a8>]
(onenand_write+0x190/0x310)
[<c0150318>] (onenand_write+0x0/0x310) from [<c01457fc>]
(part_write+0xb8/0xc0)
[<c0145744>] (part_write+0x0/0xc0) from [<c0148230>]
(erase_write+0x124/0x154)
 r8 = C3C6FEBC  r7 = C3C6FED8  r6 = C03CA2A0  r5 = C3C6E000
r4 = 00000000
[<c014810c>] (erase_write+0x0/0x154) from [<c0148294>]
(write_cached_data+0x34/0x4c)
[<c0148260>] (write_cached_data+0x0/0x4c) from [<c01484e4>]
(mtdblock_writesect+0x114/0x1d4)
 r4 = C3FF94E0
[<c01483d0>] (mtdblock_writesect+0x0/0x1d4) from [<c01477a8>]
(mtd_blktrans_thread+0x20c/0x288)
[<c014759c>] (mtd_blktrans_thread+0x0/0x288) from [<c00431fc>]
(do_exit+0x0/0x748)
Code: bad PC value.
