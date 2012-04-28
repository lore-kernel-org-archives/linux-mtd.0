Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwVm-0002z5-LD
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:31:48 +0000
Received: by pbbrq13 with SMTP id rq13so1738840pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:31:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 01/10] mtd: nand: add 'oob_required' argument to NAND {read,
 write}_page interfaces
Date: Fri, 27 Apr 2012 18:29:45 -0700
Message-Id: <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Li Yang <leoli@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New NAND controllers can perform read/write via HW engines which don't expose
OOB data in their DMA mode. To reflect this, we should rework the nand_chip /
nand_ecc_ctrl interfaces that assume that drivers will always read/write OOB
data in the nand_chip.oob_poi buffer. A better interface includes a boolean
argument that explicitly tells the callee when OOB data is requested by the
calling layer (for reading/writing to/from nand_chip.oob_poi).

This patch adds the 'oob_required' parameter to each relevant {read,write}_page
interface; all 'oob_required' parameters are left unused for now. The next
patch will set the parameter properly in the nand_base.c callers, and follow-up
patches will make use of 'oob_required' in some of the callee functions.

Note that currently, there is no harm in ignoring the 'oob_required' parameter
and *always* utilizing nand_chip.oob_poi, but there can be
performance/complexity/design benefits from avoiding filling oob_poi in the
common case. I will try to implement this for some drivers which can be ported
easily.

Note: I couldn't compile-test all of these easily, as some had ARCH
dependencies.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v3: 'bool use_oob' -> 'int oob_required'
    A few mistakes corrected (missed users, wrong 'oob_required' value)

 drivers/mtd/nand/atmel_nand.c          |    5 ++-
 drivers/mtd/nand/bcm_umi_bch.c         |   10 +++--
 drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
 drivers/mtd/nand/bf5xx_nand.c          |    4 +-
 drivers/mtd/nand/cafe_nand.c           |   13 ++++---
 drivers/mtd/nand/denali.c              |    8 ++--
 drivers/mtd/nand/docg4.c               |   12 +++---
 drivers/mtd/nand/fsl_elbc_nand.c       |   11 ++----
 drivers/mtd/nand/fsl_ifc_nand.c        |   10 ++---
 drivers/mtd/nand/fsmc_nand.c           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 ++--
 drivers/mtd/nand/nand_base.c           |   56 ++++++++++++++++++++------------
 drivers/mtd/nand/pxa3xx_nand.c         |    5 ++-
 drivers/mtd/nand/sh_flctl.c            |    4 +-
 include/linux/mtd/nand.h               |   11 +++---
 15 files changed, 90 insertions(+), 72 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 2165576..ab13400 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -324,9 +324,10 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
  * mtd:        mtd info structure
  * chip:       nand chip info structure
  * buf:        buffer to store read data
+ * oob_required:    caller expects OOB data read to chip->oob_poi
  */
-static int atmel_nand_read_page(struct mtd_info *mtd,
-		struct nand_chip *chip, uint8_t *buf, int page)
+static int atmel_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+				uint8_t *buf, int oob_required, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
diff --git a/drivers/mtd/nand/bcm_umi_bch.c b/drivers/mtd/nand/bcm_umi_bch.c
index a930666..ee6669d 100644
--- a/drivers/mtd/nand/bcm_umi_bch.c
+++ b/drivers/mtd/nand/bcm_umi_bch.c
@@ -22,9 +22,9 @@
 
 /* ---- Private Function Prototypes -------------------------------------- */
 static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
-	struct nand_chip *chip, uint8_t *buf, int page);
+	struct nand_chip *chip, uint8_t *buf, int oob_required, int page);
 static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
-	struct nand_chip *chip, const uint8_t *buf);
+	struct nand_chip *chip, const uint8_t *buf, int oob_required);
 
 /* ---- Private Variables ------------------------------------------------ */
 
