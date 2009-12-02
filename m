Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFq8H-0001f9-DH
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 14:24:46 +0000
Received: by bwz4 with SMTP id 4so214908bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Dec 2009 06:24:40 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 2 Dec 2009 19:54:20 +0530
Message-ID: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
Subject: [RFC][PATCH] Add NAND lock/unlock routines
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am not sure how useful it will be, but still here is a patch for review.
-vimal

From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 24 Nov 2009 18:26:43 +0530
Subject: [PATCH] Add NAND lock/unlock routines

At least 'Micron' NAND parts have lock/unlock feature.
Adding routines for this.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |  217 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h     |    6 +
 2 files changed, 221 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2957cc7..e447c24 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
struct nand_chip *chip)
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
+	page = (int)(ofs >> chip->page_shift);
+	chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagemask);
+
+	/* Submit address of last page to unlock */
+	page = (int)((ofs + len) >> chip->page_shift);
+	chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
+				((page | invert) & chip->pagemask));
+
+	/* Call wait ready function */
+	status = chip->waitfunc(mtd, chip);
+	udelay(1000);
+	/* See if device thinks it succeeded */
+	if (status & 0x01) {
+		/* There was an error */
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
+static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
+	if ((ofs + len) > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Align to last block address if size addresses end of the device */
+	if ((ofs + len) == mtd->size)
+		len -= mtd->erasesize;
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device(chip, mtd, FL_UNLOCKING);
+
+	/* Shift to get chip number */
+	chipnr = (int)(ofs >> chip->chip_shift);
+
+	/* Select the NAND device */
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
+	/* Deselect and wake up anyone waiting on the device */
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
+static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
+	if ((ofs + len) > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device(chip, mtd, FL_LOCKING);
+
+	/* Shift to get first page */
+	page = (int)(ofs >> chip->page_shift);
+	chipnr = (int)(ofs >> chip->chip_shift);
+
+	/* Select the NAND device */
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
+	/* Submit address of first page to unlock */
+	page = (int)(ofs >> chip->page_shift);
+	chip->cmdfunc(mtd, NAND_CMD_LOCK, -1, page & chip->pagemask);
+
+	/* Call wait ready function */
+	status = chip->waitfunc(mtd, chip);
+	udelay(1000);
+	/* See if device thinks it succeeded */
+	if (status & 0x01) {
+		/* There was an error */
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+					__func__, status);
+		ret = -EIO;
+		goto out;
+	}
+
+	if (len != -1)
+		ret = __nand_unlock(mtd, ofs, len, 0x1);
+
+out:
+	/* de-select the NAND device */
+	chip->select_chip(mtd, -1);
+
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+
+	return ret;
+}
+
+/**
  * nand_read_page_raw - [Intern] read raw page data without ecc
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -2257,6 +2469,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
erase_info *instr,

 		status = chip->waitfunc(mtd, chip);

+printk(KERN_INFO"VIMAL: status: 0x%x\n",status);
 		/*
 		 * See if operation failed and additional status checks are
 		 * available
@@ -2880,8 +3093,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->read_oob = nand_read_oob;
 	mtd->write_oob = nand_write_oob;
 	mtd->sync = nand_sync;
-	mtd->lock = NULL;
-	mtd->unlock = NULL;
+	mtd->lock = nand_lock;
+	mtd->unlock = nand_unlock;
 	mtd->suspend = nand_suspend;
 	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7a232a9..f2d97ea 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -80,6 +80,10 @@ extern void nand_wait_ready(struct mtd_info *mtd);
 #define NAND_CMD_ERASE2		0xd0
 #define NAND_CMD_RESET		0xff

+#define NAND_CMD_LOCK		0x2a
+#define NAND_CMD_UNLOCK1	0x23
+#define NAND_CMD_UNLOCK2	0x24
+
 /* Extended commands for large page devices */
 #define NAND_CMD_READSTART	0x30
 #define NAND_CMD_RNDOUTSTART	0xE0
@@ -214,6 +218,8 @@ typedef enum {
 	FL_SYNCING,
 	FL_CACHEDPRG,
 	FL_PM_SUSPENDED,
+	FL_LOCKING,
+	FL_UNLOCKING,
 } nand_state_t;

 /* Keep gcc happy */
-- 
1.5.5
