Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgh-0005bs-9K
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:38 +0000
Received: by mail-pa0-x242.google.com with SMTP id pv5so3985002pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:15 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 7/8] mtd: spi-nor: add TB (Top/Bottom) protect support
Date: Fri, 29 Jan 2016 11:25:36 -0800
Message-Id: <1454095537-130536-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
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
v2:
 * Rewrite the bounds checking for top/bottom support, since there were some
   bad corner cases. Now lock/unlock are more symmetric.

 drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a47e9dd29456..00ebf0794ca6 100644
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
 
@@ -476,12 +484,14 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
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
@@ -494,6 +504,13 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
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
@@ -504,6 +521,8 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool use_top;
 	int ret;
 
 	status_old = read_sr(nor);
@@ -514,13 +533,26 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (stm_is_locked_sr(nor, ofs, len, status_old))
 		return 0;
 
+	/* If anything below us is unlocked, we can't use 'bottom' protection */
+	if (!stm_is_locked_sr(nor, 0, ofs, status_old))
+		can_be_bottom = false;
+
 	/* If anything above us is unlocked, we can't use 'top' protection */
 	if (!stm_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
 				status_old))
+		can_be_top = false;
+
+	if (!can_be_bottom && !can_be_top)
 		return -EINVAL;
 
+	/* Prefer top, if both are valid */
+	use_top = can_be_top;
+
 	/* lock_len: length of region that should end up locked */
-	lock_len = mtd->size - ofs;
+	if (use_top)
+		lock_len = mtd->size - ofs;
+	else
+		lock_len = ofs + len;
 
 	/*
 	 * Need smallest pow such that:
@@ -539,11 +571,14 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -571,6 +606,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool use_top;
 	int ret;
 
 	status_old = read_sr(nor);
@@ -583,10 +620,24 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	/* If anything below us is locked, we can't use 'top' protection */
 	if (!stm_is_unlocked_sr(nor, 0, ofs, status_old))
+		can_be_top = false;
+
+	/* If anything above us is locked, we can't use 'bottom' protection */
+	if (!stm_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
+				status_old))
+		can_be_bottom = false;
+
+	if (!can_be_bottom && !can_be_top)
 		return -EINVAL;
 
+	/* Prefer top, if both are valid */
+	use_top = can_be_top;
+
 	/* lock_len: length of region that should remain locked */
-	lock_len = mtd->size - (ofs + len);
+	if (use_top)
+		lock_len = mtd->size - (ofs + len);
+	else
+		lock_len = ofs;
 
 	/*
 	 * Need largest pow such that:
@@ -607,12 +658,15 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask) | val;
+	status_new = (status_old & ~mask & ~SR_TB) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == mtd->size)
 		status_new &= ~SR_SRWD;
 
+	if (!use_top)
+		status_new |= SR_TB;
+
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
 		return 0;
@@ -1320,6 +1374,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
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
2.7.0.rc3.207.g0ac5344