@@ -103,11 +103,12 @@ static struct nand_ecclayout nand_hw_eccoob_4096 = {
 *  @mtd:	mtd info structure
 *  @chip:	nand chip info structure
 *  @buf:	buffer to store read data
+*  @oob_required:	caller expects OOB data read to chip->oob_poi
 *
 ***************************************************************************/
 static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
 				       struct nand_chip *chip, uint8_t * buf,
-						 int page)
+				       int oob_required, int page)
 {
 	int sectorIdx = 0;
 	int eccsize = chip->ecc.size;
@@ -188,10 +189,11 @@ static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
 *  @mtd:	mtd info structure
 *  @chip:	nand chip info structure
 *  @buf:	data buffer
+*  @oob_required:	must write chip->oob_poi to OOB
 *
 ***************************************************************************/
 static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
-	struct nand_chip *chip, const uint8_t *buf)
+	struct nand_chip *chip, const uint8_t *buf, int oob_required)
 {
 	int sectorIdx = 0;
 	int eccsize = chip->ecc.size;
diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index 6908cdd..27d11e8 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -341,7 +341,7 @@ static int bcm_umi_nand_verify_buf(struct mtd_info *mtd, const u_char * buf,
 	 * for MLC parts which may have permanently stuck bits.
 	 */
 	struct nand_chip *chip = mtd->priv;
-	int ret = chip->ecc.read_page(mtd, chip, readbackbuf, 0);
+	int ret = chip->ecc.read_page(mtd, chip, readbackbuf, false, 0);
 	if (ret < 0)
 		return -EFAULT;
 	else {
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index d7b86b9..3f1c185 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -558,7 +558,7 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 }
 
 static int bf5xx_nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-		uint8_t *buf, int page)
+		uint8_t *buf, int oob_required, int page)
 {
 	bf5xx_nand_read_buf(mtd, buf, mtd->writesize);
 	bf5xx_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -567,7 +567,7 @@ static int bf5xx_nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip
 }
 
 static void bf5xx_nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-		const uint8_t *buf)
+		const uint8_t *buf, int oob_required)
 {
 	bf5xx_nand_write_buf(mtd, buf, mtd->writesize);
 	bf5xx_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 2973d97..738aafa 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -375,12 +375,13 @@ static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oob_required:	caller expects OOB data read to chip->oob_poi
  *
  * The hw generator calculates the error syndrome automatically. Therefor
  * we need a special oob layout and handling.
  */
 static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			       uint8_t *buf, int page)
+			       uint8_t *buf, int oob_required, int page)
 {
 	struct cafe_priv *cafe = mtd->priv;
 
@@ -518,7 +519,8 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_512 = {
 
 
 static void cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
-					  struct nand_chip *chip, const uint8_t *buf)
+					  struct nand_chip *chip,
+					  const uint8_t *buf, int oob_required)
 {
 	struct cafe_priv *cafe = mtd->priv;
 
@@ -530,16 +532,17 @@ static void cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
 }
 
 static int cafe_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf, int page, int cached, int raw)
+				const uint8_t *buf, int oob_required, int page,
+				int cached, int raw)
 {
 	int status;
 
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 
 	if (unlikely(raw))
-		chip->ecc.write_page_raw(mtd, chip, buf);
+		chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
 	else
-		chip->ecc.write_page(mtd, chip, buf);
+		chip->ecc.write_page(mtd, chip, buf, oob_required);
 
 	/*
 	 * Cached progamming disabled for now, Not sure if its worth the
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a1048c7..436ea83 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1084,7 +1084,7 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
  * by write_page above.
  * */
 static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf)
+				const uint8_t *buf, int oob_required)
 {
 	/* for regular page writes, we let HW handle all the ECC
 	 * data written to the device. */
@@ -1096,7 +1096,7 @@ static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
  * write_page() function above.
  */
 static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-					const uint8_t *buf)
