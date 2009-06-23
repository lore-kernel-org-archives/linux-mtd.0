Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ3mY-0003J8-Qy
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 11:03:36 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: OneNAND: multiblock erase support
Date: Tue, 23 Jun 2009 14:02:55 +0300
Message-Id: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: amul.saha@samsung.com, kyungmin.park@samsung.com,
	Mika Korhonen <ext-mika.2.korhonen@nokia.com>, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for multiblock erase command. OneNANDs (excluding Flex-OneNAND)
are capable of simultaneous erase of up to 64 eraseblocks.
This changes the erase requests for regions covering multiple eraseblocks
to be performed using multiblock erase.

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/onenand/omap2.c        |   22 +++-
 drivers/mtd/onenand/onenand_base.c |  268 ++++++++++++++++++++++++++++-------
 include/linux/mtd/onenand.h        |    2 +
 include/linux/mtd/onenand_regs.h   |    2 +
 4 files changed, 236 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 38d656b..044621c 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -112,10 +112,24 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 	unsigned long timeout;
 	u32 syscfg;
 
-	if (state == FL_RESETING) {
-		int i;
+	if (state == FL_RESETING || state == FL_PREPARING_ERASE ||
+		state == FL_VERIFYING_ERASE) {
+
+		int i = 21;
+		unsigned int intr_flags = ONENAND_INT_MASTER;
+		switch (state) {
+		case FL_RESETING:
+			intr_flags |= ONENAND_INT_RESET;
+			break;
+		case FL_PREPARING_ERASE:
+			intr_flags |= ONENAND_INT_ERASE;
+			break;
+		case FL_VERIFYING_ERASE:
+			i = 51;
+			break;
+		}
 
-		for (i = 0; i < 20; i++) {
+		while (--i) {
 			udelay(1);
 			intr = read_reg(c, ONENAND_REG_INTERRUPT);
 			if (intr & ONENAND_INT_MASTER)
@@ -126,7 +140,7 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 			wait_err("controller error", state, ctrl, intr);
 			return -EIO;
 		}
-		if (!(intr & ONENAND_INT_RESET)) {
+		if (!(intr & intr_flags)) {
 			wait_err("timeout", state, ctrl, intr);
 			return -EIO;
 		}
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6e82909..1b36277 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -32,6 +32,12 @@
 
 #include <asm/io.h>
 
+/* Multiblock erase if number of blocks to erase is 2 or more.
+   Maximum number of blocks for simultaneous erase is 64. */
+#define MB_ERASE_MIN_BLK_COUNT 2
+#define MB_ERASE_MAX_BLK_COUNT 64
+
+
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };
 
@@ -339,6 +345,8 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		break;
 
 	case ONENAND_CMD_ERASE:
+	case ONENAND_CMD_MULTIBLOCK_ERASE:
+	case ONENAND_CMD_ERASE_VERIFY:
 	case ONENAND_CMD_BUFFERRAM:
 	case ONENAND_CMD_OTP_ACCESS:
 		block = onenand_block(this, addr);
@@ -483,7 +491,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		if (interrupt & flags)
 			break;
 
-		if (state != FL_READING)
+		if (state != FL_READING && state != FL_PREPARING_ERASE)
 			cond_resched();
 	}
 	/* To get correct interrupt status in timeout case */
@@ -513,6 +521,18 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		return -EIO;
 	}
 
+	if (state == FL_PREPARING_ERASE && !(interrupt & ONENAND_INT_ERASE)) {
+		printk(KERN_ERR "onenand_wait: mb erase timeout! ctrl=0x%04x intr=0x%04x\n",
+			ctrl, interrupt);
+		return -EIO;
+	}
+
+	if (!(interrupt & ONENAND_INT_MASTER)) {
+		printk(KERN_ERR "onenand_wait: timeout! ctrl=0x%04x intr=0x%04x\n",
+			ctrl, interrupt);
+		return -EIO;
+	}
+
 	/* If there's controller error, it's a real error */
 	if (ctrl & ONENAND_CTRL_ERROR) {
 		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n",
@@ -2140,70 +2160,144 @@ static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allo
 	return bbm->isbad_bbt(mtd, ofs, allowbbt);
 }
 
-/**
- * onenand_erase - [MTD Interface] erase block(s)
- * @param mtd		MTD device structure
- * @param instr		erase instruction
- *
- * Erase one ore more blocks
- */
-static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
+
+static int onenand_multiblock_erase_verify(struct mtd_info *mtd,
+					   struct erase_info *instr)
 {
 	struct onenand_chip *this = mtd->priv;
-	unsigned int block_size;
 	loff_t addr = instr->addr;
-	loff_t len = instr->len;
-	int ret = 0, i;
-	struct mtd_erase_region_info *region = NULL;
-	loff_t region_end = 0;
+	int len = instr->len;
+	unsigned int block_size = (1 << this->erase_shift);
+	int ret = 0;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
+	while (len) {
+		this->command(mtd, ONENAND_CMD_ERASE_VERIFY, addr, block_size);
+		ret = this->wait(mtd, FL_VERIFYING_ERASE);
+		if (ret) {
+			printk(KERN_ERR "onenand_multiblock_erase_verify: "
+			       "Failed verify, block %d\n", onenand_block(this, addr));
+			instr->state = MTD_ERASE_FAILED;
+			instr->fail_addr = addr;
+			return -1;
+		}
+		len -= block_size;
+		addr += block_size;
+	}
+	return 0;
+}
 
-	/* Do not allow erase past end of device */
-	if (unlikely((len + addr) > mtd->size)) {
-		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
-		return -EINVAL;
+
+static int onenand_multiblock_erase(struct mtd_info *mtd,
+				    struct erase_info *instr)
+{
+	struct onenand_chip *this = mtd->priv;
+	loff_t addr = instr->addr;
+	int len = instr->len;
+	unsigned int block_size = (1 << this->erase_shift);
+	int eb_count = 0;
+	int ret = 0;
+
+	instr->state = MTD_ERASING;
+
+	/* Pre-check bbs */
+	while (len) {
+		/* Check if we have a bad block, we do not erase bad blocks */
+		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
+			printk(KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);
+			instr->state = MTD_ERASE_FAILED;
+			return -1;
+		}
+		len -= block_size;
+		addr += block_size;
 	}
 
-	if (FLEXONENAND(this)) {
-		/* Find the eraseregion of this address */
-		i = flexonenand_region(mtd, addr);
-		region = &mtd->eraseregions[i];
+	len = instr->len;
+	addr = instr->addr;
 
-		block_size = region->erasesize;
-		region_end = region->offset + region->erasesize * region->numblocks;
 
-		/* Start address within region must align on block boundary.
-		 * Erase region's start offset is always block start address.
-		 */
-		if (unlikely((addr - region->offset) & (block_size - 1))) {
-			printk(KERN_ERR "onenand_erase: Unaligned address\n");
-			return -EINVAL;
+	/* loop over 64 eb batches */
+	while (len) {
+		struct erase_info verify_instr = *instr;
+		verify_instr.addr = addr;
+		verify_instr.len = 0;
+
+		eb_count = 0;
+
+		while (len > block_size &&
+		       eb_count < (MB_ERASE_MAX_BLK_COUNT - 1)) {
+			this->command(mtd, ONENAND_CMD_MULTIBLOCK_ERASE, addr, block_size);
+			onenand_invalidate_bufferram(mtd, addr, block_size);
+
+			ret = this->wait(mtd, FL_PREPARING_ERASE);
+			if (ret) {
+				printk(KERN_ERR "onenand_multiblock_erase: "
+				       "Failed multiblock erase, block %d\n",
+				       onenand_block(this, addr));
+				instr->state = MTD_ERASE_FAILED;
+				instr->fail_addr = addr;
+				return -1;
+			}
+
+			len -= block_size;
+			addr += block_size;
+			eb_count++;
 		}
-	} else {
-		block_size = 1 << this->erase_shift;
 
-		/* Start address must align on block boundary */
-		if (unlikely(addr & (block_size - 1))) {
-			printk(KERN_ERR "onenand_erase: Unaligned address\n");
-			return -EINVAL;
+		/* last block of 64-eb series */
+		cond_resched();
+		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
+		onenand_invalidate_bufferram(mtd, addr, block_size);
+
+		ret = this->wait(mtd, FL_ERASING);
+		/* Check, if it is write protected */
+		if (ret) {
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
+			       onenand_block(this, addr));
+			instr->state = MTD_ERASE_FAILED;
+			instr->fail_addr = addr;
+			return -1;
+		}
+
+		len -= block_size;
+		addr += block_size;
+		eb_count++;
+
+		/* verify */
+		verify_instr.len = eb_count * block_size;
+		if (onenand_multiblock_erase_verify(mtd, &verify_instr)) {
+			instr->state = verify_instr.state;
+			instr->fail_addr = verify_instr.fail_addr;
+			return -1;
 		}
-	}
 
-	/* Length must align on block boundary */
-	if (unlikely(len & (block_size - 1))) {
-		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
-		return -EINVAL;
 	}
+	return 0;
+}
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_ERASING);
 
-	/* Loop throught the pages */
+static int onenand_single_block_erase(struct mtd_info *mtd,
+				      struct erase_info *instr,
+				      struct mtd_erase_region_info *region)
+{
+	struct onenand_chip *this = mtd->priv;
+	loff_t addr = instr->addr;
+	int len = instr->len;
+	unsigned int block_size;
+	loff_t region_end = 0;
+	int ret = 0;
+
+	if (region) {
+		/* region is set for Flex-OneNAND */
+		block_size = region->erasesize;
+		region_end = region->offset + region->erasesize * region->numblocks;
+	} else {
+		block_size = (1 << this->erase_shift);
+	}
+
 	instr->state = MTD_ERASING;
 
+	/* Loop through the blocks */
 	while (len) {
 		cond_resched();
 
@@ -2211,7 +2305,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
 			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);
 			instr->state = MTD_ERASE_FAILED;
-			goto erase_exit;
+			return -1;
 		}
 
 		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
@@ -2222,10 +2316,10 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		/* Check, if it is write protected */
 		if (ret) {
 			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
-						 onenand_block(this, addr));
+			       onenand_block(this, addr));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
-			goto erase_exit;
+			return -1;
 		}
 
 		len -= block_size;
