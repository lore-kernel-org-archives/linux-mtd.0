Received: from goliath.siemens.de ([192.35.17.28])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhOUG-0005va-10
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 07:19:41 -0400
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.6/8.12.6) with ESMTP id l3RBJcfF010071
	for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2007 13:19:38 +0200
Received: from mchp7wta.ww002.siemens.net (mchp7wta.ww002.siemens.net
	[139.25.131.193])
	by mail2.siemens.de (8.12.6/8.12.6) with ESMTP id l3RBJbZ6014802
	for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2007 13:19:37 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] [MTD] NAND: Wrong calculation of page number in
	nand_block_bad()
Date: Fri, 27 Apr 2007 13:19:36 +0200
Message-ID: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
From: "Knobloch, Thomas" <knobloch@siemens.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


In case that there is no memory based bad block table available the
function nand_block_checkbad() in drivers/mtd/nand/nand_base.c will call
nand_block_bad() directly. When parameter 'getchip' is set to zero,
nand_block_bad() will not right shift the offset to calculate the
correct page number.

Signed-off-by: Thomas Knobloch <knobloch@siemens.com>

diff -uNr a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c	2007-04-27 12:44:23.345198284
+0200
+++ b/drivers/mtd/nand/nand_base.c	2007-04-27 12:46:57.916226928
+0200
@@ -312,7 +312,7 @@
 		/* Select the NAND device */
 		chip->select_chip(mtd, chipnr);
 	} else
-		page =3D (int)ofs;
+		page =3D (int)(ofs >> chip->page_shift);
=20
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos &
0xFE,