+					const uint8_t *buf, int oob_required)
 {
 	/* for raw page writes, we want to disable ECC and simply write
 	   whatever data is in the buffer. */
@@ -1119,7 +1119,7 @@ static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			    uint8_t *buf, int page)
+			    uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
@@ -1171,7 +1171,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int page)
+				uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index b082026..b90f315 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -786,13 +786,13 @@ static int read_page(struct mtd_info *mtd, struct nand_chip *nand,
 
 
 static int docg4_read_page_raw(struct mtd_info *mtd, struct nand_chip *nand,
-			       uint8_t *buf, int page)
+			       uint8_t *buf, int oob_required, int page)
 {
 	return read_page(mtd, nand, buf, page, false);
 }
 
 static int docg4_read_page(struct mtd_info *mtd, struct nand_chip *nand,
-			   uint8_t *buf, int page)
+			   uint8_t *buf, int oob_required, int page)
 {
 	return read_page(mtd, nand, buf, page, true);
 }
@@ -952,13 +952,13 @@ static void write_page(struct mtd_info *mtd, struct nand_chip *nand,
 }
 
 static void docg4_write_page_raw(struct mtd_info *mtd, struct nand_chip *nand,
-				 const uint8_t *buf)
+				 const uint8_t *buf, int oob_required)
 {
 	return write_page(mtd, nand, buf, false);
 }
 
 static void docg4_write_page(struct mtd_info *mtd, struct nand_chip *nand,
-			     const uint8_t *buf)
+			     const uint8_t *buf, int oob_required)
 {
 	return write_page(mtd, nand, buf, true);
 }
@@ -1002,7 +1002,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 		return -ENOMEM;
 
 	read_page_prologue(mtd, g4_addr);
-	status = docg4_read_page(mtd, nand, buf, DOCG4_FACTORY_BBT_PAGE);
+	status = docg4_read_page(mtd, nand, buf, false, DOCG4_FACTORY_BBT_PAGE);
 	if (status)
 		goto exit;
 
@@ -1079,7 +1079,7 @@ static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	/* write first page of block */
 	write_page_prologue(mtd, g4_addr);
-	docg4_write_page(mtd, nand, buf);
+	docg4_write_page(mtd, nand, buf, true);
 	ret = pageprog(mtd);
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 80b5264..5cddd65 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -738,10 +738,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	return 0;
 }
 
-static int fsl_elbc_read_page(struct mtd_info *mtd,
-                              struct nand_chip *chip,
-			      uint8_t *buf,
-			      int page)
+static int fsl_elbc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+			      uint8_t *buf, int oob_required, int page)
 {
 	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
 	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -755,9 +753,8 @@ static int fsl_elbc_read_page(struct mtd_info *mtd,
 /* ECC will be calculated automatically, and errors will be detected in
  * waitfunc.
  */
-static void fsl_elbc_write_page(struct mtd_info *mtd,
-                                struct nand_chip *chip,
-                                const uint8_t *buf)
+static void fsl_elbc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+				const uint8_t *buf, int oob_required)
 {
 	fsl_elbc_write_buf(mtd, buf, mtd->writesize);
 	fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 5387cec..a8d1e87 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -692,9 +692,8 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	return nand_fsr | NAND_STATUS_WP;
 }
 
-static int fsl_ifc_read_page(struct mtd_info *mtd,
-			      struct nand_chip *chip,
-			      uint8_t *buf, int page)
+static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+			     uint8_t *buf, int oob_required, int page)
 {
 	struct fsl_ifc_mtd *priv = chip->priv;
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
@@ -714,9 +713,8 @@ static int fsl_ifc_read_page(struct mtd_info *mtd,
 /* ECC will be calculated automatically, and errors will be detected in
  * waitfunc.
  */
-static void fsl_ifc_write_page(struct mtd_info *mtd,
-				struct nand_chip *chip,
-				const uint8_t *buf)
+static void fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			       const uint8_t *buf, int oob_required)
 {
 	fsl_ifc_write_buf(mtd, buf, mtd->writesize);
 	fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 9d7f417..2756259 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -692,6 +692,7 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oob_required:	caller expects OOB data read to chip->oob_poi
  * @page:	page number to read
  *
  * This routine is needed for fsmc version 8 as reading from NAND chip has to be
@@ -701,7 +702,7 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, const uint8_t *buf,
  * max of 8 bits)
  */
 static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				 uint8_t *buf, int page)
