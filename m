From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 3 Feb 2010 14:12:24 +0530
Subject: [PATCH 1/2] Creating helper func for 'ofs' and 'len'
Message-ID: <mailman.189.1265212255.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

verification for 'nand_erase_nand'

These checks are expected to be used by 'nand_lock' and 'nand_unlock'
routines too. As all these three are block aligned operations.
So, creating a helper function for this makes sense.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/nand_base.c |   48 ++++++++++++++++++++++++++---------------
 1 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..2dfeb4b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -108,6 +108,35 @@ static int nand_do_write_oob(struct
  */
 DEFINE_LED_TRIGGER(nand_led_trigger);

+static int check_offs_len(struct mtd_info *mtd,
+					loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret = 0;
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
+	return ret;
+}
+
 /**
  * nand_release_device - [GENERIC] release chip
  * @mtd:	MTD device structure
@@ -2293,25 +2322,8 @@ int nand_erase_nand(struct
 				__func__, (unsigned long long)instr->addr,
 				(unsigned long long)instr->len);

-	/* Start address must align on block boundary */
-	if (instr->addr & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
-		return -EINVAL;
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
+	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
-	}

 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;

-- 
1.6.3.3
