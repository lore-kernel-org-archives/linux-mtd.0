Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awEv5-0007Rk-Ip
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 20:21:48 +0000
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org,
	computersforpeace@gmail.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH 1/2] mtd: brcmnand: Add check for erased page bitflips
Date: Fri, 29 Apr 2016 16:21:24 -0400
Message-Id: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check for erased page bitflips in a page. And if well within
threshold return data as all 0xff.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 83 +++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index e052839..29a9abd 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1490,6 +1490,64 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 	return ret;
 }
 
+/*
+ * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
+ * error
+ *
+ * Because the HW ECC signals an ECC error if an erase paged has even a single
+ * bitflip, we must check each ECC error to see if it is actually an erased
+ * page with bitflips, not a truly corrupted page.
+ *
+ * On a real error, return a negative error code (-EBADMSG for ECC error), and
+ * buf will contain raw data.
+ * Otherwise, fill buf with 0xff and return the maximum number of
+ * bitflips-per-ECC-sector to the caller.
+ *
+ */
+static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
+		  struct nand_chip *chip, void *buf, u64 addr)
+{
+	int i, sas, oob_nbits, data_nbits;
+	void *oob = chip->oob_poi;
+	unsigned int max_bitflips = 0;
+	int page = addr >> chip->page_shift;
+	int ret;
+
+	if (!buf) {
+		buf = chip->buffers->databuf;
+		/* Invalidate page cache */
+		chip->pagebuf = -1;
+	}
+
+	sas = mtd->oobsize / chip->ecc.steps;
+	oob_nbits = sas << 3;
+	data_nbits = chip->ecc.size << 3;
+
+	/* read without ecc for verification */
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+		unsigned int bitflips = 0;
+
+		bitflips += oob_nbits - bitmap_weight(oob, oob_nbits);
+		bitflips += data_nbits - bitmap_weight(buf, data_nbits);
+
+		buf += chip->ecc.size;
+		addr += chip->ecc.size;
+
+		/* Too many bitflips */
+		if (bitflips > chip->ecc.strength)
+			return -EBADMSG;
+
+		max_bitflips = max(max_bitflips, bitflips);
+	}
+
+	return max_bitflips;
+}
+
 static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			 u64 addr, unsigned int trans, u32 *buf, u8 *oob)
 {
@@ -1520,11 +1578,26 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_eccerr(err)) {
-		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
-			(unsigned long long)err_addr);
-		mtd->ecc_stats.failed++;
-		/* NAND layer expects zero on ECC errors */
-		return 0;
+		int ret;
+
+		ret = brcmstb_nand_verify_erased_page(mtd, chip, buf, addr);
+		if (ret < 0) {
+			dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
+				(unsigned long long)err_addr);
+			mtd->ecc_stats.failed++;
+			/* NAND layer expects zero on ECC errors */
+			return 0;
+		} else {
+			if (buf)
+				memset(buf, 0xff, FC_BYTES * trans);
+			if (oob)
+				memset(oob, 0xff, mtd->oobsize);
+
+			dev_info(&host->pdev->dev,
+					"corrected %d bitflips in blank page at 0x%llx\n",
+					ret, (unsigned long long)addr);
+			return ret;
+		}
 	}
 
 	if (mtd_is_bitflip(err)) {
-- 
1.9.1
