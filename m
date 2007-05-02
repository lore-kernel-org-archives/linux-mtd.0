Received: from goliath.siemens.de ([192.35.17.28])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjIwP-0007ms-UD
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 13:48:40 -0400
Subject: Re: AW: [PATCH] [MTD] NAND: Wrong calculation of page number
	innand_block_bad()
From: Thomas Knobloch <knobloch@siemens.com>
To: tglx@linutronix.de
In-Reply-To: <1178119094.25504.1.camel@localhost.localdomain>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
	<1177693431.25960.123.camel@localhost.localdomain>
	<2EDADF4ED023F04BAD4D7A4131ECEB93010554E3@mchp7rfa.ww002.siemens.net>
	<1178119094.25504.1.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 02 May 2007 19:48:33 +0200
Message-Id: <1178128113.29857.9.camel@mhhb7g7c.mchh.siemens.de>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: knobloch@siemens.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-02 at 17:18 +0200, Thomas Gleixner wrote:
> If you now manage to send a non line wrapped patch with the log message
> and your Signed-off-by, then I can apply it right from the mail.

Sorry for the inconvinience. Here comes the patch again (hopefully right
this time):


In case that there is no memory based bad block table available the
function nand_block_checkbad() in drivers/mtd/nand/nand_base.c will call
nand_block_bad() directly. When parameter 'getchip' is set to zero,
nand_block_bad() will not right shift the offset to calculate the
correct page number.

Signed-off-by: Thomas Knobloch <knobloch@siemens.com>

diff -auNr a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c	2007-04-27 12:44:23.000000000 +0200
+++ b/drivers/mtd/nand/nand_base.c	2007-05-02 13:19:19.080023100 +0200
@@ -303,28 +303,27 @@
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
+	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+
 	if (getchip) {
-		page = (int)(ofs >> chip->page_shift);
 		chipnr = (int)(ofs >> chip->chip_shift);
 
 		nand_get_device(chip, mtd, FL_READING);
 
 		/* Select the NAND device */
 		chip->select_chip(mtd, chipnr);
-	} else
-		page = (int)ofs;
+	}
 
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos & 0xFE,
-			      page & chip->pagemask);
+			      page);
 		bad = cpu_to_le16(chip->read_word(mtd));
 		if (chip->badblockpos & 0x1)
 			bad >>= 8;
 		if ((bad & 0xFF) != 0xff)
 			res = 1;
 	} else {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
-			      page & chip->pagemask);
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos, page);
 		if (chip->read_byte(mtd) != 0xff)
 			res = 1;
 	}
