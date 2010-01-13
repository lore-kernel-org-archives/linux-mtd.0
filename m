Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV2gw-00030i-Qh
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 12:51:24 +0000
Received: by bwz4 with SMTP id 4so15499464bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 04:51:17 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 18:20:56 +0530
Message-ID: <ce9ab5791001130450j106a6397lf03eddc5293df263@mail.gmail.com>
Subject: [PATCH 1/2] Adding NAND lock / unlock routines
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From fdd0b28bb197e17f96bda00fa07384ef6d95b49d Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 13 Jan 2010 17:54:10 +0530
Subject: [PATCH] Adding nand lock/unlock routines.

Adding nand lock / unlock routines. At least 'micron' parts
support this.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |  204 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |   10 ++
 2 files changed, 214 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..4e27426 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -835,6 +835,208 @@ static int nand_wait(struct
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
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)ofs, len);
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
+	/* Start address must align on block boundary */
+	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Length must align on block boundary */
+	if (len & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
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
+	/* Start address must align on block boundary */
+	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Length must align on block boundary */
+	if (len & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
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
@@ -3077,6 +3279,8 @@ void nand_release(struct mtd_info *mtd)
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
@@ -38,6 +38,12 @@ extern void nand_release (struct
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

@@ -82,6 +88,10 @@ extern void nand_wait_ready(struct
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
1.5.5
