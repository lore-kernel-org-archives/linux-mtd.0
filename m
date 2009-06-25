Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MJpuh-0008Sh-IO
	for linux-mtd@lists.infradead.org; Thu, 25 Jun 2009 14:27:02 +0000
From: s-paulraj@ti.com
To: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org, tglx@linutronix.de,
	akpm@linux-foundation.org
Subject: [PATCH v2 2/3][Resubmit] NAND: Add new ECC mode - ECC_HW_OOB_FIRST
Date: Thu, 25 Jun 2009 10:26:12 -0400
Message-Id: <1245939972-12225-1-git-send-email-s-paulraj@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>, Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sandeep Paulraj <s-paulraj@ti.com>

The patch applies to linux-mtd GIT tree

This patch adds the new mode NAND_ECC_HW_OOB_FIRST in the nand code to
support 4-bit ECC on TI DaVinci devices with large page (up to 4K) NAND
chips. This ECC mode is similar to NAND_ECC_HW, with the exception of
read_page API that first reads the OOB area, reads the data in chunks, feeds
the ECC from OOB area to the ECC hw engine and perform any correction on the
data as per the ECC status reported by the engine.

"ECC_HW_OOB_FIRST" name suggested by Thomas Gleixner

Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com
---
 drivers/mtd/nand/nand_base.c |   59 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |    1 +
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a738333..93bb8f3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -980,6 +980,54 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
+ * nand_read_page_hwecc_oob_first - [REPLACABLE] hw ecc, read oob first
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ *
+ * Hardware ECC for large page chips, require OOB to be read first.
+ * For this ECC mode, the write_page method is re-used from ECC_HW.
+ * These methods read/write ECC from the OOB area, unlike the
+ * ECC_HW_SYNDROME support with multiple ECC steps, follows the
+ * "infix ECC" scheme and reads/writes ECC from the data area, by
+ * overwriting the NAND manufacturer bad block markings.
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
@@ -2673,6 +2721,17 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 */
 
 	switch (chip->ecc.mode) {
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
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 686f370..7a232a9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -121,6 +121,7 @@ typedef enum {
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
+	NAND_ECC_HW_OOB_FIRST,
 } nand_ecc_modes_t;
 
 /*
-- 
1.6.0.4
