Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cD5-0008Ci-Ml
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:30:47 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/19] mxc_nand: cleanup eccoob descriptions
Date: Wed, 21 Oct 2009 16:13:09 +0200
Message-Id: <1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The original Freescale driver used to have eccoob descriptions like
this:

static struct nand_ecclayout nand_hw_eccoob_8 = {
	.eccbytes = 5,
	.eccpos = {6, 7, 8, 9, 10},
	.oobfree = {{0, 5}, {11, 5}}
};

static struct nand_ecclayout nand_hw_eccoob_16 = {
	.eccbytes = 5,
	.eccpos = {6, 7, 8, 9, 10},
	.oobfree = {{0, 6}, {12, 4}}
};

The former was used for 8bit flashes and the latter for 16bit flashes.
They honored the fact that the bad block marker on 8bit flashes is on byte 5
while on 16bit flashes it is on byte 11.
In the Kernel driver this was copied wrong and we ended up with two identical
descriptions.

Change it so that we have only one description which leaves byte 5 and byte
11 unspecified so that it won't be used by others.

Also, rename the descriptions to nand_hw_eccoob_smallpage and
nand_hw_eccoob_largepage so that it can't be confused with Nand chip bus
widths (what actually happened in this driver)

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   24 +++++++++---------------
 1 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 76beea4..7a34679 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -129,19 +129,13 @@ struct mxc_nand_host {
 #define SPARE_SINGLEBIT_ERROR 0x1
 
 /* OOB placement block for use with hardware ecc generation */
-static struct nand_ecclayout nand_hw_eccoob_8 = {
+static struct nand_ecclayout nand_hw_eccoob_smallpage = {
 	.eccbytes = 5,
 	.eccpos = {6, 7, 8, 9, 10},
-	.oobfree = {{0, 5}, {11, 5}, }
+	.oobfree = {{0, 5}, {12, 4}, }
 };
 
-static struct nand_ecclayout nand_hw_eccoob_16 = {
-	.eccbytes = 5,
-	.eccpos = {6, 7, 8, 9, 10},
-	.oobfree = {{0, 5}, {11, 5}, }
-};
-
-static struct nand_ecclayout nand_hw_eccoob_64 = {
+static struct nand_ecclayout nand_hw_eccoob_largepage = {
 	.eccbytes = 20,
 	.eccpos = {6, 7, 8, 9, 10, 22, 23, 24, 25, 26,
 		   38, 39, 40, 41, 42, 54, 55, 56, 57, 58},
@@ -940,7 +934,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	} else {
 		this->ecc.size = 512;
 		this->ecc.bytes = 3;
-		this->ecc.layout = &nand_hw_eccoob_8;
+		this->ecc.layout = &nand_hw_eccoob_smallpage;
 		this->ecc.mode = NAND_ECC_SOFT;
 		tmp = readw(host->regs + NFC_CONFIG1);
 		tmp &= ~NFC_ECC_EN;
@@ -964,7 +958,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	/* NAND bus width determines access funtions used by upper layer */
 	if (pdata->width == 2) {
 		this->options |= NAND_BUSWIDTH_16;
-		this->ecc.layout = &nand_hw_eccoob_16;
+		this->ecc.layout = &nand_hw_eccoob_smallpage;
 	}
 
 	/* first scan to find the device and get the page size */
@@ -978,20 +972,20 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	if (this->ecc.mode == NAND_ECC_HW) {
 		switch (mtd->oobsize) {
 		case 8:
-			this->ecc.layout = &nand_hw_eccoob_8;
+			this->ecc.layout = &nand_hw_eccoob_smallpage;
 			break;
 		case 16:
-			this->ecc.layout = &nand_hw_eccoob_16;
+			this->ecc.layout = &nand_hw_eccoob_smallpage;
 			break;
 		case 64:
-			this->ecc.layout = &nand_hw_eccoob_64;
+			this->ecc.layout = &nand_hw_eccoob_largepage;
 			break;
 		default:
 			/* page size not handled by HW ECC */
 			/* switching back to soft ECC */
 			this->ecc.size = 512;
 			this->ecc.bytes = 3;
-			this->ecc.layout = &nand_hw_eccoob_8;
+			this->ecc.layout = &nand_hw_eccoob_smallpage;
 			this->ecc.mode = NAND_ECC_SOFT;
 			this->ecc.calculate = NULL;
 			this->ecc.correct = NULL;
-- 
1.6.5
