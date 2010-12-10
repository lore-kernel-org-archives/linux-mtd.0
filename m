From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Fri, 10 Dec 2010 12:04:20 +0200
Subject: [PATCH 7/7] mtd: OneNAND: lighten scary initial bad block messages
Message-ID: <mailman.52.1292242392.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Initial bad blocks are normal but the messages look like
errors.  Make the messages less scary, make the main
message an informational message not a warning, make the
message displaying registers a debug message and include
the address there instead of in the informational message.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   22 ++++++++++++----------
 drivers/mtd/onenand/onenand_bbt.c  |    4 ++--
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index bde274f..5065fc7 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1488,8 +1488,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 {
 	struct onenand_chip *this = mtd->priv;
 	unsigned long timeout;
-	unsigned int interrupt;
-	unsigned int ctrl;
+	unsigned int interrupt, ctrl, ecc, addr1, addr8;
 
 	/* The 20 msec is enough */
 	timeout = jiffies + msecs_to_jiffies(20);
@@ -1501,25 +1500,28 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 	/* To get correct interrupt status in timeout case */
 	interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+	addr1 = this->read_word(this->base + ONENAND_REG_START_ADDRESS1);
+	addr8 = this->read_word(this->base + ONENAND_REG_START_ADDRESS8);
 
 	if (interrupt & ONENAND_INT_READ) {
-		int ecc = onenand_read_ecc(this);
+		ecc = onenand_read_ecc(this);
 		if (ecc & ONENAND_ECC_2BIT_ALL) {
-			printk(KERN_WARNING "%s: ecc error = 0x%04x, "
-				"controller error 0x%04x\n",
-				__func__, ecc, ctrl);
+			printk(KERN_DEBUG "%s: ecc 0x%04x ctrl 0x%04x "
+			       "intr 0x%04x addr1 %#x addr8 %#x\n",
+			       __func__, ecc, ctrl, interrupt, addr1, addr8);
 			return ONENAND_BBT_READ_ECC_ERROR;
 		}
 	} else {
-		printk(KERN_ERR "%s: read timeout! ctrl=0x%04x intr=0x%04x\n",
-			__func__, ctrl, interrupt);
+		printk(KERN_ERR "%s: read timeout! ctrl 0x%04x "
+		       "intr 0x%04x addr1 %#x addr8 %#x\n",
+		       __func__, ctrl, interrupt, addr1, addr8);
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}
 
 	/* Initial bad block case: 0x2400 or 0x0400 */
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		printk(KERN_DEBUG "%s: controller error = 0x%04x\n",
-			__func__, ctrl);
+		printk(KERN_DEBUG "%s: ctrl 0x%04x intr 0x%04x addr1 %#x "
+		       "addr8 %#x\n", __func__, ctrl, interrupt, addr1, addr8);
 		return ONENAND_BBT_READ_ERROR;
 	}
 
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 905209b..fc2c16a 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -101,8 +101,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 			if (ret || check_short_pattern(&buf[j * scanlen],
 					       scanlen, this->writesize, bd)) {
 				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
-				printk(KERN_WARNING "Bad eraseblock %d@0x%08x\n",
-					i >> 1, (unsigned int) from);
+				printk(KERN_INFO "OneNAND eraseblock %d is an "
+					"initial bad block\n", i >> 1);
 				mtd->ecc_stats.badblocks++;
 				break;
 			}
-- 
1.7.0.4
