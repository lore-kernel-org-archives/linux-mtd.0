Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bJ6rm-0005JY-QB
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 22:24:55 +0000
Received: by mail-pf0-x244.google.com with SMTP id c74so10953915pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2016 15:24:34 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Julius Werner <jwerner@chromium.org>
Subject: [PATCH] mtd: spi-nor: perform read-back check after SR lock/unlock
Date: Fri,  1 Jul 2016 15:23:16 -0700
Message-Id: <1467411796-110267-1-git-send-email-computersforpeace@gmail.com>
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
 drivers/mtd/spi-nor/spi-nor.c | 52 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14cf6ac8c0a5..9551e41699c8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -519,12 +519,18 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 wr_mask = mask;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = false;
 	bool use_top;
 	int ret;
 
+	if (nor->flags & SNOR_F_HAS_SR_TB) {
+		wr_mask |= SR_TB;
+		can_be_bottom = true;
+	}
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -571,7 +577,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~wr_mask) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
@@ -591,7 +597,21 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	ret = write_sr(nor, status_new);
 	if (ret)
 		return ret;
-	return spi_nor_wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret < 0)
+		return ret;
+
+	if ((ret ^ status_new) & (wr_mask | SR_SRWD)) {
+		dev_dbg(nor->dev, "read-back failure: %#x, %#x\n",
+			status_new, ret);
+		return -EIO;
+	}
+
+	return 0;
 }
 
 /*
@@ -604,12 +624,18 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 wr_mask = mask;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = false;
 	bool use_top;
 	int ret;
 
+	if (nor->flags & SNOR_F_HAS_SR_TB) {
+		wr_mask |= SR_TB;
+		can_be_bottom = true;
+	}
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -658,7 +684,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~wr_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
@@ -679,7 +705,21 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	ret = write_sr(nor, status_new);
 	if (ret)
 		return ret;
-	return spi_nor_wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret < 0)
+		return ret;
+
+	if ((ret ^ status_new) & (wr_mask | SR_SRWD)) {
+		dev_dbg(nor->dev, "read-back failure: %#x, %#x\n",
+			status_new, ret);
+		return -EIO;
+	}
+
+	return 0;
 }
 
 /*
-- 
2.8.0.rc3.226.g39d4020
