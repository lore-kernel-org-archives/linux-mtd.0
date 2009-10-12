Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHaO-0001Tt-Mb
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:53:08 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
Date: Mon, 12 Oct 2009 12:52:44 +0300
Message-Id: <1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
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

Add support for multiblock erase command. OneNANDs (excluding Flex-OneNAND)
are capable of simultaneous erase of up to 64 eraseblocks which is much faster.

This changes the erase requests for regions covering multiple eraseblocks
to be performed using multiblock erase.

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/onenand/omap2.c        |   22 ++++-
 drivers/mtd/onenand/onenand_base.c |  173 +++++++++++++++++++++++++++++++++++-
 include/linux/mtd/flashchip.h      |    4 +-
 include/linux/mtd/onenand_regs.h   |    2 +
 4 files changed, 194 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 0108ed4..2dafd09 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -112,10 +112,24 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 	unsigned long timeout;
 	u32 syscfg;
 
-	if (state == FL_RESETING) {
-		int i;
+	if (state == FL_RESETING || state == FL_PREPARING_ERASE ||
+	    state == FL_VERIFYING_ERASE) {
+		int i = 21;
+		unsigned int intr_flags = ONENAND_INT_MASTER;
+
+		switch (state) {
+		case FL_RESETING:
+			intr_flags |= ONENAND_INT_RESET;
+			break;
+		case FL_PREPARING_ERASE:
+			intr_flags |= ONENAND_INT_ERASE;
+			break;
+		case FL_VERIFYING_ERASE:
+			i = 101;
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
+		if ((intr & intr_flags) != intr_flags) {
 			wait_err("timeout", state, ctrl, intr);
 			return -EIO;
 		}
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 51f4782..7355f62 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -32,6 +32,13 @@
 
 #include <asm/io.h>
 
+/*
+ * Multiblock erase if number of blocks to erase is 2 or more.
+ * Maximum number of blocks for simultaneous erase is 64.
+ */
+#define MB_ERASE_MIN_BLK_COUNT 2
+#define MB_ERASE_MAX_BLK_COUNT 64
+
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };
 
@@ -339,6 +346,8 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		break;
 
 	case ONENAND_CMD_ERASE:
+	case ONENAND_CMD_MULTIBLOCK_ERASE:
+	case ONENAND_CMD_ERASE_VERIFY:
 	case ONENAND_CMD_BUFFERRAM:
 	case ONENAND_CMD_OTP_ACCESS:
 		block = onenand_block(this, addr);
@@ -483,7 +492,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		if (interrupt & flags)
 			break;
 
-		if (state != FL_READING)
+		if (state != FL_READING && state != FL_PREPARING_ERASE)
 			cond_resched();
 	}
 	/* To get correct interrupt status in timeout case */
@@ -516,6 +525,18 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		return -EIO;
 	}
 