+				 uint8_t *buf, int oob_required, int page)
 {
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 75b1dde..ec16f2e 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -841,7 +841,7 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 }
 
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int page)
+				uint8_t *buf, int oob_required, int page)
 {
 	struct gpmi_nand_data *this = chip->priv;
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
@@ -927,8 +927,8 @@ exit_nfc:
 	return ret;
 }
 
-static void gpmi_ecc_write_page(struct mtd_info *mtd,
-				struct nand_chip *chip, const uint8_t *buf)
+static void gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+				const uint8_t *buf, int oob_required)
 {
 	struct gpmi_nand_data *this = chip->priv;
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
@@ -1308,7 +1308,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 		/* Write the first page of the current stride. */
 		dev_dbg(dev, "Writing an NCB fingerprint in page 0x%x\n", page);
 		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-		chip->ecc.write_page_raw(mtd, chip, buffer);
+		chip->ecc.write_page_raw(mtd, chip, buffer, false);
 		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 
 		/* Wait for the write to finish. */
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb88d8b..96d950e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1066,12 +1066,13 @@ EXPORT_SYMBOL(nand_lock);
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf, int page)
+			      uint8_t *buf, int oob_required, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -1083,13 +1084,14 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
  * We need a special oob layout and handling even when OOB isn't used.
  */
 static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
-					struct nand_chip *chip,
-					uint8_t *buf, int page)
+				       struct nand_chip *chip, uint8_t *buf,
+				       int oob_required, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1126,10 +1128,11 @@ static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  */
 static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int page)
+				uint8_t *buf, int oob_required, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1139,7 +1142,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *ecc_code = chip->buffers->ecccode;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
-	chip->ecc.read_page_raw(mtd, chip, buf, page);
+	chip->ecc.read_page_raw(mtd, chip, buf, 1, page);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
@@ -1257,12 +1260,13 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
  * Not for syndrome calculating ECC controllers which need a special oob layout.
  */
 static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int page)
+				uint8_t *buf, int oob_required, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1302,6 +1306,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
  * Hardware ECC for large page chips, require OOB to be read first. For this
@@ -1311,7 +1316,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * the data area, by overwriting the NAND manufacturer bad block markings.
  */
 static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
-	struct nand_chip *chip, uint8_t *buf, int page)
+	struct nand_chip *chip, uint8_t *buf, int oob_required, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1350,13 +1355,14 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
  * @page: page number to read
  *
  * The hw generator calculates the error syndrome automatically. Therefore we
  * need a special oob layout and handling.
  */
 static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				   uint8_t *buf, int page)
+				   uint8_t *buf, int oob_required, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1500,14 +1506,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OPS_RAW))
-				ret = chip->ecc.read_page_raw(mtd, chip,
-							      bufpoi, page);
+				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
+							      1, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
-							  page);
+							  1, page);
 			if (ret < 0) {
 				if (!aligned)
 					/* Invalidate page cache */
@@ -1919,11 +1925,12 @@ out:
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
  *
  * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf)
+				const uint8_t *buf, int oob_required)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
 	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
@@ -1934,12 +1941,13 @@ static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
  *
  * We need a special oob layout and handling even when ECC isn't checked.
  */
 static void nand_write_page_raw_syndrome(struct mtd_info *mtd,
 					struct nand_chip *chip,
-					const uint8_t *buf)
+					const uint8_t *buf, int oob_required)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1973,9 +1981,10 @@ static void nand_write_page_raw_syndrome(struct mtd_info *mtd,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
  */
 static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
-				  const uint8_t *buf)
+				  const uint8_t *buf, int oob_required)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1991,7 +2000,7 @@ static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < chip->ecc.total; i++)
 		chip->oob_poi[eccpos[i]] = ecc_calc[i];
 
