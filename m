Received: from mail-fx0-f223.google.com ([209.85.220.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NgHf1-0001dt-Ac
	for linux-mtd@lists.infradead.org; Sat, 13 Feb 2010 13:03:52 +0000
Received: by mail-fx0-f223.google.com with SMTP id 23so3374278fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Feb 2010 05:03:47 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 10/14] MTD: nand: add ->badblockbits to specify the minimum
	number of bits in bad block byte to consider the block good
Date: Sat, 13 Feb 2010 15:03:09 +0200
Message-Id: <1266066193-17625-11-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266066193-17625-1-git-send-email-maximlevitsky@gmail.com>
References: <1266066193-17625-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This can be used to protect against bitflips in that field, but now mostly
for smartmedia.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   13 +++++++++----
 include/linux/mtd/nand.h     |    1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c393df3..88750a6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -335,14 +335,18 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		bad = cpu_to_le16(chip->read_word(mtd));
 		if (chip->badblockpos & 0x1)
 			bad >>= 8;
-		if ((bad & 0xFF) != 0xff)
-			res = 1;
+		else
+			bad &= 0xFF;
 	} else {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos, page);
-		if (chip->read_byte(mtd) != 0xff)
-			res = 1;
+		bad = chip->read_byte(mtd);
 	}
 
+	if (likely(chip->badblockbits == 8))
+		res = bad != 0xFF;
+	else
+		res = hweight8(bad) < chip->badblockbits;
+
 	if (getchip)
 		nand_release_device(mtd);
 
@@ -2710,6 +2714,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	/* Set the bad block position */
 	chip->badblockpos = mtd->writesize > 512 ?
 		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
+	chip->badblockbits = 8;
 
 	/* Get chip options, preserve non chip based options */
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ccab9df..27d998e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -391,6 +391,7 @@ struct nand_chip {
 	int		subpagesize;
 	uint8_t		cellinfo;
 	int		badblockpos;
+	int		badblockbits;
 
 	flstate_t	state;
 
-- 
1.6.3.3
