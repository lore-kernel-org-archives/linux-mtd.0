Received: from smtpauth00.csee.onr.siteprotect.com ([64.26.60.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M51NG-0002kc-0c
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 17:39:18 +0000
Message-ID: <4A0DA8B1.2060109@boundarydevices.com>
Date: Fri, 15 May 2009 10:38:57 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: richard.genoud@gmail.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: repost [Fwd: [PATCH 1/5] mtd: nand: move layout structure into
	nand_ecc_ctrl]
Content-Type: multipart/mixed; boundary="------------090103030509070207050307"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090103030509070207050307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090103030509070207050307
Content-Type: message/rfc822;
 name="[PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[PATCH 1/5] mtd: nand: move layout structure into nand_ecc_c";
 filename*1="trl.eml"

X-Account-Key: account2
X-Mozilla-Keys: 
Received: from mx05.mfg.onr.siteprotect.com (unknown [192.168.33.227])
	by mf30.mfg.onr.chicago.hostway (Postfix) with ESMTP id 1AC5FEA04A7
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:18 -0500 (CDT)
Received: from mpls-qmqp-03.inet.qwest.net (mpls-qmqp-03.inet.qwest.net [63.231.195.114])
	by mx05.mfg.onr.siteprotect.com (Postfix) with ESMTP id EE1DB55C06F
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from localhost (unknown [67.42.45.38])
	by mpls-qmqp-03.inet.qwest.net (Postfix) with ESMTP id 0FB46621C35;
	Thu, 14 May 2009 03:00:15 +0000 (UTC)
Received: by localhost (Postfix, from userid 1002)
	id 4DB44588190; Wed, 13 May 2009 20:00:09 -0700 (MST)
From: Troy Kisky <troy.kisky@boundarydevices.com>
To: linux-mtd@lists.infradead.org
Cc: david-b@pacbell.net, Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
Date: Wed, 13 May 2009 20:00:04 -0700
Message-Id: <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Mail-Filter-Gateway: Found to be Virus Free
X-Mail-Filter-Gateway-SpamDetectionEngine: NOT SPAM,
	MailFilterGateway Engine (Not Cached, Score=-1, Score Required 3,
	autolearn=disabled, CTASD_SPAM_UNKNOWN -1.00)
X-Mail-Filter-Gateway-From: tkisky@boundarydevices.com
X-Mail-Filter-Gateway-To: troy.kisky@boundarydevices.com
X-Spam-Status: No

This patch only replaces the layout pointer with
the actual structure. It is needed to allow the
oob_free entries to be calculated.

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
---
 drivers/mtd/nand/atmel_nand.c    |   19 +++++---
 drivers/mtd/nand/bf5xx_nand.c    |    5 +-
 drivers/mtd/nand/cafe_nand.c     |   10 +++--
 drivers/mtd/nand/diskonchip.c    |    6 +-
 drivers/mtd/nand/fsl_elbc_nand.c |   25 +++++-----
 drivers/mtd/nand/mxc_nand.c      |   13 +++--
 drivers/mtd/nand/nand_base.c     |   93 +++++++++++++++++++------------------
 drivers/mtd/nand/plat_nand.c     |    4 +-
 drivers/mtd/nand/pxa3xx_nand.c   |   10 +++--
 drivers/mtd/nand/rtc_from4.c     |    5 +-
 drivers/mtd/nand/s3c2410.c       |   10 +++--
 drivers/mtd/nand/sh_flctl.c      |   12 +++--
 drivers/mtd/nand/sharpsl.c       |    4 +-
 include/linux/mtd/nand.h         |    2 +-
 14 files changed, 120 insertions(+), 98 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 47a33ce..7b52637 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -60,7 +60,7 @@
  * the bytes have to be consecutives to avoid
  * several NAND_CMD_RNDOUT during read
  */
-static struct nand_ecclayout atmel_oobinfo_large = {
+static const struct nand_ecclayout atmel_oobinfo_large __initdata = {
 	.eccbytes = 4,
 	.eccpos = {60, 61, 62, 63},
 	.oobfree = {
@@ -73,7 +73,7 @@ static struct nand_ecclayout atmel_oobinfo_large = {
  * the bytes have to be consecutives to avoid
  * several NAND_CMD_RNDOUT during read
  */
-static struct nand_ecclayout atmel_oobinfo_small = {
+static const struct nand_ecclayout atmel_oobinfo_small __initdata = {
 	.eccbytes = 4,
 	.eccpos = {0, 1, 2, 3},
 	.oobfree = {
@@ -188,7 +188,6 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;
 
 	/* get the first 2 ECC bytes */
@@ -218,7 +217,7 @@ static int atmel_nand_read_page(struct mtd_info *mtd,
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 	uint8_t *p = buf;
 	uint8_t *oob = chip->oob_poi;
 	uint8_t *ecc_pos;
@@ -478,19 +477,23 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		/* set ECC page size and oob layout */
 		switch (mtd->writesize) {
 		case 512:
-			nand_chip->ecc.layout = &atmel_oobinfo_small;
+			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_small,
+					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_528);
 			break;
 		case 1024:
-			nand_chip->ecc.layout = &atmel_oobinfo_large;
+			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
+					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_1056);
 			break;
 		case 2048:
-			nand_chip->ecc.layout = &atmel_oobinfo_large;
+			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
+					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
 			break;
 		case 4096:
-			nand_chip->ecc.layout = &atmel_oobinfo_large;
+			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
+					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_4224);
 			break;
 		default:
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4c2a67c..fbdccb7 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -101,7 +101,7 @@ static struct nand_bbt_descr bootrom_bbt = {
 	.pattern = bbt_pattern,
 };
 
-static struct nand_ecclayout bootrom_ecclayout = {
+static const struct nand_ecclayout bootrom_ecclayout __devinitdata = {
 	.eccbytes = 24,
 	.eccpos = {
 		0x8 * 0, 0x8 * 0 + 1, 0x8 * 0 + 2,
@@ -753,7 +753,8 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	if (hardware_ecc) {
 #ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
 		chip->badblock_pattern = &bootrom_bbt;
-		chip->ecc.layout = &bootrom_ecclayout;
+		memcpy(&chip->ecc.layout, &bootrom_ecclayout,
+				sizeof(chip->ecc.layout));
 #endif
 
 		if (plat->page_size == NFC_PG_SIZE_256) {
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 29acd06..c6c7f51 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -456,7 +456,7 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static struct nand_ecclayout cafe_oobinfo_2048 = {
+static const struct nand_ecclayout cafe_oobinfo_2048 __devinitdata = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
 	.oobfree = {{14, 50}}
@@ -491,7 +491,7 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_2048 = {
 	.pattern = cafe_mirror_pattern_2048
 };
 
-static struct nand_ecclayout cafe_oobinfo_512 = {
+static const struct nand_ecclayout cafe_oobinfo_512 __devinitdata = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
 	.oobfree = {{14, 2}}
@@ -772,11 +772,13 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 
 	/* Set up ECC according to the type of chip we found */
 	if (mtd->writesize == 2048) {
-		cafe->nand.ecc.layout = &cafe_oobinfo_2048;
+		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_2048,
+				sizeof(cafe->nand.ecc.layout));
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
 	} else if (mtd->writesize == 512) {
-		cafe->nand.ecc.layout = &cafe_oobinfo_512;
+		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_512,
+				sizeof(cafe->nand.ecc.layout));
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
 	} else {
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index e51c1ed..ef04b7a 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -37,7 +37,7 @@
 #define CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS 0
 #endif
 
-static unsigned long __initdata doc_locations[] = {
+static const unsigned long doc_locations[] __initdata = {
 #if defined (__alpha__) || defined(__i386__) || defined(__x86_64__)
 #ifdef CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH
 	0xfffc8000, 0xfffca000, 0xfffcc000, 0xfffce000,
@@ -1049,7 +1049,7 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
  * safer.  The only problem with it is that any code that parses oobfree must
  * be able to handle out-of-order segments.
  */
-static struct nand_ecclayout doc200x_oobinfo = {
+static const struct nand_ecclayout doc200x_oobinfo __initdata = {
 	.eccbytes = 6,
 	.eccpos = {0, 1, 2, 3, 4, 5},
 	.oobfree = {{8, 8}, {6, 2}}
@@ -1651,7 +1651,7 @@ static int __init doc_probe(unsigned long physadr)
 	nand->ecc.calculate	= doc200x_calculate_ecc;
 	nand->ecc.correct	= doc200x_correct_data;
 
-	nand->ecc.layout	= &doc200x_oobinfo;
+	memcpy(&nand->ecc.layout, &doc200x_oobinfo, sizeof(nand->ecc.layout));
 	nand->ecc.mode		= NAND_ECC_HW_SYNDROME;
 	nand->ecc.size		= 512;
 	nand->ecc.bytes		= 6;
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1f6eb25..f05c97a 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -85,28 +85,28 @@ struct fsl_elbc_ctrl {
 /* These map to the positions used by the FCM hardware ECC generator */
 
 /* Small Page FLASH with FMR[ECCM] = 0 */
-static struct nand_ecclayout fsl_elbc_oob_sp_eccm0 = {
+static const struct nand_ecclayout fsl_elbc_oob_sp_eccm0 __devinitdata = {
 	.eccbytes = 3,
 	.eccpos = {6, 7, 8},
 	.oobfree = { {0, 5}, {9, 7} },
 };
 
 /* Small Page FLASH with FMR[ECCM] = 1 */
-static struct nand_ecclayout fsl_elbc_oob_sp_eccm1 = {
+static const struct nand_ecclayout fsl_elbc_oob_sp_eccm1 __devinitdata = {
 	.eccbytes = 3,
 	.eccpos = {8, 9, 10},
 	.oobfree = { {0, 5}, {6, 2}, {11, 5} },
 };
 
 /* Large Page FLASH with FMR[ECCM] = 0 */
-static struct nand_ecclayout fsl_elbc_oob_lp_eccm0 = {
+static const struct nand_ecclayout fsl_elbc_oob_lp_eccm0 __devinitdata = {
 	.eccbytes = 12,
 	.eccpos = {6, 7, 8, 22, 23, 24, 38, 39, 40, 54, 55, 56},
 	.oobfree = { {1, 5}, {9, 13}, {25, 13}, {41, 13}, {57, 7} },
 };
 
 /* Large Page FLASH with FMR[ECCM] = 1 */
-static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
+static const struct nand_ecclayout fsl_elbc_oob_lp_eccm1 __devinitdata = {
 	.eccbytes = 12,
 	.eccpos = {8, 9, 10, 24, 25, 26, 40, 41, 42, 56, 57, 58},
 	.oobfree = { {1, 7}, {11, 13}, {27, 13}, {43, 13}, {59, 5} },
@@ -655,7 +655,7 @@ static int fsl_elbc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return fsl_elbc_read_byte(mtd);
 }
 
-static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
+static int __devinit fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct fsl_elbc_mtd *priv = chip->priv;
@@ -700,8 +700,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	        chip->ecc.bytes);
 	dev_dbg(ctrl->dev, "fsl_elbc_init: nand->ecc.total = %d\n",
 	        chip->ecc.total);
-	dev_dbg(ctrl->dev, "fsl_elbc_init: nand->ecc.layout = %p\n",
-	        chip->ecc.layout);
 	dev_dbg(ctrl->dev, "fsl_elbc_init: mtd->flags = %08x\n", mtd->flags);
 	dev_dbg(ctrl->dev, "fsl_elbc_init: mtd->size = %lld\n", mtd->size);
 	dev_dbg(ctrl->dev, "fsl_elbc_init: mtd->erasesize = %d\n",
@@ -722,9 +720,9 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 		if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
 		    BR_DECC_CHK_GEN) {
 			chip->ecc.size = 512;
-			chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
-			                   &fsl_elbc_oob_lp_eccm1 :
-			                   &fsl_elbc_oob_lp_eccm0;
+			memcpy(&chip->ecc.layout, (priv->fmr & FMR_ECCM) ?
+				&fsl_elbc_oob_lp_eccm1 : &fsl_elbc_oob_lp_eccm0,
+				sizeof(chip->ecc.layout));
 			chip->badblock_pattern = &largepage_memorybased;
 		}
 	} else {
@@ -766,7 +764,7 @@ static void fsl_elbc_write_page(struct mtd_info *mtd,
 	ctrl->oob_poi = chip->oob_poi;
 }
 
-static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
+static int __devinit fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_elbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
@@ -809,8 +807,9 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	    BR_DECC_CHK_GEN) {
 		chip->ecc.mode = NAND_ECC_HW;
 		/* put in small page settings and adjust later if needed */
-		chip->ecc.layout = (priv->fmr & FMR_ECCM) ?
-				&fsl_elbc_oob_sp_eccm1 : &fsl_elbc_oob_sp_eccm0;
+		memcpy(&chip->ecc.layout, (priv->fmr & FMR_ECCM) ?
+				&fsl_elbc_oob_sp_eccm1 : &fsl_elbc_oob_sp_eccm0,
+				sizeof(chip->ecc.layout));
 		chip->ecc.size = 512;
 		chip->ecc.bytes = 3;
 	} else {
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index f3548d0..52efe81 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -129,13 +129,13 @@ struct mxc_nand_host {
 #define SPARE_SINGLEBIT_ERROR 0x1
 
 /* OOB placement block for use with hardware ecc generation */
-static struct nand_ecclayout nand_hw_eccoob_8 = {
+static const struct nand_ecclayout nand_hw_eccoob_8 __initdata = {
 	.eccbytes = 5,
 	.eccpos = {6, 7, 8, 9, 10},
 	.oobfree = {{0, 5}, {11, 5}, }
 };
 
-static struct nand_ecclayout nand_hw_eccoob_16 = {
+static const struct nand_ecclayout nand_hw_eccoob_16 __initdata = {
 	.eccbytes = 5,
 	.eccpos = {6, 7, 8, 9, 10},
 	.oobfree = {{0, 6}, {12, 4}, }
@@ -919,14 +919,16 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		this->ecc.mode = NAND_ECC_HW;
 		this->ecc.size = 512;
 		this->ecc.bytes = 3;
-		this->ecc.layout = &nand_hw_eccoob_8;
+		memcpy(&this->ecc.layout, &nand_hw_eccoob_8,
+				sizeof(this->ecc.layout));
 		tmp = readw(host->regs + NFC_CONFIG1);
 		tmp |= NFC_ECC_EN;
 		writew(tmp, host->regs + NFC_CONFIG1);
 	} else {
 		this->ecc.size = 512;
 		this->ecc.bytes = 3;
-		this->ecc.layout = &nand_hw_eccoob_8;
+		memcpy(&this->ecc.layout, &nand_hw_eccoob_8,
+				sizeof(this->ecc.layout));
 		this->ecc.mode = NAND_ECC_SOFT;
 		tmp = readw(host->regs + NFC_CONFIG1);
 		tmp &= ~NFC_ECC_EN;
@@ -950,7 +952,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	/* NAND bus width determines access funtions used by upper layer */
 	if (pdata->width == 2) {
 		this->options |= NAND_BUSWIDTH_16;
-		this->ecc.layout = &nand_hw_eccoob_16;
+		memcpy(&this->ecc.layout, &nand_hw_eccoob_16,
+				sizeof(this->ecc.layout));
 	}
 
 	host->pagesize_2k = 0;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3d7ed43..2780a9b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -829,7 +829,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 
 	chip->ecc.read_page_raw(mtd, chip, buf);
 
@@ -865,7 +865,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
 {
 	int start_step, end_step, num_steps;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 	uint8_t *p;
 	int data_col_addr, i, gaps = 0;
 	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
@@ -952,7 +952,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
@@ -1051,7 +1051,7 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 		return oob + len;
 
 	case MTD_OOB_AUTO: {
-		struct nand_oobfree *free = chip->ecc.layout->oobfree;
+		struct nand_oobfree *free = chip->ecc.layout.oobfree;
 		uint32_t boffs = 0, roffs = ops->ooboffs;
 		size_t bytes = 0;
 
@@ -1152,7 +1152,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				/* Raw mode does data:oob:data:oob */
 				if (ops->mode != MTD_OOB_RAW) {
 					int toread = min(oobreadlen,
-						chip->ecc.layout->oobavail);
+						chip->ecc.layout.oobavail);
 					if (toread) {
 						oob = nand_transfer_oob(chip,
 							oob, ops, toread);
@@ -1417,7 +1417,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	      (unsigned long long)from, readlen);
 
 	if (ops->mode == MTD_OOB_AUTO)
-		len = chip->ecc.layout->oobavail;
+		len = chip->ecc.layout.oobavail;
 	else
 		len = mtd->oobsize;
 
@@ -1601,7 +1601,7 @@ static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 
 	/* Software ecc calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -1627,7 +1627,7 @@ static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint32_t *eccpos = chip->ecc.layout.eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
@@ -1760,7 +1760,7 @@ static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob,
 		return oob + len;
 
 	case MTD_OOB_AUTO: {
-		struct nand_oobfree *free = chip->ecc.layout->oobfree;
+		struct nand_oobfree *free = chip->ecc.layout.oobfree;
 		uint32_t boffs = 0, woffs = ops->ooboffs;
 		size_t bytes = 0;
 
@@ -1948,7 +1948,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	      (unsigned int)to, (int)ops->ooblen);
 
 	if (ops->mode == MTD_OOB_AUTO)
-		len = chip->ecc.layout->oobavail;
+		len = chip->ecc.layout.oobavail;
 	else
 		len = mtd->oobsize;
 
@@ -2638,30 +2638,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Set the internal oob buffer location, just after the page data */
 	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
 
-	/*
-	 * If no default placement scheme is given, select an appropriate one
-	 */
-	if (!chip->ecc.layout) {
-		switch (mtd->oobsize) {
-		case 8:
-			chip->ecc.layout = &nand_oob_8;
-			break;
-		case 16:
-			chip->ecc.layout = &nand_oob_16;
-			break;
-		case 64:
-			chip->ecc.layout = &nand_oob_64;
-			break;
-		case 128:
-			chip->ecc.layout = &nand_oob_128;
-			break;
-		default:
-			printk(KERN_WARNING "No oob scheme defined for "
-			       "oobsize %d\n", mtd->oobsize);
-			BUG();
-		}
-	}
-
 	if (!chip->write_page)
 		chip->write_page = nand_write_page;
 
@@ -2752,16 +2728,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 
 	/*
-	 * The number of bytes available for a client to place data into
-	 * the out of band area
-	 */
-	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
-		chip->ecc.layout->oobavail +=
-			chip->ecc.layout->oobfree[i].length;
-	mtd->oobavail = chip->ecc.layout->oobavail;
-
-	/*
 	 * Set the number of read / write steps for one page depending on ECC
 	 * mode
 	 */
@@ -2773,6 +2739,43 @@ int nand_scan_tail(struct mtd_info *mtd)
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
 
 	/*
+	 * If no default placement scheme is given, select an appropriate one
+	 */
+	if (!chip->ecc.layout.eccbytes) {
+		const struct nand_ecclayout *layout = NULL;
+		switch (mtd->oobsize) {
+		case 8:
+			layout = &nand_oob_8;
+			break;
+		case 16:
+			layout = &nand_oob_16;
+			break;
+		case 64:
+			layout = &nand_oob_64;
+			break;
+		case 128:
+			layout = &nand_oob_128;
+			break;
+		default:
+			printk(KERN_WARNING "No oob scheme defined for "
+			       "oobsize %d\n", mtd->oobsize);
+			BUG();
+		}
+		if (layout)
+			memcpy(&chip->ecc.layout, layout, sizeof(*layout));
+	}
+
+	/*
+	 * The number of bytes available for a client to place data into
+	 * the out of band area
+	 */
+	chip->ecc.layout.oobavail = 0;
+	for (i = 0; chip->ecc.layout.oobfree[i].length; i++)
+		chip->ecc.layout.oobavail +=
+			chip->ecc.layout.oobfree[i].length;
+	mtd->oobavail = chip->ecc.layout.oobavail;
+
+	/*
 	 * Allow subpage writes up to ecc.steps. Not possible for MLC
 	 * FLASH.
 	 */
@@ -2819,7 +2822,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->block_markbad = nand_block_markbad;
 
 	/* propagate ecc.layout to mtd_info */
-	mtd->ecclayout = chip->ecc.layout;
+	mtd->ecclayout = &chip->ecc.layout;
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 86e1d08..53cd39f 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -65,7 +65,9 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	data->chip.options |= pdata->chip.options;
 
 	data->chip.ecc.hwctl = pdata->ctrl.hwcontrol;
-	data->chip.ecc.layout = pdata->chip.ecclayout;
+	if (pdata->chip.ecclayout)
+		memcpy(&data->chip.ecc.layout, pdata->chip.ecclayout,
+				sizeof(data->chip.ecc.layout));
 	data->chip.ecc.mode = NAND_ECC_SOFT;
 
 	platform_set_drvdata(pdev, data);
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 30a8ce6..56b9715 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1104,13 +1104,13 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 	return 0;
 }
 
-static struct nand_ecclayout hw_smallpage_ecclayout = {
+static const struct nand_ecclayout hw_smallpage_ecclayout = {
 	.eccbytes = 6,
 	.eccpos = {8, 9, 10, 11, 12, 13 },
 	.oobfree = { {2, 6} }
 };
 
-static struct nand_ecclayout hw_largepage_ecclayout = {
+static const struct nand_ecclayout hw_largepage_ecclayout = {
 	.eccbytes = 24,
 	.eccpos = {
 		40, 41, 42, 43, 44, 45, 46, 47,
@@ -1144,9 +1144,11 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
 	this->ecc.size		= f->page_size;
 
 	if (f->page_size == 2048)
-		this->ecc.layout = &hw_largepage_ecclayout;
+		memcpy(&this->ecc.layout, &hw_largepage_ecclayout,
+				sizeof(this->ecc.layout));
 	else
-		this->ecc.layout = &hw_smallpage_ecclayout;
+		memcpy(&this->ecc.layout, &hw_smallpage_ecclayout,
+				sizeof(this->ecc.layout));
 
 	this->chip_delay = 25;
 }
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index a033c4c..5a1d272 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -141,7 +141,7 @@ static struct rs_control *rs_decoder;
 /*
  *      hardware specific Out Of Band information
  */
-static struct nand_ecclayout rtc_from4_nand_oobinfo = {
+static const struct nand_ecclayout rtc_from4_nand_oobinfo __initdata = {
 	.eccbytes = 32,
 	.eccpos = {
 		   0, 1, 2, 3, 4, 5, 6, 7,
@@ -532,7 +532,8 @@ static int __init rtc_from4_init(void)
 	/* return the status of extra status and ECC checks */
 	this->errstat = rtc_from4_errstat;
 	/* set the nand_oobinfo to support FPGA H/W error detection */
-	this->ecc.layout = &rtc_from4_nand_oobinfo;
+	memcpy(&this->ecc.layout, &rtc_from4_nand_oobinfo,
+			sizeof(this->ecc.layout));
 	this->ecc.hwctl = rtc_from4_enable_hwecc;
 	this->ecc.calculate = rtc_from4_calculate_ecc;
 	this->ecc.correct = rtc_from4_correct_data;
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 8e375d5..13f9b61 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -64,7 +64,7 @@ static const int clock_stop = 0;
 /* new oob placement block for use with hardware ecc generation
  */
 
-static struct nand_ecclayout nand_hw_eccoob = {
+static const struct nand_ecclayout nand_hw_eccoob = {
 	.eccbytes = 3,
 	.eccpos = {0, 1, 2},
 	.oobfree = {{8, 8}}
@@ -752,8 +752,9 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
 		chip->ecc.mode	    = NAND_ECC_SOFT;
 	}
 
-	if (set->ecc_layout != NULL)
-		chip->ecc.layout = set->ecc_layout;
+	if (set->ecc_layout)
+		memcpy(&chip->ecc.layout, set->ecc_layout,
+				sizeof(chip->ecc.layout));
 
 	if (set->disable_ecc)
 		chip->ecc.mode	= NAND_ECC_NONE;
@@ -783,7 +784,8 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 		} else {
 			chip->ecc.size	    = 512;
 			chip->ecc.bytes	    = 3;
-			chip->ecc.layout    = &nand_hw_eccoob;
+			memcpy(&chip->ecc.layout, &nand_hw_eccoob,
+					sizeof(chip->ecc.layout));
 		}
 	}
 }
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 2bc8966..a9d92fd 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -32,7 +32,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sh_flctl.h>
 
-static struct nand_ecclayout flctl_4secc_oob_16 = {
+static const struct nand_ecclayout flctl_4secc_oob_16 __initdata = {
 	.eccbytes = 10,
 	.eccpos = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 	.oobfree = {
@@ -40,7 +40,7 @@ static struct nand_ecclayout flctl_4secc_oob_16 = {
 		. length = 4} },
 };
 
-static struct nand_ecclayout flctl_4secc_oob_64 = {
+static const struct nand_ecclayout flctl_4secc_oob_64 __initdata = {
 	.eccbytes = 10,
 	.eccpos = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57},
 	.oobfree = {
@@ -709,7 +709,7 @@ static void flctl_register_init(struct sh_flctl *flctl, unsigned long val)
 	writel(val, FLCMNCR(flctl));
 }
 
-static int flctl_chip_init_tail(struct mtd_info *mtd)
+static int __init flctl_chip_init_tail(struct mtd_info *mtd)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
 	struct nand_chip *chip = &flctl->chip;
@@ -746,10 +746,12 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
 
 	if (flctl->hwecc) {
 		if (mtd->writesize == 512) {
-			chip->ecc.layout = &flctl_4secc_oob_16;
+			memcpy(&chip->ecc.layout, &flctl_4secc_oob_16,
+					sizeof(chip->ecc.layout));
 			chip->badblock_pattern = &flctl_4secc_smallpage;
 		} else {
-			chip->ecc.layout = &flctl_4secc_oob_64;
+			memcpy(&chip->ecc.layout = &flctl_4secc_oob_64,
+					sizeof(chip->ecc.layout));
 			chip->badblock_pattern = &flctl_4secc_largepage;
 		}
 
diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 54ec754..65995a7 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -176,7 +176,9 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	this->ecc.size = 256;
 	this->ecc.bytes = 3;
 	this->badblock_pattern = data->badblock_pattern;
-	this->ecc.layout = data->ecc_layout;
+	if (data->ecc_layout)
+		memcpy(&this->ecc.layout, data->ecc_layout,
+				sizeof(this->ecc.layout));
 	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	this->ecc.calculate = sharpsl_nand_calculate_ecc;
 	this->ecc.correct = nand_correct_data;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7efb9be..a315fcb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -261,7 +261,7 @@ struct nand_ecc_ctrl {
 	int			total;
 	int			prepad;
 	int			postpad;
-	struct nand_ecclayout	*layout;
+	struct nand_ecclayout	layout;
 	void			(*hwctl)(struct mtd_info *mtd, int mode);
 	int			(*calculate)(struct mtd_info *mtd,
 					     const uint8_t *dat,
-- 
1.5.4.3



--------------090103030509070207050307
Content-Type: message/rfc822;
 name="[PATCH 2/5] mtd: nand: Calculate better default ecc layout.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[PATCH 2/5] mtd: nand: Calculate better default ecc layout.e";
 filename*1="ml"

X-Account-Key: account2
X-Mozilla-Keys: 
Received: from mx04.mfg.onr.siteprotect.com (unknown [192.168.33.225])
	by mf29.mfg.onr.chicago.hostway (Postfix) with ESMTP id C5EFD12001E
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from mpls-qmqp-05.inet.qwest.net (mpls-qmqp-05.inet.qwest.net [63.231.195.116])
	by mx04.mfg.onr.siteprotect.com (Postfix) with ESMTP id ADCE420B4068
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from localhost (unknown [67.42.45.38])
	by mpls-qmqp-05.inet.qwest.net (Postfix) with ESMTP id 112516278AA;
	Thu, 14 May 2009 03:00:15 +0000 (UTC)
Received: by localhost (Postfix, from userid 1002)
	id 6BD3E588192; Wed, 13 May 2009 20:00:09 -0700 (MST)
From: Troy Kisky <troy.kisky@boundarydevices.com>
To: linux-mtd@lists.infradead.org
Cc: david-b@pacbell.net, Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 2/5] mtd: nand: Calculate better default ecc layout
Date: Wed, 13 May 2009 20:00:05 -0700
Message-Id: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
References: <>
 <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
Mail-Filter-Gateway: Found to be Virus Free
X-Mail-Filter-Gateway-SpamDetectionEngine: NOT SPAM,
	MailFilterGateway Engine (Not Cached, Score=-1, Score Required 3,
	autolearn=disabled, CTASD_SPAM_UNKNOWN -1.00)
X-Mail-Filter-Gateway-From: tkisky@boundarydevices.com
X-Mail-Filter-Gateway-To: troy.kisky@boundarydevices.com
X-Spam-Status: No

This saves lines of code by having nand_base
calculate oob_free entries.

Boards that don't specify a layout and don't
use all ecc bytes in the current default layout
could have their ecc position changed.

Looking through the code, I can only see that
Davinci is effected this way. It has its ecc
bytes moved to the end of the oob data, which
is why I want this patch. Before, it was wasting
a lot of oob bytes.

Some boards will print warning messages. i.e.
mxc_nand which specifies ecc.bytes = 3, but
eccbytes = 5 (not a multiple of 3).

I may have missed other boards being affected
so it needs through testing.

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
---
 drivers/mtd/nand/nand_base.c |  186 ++++++++++++++++++++++++++----------------
 1 files changed, 114 insertions(+), 72 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2780a9b..6505d87 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -52,50 +52,6 @@
 #include <linux/mtd/partitions.h>
 #endif
 
-/* Define default oob placement schemes for large and small page devices */
-static struct nand_ecclayout nand_oob_8 = {
-	.eccbytes = 3,
-	.eccpos = {0, 1, 2},
-	.oobfree = {
-		{.offset = 3,
-		 .length = 2},
-		{.offset = 6,
-		 .length = 2}}
-};
-
-static struct nand_ecclayout nand_oob_16 = {
-	.eccbytes = 6,
-	.eccpos = {0, 1, 2, 3, 6, 7},
-	.oobfree = {
-		{.offset = 8,
-		 . length = 8}}
-};
-
-static struct nand_ecclayout nand_oob_64 = {
-	.eccbytes = 24,
-	.eccpos = {
-		   40, 41, 42, 43, 44, 45, 46, 47,
-		   48, 49, 50, 51, 52, 53, 54, 55,
-		   56, 57, 58, 59, 60, 61, 62, 63},
-	.oobfree = {
-		{.offset = 2,
-		 .length = 38}}
-};
-
-static struct nand_ecclayout nand_oob_128 = {
-	.eccbytes = 48,
-	.eccpos = {
-		   80, 81, 82, 83, 84, 85, 86, 87,
-		   88, 89, 90, 91, 92, 93, 94, 95,
-		   96, 97, 98, 99, 100, 101, 102, 103,
-		   104, 105, 106, 107, 108, 109, 110, 111,
-		   112, 113, 114, 115, 116, 117, 118, 119,
-		   120, 121, 122, 123, 124, 125, 126, 127},
-	.oobfree = {
-		{.offset = 2,
-		 .length = 78}}
-};
-
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 			   int new_state);
 
@@ -2627,7 +2583,10 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips)
  */
 int nand_scan_tail(struct mtd_info *mtd)
 {
-	int i;
+	int i, len, bit, next_bit;
+	int bad_block_marker_offset;
+	int bad_block_marker_length;
+	DECLARE_BITMAP(in_use, 256);
 	struct nand_chip *chip = mtd->priv;
 
 	if (!(chip->options & NAND_OWN_BUFFERS))
@@ -2737,42 +2696,125 @@ int nand_scan_tail(struct mtd_info *mtd)
 		BUG();
 	}
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
+	pr_info("%s ecc.total = %d, ecc.steps = %d, ecc.bytes = %d, "
+		"ecc.size = %d, writesize = %d\n",
+		__func__, chip->ecc.total, chip->ecc.steps, chip->ecc.bytes,
+		chip->ecc.size, mtd->writesize);
+try_again:
+	bad_block_marker_offset = 0;
+	bad_block_marker_length = 2;
+	if (mtd->oobsize == 8) {
+		bad_block_marker_offset = 5;
+		bad_block_marker_length = 1;
+	} else if (mtd->oobsize == 16) {
+		bad_block_marker_offset = 4;	/* length still 2 */
+	}
+	if (chip->bbt_td) {
+		bad_block_marker_offset = chip->bbt_td->offs;
+		bad_block_marker_length = chip->bbt_td->len;
+	}
+	if (chip->badblock_pattern) {
+		bad_block_marker_offset = chip->badblock_pattern->offs;
+		bad_block_marker_length = chip->badblock_pattern->len;
+	}
+	memset(in_use, 0, 256/8);
+	while (bad_block_marker_length--)
+		__set_bit(bad_block_marker_offset++, in_use);
 
 	/*
-	 * If no default placement scheme is given, select an appropriate one
+	 * The number of bytes available for a client to place data into
+	 * the out of band area
 	 */
-	if (!chip->ecc.layout.eccbytes) {
-		const struct nand_ecclayout *layout = NULL;
-		switch (mtd->oobsize) {
-		case 8:
-			layout = &nand_oob_8;
-			break;
-		case 16:
-			layout = &nand_oob_16;
-			break;
-		case 64:
-			layout = &nand_oob_64;
-			break;
-		case 128:
-			layout = &nand_oob_128;
+	chip->ecc.layout.oobavail = 0;
+	i = 0;
+	do {
+		len = chip->ecc.layout.oobfree[i].length;
+		if (!len)
 			break;
-		default:
-			printk(KERN_WARNING "No oob scheme defined for "
-			       "oobsize %d\n", mtd->oobsize);
-			BUG();
+		bit = chip->ecc.layout.oobfree[i].offset;
+		if (bit + len > mtd->oobsize) {
+			pr_warning("oob byte(%d) >= oobsize(%d)\n",
+					bit + len - 1, mtd->oobsize);
+			len = mtd->oobsize - bit;
+			if (len < 0)
+				len = 0;
+			chip->ecc.layout.oobfree[i].length = len;
+			if (!len)
+				break;
 		}
-		if (layout)
-			memcpy(&chip->ecc.layout, layout, sizeof(*layout));
-	}
+		chip->ecc.layout.oobavail += len;
+		while (len) {
+			if (test_and_set_bit(bit, in_use))
+				pr_warning("free oob byte(%d) in use\n", bit);
+			bit++;
+			len--;
+		}
+		i++;
+	} while (i < MTD_MAX_OOBFREE_ENTRIES);
 
 	/*
-	 * The number of bytes available for a client to place data into
-	 * the out of band area
+	 * If no ecc placement scheme is given, select an appropriate one
 	 */
-	chip->ecc.layout.oobavail = 0;
-	for (i = 0; chip->ecc.layout.oobfree[i].length; i++)
+	if (chip->ecc.layout.eccbytes >= chip->ecc.total) {
+		int j = 0;
+		if (chip->ecc.layout.eccbytes > chip->ecc.total)
+			pr_warning("%s: layout.eccbytes(%d) > ecc.total(%d),"
+				" some oob space will be wasted\n", __func__,
+				chip->ecc.layout.eccbytes, chip->ecc.total);
+		for (len = chip->ecc.layout.eccbytes; len; len--) {
+			bit = chip->ecc.layout.eccpos[j++];
+			if (bit >= mtd->oobsize) {
+				pr_warning("%s: eccpos(%d) too big, "
+						"defaulting\n", __func__, bit);
+				chip->ecc.layout.eccbytes = 0;
+				goto try_again;
+			} else if (test_and_set_bit(bit, in_use))
+				pr_warning("%s: eccpos(%d) in use\n", __func__,
+					bit);
+		}
+	} else {
+		int j = 0;
+		if (chip->ecc.layout.eccbytes)
+			pr_warning("%s: layout.eccbytes(%d) < ecc.total(%d),"
+				" eccpos will default\n", __func__,
+				chip->ecc.layout.eccbytes, chip->ecc.total);
+		bit = 0;
+		bit = find_next_zero_bit(in_use, mtd->oobsize, bit);
+		if (bit)
+			bit = mtd->oobsize - chip->ecc.total;
+		while (j < chip->ecc.total) {
+			bit = find_next_zero_bit(in_use, mtd->oobsize, bit);
+			if (bit == mtd->oobsize) {
+				bit = find_next_zero_bit(in_use, mtd->oobsize,
+						0);
+				if (bit == mtd->oobsize) {
+					pr_warning("%s: oobfull\n", __func__);
+					break;
+				}
+			}
+			__set_bit(bit, in_use);
+			chip->ecc.layout.eccpos[j++] = bit++;
+		}
+		chip->ecc.layout.eccbytes = j;
+	}
+
+	next_bit = 0;
+	while (i < MTD_MAX_OOBFREE_ENTRIES) {
+		bit = find_next_zero_bit(in_use, mtd->oobsize, next_bit);
+		if (bit == mtd->oobsize)
+			break;
+		next_bit = find_next_bit(in_use, mtd->oobsize, bit);
+		pr_info("%s oobfree[%d].offset=%d, .length=%d\n", __func__, i,
+				bit, next_bit - bit);
+		chip->ecc.layout.oobfree[i].offset = bit;
 		chip->ecc.layout.oobavail +=
-			chip->ecc.layout.oobfree[i].length;
+			chip->ecc.layout.oobfree[i++].length = next_bit - bit;
+	}
+
+	if (i < MTD_MAX_OOBFREE_ENTRIES) {
+		chip->ecc.layout.oobfree[i].offset = 0;
+		chip->ecc.layout.oobfree[i].length = 0;
+	}
 	mtd->oobavail = chip->ecc.layout.oobavail;
 
 	/*
-- 
1.5.4.3



--------------090103030509070207050307
Content-Type: message/rfc822;
 name="[PATCH 3/5] mtd: nand: atmel: use default ecc layout.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[PATCH 3/5] mtd: nand: atmel: use default ecc layout.eml"

X-Account-Key: account2
X-Mozilla-Keys: 
Received: from mx05.mfg.onr.siteprotect.com (unknown [192.168.33.227])
	by mf26.mfg.onr.chicago.hostway (Postfix) with ESMTP id 8C063EFC5D4
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from mpls-qmqp-04.inet.qwest.net (mpls-qmqp-04.inet.qwest.net [63.231.195.115])
	by mx05.mfg.onr.siteprotect.com (Postfix) with ESMTP id 8495655C078
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from localhost (unknown [67.42.45.38])
	by mpls-qmqp-04.inet.qwest.net (Postfix) with ESMTP id 117B622DC99;
	Thu, 14 May 2009 03:00:15 +0000 (UTC)
Received: by localhost (Postfix, from userid 1002)
	id 81976588165; Wed, 13 May 2009 20:00:09 -0700 (MST)
From: Troy Kisky <troy.kisky@boundarydevices.com>
To: linux-mtd@lists.infradead.org
Cc: david-b@pacbell.net, Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
Date: Wed, 13 May 2009 20:00:06 -0700
Message-Id: <1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
References: <>
 <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
Mail-Filter-Gateway: Found to be Virus Free
X-Mail-Filter-Gateway-SpamDetectionEngine: NOT SPAM,
	MailFilterGateway Engine (Not Cached, Score=-1, Score Required 3,
	autolearn=disabled, CTASD_SPAM_UNKNOWN -1.00)
X-Mail-Filter-Gateway-From: tkisky@boundarydevices.com
X-Mail-Filter-Gateway-To: troy.kisky@boundarydevices.com
X-Spam-Status: No

atmel should not need to override default

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
---
 drivers/mtd/nand/atmel_nand.c |   34 ----------------------------------
 1 files changed, 0 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7b52637..8537e86 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -55,32 +55,6 @@
 
 #include "atmel_nand_ecc.h"	/* Hardware ECC registers */
 
-/* oob layout for large page size
- * bad block info is on bytes 0 and 1
- * the bytes have to be consecutives to avoid
- * several NAND_CMD_RNDOUT during read
- */
-static const struct nand_ecclayout atmel_oobinfo_large __initdata = {
-	.eccbytes = 4,
-	.eccpos = {60, 61, 62, 63},
-	.oobfree = {
-		{2, 58}
-	},
-};
-
-/* oob layout for small page size
- * bad block info is on bytes 4 and 5
- * the bytes have to be consecutives to avoid
- * several NAND_CMD_RNDOUT during read
- */
-static const struct nand_ecclayout atmel_oobinfo_small __initdata = {
-	.eccbytes = 4,
-	.eccpos = {0, 1, 2, 3},
-	.oobfree = {
-		{6, 10}
-	},
-};
-
 struct atmel_nand_host {
 	struct nand_chip	nand_chip;
 	struct mtd_info		mtd;
@@ -477,23 +451,15 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		/* set ECC page size and oob layout */
 		switch (mtd->writesize) {
 		case 512:
-			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_small,
-					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_528);
 			break;
 		case 1024:
-			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
-					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_1056);
 			break;
 		case 2048:
-			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
-					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
 			break;
 		case 4096:
-			memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
-					sizeof(nand_chip->ecc.layout));
 			ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_4224);
 			break;
 		default:
-- 
1.5.4.3



--------------090103030509070207050307
Content-Type: message/rfc822;
 name="[PATCH 4/5] mtd: nand: cafe_nand: use default ecc layout.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[PATCH 4/5] mtd: nand: cafe_nand: use default ecc layout.eml"

X-Account-Key: account2
X-Mozilla-Keys: 
Received: from mx05.mfg.onr.siteprotect.com (unknown [192.168.33.227])
	by mf30.mfg.onr.chicago.hostway (Postfix) with ESMTP id B985FEA04A4
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from mpls-qmqp-03.inet.qwest.net (mpls-qmqp-03.inet.qwest.net [63.231.195.114])
	by mx05.mfg.onr.siteprotect.com (Postfix) with ESMTP id 9C3D055C07F
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from localhost (unknown [67.42.45.38])
	by mpls-qmqp-03.inet.qwest.net (Postfix) with ESMTP id 14C72621C6C;
	Thu, 14 May 2009 03:00:15 +0000 (UTC)
Received: by localhost (Postfix, from userid 1002)
	id 9EF43588191; Wed, 13 May 2009 20:00:09 -0700 (MST)
From: Troy Kisky <troy.kisky@boundarydevices.com>
To: linux-mtd@lists.infradead.org
Cc: david-b@pacbell.net, Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 4/5] mtd: nand: cafe_nand: use default ecc layout
Date: Wed, 13 May 2009 20:00:07 -0700
Message-Id: <1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
References: <>
 <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
Mail-Filter-Gateway: Found to be Virus Free
X-Mail-Filter-Gateway-SpamDetectionEngine: NOT SPAM,
	MailFilterGateway Engine (Not Cached, Score=-1, Score Required 3,
	autolearn=disabled, CTASD_SPAM_UNKNOWN -1.00)
X-Mail-Filter-Gateway-From: tkisky@boundarydevices.com
X-Mail-Filter-Gateway-To: troy.kisky@boundarydevices.com
X-Spam-Status: No

The bad block marker is at 14, but oobfree also
starts at 14. This doesn't make sense to me,
so I don't know if this patch is good or not.

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
---
 drivers/mtd/nand/cafe_nand.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index c6c7f51..6048bd9 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -456,12 +456,6 @@ static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static const struct nand_ecclayout cafe_oobinfo_2048 __devinitdata = {
-	.eccbytes = 14,
-	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
-	.oobfree = {{14, 50}}
-};
-
 /* Ick. The BBT code really ought to be able to work this bit out
    for itself from the above, at least for the 2KiB case */
 static uint8_t cafe_bbt_pattern_2048[] = { 'B', 'b', 't', '0' };
@@ -491,12 +485,6 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_2048 = {
 	.pattern = cafe_mirror_pattern_2048
 };
 
-static const struct nand_ecclayout cafe_oobinfo_512 __devinitdata = {
-	.eccbytes = 14,
-	.eccpos = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
-	.oobfree = {{14, 2}}
-};
-
 static struct nand_bbt_descr cafe_bbt_main_descr_512 = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
 		| NAND_BBT_2BIT | NAND_BBT_VERSION,
@@ -772,13 +760,9 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 
 	/* Set up ECC according to the type of chip we found */
 	if (mtd->writesize == 2048) {
-		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_2048,
-				sizeof(cafe->nand.ecc.layout));
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
 	} else if (mtd->writesize == 512) {
-		memcpy(&cafe->nand.ecc.layout, &cafe_oobinfo_512,
-				sizeof(cafe->nand.ecc.layout));
 		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
 		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
 	} else {
-- 
1.5.4.3



--------------090103030509070207050307
Content-Type: message/rfc822;
 name="[PATCH 5/5] mtd: nand: rtc_from4: use default ecc layout.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[PATCH 5/5] mtd: nand: rtc_from4: use default ecc layout.eml"

X-Account-Key: account2
X-Mozilla-Keys: 
Received: from mx05.mfg.onr.siteprotect.com (unknown [192.168.33.227])
	by mf29.mfg.onr.chicago.hostway (Postfix) with ESMTP id 9B85D120136
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from mpls-qmqp-01.inet.qwest.net (mpls-qmqp-01.inet.qwest.net [63.231.195.112])
	by mx05.mfg.onr.siteprotect.com (Postfix) with ESMTP id 90D6255C078
	for <troy.kisky@boundarydevices.com>; Wed, 13 May 2009 22:00:17 -0500 (CDT)
Received: from localhost (unknown [67.42.45.38])
	by mpls-qmqp-01.inet.qwest.net (Postfix) with ESMTP id 170C41A9882;
	Thu, 14 May 2009 03:00:15 +0000 (UTC)
Received: by localhost (Postfix, from userid 1002)
	id 9FF5E588059; Wed, 13 May 2009 20:00:09 -0700 (MST)
From: Troy Kisky <troy.kisky@boundarydevices.com>
To: linux-mtd@lists.infradead.org
Cc: david-b@pacbell.net, Troy Kisky <troy.kisky@boundarydevices.com>
Subject: [PATCH 5/5] mtd: nand: rtc_from4: use default ecc layout
Date: Wed, 13 May 2009 20:00:08 -0700
Message-Id: <1242270008-1552-5-git-send-email-troy.kisky@boundarydevices.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
References: <>
 <1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
 <1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
Mail-Filter-Gateway: Found to be Virus Free
X-Mail-Filter-Gateway-SpamDetectionEngine: NOT SPAM,
	MailFilterGateway Engine (Not Cached, Score=-1, Score Required 3,
	autolearn=disabled, CTASD_SPAM_UNKNOWN -1.00)
X-Mail-Filter-Gateway-From: tkisky@boundarydevices.com
X-Mail-Filter-Gateway-To: troy.kisky@boundarydevices.com
X-Spam-Status: No

The bad block marker is at offset 40, and is currently
part of the free space. This will remove it from the free
space.

Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
---
 drivers/mtd/nand/rtc_from4.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 5a1d272..2d3cbf3 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -138,19 +138,6 @@ static struct nand_bbt_descr rtc_from4_bbt_mirror_descr = {
 /* the Reed Solomon control structure */
 static struct rs_control *rs_decoder;
 
-/*
- *      hardware specific Out Of Band information
- */
-static const struct nand_ecclayout rtc_from4_nand_oobinfo __initdata = {
-	.eccbytes = 32,
-	.eccpos = {
-		   0, 1, 2, 3, 4, 5, 6, 7,
-		   8, 9, 10, 11, 12, 13, 14, 15,
-		   16, 17, 18, 19, 20, 21, 22, 23,
-		   24, 25, 26, 27, 28, 29, 30, 31},
-	.oobfree = {{32, 32}}
-};
-
 #endif
 
 /*
@@ -531,9 +518,6 @@ static int __init rtc_from4_init(void)
 	this->ecc.bytes = 8;
 	/* return the status of extra status and ECC checks */
 	this->errstat = rtc_from4_errstat;
-	/* set the nand_oobinfo to support FPGA H/W error detection */
-	memcpy(&this->ecc.layout, &rtc_from4_nand_oobinfo,
-			sizeof(this->ecc.layout));
 	this->ecc.hwctl = rtc_from4_enable_hwecc;
 	this->ecc.calculate = rtc_from4_calculate_ecc;
 	this->ecc.correct = rtc_from4_correct_data;
-- 
1.5.4.3



--------------090103030509070207050307--
