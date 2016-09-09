Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKZ4-000185-OO
 for linux-mtd@lists.infradead.org; Fri, 09 Sep 2016 12:05:52 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/9] mtd: nand: Create a NAND reset function
Date: Fri,  9 Sep 2016 14:05:04 +0200
Message-Id: <1473422712-12359-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
References: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When NAND devices are resetted some initialization may have to be done,
like for example they have to be configured for the timing mode that
shall be used. To get a common place where this initialization can be
implemented create a nand_reset() function. This currently only issues
a NAND_CMD_RESET to the NAND device. The places issuing this command
manually are replaced with a call to nand_reset().

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/nand_base.c | 23 ++++++++++++++++++-----
 include/linux/mtd/nand.h     |  4 ++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77533f7..1f704cc 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -948,6 +948,19 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 }
 
 /**
+ * nand_reset - Reset and initialize a NAND device
+ * @chip: The NAND chip
+ *
+ * Returns 0 for success or negative error code otherwise
+ */
+int nand_reset(struct nand_chip *chip)
+{
+	chip->cmdfunc(&chip->mtd, NAND_CMD_RESET, -1, -1);
+
+	return 0;
+}
+
+/**
  * __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
  * @mtd: mtd info
  * @ofs: offset to start unlock from
@@ -1025,7 +1038,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	 * some operation can also clear the bit 7 of status register
 	 * eg. erase/program a locked block
 	 */
-	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	nand_reset(chip);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
@@ -1084,7 +1097,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	 * some operation can also clear the bit 7 of status register
 	 * eg. erase/program a locked block
 	 */
-	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	nand_reset(chip);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
@@ -2788,7 +2801,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
 	 * it in the doc2000 driver in August 1999.  dwmw2.
 	 */
-	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	nand_reset(chip);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
@@ -3829,7 +3842,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
 	 * after power-up.
 	 */
-	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	nand_reset(chip);
 
 	/* Send the command for reading device ID */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
@@ -4161,7 +4174,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	for (i = 1; i < maxchips; i++) {
 		chip->select_chip(mtd, i);
 		/* See comment in nand_get_flash_type for reset */
-		chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+		nand_reset(chip);
 		/* Send the command for reading device ID */
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8dd6e01..9890df2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1093,4 +1093,8 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 /* Default read_oob syndrome implementation */
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
+
+/* Reset and initialize a NAND device */
+int nand_reset(struct nand_chip *chip);
+
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.8.1
