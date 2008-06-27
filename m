Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCJEq-0001BN-QE
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 19:04:05 +0000
Date: Fri, 27 Jun 2008 23:04:04 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/3] MTD: NAND: fsl_elbc_nand: fix OOB workability for
	large page NAND chips
Message-ID: <20080627190404.GA16901@polina.dev.rtsoft.ru>
References: <20080627190243.GA4713@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20080627190243.GA4713@polina.dev.rtsoft.ru>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For large page chips, nand_bbt is looking into OOB area, and checking
for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
reserved for bbt means.

But ELBC driver is specifying ecclayout so that oobfree area starts at
offset 1, so only one byte left for the bbt purposes.

This causes problems with any OOB users, namely JFFS2: after first mount
JFFS2 will fill all OOBs with "erased marker", so OOBs will contain:

  OOB Data: ff 19 85 20 03 00 ff ff ff 00 00 08 ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

And on the next boot, NAND core will rescan for bad blocks, then will
see "0xff 0x19" pattern, and will mark all blocks as bad ones.

To fix the issue we should implement our own bad block pattern: just one
byte at OOB start. Though, this will work only for x8 chips. For x16
chips two bytes must be checked. Since ELBC driver does not support x16
NANDs (yet), we're safe for now.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
Acked-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1b06d29..99dc2be 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -116,6 +116,20 @@ static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
 	.oobavail = 48,
 };
 
+/*
+ * fsl_elbc_oob_lp_eccm* specify that LP NAND's OOB free area starts at offset
+ * 1, so we have to adjust bad block pattern. This pattern should be used for
+ * x8 chips only. So far hardware does not support x16 chips anyway.
+ */
+static u8 scan_ff_pattern[] = { 0xff, };
+
+static struct nand_bbt_descr largepage_memorybased = {
+	.options = 0,
+	.offs = 0,
+	.len = 1,
+	.pattern = scan_ff_pattern,
+};
+
 /*=================================*/
 
 /*
@@ -687,6 +701,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
 			                   &fsl_elbc_oob_lp_eccm1 :
 			                   &fsl_elbc_oob_lp_eccm0;
+			chip->badblock_pattern = &largepage_memorybased;
 			mtd->ecclayout = chip->ecc.layout;
 			mtd->oobavail = chip->ecc.layout->oobavail;
 		}
-- 
1.5.5.4
