Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22u-0007VB-LY
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:51 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 6/7] mtd: Blackfin NFC: fix handling of page sizes
Date: Thu,  5 Aug 2010 11:07:43 -0400
Message-Id: <1281020864-26842-6-git-send-email-vapier@gentoo.org>
In-Reply-To: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Barry Song <barry.song@analog.com>

Rather than forcing the platform resources to declare the desired page
size, simply use the existing information passed down to us by the higher
layers.  This way we work out of the box with all flash chips that the
kernel knows about.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 arch/blackfin/include/asm/nand.h |    3 -
 drivers/mtd/nand/bf5xx_nand.c    |   86 +++++++++++++++++++++-----------------
 2 files changed, 48 insertions(+), 41 deletions(-)

diff --git a/arch/blackfin/include/asm/nand.h b/arch/blackfin/include/asm/nand.h
index 3a1e79d..256c50d 100644
--- a/arch/blackfin/include/asm/nand.h
+++ b/arch/blackfin/include/asm/nand.h
@@ -15,8 +15,6 @@
  * partitions	 = mtd partition list
  */
 
-#define NFC_PG_SIZE_256		0
-#define NFC_PG_SIZE_512		1
 #define NFC_PG_SIZE_OFFSET	9
 
 #define NFC_NWIDTH_8		0
