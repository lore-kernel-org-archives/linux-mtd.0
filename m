Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUjS7-0002mk-NH
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2005 07:28:24 -0400
Date: Wed, 26 Oct 2005 15:28:28 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20051026152828.3959d71d.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] [trivial] fixing rightshift in nand_block_bad
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As was discussed in the IRC chat, it's necessary to shift value obtained read_word from right by 8 in case of odd this->badblockpos.
The patch from that is inlined below.

Best regards,
   Vitaly

Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.150
diff -u -r1.150 nand_base.c
--- drivers/mtd/nand/nand_base.c	15 Sep 2005 13:58:48 -0000	1.150
+++ drivers/mtd/nand/nand_base.c	26 Oct 2005 11:24:50 -0000
@@ -433,7 +433,7 @@
 		this->cmdfunc (mtd, NAND_CMD_READOOB, this->badblockpos & 0xFE, page & this->pagemask);
 		bad = cpu_to_le16(this->read_word(mtd));
 		if (this->badblockpos & 0x1)
-			bad >>= 1;
+			bad >>= 8;
 		if ((bad & 0xFF) != 0xff)
 			res = 1;
 	} else {
