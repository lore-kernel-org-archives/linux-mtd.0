Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1tNK-00086s-Qq
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 02:30:25 +0000
From: nsnehaprabha@ti.com
To: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org,
	tglx@linutronix.de, akpm@linux-foundation.org
Subject: [PATCH 1/2] NAND: Adding new ECC mode - NAND_ECC_HW_OOB_FIRST for TI
	DaVinci devices
Date: Wed,  6 May 2009 22:29:10 -0400
Message-Id: <1241663350-20416-1-git-send-email-nsnehaprabha@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sneha Narnakaje <nsnehaprabha@ti.com>

This patch adds new ECC mode NAND_ECC_HW_OOB_FIRST in the nand core to
support 4-bit ECC on TI DaVinci devices with large page NAND chips.
This ECC mode is similar to NAND_ECC_HW, with the exception of read_page
handle that should first read the OOB area, read the data in chunks, feed the
ECC from OOB area to the ECC hw engine and perform any correction on the data
as per the ECC status reported by hw engine. In order to read the OOB area
before the data area, the read_page handle has to send READOOB command and
thus the read_page/read_page_raw APIs are changed to pass the page argument.

Note: This patch is dependent on [patch 2.6.30-rc1] NAND: don't walk past
end of oobfree[] from David Brownell:
http://lists.infradead.org/pipermail/linux-mtd/2009-April/025205.html

Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
---
 drivers/mtd/nand/atmel_nand.c    |    2 +-
 drivers/mtd/nand/cafe_nand.c     |    2 +-
 drivers/mtd/nand/fsl_elbc_nand.c |    3 +-
 drivers/mtd/nand/nand_base.c     |   72 +++++++++++++++++++++++++++++++++----
 drivers/mtd/nand/sh_flctl.c      |    2 +-
 include/linux/mtd/nand.h         |    5 ++-
 6 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 47a33ce..b63eddb 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -214,7 +214,7 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
  * buf:        buffer to store read data
  */
 static int atmel_nand_read_page(struct mtd_info *mtd,
-		struct nand_chip *chip, uint8_t *buf)
+		struct nand_chip *chip, uint8_t *buf, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 7c5b257..d81ce77 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -381,7 +381,7 @@ static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
  * we need a special oob layout and handling.
  */
 static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			       uint8_t *buf)
+			       uint8_t *buf, int page)
 {
 	struct cafe_priv *cafe = mtd->priv;
 
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1f6eb25..ddd37d2 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -739,7 +739,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 
 static int fsl_elbc_read_page(struct mtd_info *mtd,
                               struct nand_chip *chip,
-                              uint8_t *buf)
+			      uint8_t *buf,
+			      int page)
 {
 	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
 	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8fdc408..f484ec1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -766,7 +766,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
  * Not for syndrome calculating ecc controllers, which use a special oob layout
  */
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf)
+			      uint8_t *buf, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -782,7 +782,7 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  * We need a special oob layout and handling even when OOB isn't used.
  */
 static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf)
+			      uint8_t *buf, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -821,7 +821,7 @@ static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *c
  * @buf:	buffer to store read data
  */
 static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf)
+				uint8_t *buf, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -831,7 +831,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *ecc_code = chip->buffers->ecccode;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
-	chip->ecc.read_page_raw(mtd, chip, buf);
+	chip->ecc.read_page_raw(mtd, chip, buf, page);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
@@ -944,7 +944,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
  * Not for syndrome calculating ecc controllers which need a special oob layout
  */
 static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf)
+				uint8_t *buf, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -980,6 +980,49 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
+ * nand_read_page_hwecc_oob_first - [REPLACABLE] hw ecc, read oob first
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ *
+ * Hardware ECC for large page chips, require OOB to be read first
+ */
+static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
+	struct nand_chip *chip, uint8_t *buf, int page)
+{
+	int i, eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	uint8_t *p = buf;
+	uint8_t *ecc_code = chip->buffers->ecccode;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint8_t *ecc_calc = chip->buffers->ecccalc;
+
+	/* Read the OOB area first */
+	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+
+	for (i = 0; i < chip->ecc.total; i++)
+		ecc_code[i] = chip->oob_poi[eccpos[i]];
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		int stat;
+
+		chip->ecc.hwctl(mtd, NAND_ECC_READ);
+		chip->read_buf(mtd, p, eccsize);
+		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
+
+		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
+		if (stat < 0)
+			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected += stat;
+	}
+	return 0;
+}
+
+/**
  * nand_read_page_syndrome - [REPLACABLE] hardware ecc syndrom based page read
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -989,7 +1032,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * we need a special oob layout and handling.
  */
 static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				   uint8_t *buf)
+				   uint8_t *buf, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1131,11 +1174,13 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OOB_RAW))
-				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
+				ret = chip->ecc.read_page_raw(mtd, chip,
+							      bufpoi, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
 			else
-				ret = chip->ecc.read_page(mtd, chip, bufpoi);
+				ret = chip->ecc.read_page(mtd, chip, bufpoi,
+							  page);
 			if (ret < 0)
 				break;
 
@@ -2678,6 +2723,17 @@ int nand_scan_tail(struct mtd_info *mtd)
 	case NAND_ECC_HW3_512:
 	case NAND_ECC_HW3_256:
 #endif
+	case NAND_ECC_HW_OOB_FIRST:
+		/* Similar to NAND_ECC_HW, but a separate read_page handle */
+		if (!chip->ecc.calculate || !chip->ecc.correct ||
+		     !chip->ecc.hwctl) {
+			printk(KERN_WARNING "No ECC functions supplied, "
+			       "Hardware ECC not possible\n");
+			BUG();
+		}
+		if (!chip->ecc.read_page)
+			chip->ecc.read_page = nand_read_page_hwecc_oob_first;
+
 	case NAND_ECC_HW:
 		/* Use standard hwecc read page function ? */
 		if (!chip->ecc.read_page)
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 2bc8966..c5df285 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -329,7 +329,7 @@ static void set_cmd_regs(struct mtd_info *mtd, uint32_t cmd, uint32_t flcmcdr_va
 }
 
 static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf)
+				uint8_t *buf, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index b2bed22..6e7a886 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -121,6 +121,7 @@ typedef enum {
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
+	NAND_ECC_HW_OOB_FIRST,
 #ifdef CONFIG_NAND_FLASH_HW_ECC
 	NAND_ECC_HW3_256,
 	NAND_ECC_HW3_512,
@@ -278,13 +279,13 @@ struct nand_ecc_ctrl {
 					   uint8_t *calc_ecc);
 	int			(*read_page_raw)(struct mtd_info *mtd,
 						 struct nand_chip *chip,
-						 uint8_t *buf);
+						 uint8_t *buf, int page);
 	void			(*write_page_raw)(struct mtd_info *mtd,
 						  struct nand_chip *chip,
 						  const uint8_t *buf);
 	int			(*read_page)(struct mtd_info *mtd,
 					     struct nand_chip *chip,
-					     uint8_t *buf);
+					     uint8_t *buf, int page);
 	int			(*read_subpage)(struct mtd_info *mtd,
 					     struct nand_chip *chip,
 					     uint32_t offs, uint32_t len,
-- 
1.6.0.4