-	chip->ecc.write_page_raw(mtd, chip, buf);
+	chip->ecc.write_page_raw(mtd, chip, buf, 1);
 }
 
 /**
@@ -1999,9 +2008,10 @@ static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
  */
 static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				  const uint8_t *buf)
+				  const uint8_t *buf, int oob_required)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -2027,12 +2037,14 @@ static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
+ * @oob_required: must write chip->oob_poi to OOB
  *
  * The hw generator calculates the error syndrome automatically. Therefore we
  * need a special oob layout and handling.
  */
 static void nand_write_page_syndrome(struct mtd_info *mtd,
-				    struct nand_chip *chip, const uint8_t *buf)
+				    struct nand_chip *chip,
+				    const uint8_t *buf, int oob_required)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -2071,21 +2083,23 @@ static void nand_write_page_syndrome(struct mtd_info *mtd,
  * @mtd: MTD device structure
  * @chip: NAND chip descriptor
  * @buf: the data to write
+ * @oob_required: must write chip->oob_poi to OOB
  * @page: page number to write
  * @cached: cached programming
  * @raw: use _raw version of write_page
  */
 static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			   const uint8_t *buf, int page, int cached, int raw)
+			   const uint8_t *buf, int oob_required, int page,
+			   int cached, int raw)
 {
 	int status;
 
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 
 	if (unlikely(raw))
-		chip->ecc.write_page_raw(mtd, chip, buf);
+		chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
 	else
-		chip->ecc.write_page(mtd, chip, buf);
+		chip->ecc.write_page(mtd, chip, buf, oob_required);
 
 	/*
 	 * Cached progamming disabled for now. Not sure if it's worth the
@@ -2264,7 +2278,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
-		ret = chip->write_page(mtd, chip, wbuf, page, cached,
+		ret = chip->write_page(mtd, chip, wbuf, 1, page, cached,
 				       (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index def50ca..82ef968 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -682,14 +682,15 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 }
 
 static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
-		struct nand_chip *chip, const uint8_t *buf)
+		struct nand_chip *chip, const uint8_t *buf, int oob_required)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
 	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
-		struct nand_chip *chip, uint8_t *buf, int page)
+		struct nand_chip *chip, uint8_t *buf, int oob_required,
+		int page)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index e9b2b26..115d2e7 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -344,7 +344,7 @@ static void set_cmd_regs(struct mtd_info *mtd, uint32_t cmd, uint32_t flcmcdr_va
 }
 
 static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int page)
+				uint8_t *buf, int oob_required, int page)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -366,7 +366,7 @@ static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static void flctl_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				   const uint8_t *buf)
+				   const uint8_t *buf, int oob_required)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 1482340..9e9cdca 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -363,15 +363,15 @@ struct nand_ecc_ctrl {
 	int (*correct)(struct mtd_info *mtd, uint8_t *dat, uint8_t *read_ecc,
 			uint8_t *calc_ecc);
 	int (*read_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
-			uint8_t *buf, int page);
+			uint8_t *buf, int oob_required, int page);
 	void (*write_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf);
+			const uint8_t *buf, int oob_required);
 	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
-			uint8_t *buf, int page);
+			uint8_t *buf, int oob_required, int page);
 	int (*read_subpage)(struct mtd_info *mtd, struct nand_chip *chip,
 			uint32_t offs, uint32_t len, uint8_t *buf);
 	void (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf);
+			const uint8_t *buf, int oob_required);
 	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
 			int page);
 	int (*read_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
@@ -505,7 +505,8 @@ struct nand_chip {
 	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
 			int status, int page);
 	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, int page, int cached, int raw);
+			const uint8_t *buf, int oob_required, int page,
+			int cached, int raw);
 
 	int chip_delay;
 	unsigned int options;
-- 
1.7.5.4.2.g519b1
