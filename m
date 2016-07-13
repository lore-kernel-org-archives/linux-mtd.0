Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNReJ-0006vw-DZ
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 21:24:56 +0000
Received: by mail-pf0-x244.google.com with SMTP id i6so3396152pfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 14:24:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Julius Werner <jwerner@chromium.org>
Subject: [PATCH v2] mtd: spi-nor: perform read-back check after SR lock/unlock
Date: Wed, 13 Jul 2016 14:24:24 -0700
Message-Id: <1468445064-54459-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When programming the Status Register for performing write protect, it's
important to know the result of the operation (i.e., success or
failure). Particularly, it's possible to fail when the hardware write
protect pin (WP#) is asserted, potentially disallowing writes to the
status register. Previously, even if we weren't able to update the
status register, ioctl(MEMLOCK) and ioctl(MEMUNLOCK) would return
success.

Let's add a read-back check, to make sure that the status register was
updated appropriately. If the relevant bits weren't updated, then return
-EIO.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2:
 * factor out spi_nor_update_sr_rb() to do the repeated update steps for both
   stm_{un,}lock()
 * add a few comments
 * make the dbg print more suggestive about WP#

 drivers/mtd/spi-nor/spi-nor.c | 64 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14cf6ac8c0a5..43179038e654 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -483,6 +483,36 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 }
 
 /*
+ * Update the Status Register, and check that its value was updated (with a
+ * mask, for the don't-care bits). An update can fail due when WP# is asserted,
+ * for instance, as that may disallow further writes to the Status Register.
+ */
+static int spi_nor_update_sr_rb(struct spi_nor *nor, u8 val, u8 mask)
+{
+	int ret;
+
+	write_enable(nor);
+	ret = write_sr(nor, val);
+	if (ret)
+		return ret;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret < 0)
+		return ret;
+
+	if ((ret ^ val) & mask) {
+		dev_dbg(nor->dev, "read-back failure - is WP# asserted?: %#x, %#x\n",
+			val, ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2} in the status register
  * (SR). Does not support these features found in newer SR bitfields:
@@ -519,11 +549,16 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 wr_mask = mask;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = false;
 	bool use_top;
-	int ret;
+
+	if (nor->flags & SNOR_F_HAS_SR_TB) {
+		wr_mask |= SR_TB;
+		can_be_bottom = true;
+	}
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -571,7 +606,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~wr_mask) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
@@ -587,11 +622,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) < (status_old & mask))
 		return -EINVAL;
 
-	write_enable(nor);
-	ret = write_sr(nor, status_new);
-	if (ret)
-		return ret;
-	return spi_nor_wait_till_ready(nor);
+	return spi_nor_update_sr_rb(nor, status_new, wr_mask | SR_SRWD);
 }
 
 /*
@@ -604,11 +635,16 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 wr_mask = mask;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = false;
 	bool use_top;
-	int ret;
+
+	if (nor->flags & SNOR_F_HAS_SR_TB) {
+		wr_mask |= SR_TB;
+		can_be_bottom = true;
+	}
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -658,7 +694,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~wr_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
@@ -675,11 +711,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) > (status_old & mask))
 		return -EINVAL;
 
-	write_enable(nor);
-	ret = write_sr(nor, status_new);
-	if (ret)
-		return ret;
-	return spi_nor_wait_till_ready(nor);
+	return spi_nor_update_sr_rb(nor, status_new, wr_mask | SR_SRWD);
 }
 
 /*
-- 
2.8.0.rc3.226.g39d4020
