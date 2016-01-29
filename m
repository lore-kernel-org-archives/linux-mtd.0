Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgf-0005bI-H0
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:31 +0000
Received: by mail-pa0-x243.google.com with SMTP id pv5so3984947pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:12 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 3/8] mtd: spi-nor: make lock/unlock bounds checks more
 obvious and robust
Date: Fri, 29 Jan 2016 11:25:32 -0800
Message-Id: <1454095537-130536-4-git-send-email-computersforpeace@gmail.com>
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

There are a few different corner cases to the current logic that seem
undesirable:

* mtd_lock() with offs==0 trips a bounds issue on
  ofs - mtd->erasesize < 0

* mtd_unlock() on the middle of a flash that is already unlocked will
  return -EINVAL

* probably other corner cases

So, let's stop doing "smart" checks like "check the block below us",
let's just do the following:

(a) pass only non-negative offsets/lengths to stm_is_locked_sr()
(b) add a similar stm_is_unlocked_sr() function, so we can check if the
    *entire* range is unlocked (and not just whether some part of it is
    unlocked)

Then armed with (b), we can make lock() and unlock() much more
symmetric:

(c) short-circuit the procedure if there is no work to be done, and
(d) check the entire range above/below

This also aligns well with the structure needed for proper TB
(Top/Bottom) support.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2:
 * mostly new (refactored from patch 2 in v1), since there were more corner
   cases, and this needed some more refactoring to prepare for TB support

 drivers/mtd/spi-nor/spi-nor.c | 68 +++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 77c88ac69ef9..68133b949fe5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -439,17 +439,38 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 }
 
 /*
- * Return 1 if the entire region is locked, 0 otherwise
+ * Return 1 if the entire region is locked (if @locked is true) or unlocked (if
+ * @locked is false); 0 otherwise
  */
-static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-			    u8 sr)
+static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				    u8 sr, bool locked)
 {
 	loff_t lock_offs;
 	uint64_t lock_len;
 
+	if (!len)
+		return 1;
+
 	stm_get_locked_range(nor, sr, &lock_offs, &lock_len);
 
-	return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
+	if (locked)
+		/* Requested range is a sub-range of locked range */
+		return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
+	else
+		/* Requested range does not overlap with locked range */
+		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
+}
+
+static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+			    u8 sr)
+{
+	return stm_check_lock_status_sr(nor, ofs, len, sr, true);
+}
+
+static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+			      u8 sr)
+{
+	return stm_check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
 /*
@@ -481,20 +502,24 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	loff_t lock_len;
 	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
-	/* SPI NOR always locks to the end */
-	if (ofs + len != mtd->size) {
-		/* Does combined region extend to end? */
-		if (!stm_is_locked_sr(nor, ofs + len, mtd->size - ofs - len,
-				      status_old))
-			return -EINVAL;
-		len = mtd->size - ofs;
-	}
+	/* If nothing in our range is unlocked, we don't need to do anything */
+	if (stm_is_locked_sr(nor, ofs, len, status_old))
+		return 0;
+
+	/* If anything above us is unlocked, we can't use 'top' protection */
+	if (!stm_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
+				status_old))
+		return -EINVAL;
+
+	/* lock_len: length of region that should end up locked */
+	lock_len = mtd->size - ofs;
 
 	/*
 	 * Need smallest pow such that:
@@ -505,7 +530,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
-	pow = ilog2(mtd->size) - ilog2(len);
+	pow = ilog2(mtd->size) - ilog2(lock_len);
 	val = mask - (pow << shift);
 	if (val & ~mask)
 		return -EINVAL;
@@ -541,17 +566,24 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
+	loff_t lock_len;
 	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
-	/* Cannot unlock; would unlock larger region than requested */
-	if (stm_is_locked_sr(nor, ofs - mtd->erasesize, mtd->erasesize,
-			     status_old))
+	/* If nothing in our range is locked, we don't need to do anything */
+	if (stm_is_unlocked_sr(nor, ofs, len, status_old))
+		return 0;
+
+	/* If anything below us is locked, we can't use 'top' protection */
+	if (!stm_is_unlocked_sr(nor, 0, ofs, status_old))
 		return -EINVAL;
 
+	/* lock_len: length of region that should remain locked */
+	lock_len = mtd->size - (ofs + len);
+
 	/*
 	 * Need largest pow such that:
 	 *
@@ -561,8 +593,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
-- 
2.7.0.rc3.207.g0ac5344
