Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUAB5-0001Yv-I1
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 01:34:18 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch 2.6.29-rc3] NAND:  fix "raw" reads with ECC syndrome layouts
Date: Mon, 2 Feb 2009 17:34:12 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902021734.12505.david-b@pacbell.net>
Cc: Kevin Hilman <khilman@deeprootsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

The syndrome based page read/write routines store ECC, and possibly
other OOB data, right after each chunk of ECC'd data.  With ECC
chunk size of 512 bytes and a large page (2KB) NAND, the layout is:

  data-0 OOB-0, data-1 OOB-1, data-2 OOB-2, data-3 OOB-3, OOB-rest

Where OOB-x is (prepad, ECC, postpad).  However, the current "raw"
routines presume traditional layout -- data OOB, disregarding the
subpage-like chunking -- so when they're used with that type of
ECC hardware, those calls mangle the data into OOB.  Which means,
in particular, that bad block tables won't be found on startup,
causing data corruption and related chaos.

The current syndrome-based drivers in mainline all seem to use one
chunk per page; which is presumably why they've not hit this bug.

Fix ... by adding read/write page_raw_syndrome() routines as
siblings of the existing non-raw routines; "raw" just means to
bypass the ECC computations, not mutate data and OOB layout.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
Observed when trying to get this working with the DaVinci NAND
driver in 4-bit ECC mode with a large page chip.  I could imagine
that driver going to mainline for 2.6.30 *without* that new mode.

 drivers/mtd/nand/nand_base.c |  113 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 10 deletions(-)

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -748,6 +748,8 @@ static int nand_wait(struct mtd_info *mt
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ *
+ * Not for syndrome calculating ecc controllers, which use a special oob layout
  */
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf)
@@ -758,6 +760,48 @@ static int nand_read_page_raw(struct mtd
 }
 
 /**
+ * nand_read_page_raw_syndrome - [Intern] read raw page data without ecc
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ *
+ * We need a special oob layout and handling even when ECC isn't used.
+ */
+static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
+			      uint8_t *buf)
+{
+	int eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	uint8_t *oob = chip->oob_poi;
+	int temp;
+
+	temp = chip->ecc.steps;
+	do {
+		chip->read_buf(mtd, buf, eccsize);
+		buf += eccsize;
+
+		if (chip->ecc.prepad) {
+			chip->read_buf(mtd, oob, chip->ecc.prepad);
+			oob += chip->ecc.prepad;
+		}
+
+		chip->read_buf(mtd, oob, eccbytes);
+		oob += eccbytes;
+
+		if (chip->ecc.postpad) {
+			chip->read_buf(mtd, oob, chip->ecc.postpad);
+			oob += chip->ecc.postpad;
+		}
+	} while (--temp);
+
+	temp = mtd->oobsize - (oob - chip->oob_poi);
+	if (temp)
+		chip->read_buf(mtd, oob, temp);
+
+	return 0;
+}
+
+/**
  * nand_read_page_swecc - [REPLACABLE] software ecc based page read function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -1482,6 +1526,8 @@ static int nand_read_oob(struct mtd_info
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	data buffer
+ *
+ * Not for syndrome calculating ecc controllers, which use a special oob layout
  */
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
@@ -1491,6 +1537,45 @@ static void nand_write_page_raw(struct m
 }
 
 /**
+ * nand_write_page_raw_syndrome - [Intern] raw page write function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	data buffer
+ *
+ * We need a special oob layout and handling even when ECC isn't used.
+ */
+static void nand_write_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
+				const uint8_t *buf)
+{
+	int eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	uint8_t *oob = chip->oob_poi;
+	int temp;
+
+	temp = chip->ecc.steps;
+	do {
+		chip->write_buf(mtd, buf, eccsize);
+		buf += eccsize;
+
+		if (chip->ecc.prepad) {
+			chip->write_buf(mtd, oob, chip->ecc.prepad);
+			oob += chip->ecc.prepad;
+		}
+
+		chip->read_buf(mtd, oob, eccbytes);
+		oob += eccbytes;
+
+		if (chip->ecc.postpad) {
+			chip->write_buf(mtd, oob, chip->ecc.postpad);
+			oob += chip->ecc.postpad;
+		}
+	} while (--temp);
+
+	temp = mtd->oobsize - (oob - chip->oob_poi);
+	if (temp)
+		chip->write_buf(mtd, oob, temp);
+}
+/**
  * nand_write_page_swecc - [REPLACABLE] software ecc based page write function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -2564,10 +2649,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
 	 */
-	if (!chip->ecc.read_page_raw)
-		chip->ecc.read_page_raw = nand_read_page_raw;
-	if (!chip->ecc.write_page_raw)
-		chip->ecc.write_page_raw = nand_write_page_raw;
 
 	switch (chip->ecc.mode) {
 #ifdef CONFIG_NAND_FLASH_HW_ECC
@@ -2583,6 +2664,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.read_page = nand_read_page_hwecc;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_hwecc;
+		if (!chip->ecc.read_page_raw)
+			chip->ecc.read_page_raw = nand_read_page_raw;
+		if (!chip->ecc.write_page_raw)
+			chip->ecc.write_page_raw = nand_write_page_raw;
 		if (!chip->ecc.read_oob)
 			chip->ecc.read_oob = nand_read_oob_std;
 		if (!chip->ecc.write_oob)
@@ -2604,6 +2689,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.read_page = nand_read_page_syndrome;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_syndrome;
+		if (!chip->ecc.read_page_raw)
+			chip->ecc.read_page_raw = nand_read_page_raw_syndrome;
+		if (!chip->ecc.write_page_raw)
+			chip->ecc.write_page_raw = nand_write_page_raw_syndrome;
 		if (!chip->ecc.read_oob)
 			chip->ecc.read_oob = nand_read_oob_syndrome;
 		if (!chip->ecc.write_oob)
@@ -2622,6 +2711,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->ecc.read_page = nand_read_page_swecc;
 		chip->ecc.read_subpage = nand_read_subpage;
 		chip->ecc.write_page = nand_write_page_swecc;
+		chip->ecc.read_page_raw = nand_read_page_raw;
+		chip->ecc.write_page_raw = nand_write_page_raw;
 		chip->ecc.read_oob = nand_read_oob_std;
 		chip->ecc.write_oob = nand_write_oob_std;
 		chip->ecc.size = 256;
@@ -2634,6 +2725,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->ecc.read_page = nand_read_page_raw;
 		chip->ecc.write_page = nand_write_page_raw;
 		chip->ecc.read_oob = nand_read_oob_std;
+		chip->ecc.read_page_raw = nand_read_page_raw;
+		chip->ecc.write_page_raw = nand_write_page_raw;
 		chip->ecc.write_oob = nand_write_oob_std;
 		chip->ecc.size = mtd->writesize;
 		chip->ecc.bytes = 0;
