Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVf-0004Dd-3f
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:50 +0000
Received: by mail-pf0-x244.google.com with SMTP id 66so1079462pfe.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:26 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [RFC PATCH 7/8] mtd: spi-nor: add TB (Top/Bottom) protect support
Date: Wed, 27 Jan 2016 21:51:46 -0800
Message-Id: <1453960307-10181-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flash support a bit in the status register that inverts protection
so that it applies to the bottom of the flash, not the top. This yields
additions to the protection range table, as noted in the comments.

Because this feature is not universal to all flash that support
lock/unlock, control it via a new flag.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
This one hasn't been exhaustively tested yet, so I labeled it 'RFC'. I hope to
have some sort of test scripts (possibly targeting mtd-utils) ready, to help
make sure the locking APIs behave as expected. (And "as expected" is a little
ill-defined, IMO.)

 drivers/mtd/spi-nor/spi-nor.c |   85 ++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |    2 +
 2 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8846b575b526..5e84e3c543aa 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -70,6 +70,11 @@ struct flash_info {
 #define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
 #define USE_FSR			BIT(7)	/* use flag status register */
 #define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
+#define SPI_NOR_HAS_TB		BIT(9)	/*
+					 * Flash SR has Top/Bottom (TB) protect
+					 * bit. Must be used with
+					 * SPI_NOR_HAS_LOCK.
+					 */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -435,7 +440,10 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		*ofs = mtd->size - *len;
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+			*ofs = 0;
+		else
+			*ofs = mtd->size - *len;
 	}
 }
 
@@ -458,12 +466,14 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports only the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2} in the status register
  * (SR). Does not support these features found in newer SR bitfields:
- *   - TB: top/bottom protect - only handle TB=0 (top protect)
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
  *
+ * Support for the following is provided conditionally for some flash:
+ *   - TB: top/bottom protect
+ *
  * Sample table portion for 8MB flash (Winbond w25q64fw):
  *
  *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
@@ -476,6 +486,13 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  *    0   |   0   |   1   |   0   |   1   |  2 MB         | Upper 1/4
  *    0   |   0   |   1   |   1   |   0   |  4 MB         | Upper 1/2
  *    X   |   X   |   1   |   1   |   1   |  8 MB         | ALL
+ *  ------|-------|-------|-------|-------|---------------|-------------------
+ *    0   |   1   |   0   |   0   |   1   |  128 KB       | Lower 1/64
+ *    0   |   1   |   0   |   1   |   0   |  256 KB       | Lower 1/32
+ *    0   |   1   |   0   |   1   |   1   |  512 KB       | Lower 1/16
+ *    0   |   1   |   1   |   0   |   0   |  1 MB         | Lower 1/8
+ *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower 1/4
+ *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower 1/2
  *
  * Returns negative on errors, 0 on success.
  */
@@ -485,6 +502,8 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool use_top;
 	int ret;
 
 	status_old = read_sr(nor);
@@ -496,10 +515,24 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		/* Does combined region extend to end? */
 		if (!stm_is_locked_sr(nor, ofs + len, mtd->size - ofs - len,
 				      status_old))
-			return -EINVAL;
-		len = mtd->size - ofs;
+			can_be_top = false;
+		else
+			len = mtd->size - ofs;
 	}
 
+	if (can_be_bottom && ofs != 0) {
+		/* Does combined region extend to beginning? */
+		if (!stm_is_locked_sr(nor, 0, ofs, status_old))
+			can_be_bottom = false;
+		else
+			ofs = 0;
+	}
+
+	if (!can_be_bottom && !can_be_top)
+		return -EINVAL;
+	/* Prefer top, if both are valid */
+	use_top = can_be_top;
+
 	/*
 	 * Need smallest pow such that:
 	 *
@@ -517,11 +550,14 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask) | val;
+	status_new = (status_old & ~mask & ~SR_TB) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
+	if (!use_top)
+		status_new |= SR_TB;
+
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
 		return 0;
@@ -548,6 +584,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	loff_t lock_len;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool use_top;
 	int ret;
 
 	status_old = read_sr(nor);
@@ -555,13 +594,35 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		return status_old;
 
 	/*
-	 * Check the eraseblock next to us; if locked, then this would unlock
+	 * Check the eraseblock below us; if locked, then this would unlock
 	 * larger region than requested
 	 */
 	if (ofs > 0 && stm_is_locked_sr(nor, ALIGN(ofs - mtd->erasesize,
 					mtd->erasesize), mtd->erasesize,
 					status_old))
+		can_be_top = false;
+
+	/*
+	 * If TB is supported: Check the eraseblock above us; if locked, then
+	 * this would unlock larger region than requested
+	 */
+	if (can_be_bottom && ofs + len < mtd->size && stm_is_locked_sr(nor,
+				mtd_mod_by_eb(ofs + len + mtd->erasesize, mtd),
+				mtd->erasesize, status_old))
+		can_be_bottom = false;
+
+	if (!can_be_bottom && !can_be_top)
 		return -EINVAL;
+	/* Prefer top, if both are valid */
+	use_top = can_be_top;
+	/*
+	 * lock_len: length of region (either top or bottom) that should remain
+	 * locked
+	 */
+	if (use_top)
+		lock_len = mtd->size - (ofs + len);
+	else
+		lock_len = ofs;
 
 	/*
 	 * Need largest pow such that:
@@ -572,8 +633,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *
 	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
 	 */
-	pow = ilog2(mtd->size) - order_base_2(mtd->size - (ofs + len));
-	if (ofs + len == mtd->size) {
+	pow = ilog2(mtd->size) - order_base_2(lock_len);
+	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
 		val = mask - (pow << shift);
@@ -582,7 +643,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask) | val;
+	status_new = (status_old & ~mask & ~SR_TB) | val;
+	if (!use_top)
+		status_new |= SR_TB;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1291,6 +1354,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
+	if (info->flags & SPI_NOR_HAS_TB)
+		nor->flags |= SNOR_F_HAS_SR_TB;
 
 #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 62356d50815b..3c36113a88e1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -85,6 +85,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_TB			BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 
 #define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
@@ -116,6 +117,7 @@ enum spi_nor_ops {
 
 enum spi_nor_option_flags {
 	SNOR_F_USE_FSR		= BIT(0),
+	SNOR_F_HAS_SR_TB	= BIT(1),
 };
 
 /**
-- 
1.7.9.5
