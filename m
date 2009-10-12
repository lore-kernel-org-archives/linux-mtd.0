Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHaN-0001Tu-O3
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:53:04 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 1/3] MTD: OneNAND: move erase method to a separate function
Date: Mon, 12 Oct 2009 12:52:43 +0300
Message-Id: <1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: amul.saha@samsung.com, artem.bityutskiy@nokia.com,
	kyungmin.park@samsung.com, Mika Korhonen <ext-mika.2.korhonen@nokia.com>,
	adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Separate the actual execution of erase to a new function:
onenand_block_by_block_erase(). This is done in preparation for
the multiblock erase support.

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |  132 +++++++++++++++++++++---------------
 1 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6e250f3..51f4782 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2169,69 +2169,33 @@ static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allo
 }
 
 /**
- * onenand_erase - [MTD Interface] erase block(s)
+ * onenand_block_by_block_erase - [Internal] erase block(s) using regular erase
  * @param mtd		MTD device structure
  * @param instr		erase instruction
+ * @param region	erase region
+ * @param block_size	erase block size
  *
- * Erase one ore more blocks
+ * Erase one or more blocks one block at a time
  */
-static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
+static int onenand_block_by_block_erase(struct mtd_info *mtd,
+					struct erase_info *instr,
+					struct mtd_erase_region_info *region,
+					unsigned int block_size)
 {
 	struct onenand_chip *this = mtd->priv;
-	unsigned int block_size;
 	loff_t addr = instr->addr;
-	loff_t len = instr->len;
-	int ret = 0, i;
-	struct mtd_erase_region_info *region = NULL;
+	int len = instr->len;
 	loff_t region_end = 0;
+	int ret = 0;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
-
-	/* Do not allow erase past end of device */
-	if (unlikely((len + addr) > mtd->size)) {
-		printk(KERN_ERR "%s: Erase past end of device\n", __func__);
-		return -EINVAL;
-	}
-
-	if (FLEXONENAND(this)) {
-		/* Find the eraseregion of this address */
-		i = flexonenand_region(mtd, addr);
-		region = &mtd->eraseregions[i];
-
-		block_size = region->erasesize;
+	if (region) {
+		/* region is set for Flex-OneNAND */
 		region_end = region->offset + region->erasesize * region->numblocks;
-
-		/* Start address within region must align on block boundary.
-		 * Erase region's start offset is always block start address.
-		 */
-		if (unlikely((addr - region->offset) & (block_size - 1))) {
-			printk(KERN_ERR "%s: Unaligned address\n", __func__);
-			return -EINVAL;
-		}
-	} else {
-		block_size = 1 << this->erase_shift;
-
-		/* Start address must align on block boundary */
-		if (unlikely(addr & (block_size - 1))) {
-			printk(KERN_ERR "%s: Unaligned address\n", __func__);
-			return -EINVAL;
-		}
-	}
-
-	/* Length must align on block boundary */
-	if (unlikely(len & (block_size - 1))) {
-		printk(KERN_ERR "%s: Length not block aligned\n", __func__);
-		return -EINVAL;
 	}
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_ERASING);
-
-	/* Loop through the blocks */
 	instr->state = MTD_ERASING;
 
+	/* Loop through the blocks */
 	while (len) {
 		cond_resched();
 
@@ -2241,7 +2205,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 					"at addr 0x%012llx\n",
 					__func__, (unsigned long long) addr);
 			instr->state = MTD_ERASE_FAILED;
-			goto erase_exit;
+			return -EIO;
 		}
 
 		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
@@ -2255,7 +2219,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 				__func__, onenand_block(this, addr));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
-			goto erase_exit;
+			return -EIO;
 		}
 
 		len -= block_size;
@@ -2273,24 +2237,80 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 				/* FIXME: This should be handled at MTD partitioning level. */
 				printk(KERN_ERR "%s: Unaligned address\n",
 					__func__);
-				goto erase_exit;
+				return -EIO;
 			}
 		}
+	}
+	return 0;
+}
+
+/**
+ * onenand_erase - [MTD Interface] erase block(s)
+ * @param mtd		MTD device structure
+ * @param instr		erase instruction
+ *
+ * Erase one or more blocks
+ */
+static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned int block_size;
+	loff_t addr = instr->addr;
+	loff_t len = instr->len;
+	int ret = 0;
+	struct mtd_erase_region_info *region = NULL;
+	loff_t region_offset = 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: start=0x%012llx, len=%llu\n", __func__,
+	      (unsigned long long) instr->addr, (unsigned long long) instr->len);
+
+	/* Do not allow erase past end of device */
+	if (unlikely((len + addr) > mtd->size)) {
+		printk(KERN_ERR "%s: Erase past end of device\n", __func__);
+		return -EINVAL;
+	}
+
+	if (FLEXONENAND(this)) {
+		/* Find the eraseregion of this address */
+		int i = flexonenand_region(mtd, addr);
+
+		region = &mtd->eraseregions[i];
+		block_size = region->erasesize;
+
+		/* Start address within region must align on block boundary.
+		 * Erase region's start offset is always block start address.
+		 */
+		region_offset = region->offset;
+	} else
+		block_size = 1 << this->erase_shift;
+
+	/* Start address must align on block boundary */
+	if (unlikely((addr - region_offset) & (block_size - 1))) {
+		printk(KERN_ERR "%s: Unaligned address\n", __func__);
+		return -EINVAL;
+	}
 
+	/* Length must align on block boundary */
+	if (unlikely(len & (block_size - 1))) {
+		printk(KERN_ERR "%s: Length not block aligned\n", __func__);
+		return -EINVAL;
 	}
 
-	instr->state = MTD_ERASE_DONE;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
-erase_exit:
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_ERASING);
 
-	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
+	ret = onenand_block_by_block_erase(mtd, instr, region, block_size);
 
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
 
 	/* Do call back function */
-	if (!ret)
+	if (!ret) {
+		instr->state = MTD_ERASE_DONE;
 		mtd_erase_callback(instr);
+	}
 
 	return ret;
 }
-- 
1.6.0.4