@@ -30,7 +28,6 @@
 
 struct bf5xx_nand_platform {
 	/* NAND chip information */
-	unsigned short		page_size;
 	unsigned short		data_width;
 
 	/* RD/WR strobe delay timing information, all times in SCLK cycles */
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 2f90cac..b54f222 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -314,18 +314,16 @@ static int bf5xx_nand_correct_data_256(struct mtd_info *mtd, u_char *dat,
 static int bf5xx_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 					u_char *read_ecc, u_char *calc_ecc)
 {
-	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct bf5xx_nand_platform *plat = info->platform;
-	unsigned short page_size = (plat->page_size ? 512 : 256);
+	struct nand_chip *chip = mtd->priv;
 	int ret;
 
 	ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
 
-	/* If page size is 512, correct second 256 bytes */
-	if (page_size == 512) {
+	/* If ecc size is 512, correct second 256 bytes */
+	if (chip->ecc.size == 512) {
 		dat += 256;
-		read_ecc += 8;
-		calc_ecc += 8;
+		read_ecc += 3;
+		calc_ecc += 3;
 		ret |= bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
 	}
 
@@ -341,13 +339,12 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 		const u_char *dat, u_char *ecc_code)
 {
 	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct bf5xx_nand_platform *plat = info->platform;
-	u16 page_size = (plat->page_size ? 512 : 256);
+	struct nand_chip *chip = mtd->priv;
 	u16 ecc0, ecc1;
 	u32 code[2];
 	u8 *p;
 
-	/* first 4 bytes ECC code for 256 page size */
+	/* first 3 bytes ECC code for 256 page size */
 	ecc0 = bfin_read_NFC_ECC0();
 	ecc1 = bfin_read_NFC_ECC1();
 
@@ -355,12 +352,11 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 
 	dev_dbg(info->device, "returning ecc 0x%08x\n", code[0]);
 
-	/* first 3 bytes in ecc_code for 256 page size */
 	p = (u8 *) code;
 	memcpy(ecc_code, p, 3);
 
-	/* second 4 bytes ECC code for 512 page size */
-	if (page_size == 512) {
+	/* second 3 bytes ECC code for 512 ecc size */
+	if (chip->ecc.size == 512) {
 		ecc0 = bfin_read_NFC_ECC2();
 		ecc1 = bfin_read_NFC_ECC3();
 		code[1] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
@@ -480,8 +476,7 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 				uint8_t *buf, int is_read)
 {
 	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct bf5xx_nand_platform *plat = info->platform;
-	unsigned short page_size = (plat->page_size ? 512 : 256);
+	struct nand_chip *chip = mtd->priv;
 	unsigned short val;
 
 	dev_dbg(info->device, " mtd->%p, buf->%p, is_read %d\n",
@@ -495,10 +490,10 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	 */
 	if (is_read)
 		invalidate_dcache_range((unsigned int)buf,
-				(unsigned int)(buf + page_size));
+				(unsigned int)(buf + chip->ecc.size));
 	else
 		flush_dcache_range((unsigned int)buf,
-				(unsigned int)(buf + page_size));
+				(unsigned int)(buf + chip->ecc.size));
 
 	/*
 	 * This register must be written before each page is
@@ -519,13 +514,13 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 
 	/* The DMAs have different size on BF52x and BF54x */
 #ifdef CONFIG_BF52x
-	set_dma_x_count(CH_NFC, (page_size >> 1));
+	set_dma_x_count(CH_NFC, (chip->ecc.size >> 1));
 	set_dma_x_modify(CH_NFC, 2);
 	val = DI_EN | WDSIZE_16;
 #endif
 
 #ifdef CONFIG_BF54x
-	set_dma_x_count(CH_NFC, (page_size >> 2));
+	set_dma_x_count(CH_NFC, (chip->ecc.size >> 2));
 	set_dma_x_modify(CH_NFC, 4);
 	val = DI_EN | WDSIZE_32;
 #endif
@@ -547,12 +542,11 @@ static void bf5xx_nand_dma_read_buf(struct mtd_info *mtd,
 					uint8_t *buf, int len)
 {
 	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct bf5xx_nand_platform *plat = info->platform;
-	unsigned short page_size = (plat->page_size ? 512 : 256);
+	struct nand_chip *chip = mtd->priv;
 
 	dev_dbg(info->device, "mtd->%p, buf->%p, int %d\n", mtd, buf, len);
 
-	if (len == page_size)
+	if (len == chip->ecc.size)
 		bf5xx_nand_dma_rw(mtd, buf, 1);
 	else
 		bf5xx_nand_read_buf(mtd, buf, len);
@@ -562,12 +556,11 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 				const uint8_t *buf, int len)
 {
 	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
-	struct bf5xx_nand_platform *plat = info->platform;
-	unsigned short page_size = (plat->page_size ? 512 : 256);
+	struct nand_chip *chip = mtd->priv;
 
 	dev_dbg(info->device, "mtd->%p, buf->%p, len %d\n", mtd, buf, len);
 
-	if (len == page_size)
+	if (len == chip->ecc.size)
 		bf5xx_nand_dma_rw(mtd, (uint8_t *)buf, 0);
 	else
 		bf5xx_nand_write_buf(mtd, buf, len);
@@ -626,12 +619,11 @@ static int bf5xx_nand_hw_init(struct bf5xx_nand_info *info)
 
 	/* setup NFC_CTL register */
 	dev_info(info->device,
-		"page_size=%d, data_width=%d, wr_dly=%d, rd_dly=%d\n",
-		(plat->page_size ? 512 : 256),
+		"data_width=%d, wr_dly=%d, rd_dly=%d\n",
 		(plat->data_width ? 16 : 8),
 		plat->wr_dly, plat->rd_dly);
 
-	val = (plat->page_size << NFC_PG_SIZE_OFFSET) |
+	val = (1 << NFC_PG_SIZE_OFFSET) |
 		(plat->data_width << NFC_NWIDTH_OFFSET) |
 		(plat->rd_dly << NFC_RDDLY_OFFSET) |
 		(plat->wr_dly << NFC_WRDLY_OFFSET);
@@ -697,6 +689,33 @@ static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int bf5xx_nand_scan(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret;
+
+	ret = nand_scan_ident(mtd, 1);
+	if (ret)
+		return ret;
+
+	if (hardware_ecc) {
+		/*
+		 * for nand with page size > 512B, think it as several sections with 512B
+		 */
+		if (likely(mtd->writesize >= 512)) {
+			chip->ecc.size = 512;
+			chip->ecc.bytes = 6;
+		} else {
+			chip->ecc.size = 256;
+			chip->ecc.bytes = 3;
+			bfin_write_NFC_CTL(bfin_read_NFC_CTL() & ~(1 << NFC_PG_SIZE_OFFSET));
+			SSYNC();
+		}
+	}
+
+	return	nand_scan_tail(mtd);
+}
+
 /*
  * bf5xx_nand_probe
  *
@@ -782,15 +801,6 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 		chip->badblock_pattern = &bootrom_bbt;
 		chip->ecc.layout = &bootrom_ecclayout;
 #endif
-
-		if (plat->page_size == NFC_PG_SIZE_256) {
-			chip->ecc.bytes = 3;
-			chip->ecc.size = 256;
-		} else if (plat->page_size == NFC_PG_SIZE_512) {
-			chip->ecc.bytes = 6;
-			chip->ecc.size = 512;
-		}
-
 		chip->read_buf      = bf5xx_nand_dma_read_buf;
 		chip->write_buf     = bf5xx_nand_dma_write_buf;
 		chip->ecc.calculate = bf5xx_nand_calculate_ecc;
@@ -802,7 +812,7 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	}
 
 	/* scan hardware nand chip and setup mtd info data struct */
-	if (nand_scan(mtd, 1)) {
+	if (bf5xx_nand_scan(mtd)) {
 		err = -ENXIO;
 		goto out_err_nand_scan;
 	}
-- 
1.7.2
