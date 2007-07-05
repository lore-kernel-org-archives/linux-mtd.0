Received: from smtp.x263.net ([211.150.96.21] helo=smtp.263.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6GNX-0002eH-7c
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 21:43:36 -0400
Received: from smtp.263.net (localhost [127.0.0.1])
	by smtp.263.net (Postfix) with ESMTP id EA66B20FA85
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 Jul 2007 09:15:46 +0800 (CST)
Received: from mox89b9e5e1226 (localhost [127.0.0.1])
	by smtp.263.net (Postfix) with ESMTP id A65C015DF69
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 Jul 2007 09:15:46 +0800 (CST)
From: "Eric" <liuhxshanghai@263.net>
To: <linux-mtd@lists.infradead.org>
Subject: Nand dump Jffs2
Date: Thu, 5 Jul 2007 09:14:31 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20070705011546.A65C015DF69@smtp.263.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

My Linux kernel v2.4.7-vrs1, Nand flash Sumsong k9f5608x0d (page size: =
512 bytes, OOB 16 bytes, 32 pages per block, total 2048 blocks and 32M).

After I mount an erased nand flash as JFFS2 file system, I dump the =
flash, and I find the first page of the first block is:
0x00 85  19   3  20   c   0   0   0  b1  b0  1e  e4  ff  ff  ff  ff =20
0x10 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x20 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x30 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x40 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x50 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x60 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x70 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x80 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x90 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0xa0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0xb0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x c0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0xd0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0xe0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0xf0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x100 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x110 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x120 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x130 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x140 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x150 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x160 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x170 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x180 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x190 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1a0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1b0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1c0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1d0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1e0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
0x1f0 ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20
---OOB ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff  ff =20

It seems that the first 8 bytes are JFFS2 cleanmarker. However, the =
Linux MTD web page (http://www.linux-mtd.infradead.org/doc/nand.html) =
says the cleanmarker starts at offset 0x08 of OOB area.

If I use Linux kernel v2.6.21, the first block of the first page is:
0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000000f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00000190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
OOB Data: ff ff ff ff ff ff ff ff 85 19 03 20 08 00 00 00
=20
I think this is OK.

Any idea?

Thanks and Regards
Eric
