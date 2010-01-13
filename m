From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 13 Jan 2010 18:11:47 +0530
Subject: [PATCH] Creating helper func for block alignment verfication
Message-ID: <mailman.148.1263389387.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

These checks are fairly common in 'nand_erase_nand', 'nand_lock'
and 'nand_unlock' functions.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |   97 +++++++++++++++---------------------------
 1 files changed, 34 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4e27426..c80cec5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -108,6 +108,37 @@ static int nand_do_write_oob(struct
  */
 DEFINE_LED_TRIGGER(nand_led_trigger);

+static int block_alignment_verification(struct mtd_info *mtd,
+					loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)ofs, len);
+
+	/* Start address must align on block boundary */
+	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		ret = -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (len & ((1 << chip->phys_erase_shift) - 1)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
+					__func__);
+		ret = -EINVAL;
+	}
+
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
+					__func__);
+		ret = -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * nand_release_device - [GENERIC] release chip
  * @mtd:	MTD device structure
@@ -894,28 +925,8 @@ int nand_unlock(struct mtd_info
 	int chipnr;
 	struct nand_chip *chip = mtd->priv;

-	/* Start address must align on block boundary */
-	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/* Length must align on block boundary */
-	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		ret = -EINVAL;
+	if (block_alignment_verification(mtd, ofs, len))
 		goto out;
-	}
-
-	/* Do not allow past end of device */
-	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
-		ret = -EINVAL;
-		goto out;
-	}

 	/* Align to last block address if size addresses end of the device */
 	if (ofs + len == mtd->size)
@@ -968,31 +979,8 @@ int nand_lock(struct mtd_info
 	int chipnr, status, page;
 	struct nand_chip *chip = mtd->priv;

-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
-			__func__, (unsigned long long)ofs, len);
-
-	/* Start address must align on block boundary */
-	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/* Length must align on block boundary */
-	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		ret = -EINVAL;
+	if (block_alignment_verification(mtd, ofs, len))
 		goto out;
-	}
-
-	/* Do not allow past end of device */
-	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
-		ret = -EINVAL;
-		goto out;
-	}

 	nand_get_device(chip, mtd, FL_LOCKING);

@@ -2495,25 +2483,8 @@ int nand_erase_nand(struct
 				__func__, (unsigned long long)instr->addr,
 				(unsigned long long)instr->len);

-	/* Start address must align on block boundary */
-	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+	if (block_alignment_verification(mtd, instr->addr, instr->len))
 		return -EINVAL;
-	}
-
-	/* Length must align on block boundary */
-	if (instr->len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
-		return -EINVAL;
-	}
-
-	/* Do not allow erase past end of device */
-	if ((instr->len + instr->addr) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Erase past end of device\n",
-					__func__);
-		return -EINVAL;
-	}

 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;

-- 
1.5.5