@@ -2235,24 +2329,90 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 			if (!len)
 				break;
 			region++;
-
 			block_size = region->erasesize;
 			region_end = region->offset + region->erasesize * region->numblocks;
 
 			if (len & (block_size - 1)) {
 				/* FIXME: This should be handled at MTD partitioning level. */
 				printk(KERN_ERR "onenand_erase: Unaligned address\n");
-				goto erase_exit;
+				return -1;
 			}
 		}
+	}
+
+	return 0;
+}
+
+
+/**
+ * onenand_erase - [MTD Interface] erase block(s)
+ * @param mtd		MTD device structure
+ * @param instr		erase instruction
+ *
+ * Erase one ore more blocks
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
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
 
+	/* Do not allow erase past end of device */
+	if (unlikely((len + addr) > mtd->size)) {
+		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
+		return -EINVAL;
 	}
 
-	instr->state = MTD_ERASE_DONE;
+	if (FLEXONENAND(this)) {
+		/* Find the eraseregion of this address */
+		int i = flexonenand_region(mtd, addr);
+		region = &mtd->eraseregions[i];
+		block_size = region->erasesize;
 
-erase_exit:
+		/* Start address within region must align on block boundary.
+		 * Erase region's start offset is always block start address.
+		 */
+		region_offset = region->offset;
+	} else {
+		block_size = 1 << this->erase_shift;
+	}
 
