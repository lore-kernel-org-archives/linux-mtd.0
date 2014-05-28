Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZbd-0008MG-MX
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:53:06 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so10699592pab.38
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 01:52:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: lpc32xx: drop bitflip_threshold initialization
Date: Wed, 28 May 2014 01:52:25 -0700
Message-Id: <1401267145-18218-1-git-send-email-computersforpeace@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These drivers don't need to explicitly initialize their bitflip
thresholds. The comment is no longer correct, since nand_scan_tail()
performs this initialization as of the following commit:

    commit ea3b2ea24ef0f2ef9c6795b19cff456195b6728a
    Author: Shmulik Ladkani <shmulik@jungo.com>
    Date:   Fri Jun 8 18:29:06 2012 +0300

        mtd: nand: initialize bitflip_threshold prior to BBT scanning

(It seems there were some parallel efforts on writing/submitting these
drivers, and Shmulik's bug fix.)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>
---
Not tested

 drivers/mtd/nand/lpc32xx_mlc.c | 6 ------
 drivers/mtd/nand/lpc32xx_slc.c | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 687478c9f09c..7335346dc126 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -721,12 +721,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_chip->bbt_td = &lpc32xx_nand_bbt;
 	nand_chip->bbt_md = &lpc32xx_nand_bbt_mirror;
 
-	/* bitflip_threshold's default is defined as ecc_strength anyway.
-	 * Unfortunately, it is set only later at add_mtd_device(). Meanwhile
-	 * being 0, it causes bad block table scanning errors in
-	 * nand_scan_tail(), so preparing it here. */
-	mtd->bitflip_threshold = nand_chip->ecc.strength;
-
 	if (use_dma) {
 		res = lpc32xx_dma_setup(host);
 		if (res) {
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 53a6742e3da3..8caef28e0756 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -840,12 +840,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	chip->ecc.strength = 1;
 	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
-	/* bitflip_threshold's default is defined as ecc_strength anyway.
-	 * Unfortunately, it is set only later at add_mtd_device(). Meanwhile
-	 * being 0, it causes bad block table scanning errors in
-	 * nand_scan_tail(), so preparing it here already. */
-	mtd->bitflip_threshold = chip->ecc.strength;
-
 	/*
 	 * Allocate a large enough buffer for a single huge page plus
 	 * extra space for the spare area and ECC storage area
-- 
1.9.1
