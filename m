Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN7Xq-0004HL-CR
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 19:06:31 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/7] mtd: nand: fix incorrect ecc strength values
Date: Wed, 25 Apr 2012 12:06:06 -0700
Message-Id: <1335380771-27805-3-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
Cc: Scott Branden <sbranden@broadcom.com>, Mike Dunn <mikedunn@newsguy.com>,
 Jiandong Zheng <jdzheng@broadcom.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Lars-Peter Clausen <lars@metafoo.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a couple of ecc strength values for which I earlier made conservative
guesses, but whose correct values were later determined [1] (thanks Ivan).  Also
sets strength for fsl_ifc_nand, which was merged to mainline after the original
patch that set the strength for all drivers.

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040325.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---

This v2 is actually unchanged from the original set.

 drivers/mtd/nand/bcm_umi_nand.c |    7 +------
 drivers/mtd/nand/fsl_ifc_nand.c |    1 +
 drivers/mtd/nand/jz4740_nand.c  |    6 +-----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index 6908cdd..7134adf 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -476,12 +476,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 		this->badblock_pattern = &largepage_bbt;
 	}
 
-	/*
-	 * FIXME: ecc strength value of 6 bits per 512 bytes of data is a
-	 * conservative guess, given 13 ecc bytes and using bch alg.
-	 * (Assume Galois field order m=15 to allow a margin of error.)
-	 */
-	this->ecc.strength = 6;
+	this->ecc.strength = 8;
 
 #endif
 
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 5387cec..872cc96 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -821,6 +821,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	/* Hardware generates ECC per 512 Bytes */
 	chip->ecc.size = 512;
 	chip->ecc.bytes = 8;
+	chip->ecc.strength = 4;
 
 	switch (csor & CSOR_NAND_PGS_MASK) {
 	case CSOR_NAND_PGS_512:
diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index e4147e8..a6fa884 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -332,11 +332,7 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 	chip->ecc.mode		= NAND_ECC_HW_OOB_FIRST;
 	chip->ecc.size		= 512;
 	chip->ecc.bytes		= 9;
-	chip->ecc.strength	= 2;
-	/*
-	 * FIXME: ecc_strength value of 2 bits per 512 bytes of data is a
-	 * conservative guess, given 9 ecc bytes and reed-solomon alg.
-	 */
+	chip->ecc.strength	= 4;
 
 	if (pdata)
 		chip->ecc.layout = pdata->ecc_layout;
-- 
1.7.3.4
