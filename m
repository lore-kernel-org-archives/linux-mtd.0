Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRZ0E-0003RW-Tp
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 22:00:41 +0000
From: nsnehaprabha@ti.com
To: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org,
	tglx@linutronix.de, akpm@linux-foundation.org
Subject: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
	read_page/read_page_raw APIs
Date: Thu, 16 Jul 2009 17:59:30 -0400
Message-Id: <1247781570-11021-1-git-send-email-nsnehaprabha@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>, Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sneha Narnakaje <nsnehaprabha@ti.com>

This patch new "page" parameter to all NAND read_page/read_page_raw APIs.
The read_page API for the new mode ECC_HW_OOB_FIRST requires the page
information to send the READOOB command and read the OOB area before the
data area.

This patch series applies to linux-mtd next (mmotm) GIT tree.
This patch is the same as v2 version of this patch.

Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
---
 drivers/mtd/nand/atmel_nand.c    |    2 +-
 drivers/mtd/nand/cafe_nand.c     |    2 +-
 drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
 drivers/mtd/nand/nand_base.c     |   18 ++++++++++--------
 drivers/mtd/nand/sh_flctl.c      |    2 +-
 include/linux/mtd/nand.h         |    4 ++--
 6 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 20c828b..f8e9975 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -218,7 +218,7 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
  * buf:        buffer to store read data
  */
 static int atmel_nand_read_page(struct mtd_info *mtd,
-		struct nand_chip *chip, uint8_t *buf)
+		struct nand_chip *chip, uint8_t *buf, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 1b4690b..c828d9a 100644
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
index 8c21b89..979988a 100644
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
@@ -989,7 +989,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * we need a special oob layout and handling.
  */
 static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				   uint8_t *buf)
+				   uint8_t *buf, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1131,11 +1131,13 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
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
index 4030eba..686f370 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -271,13 +271,13 @@ struct nand_ecc_ctrl {
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
