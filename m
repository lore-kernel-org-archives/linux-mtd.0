From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 3 Feb 2010 14:32:06 +0530
Subject: [PATCH 2/2] Adding nand lock/unlock routines.
Message-ID: <mailman.197.1265624481.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Adding nand lock / unlock routines. At least 'micron' parts
support this.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |  164 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |   10 +++
 2 files changed, 174 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2dfeb4b..a2dddca 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -864,6 +864,168 @@ static int nand_wait(struct mtd_info
 }

 /**
+ * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
+ *
+ * @param mtd - mtd info
+ * @param ofs - offset to start unlock from
+ * @param len - length to unlock
+ * @invert -  when = 0, unlock the range of blocks within the lower and
+ *                      upper boundary address
+ *            whne = 1, unlock the range of blocks outside the boundaries
+ *                      of the lower and upper boundary address
+ *
+ * @return - unlock status
+ */
+static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
+					uint64_t len, int invert)
+{
+	int ret = 0;
+	int status, page;
+	struct nand_chip *chip = mtd->priv;
+
+	/* Submit address of first page to unlock */
+	page = ofs >> chip->page_shift;
+	chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagemask);
+
+	/* Submit address of last page to unlock */
+	page = (ofs + len) >> chip->page_shift;
+	chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
+				(page | invert) & chip->pagemask);
+
+	/* Call wait ready function */
+	status = chip->waitfunc(mtd, chip);
+	udelay(1000);
+	/* See if device thinks it succeeded */
+	if (status & 0x01) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+					__func__, status);
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+/**
+ * nand_unlock - [REPLACABLE] unlocks specified locked blockes
+ *
+ * @param mtd - mtd info
+ * @param ofs - offset to start unlock from
+ * @param len - length to unlock
+ *
+ * @return - unlock status
+ */
+int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	int ret = 0;
+	int chipnr;
+	struct nand_chip *chip = mtd->priv;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)ofs, len);
+
+	if (check_offs_len(mtd, ofs, len))
+		ret = -EINVAL;
+
+	/* Align to last block address if size addresses end of the device */
+	if (ofs + len == mtd->size)
+		len -= mtd->erasesize;
+
+	nand_get_device(chip, mtd, FL_UNLOCKING);
+
+	/* Shift to get chip number */
+	chipnr = ofs >> chip->chip_shift;
+
+	chip->select_chip(mtd, chipnr);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+					__func__);
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = __nand_unlock(mtd, ofs, len, 0);
+
+out:
+	/* de-select the NAND device */
+	chip->select_chip(mtd, -1);
+
+	nand_release_device(mtd);
+
+	return ret;
+}
+
+/**
+ * nand_lock - [REPLACABLE] locks all blockes present in the device
+ *
+ * @param mtd - mtd info
+ * @param ofs - offset to start unlock from
+ * @param len - length to unlock
+ *
+ * @return - lock status
+ *
+ * This feature is not support in many NAND parts. 'Micron' NAND parts
+ * do have this feature, but it allows only to lock all blocks not for
+ * specified range for block.
+ *
+ * Implementing 'lock' feature by making use of 'unlock', for now.
+ */
+int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	int ret = 0;
+	int chipnr, status, page;
+	struct nand_chip *chip = mtd->priv;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)ofs, len);
+
+	if (check_offs_len(mtd, ofs, len))
+		ret = -EINVAL;
+
+	nand_get_device(chip, mtd, FL_LOCKING);
+
+	/* Shift to get chip number */
+	chipnr = ofs >> chip->chip_shift;
+
+	chip->select_chip(mtd, chipnr);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+					__func__);
+		status = MTD_ERASE_FAILED;
+		ret = -EIO;
+		goto out;
+	}
+
+	/* Submit address of first page to lock */
+	page = ofs >> chip->page_shift;
+	chip->cmdfunc(mtd, NAND_CMD_LOCK, -1, page & chip->pagemask);
+
+	/* Call wait ready function */
+	status = chip->waitfunc(mtd, chip);
+	udelay(1000);
+	/* See if device thinks it succeeded */
+	if (status & 0x01) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+					__func__, status);
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = __nand_unlock(mtd, ofs, len, 0x1);
+
+out:
+	/* de-select the NAND device */
+	chip->select_chip(mtd, -1);
+
+	nand_release_device(mtd);
+
+	return ret;
+}
+
+/**
  * nand_read_page_raw - [Intern] read raw page data without ecc
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -3089,6 +3251,8 @@ void nand_release(struct mtd_info
 		kfree(chip->buffers);
 }

+EXPORT_SYMBOL_GPL(nand_lock);
+EXPORT_SYMBOL_GPL(nand_unlock);
 EXPORT_SYMBOL_GPL(nand_scan);
 EXPORT_SYMBOL_GPL(nand_scan_ident);
 EXPORT_SYMBOL_GPL(nand_scan_tail);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ccab9df..48bc2c5 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -38,6 +38,12 @@ extern void nand_release (struct mtd_info
 /* Internal helper for board drivers which need to override command function */
 extern void nand_wait_ready(struct mtd_info *mtd);

+/* locks all blockes present in the device */
+extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+
+/* unlocks specified locked blockes */
+extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8

@@ -82,6 +88,10 @@ extern void nand_wait_ready(struct mtd_info
 #define NAND_CMD_ERASE2		0xd0
 #define NAND_CMD_RESET		0xff

+#define NAND_CMD_LOCK		0x2a
+#define NAND_CMD_UNLOCK1	0x23
+#define NAND_CMD_UNLOCK2	0x24
+
 /* Extended commands for large page devices */
 #define NAND_CMD_READSTART	0x30
 #define NAND_CMD_RNDOUTSTART	0xE0
-- 
1.6.3.3