-	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
+	/* Start address must align on block boundary */
+	if (unlikely((addr - region_offset) & (block_size - 1))) {
+		printk(KERN_ERR "onenand_erase: Unaligned address\n");
+		return -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (unlikely(len & (block_size - 1))) {
+		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
+		return -EINVAL;
+	}
+
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_ERASING);
+
+
+	if (region || instr->len < MB_ERASE_MIN_BLK_COUNT * block_size) {
+		/* region is set for Flex-OneNAND (no mb erase) */
+		ret = onenand_single_block_erase(mtd, instr, region);
+	} else {
+		ret = onenand_multiblock_erase(mtd, instr);
+	}
+
+	if (ret) {
+		ret = -EIO;
+	} else {
+		instr->state = MTD_ERASE_DONE;
+	}
 
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 8ed8733..42384f3 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -39,6 +39,8 @@ typedef enum {
 	FL_RESETING,
 	FL_OTPING,
 	FL_PM_SUSPENDED,
+	FL_PREPARING_ERASE,
+	FL_VERIFYING_ERASE
 } onenand_state_t;
 
 /**
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index 86a6bbe..bd346e5 100644
--- a/include/linux/mtd/onenand_regs.h
+++ b/include/linux/mtd/onenand_regs.h
@@ -131,6 +131,8 @@
 #define ONENAND_CMD_LOCK_TIGHT		(0x2C)
 #define ONENAND_CMD_UNLOCK_ALL		(0x27)
 #define ONENAND_CMD_ERASE		(0x94)
+#define ONENAND_CMD_MULTIBLOCK_ERASE	(0x95)
+#define ONENAND_CMD_ERASE_VERIFY	(0x71)
 #define ONENAND_CMD_RESET		(0xF0)
 #define ONENAND_CMD_OTP_ACCESS		(0x65)
 #define ONENAND_CMD_READID		(0x90)
-- 
1.5.6.5
