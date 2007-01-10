Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4eL3-0001RE-H4
	for linux-mtd@lists.infradead.org; Wed, 10 Jan 2007 09:22:05 -0500
Message-ID: <45A4F65B.2060805@nokia.com>
Date: Wed, 10 Jan 2007 16:21:15 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] [MTD] OneNAND: Always print error messages
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change important error messages to always print rather than
being dependent on MTD debug settings.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   36 +++++++++++++++++++-----------------
 1 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7480776..02ad959 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -317,16 +317,16 @@ static int onenand_wait(struct mtd_info 
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error = 0x%04x\n", ctrl);
+		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error.\n");
+			printk(KERN_ERR "onenand_wait: it's locked error.\n");
 		return ctrl;
 	}
 
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 		if (ecc) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error = 0x%04x\n", ecc);
+			printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				mtd->ecc_stats.failed++;
 				return ecc;
@@ -716,7 +716,7 @@ static int onenand_read(struct mtd_info 
 
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read: Attempt read beyond end of device\n");
+		printk(KERN_ERR "onenand_read: Attempt read beyond end of device\n");
 		*retlen = 0;
 		return -EINVAL;
 	}
@@ -778,6 +778,8 @@ static int onenand_read(struct mtd_info 
 		ret = this->wait(mtd, FL_READING);
 		onenand_update_bufferram(mtd, from, !ret);
 	}
+	if (ret)
+		printk(KERN_ERR "onenand_read: read failed = %d\n", ret);
 
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
@@ -822,7 +824,7 @@ int onenand_do_read_oob(struct mtd_info 
 
 	/* Do not allow reads past end of device */
 	if (unlikely((from + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempt read beyond end of device\n");
+		printk(KERN_ERR "onenand_read_oob: Attempt read beyond end of device\n");
 		return -EINVAL;
 	}
 
@@ -845,7 +847,7 @@ int onenand_do_read_oob(struct mtd_info 
 		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
 
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read failed = 0x%x\n", ret);
+			printk(KERN_ERR "onenand_read_oob: read failed = 0x%x\n", ret);
 			goto out;
 		}
 
@@ -984,13 +986,13 @@ static int onenand_write(struct mtd_info
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write: Attempt write to past end of device\n");
 		return -EINVAL;
 	}
 
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
-                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt to write not page aligned data\n");
+                printk(KERN_ERR "onenand_write: Attempt to write not page aligned data\n");
                 return -EINVAL;
         }
 
@@ -1028,14 +1030,14 @@ static int onenand_write(struct mtd_info
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write: write filaed %d\n", ret);
 			break;
 		}
 
 		/* Only check verify write turn on */
 		ret = onenand_verify_page(mtd, (u_char *) wbuf, to);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write: verify failed %d\n", ret);
 			break;
 		}
 
@@ -1081,7 +1083,7 @@ static int onenand_do_write_oob(struct m
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write_oob: Attempt write to past end of device\n");
 		return -EINVAL;
 	}
 
@@ -1108,13 +1110,13 @@ static int onenand_do_write_oob(struct m
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: write failed %d\n", ret);
 			goto out;
 		}
 
 		ret = onenand_verify_oob(mtd, buf, to, thislen);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: verify failed %d\n", ret);
 			goto out;
 		}
 
@@ -1191,19 +1193,19 @@ static int onenand_erase(struct mtd_info
 
 	/* Start address must align on block boundary */
 	if (unlikely(instr->addr & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Unaligned address\n");
+		printk(KERN_ERR "onenand_erase: Unaligned address\n");
 		return -EINVAL;
 	}
 
 	/* Length must align on block boundary */
 	if (unlikely(instr->len & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Length not block aligned\n");
+		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
 		return -EINVAL;
 	}
 
 	/* Do not allow erase past end of device */
 	if (unlikely((instr->len + instr->addr) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Erase past end of device\n");
+		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
 		return -EINVAL;
 	}
 
@@ -1231,7 +1233,7 @@ static int onenand_erase(struct mtd_info
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
-- 
1.4.3