+	if (state == FL_PREPARING_ERASE && !(interrupt & ONENAND_INT_ERASE)) {
+		printk(KERN_ERR "%s: mb erase timeout! ctrl=0x%04x intr=0x%04x\n",
+		       __func__, ctrl, interrupt);
+		return -EIO;
+	}
+
+	if (!(interrupt & ONENAND_INT_MASTER)) {
+		printk(KERN_ERR "%s: timeout! ctrl=0x%04x intr=0x%04x\n",
+		       __func__, ctrl, interrupt);
+		return -EIO;
+	}
+
 	/* If there's controller error, it's a real error */
 	if (ctrl & ONENAND_CTRL_ERROR) {
 		printk(KERN_ERR "%s: controller error = 0x%04x\n",
@@ -2168,6 +2189,148 @@ static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allo
 	return bbm->isbad_bbt(mtd, ofs, allowbbt);
 }
 
+
+static int onenand_multiblock_erase_verify(struct mtd_info *mtd,
+					   struct erase_info *instr)
+{
+	struct onenand_chip *this = mtd->priv;
+	loff_t addr = instr->addr;
+	int len = instr->len;
+	unsigned int block_size = (1 << this->erase_shift);
+	int ret = 0;
+
+	while (len) {
+		this->command(mtd, ONENAND_CMD_ERASE_VERIFY, addr, block_size);
+		ret = this->wait(mtd, FL_VERIFYING_ERASE);
+		if (ret) {
+			printk(KERN_ERR "%s: Failed verify, block %d\n",
+			       __func__, onenand_block(this, addr));
+			instr->state = MTD_ERASE_FAILED;
+			instr->fail_addr = addr;
+			return -1;
+		}
+		len -= block_size;
+		addr += block_size;
+	}
+	return 0;
+}
+
+/**
+ * onenand_multiblock_erase - [Internal] erase block(s) using multiblock erase
+ * @param mtd		MTD device structure
+ * @param instr		erase instruction
+ * @param region	erase region
+ *
+ * Erase one or more blocks up to 64 block at a time
+ */
+static int onenand_multiblock_erase(struct mtd_info *mtd,
+				    struct erase_info *instr,
+				    unsigned int block_size)
+{
+	struct onenand_chip *this = mtd->priv;
+	loff_t addr = instr->addr;
+	int len = instr->len;
+	int eb_count = 0;
+	int ret = 0;
+	int bdry_block = 0;
+
+	instr->state = MTD_ERASING;
+
+	if (ONENAND_IS_DDP(this)) {
+		loff_t bdry_addr = this->chipsize >> 1;
+		if (addr < bdry_addr && (addr + len) > bdry_addr)
+			bdry_block = bdry_addr >> this->erase_shift;
+	}
+
+	/* Pre-check bbs */
+	while (len) {
+		/* Check if we have a bad block, we do not erase bad blocks */
+		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
+			printk(KERN_WARNING "%s: attempt to erase a bad block "
+			       "at addr 0x%012llx\n",
+			       __func__, (unsigned long long) addr);
+			instr->state = MTD_ERASE_FAILED;
+			return -EIO;
+		}
+		len -= block_size;
+		addr += block_size;
+	}
+
+	len = instr->len;
+	addr = instr->addr;
+
+	/* loop over 64 eb batches */
+	while (len) {
+		struct erase_info verify_instr = *instr;
+		int max_eb_count = MB_ERASE_MAX_BLK_COUNT;
+
+		verify_instr.addr = addr;
+		verify_instr.len = 0;
+
+		/* do not cross chip boundary */
+		if (bdry_block) {
+			int this_block = (addr >> this->erase_shift);
+
+			if (this_block < bdry_block) {
+				max_eb_count = min(max_eb_count,
+						   (bdry_block - this_block));
+			}
+		}
+
+		eb_count = 0;
+
+		while (len > block_size && eb_count < (max_eb_count - 1)) {
+			this->command(mtd, ONENAND_CMD_MULTIBLOCK_ERASE,
+				      addr, block_size);
+			onenand_invalidate_bufferram(mtd, addr, block_size);
+
+			ret = this->wait(mtd, FL_PREPARING_ERASE);
+			if (ret) {
+				printk(KERN_ERR "%s: Failed multiblock erase, "
+				       "block %d\n", __func__,
+				       onenand_block(this, addr));
+				instr->state = MTD_ERASE_FAILED;
+				instr->fail_addr = addr;
+				return -EIO;
+			}
+
+			len -= block_size;
+			addr += block_size;
+			eb_count++;
+		}
+
+		/* last block of 64-eb series */
+		cond_resched();
+		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
+		onenand_invalidate_bufferram(mtd, addr, block_size);
+
+		ret = this->wait(mtd, FL_ERASING);
+		/* Check if it is write protected */
+		if (ret) {
+			printk(KERN_ERR "%s: Failed erase, block %d\n",
+			       __func__, onenand_block(this, addr));
+			instr->state = MTD_ERASE_FAILED;
+			instr->fail_addr = addr;
+			return -EIO;
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
+			return -EIO;
+		}
+
+	}
+	return 0;
+}
+
+
 /**
  * onenand_block_by_block_erase - [Internal] erase block(s) using regular erase
  * @param mtd		MTD device structure
@@ -2301,7 +2464,13 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_ERASING);
 
-	ret = onenand_block_by_block_erase(mtd, instr, region, block_size);
+	if (region || instr->len < MB_ERASE_MIN_BLK_COUNT * block_size) {
+		/* region is set for Flex-OneNAND (no mb erase) */
+		ret = onenand_block_by_block_erase(mtd, instr,
+						   region, block_size);
+	} else {
+		ret = onenand_multiblock_erase(mtd, instr, block_size);
+	}
 
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index f350a48..d0bf422 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -41,9 +41,11 @@ typedef enum {
 	/* These 2 come from nand_state_t, which has been unified here */
 	FL_READING,
 	FL_CACHEDPRG,
-	/* These 2 come from onenand_state_t, which has been unified here */
+	/* These 4 come from onenand_state_t, which has been unified here */
 	FL_RESETING,
 	FL_OTPING,
+	FL_PREPARING_ERASE,
+	FL_VERIFYING_ERASE,
 
 	FL_UNKNOWN
 } flstate_t;
diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand_regs.h
index acadbf5..cd6f3b4 100644
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
1.6.0.4
