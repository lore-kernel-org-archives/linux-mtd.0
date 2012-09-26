Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TH0ps-0007vl-5c
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 23:16:08 +0000
Received: by padbi5 with SMTP id bi5so871998pad.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 16:16:06 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: fsl_elbc_nand: remove unnecessary badblock_pattern
Date: Wed, 26 Sep 2012 16:15:27 -0700
Message-Id: <1348701327-12226-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the introduction of nand_create_default_bbt_descr() (now known as
nand_create_badblock_pattern()) in

  commit 58373ff0afff4cc8ac40608872995f4d87eb72ec

nand_chip.badblock_pattern will be dynamically calculated to the same
1-byte-length pattern that is required by fsl_elbc_nand. This custom
badblock_pattern is no longer needed, then, and its removal may help
facilitate further nand_bbt.c/nand_base.c cleanup in the future (one
down, many to go?)

Anyway, with nand_bbt.c fixed, this effectively reverts:

  commit 452db2724351ff3d9416a183a7955e00ab4e6ab4
  [MTD] [NAND] fsl_elbc_nand: fix OOB workability for large page NAND chips

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>
---

Not even compile-tested...

 drivers/mtd/nand/fsl_elbc_nand.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index cc1480a..4c4d3e5 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -109,20 +109,6 @@ static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
 };
 
 /*
- * fsl_elbc_oob_lp_eccm* specify that LP NAND's OOB free area starts at offset
- * 1, so we have to adjust bad block pattern. This pattern should be used for
- * x8 chips only. So far hardware does not support x16 chips anyway.
- */
-static u8 scan_ff_pattern[] = { 0xff, };
-
-static struct nand_bbt_descr largepage_memorybased = {
-	.options = 0,
-	.offs = 0,
-	.len = 1,
-	.pattern = scan_ff_pattern,
-};
-
-/*
  * ELBC may use HW ECC, so that OOB offsets, that NAND core uses for bbt,
  * interfere with ECC positions, that's why we implement our own descriptors.
  * OOB {11, 5}, works for both SP and LP chips, with ECCM = 1 and ECCM = 0.
@@ -699,7 +685,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
 			                   &fsl_elbc_oob_lp_eccm1 :
 			                   &fsl_elbc_oob_lp_eccm0;
-			chip->badblock_pattern = &largepage_memorybased;
 		}
 	} else {
 		dev_err(priv->dev,
-- 
1.7.11.3
