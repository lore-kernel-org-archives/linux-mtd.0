Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriE-00030S-43
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:22 +0000
Received: by pacfv12 with SMTP id fv12so5916101pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:59:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 07/10] mtd: spi-nor: add mtd_is_locked() support
Date: Tue,  1 Sep 2015 12:57:12 -0700
Message-Id: <1441137435-52862-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enables ioctl(MEMISLOCKED). Status can now be reported in the
mtdinfo or flash_lock utilities found in mtd-utils.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 37 ++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |  3 +++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 62fa1b4ff3c0..c4fb1205f1d3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -519,6 +519,24 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return write_sr(nor, status_new);
 }
 
+/*
+ * Check if a region of the flash is (completely) locked. See stm_lock() for
+ * more info.
+ *
+ * Returns 1 if entire region is locked, 0 if any portion is unlocked, and
+ * negative on errors.
+ */
+static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int status;
+
+	status = read_sr(nor);
+	if (status < 0)
+		return status;
+
+	return stm_is_locked_sr(nor, ofs, len, status);
+}
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -549,6 +567,21 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_UNLOCK);
+	if (ret)
+		return ret;
+
+	ret = nor->flash_is_locked(nor, ofs, len);
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
+	return ret;
+}
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
@@ -1151,11 +1184,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
+		nor->flash_is_locked = stm_is_locked;
 	}
 
-	if (nor->flash_lock && nor->flash_unlock) {
+	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
+		mtd->_is_locked = spi_nor_is_locked;
 	}
 
 	/* sst nor chips use AAI word program */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index bd8068f6796a..8620bfaed261 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -176,6 +176,8 @@ struct mtd_info;
  *			at the offset @offs
  * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
+ * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
+ *			completely locked
  * @priv:		the private data
  */
 struct spi_nor {
@@ -212,6 +214,7 @@ struct spi_nor {
 
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 
 	void *priv;
 };
-- 
2.5.0.457.gab17608
