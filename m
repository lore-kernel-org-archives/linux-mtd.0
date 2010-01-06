Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSWFk-0006SL-4C
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 13:48:53 +0000
Received: by bwz4 with SMTP id 4so10821310bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 05:48:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<1259915925.8673.9.camel@localhost>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
	<1260185336.3047.0.camel@localhost>
	<ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 6 Jan 2010 19:18:25 +0530
Message-ID: <ce9ab5791001060548g6075dcd5tb15bcd18c9a4b458@mail.gmail.com>
Subject: [PATCH - V2] Add NAND lock/unlock routines
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

Here is the 2nd version of this patch after removing extra braces as
suggested by Artem.

-vimal

>From 2dc40c3d42c14ac7e73ec8a9a1ccf9e524385263 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 6 Jan 2010 18:13:01 +0530
Subject: [PATCH] Add NAND lock/unlock routines

At least 'Micron' NAND parts have lock/unlock feature.
Adding routines for this.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |  216 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h     |    4 +
 2 files changed, 218 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..2ceec1c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -835,6 +835,218 @@ static int nand_wait(struct mtd_info
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
+	page = (int)(ofs + len >> chip->page_shift);
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
+	if (ofs + len > mtd->size) {
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
@@ -2999,8 +3211,8 @@ int nand_scan_tail(struct mtd_info *mtd)
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
index ccab9df..698eada 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -82,6 +82,10 @@ extern void nand_wait_ready(struct mtd_info *mtd);
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
