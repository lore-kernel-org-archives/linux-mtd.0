Date: Wed, 13 Feb 2008 15:55:38 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][OneNAND] Fix unlock all in Double Density Package (DDP)
Message-ID: <20080213065538.GA22073@party>
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

Fix unlock all in Double Density Package (DDP)

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 8d7d21b..15a62db 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2052,7 +2052,7 @@ static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
  *
  * Check lock status
  */
-static void onenand_check_lock_status(struct onenand_chip *this)
+static int onenand_check_lock_status(struct onenand_chip *this)
 {
 	unsigned int value, block, status;
 	unsigned int end;
@@ -2070,9 +2070,13 @@ static void onenand_check_lock_status(struct onenand_chip *this)
 
 		/* Check lock status */
 		status = this->read_word(this->base + ONENAND_REG_WP_STATUS);
-		if (!(status & ONENAND_WP_US))
+		if (!(status & ONENAND_WP_US)) {
 			printk(KERN_ERR "block = %d, wp status = 0x%x\n", block, status);
+			return 0;
+		}
 	}
+
+	return 1;
 }
 
 /**
@@ -2081,9 +2085,11 @@ static void onenand_check_lock_status(struct onenand_chip *this)
  *
  * Unlock all blocks
  */
-static int onenand_unlock_all(struct mtd_info *mtd)
+static void onenand_unlock_all(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
+	loff_t ofs = 0;
+	size_t len = this->chipsize;
 
 	if (this->options & ONENAND_HAS_UNLOCK_ALL) {
 		/* Set start block address */
@@ -2099,23 +2105,19 @@ static int onenand_unlock_all(struct mtd_info *mtd)
 		    & ONENAND_CTRL_ONGO)
 			continue;
 
+		/* Check lock status */
+		if (onenand_check_lock_status(this))
+			return;
+
 		/* Workaround for all block unlock in DDP */
 		if (ONENAND_IS_DDP(this)) {
-			/* 1st block on another chip */
-			loff_t ofs = this->chipsize >> 1;
-			size_t len = mtd->erasesize;
-
-			onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
+			/* All blocks on another chip */
+			ofs = this->chipsize >> 1;
+			len = this->chipsize >> 1;
 		}
-
-		onenand_check_lock_status(this);
-
-		return 0;
 	}
 
-	onenand_do_lock_cmd(mtd, 0x0, this->chipsize, ONENAND_CMD_UNLOCK);
-
-	return 0;
+	onenand_do_lock_cmd(mtd, ofs, len, ONENAND_CMD_UNLOCK);
 }
 
 #ifdef CONFIG_MTD_ONENAND_OTP
