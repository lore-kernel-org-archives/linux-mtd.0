Received: from [210.94.41.89] (helo=party)
	by bombadil.infradead.org with esmtpsa (Exim 4.68 #1 (Red Hat Linux))
	id 1K1bJt-0004ru-Qe
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 06:09:03 +0000
Date: Thu, 29 May 2008 14:52:40 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][OneNAND] Check the ECC status first instead of controller
Message-ID: <20080529055240.GA11470@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To get the correct information in case of power off recovery,
it should read ECC status first
Also remove previous workaround method.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 5d7965f..5c26b0d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -325,28 +325,11 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
-	if (ctrl & ONENAND_CTRL_ERROR) {
-		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
-		if (ctrl & ONENAND_CTRL_LOCK)
-			printk(KERN_ERR "onenand_wait: it's locked error.\n");
-		if (state == FL_READING) {
-			/*
-			 * A power loss while writing can result in a page
-			 * becoming unreadable.  When the device is mounted
-			 * again, reading that page gives controller errors.
-			 * Upper level software like JFFS2 treat -EIO as fatal,
-			 * refusing to mount at all.  That means it is necessary
-			 * to treat the error as an ECC error to allow recovery.
-			 * Note that typically in this case, the eraseblock can
-			 * still be erased and rewritten i.e. it has not become
-			 * a bad block.
-			 */
-			mtd->ecc_stats.failed++;
-			return -EBADMSG;
-		}
-		return -EIO;
-	}
-
+	/*
+	 * In the Spec. it checks the controller status first
+	 * However if you get the correct information in case of
+	 * power off recovery (POR) test, it should read ECC status first
+	 */
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 		if (ecc) {
@@ -364,6 +347,15 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		return -EIO;
 	}
 
+	/* If there's controller error, it's a real error */
+	if (ctrl & ONENAND_CTRL_ERROR) {
+		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n",
+			ctrl);
+		if (ctrl & ONENAND_CTRL_LOCK)
+			printk(KERN_ERR "onenand_wait: it's locked error.\n");
+		return -EIO;
+	}
+
 	return 0;
 }
 
@@ -1135,22 +1127,26 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 	interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
-	/* Initial bad block case: 0x2400 or 0x0400 */
-	if (ctrl & ONENAND_CTRL_ERROR) {
-		printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
-		return ONENAND_BBT_READ_ERROR;
-	}
-
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
-		if (ecc & ONENAND_ECC_2BIT_ALL)
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			printk(KERN_INFO "onenand_bbt_wait: ecc error = 0x%04x"
+				", controller error 0x%04x\n", ecc, ctrl);
 			return ONENAND_BBT_READ_ERROR;
+		}
 	} else {
 		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
 			"ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}
 
+	/* Initial bad block case: 0x2400 or 0x0400 */
+	if (ctrl & ONENAND_CTRL_ERROR) {
+		printk(KERN_DEBUG "onenand_bbt_wait: "
+			"controller error = 0x%04x\n", ctrl);
+		return ONENAND_BBT_READ_ERROR;
+	}
+
 	return 0;
 }
 
