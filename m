Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATG4-00023z-Lg
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:26:23 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: NAND ECC by chip rather than global
Date: Sat, 30 May 2009 18:41:30 +0100
Message-Id: <1243705298-21814-4-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-3-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
Cc: Andy Green <andy@warmcat.com>, Nelson Castillo <arhuaco@freaks-unidos.net>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andy Green <andy@warmcat.com>

This makes us take note about the chosen ECC mode per-chip and
not the one set globally.

Signed-off-by: Andy Green <andy@warmcat.com>
Signed-off-by: Nelson Castillo <arhuaco@freaks-unidos.net>
[ben-linux@fluff.org: andy@openmoko.com => andy@warmcat.com, rewrite subject]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |   34 +++++++++++++++++++++++++---------
 1 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index a2d1c70..daa4af9 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -819,6 +819,21 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 
 	if (set->disable_ecc)
 		chip->ecc.mode	= NAND_ECC_NONE;
+
+	switch (chip->ecc.mode) {
+	case NAND_ECC_NONE:
+		dev_info(info->device, "NAND ECC disabled\n");
+		break;
+	case NAND_ECC_SOFT:
+		dev_info(info->device, "NAND soft ECC\n");
+		break;
+	case NAND_ECC_HW:
+		dev_info(info->device, "NAND hardware ECC\n");
+		break;
+	default:
+		dev_info(info->device, "NAND ECC UNKNOWN\n");
+		break;
+	}
 }
 
 /**
@@ -840,18 +855,19 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 	dev_dbg(info->device, "chip %p => page shift %d\n",
 		chip, chip->page_shift);
 
-	if (hardware_ecc) {
+	if (chip->ecc.mode != NAND_ECC_HW)
+		return;
+
 		/* change the behaviour depending on wether we are using
 		 * the large or small page nand device */
 
-		if (chip->page_shift > 10) {
-			chip->ecc.size	    = 256;
-			chip->ecc.bytes	    = 3;
-		} else {
-			chip->ecc.size	    = 512;
-			chip->ecc.bytes	    = 3;
-			chip->ecc.layout    = &nand_hw_eccoob;
-		}
+	if (chip->page_shift > 10) {
+		chip->ecc.size	    = 256;
+		chip->ecc.bytes	    = 3;
+	} else {
+		chip->ecc.size	    = 512;
+		chip->ecc.bytes	    = 3;
+		chip->ecc.layout    = &nand_hw_eccoob;
 	}
 }
 
-- 
1.5.6.5
