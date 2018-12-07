Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-0000zd-Bu
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:16 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 05/34] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Date: Fri,  7 Dec 2018 10:26:08 +0100
Message-Id: <20181207092637.18687-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the SNOR_F_HAS_LOCK flag and set it when SPI_NOR_HAS_LOCK is set
in the flash_info entry or when it's a Micron or ST flash.

We also move the locking hooks in a separate struct so that we just
have one field to update when we change the locking implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 45 +++++++++++++++++++++--------------
 include/linux/mtd/spi-nor.h   | 24 +++++++++++++------
 2 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fd88b0a13115..1f15b93adc11 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1305,6 +1305,12 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return stm_is_locked_sr(nor, ofs, len, status);
 }
 
+static const struct spi_nor_locking_ops stm_locking_ops = {
+	.lock = stm_lock,
+	.unlock = stm_unlock,
+	.is_locked = stm_is_locked,
+};
+
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
@@ -1314,7 +1320,7 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_lock(nor, ofs, len);
+	ret = nor->locking_ops->lock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_UNLOCK);
 	return ret;
@@ -1329,7 +1335,7 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_unlock(nor, ofs, len);
+	ret = nor->locking_ops->unlock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
 	return ret;
@@ -1344,7 +1350,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->flash_is_locked(nor, ofs, len);
+	ret = nor->locking_ops->is_locked(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
 	return ret;
@@ -3664,6 +3670,8 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 
 static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
 {
+	/* All ST/Micron NORs support the unlock/lock operations. */
+	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->set_4byte = st_micron_set_4byte;
 }
 
@@ -3826,21 +3834,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
-	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
-	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-	    info->flags & SPI_NOR_HAS_LOCK) {
-		nor->flash_lock = stm_lock;
-		nor->flash_unlock = stm_unlock;
-		nor->flash_is_locked = stm_is_locked;
-	}
-
-	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
-		mtd->_lock = spi_nor_lock;
-		mtd->_unlock = spi_nor_unlock;
-		mtd->_is_locked = spi_nor_is_locked;
-	}
-
 	/* sst nor chips use AAI word program */
 	if (info->flags & SST_WRITE)
 		mtd->_write = sst_write;
@@ -3881,6 +3874,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_NO_FR)
 		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
 
+	if (info->flags & SPI_NOR_HAS_LOCK)
+		nor->flags |= SNOR_F_HAS_LOCK;
+
 	/*
 	 * Post SFDP fixups. Has to be called before spi_nor_setup() because
 	 * some fixups might modify params that are then used by
@@ -3893,6 +3889,19 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return ret;
 	}
 
+	/*
+	 * NOR protection support. When locking_ops are not provided, we
+	 * pick the default ones.
+	 */
+	if (nor->flags & SNOR_F_HAS_LOCK && !nor->locking_ops)
+		nor->locking_ops = &stm_locking_ops;
+
+	if (nor->locking_ops) {
+		mtd->_lock = spi_nor_lock;
+		mtd->_unlock = spi_nor_unlock;
+		mtd->_is_locked = spi_nor_is_locked;
+	}
+
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d28a9913b165..56e6bf4ee823 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -234,6 +234,7 @@ enum spi_nor_option_flags {
 	SNOR_F_USE_CLSR		= BIT(5),
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
+	SNOR_F_HAS_LOCK		= BIT(8),
 };
 
 /**
@@ -360,13 +361,10 @@ struct flash_info;
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
  *			at the offset @offs; if not provided by the driver,
  *			spi-nor will send the erase opcode via write_reg()
- * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
- * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
- * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
- *			completely locked
  * @set_4byte:		[FLASH-SPECIFIC] put the SPI NOR in 4 byte addressing
  *			mode
+ * @locking_ops:	[FLASH-SPECIFIC] SPI NOR locking methods
  * @priv:		the private data
  */
 struct spi_nor {
@@ -399,15 +397,27 @@ struct spi_nor {
 			size_t len, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
-	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
 
+	const struct spi_nor_locking_ops *locking_ops;
+
 	void *priv;
 };
 
+/**
+ * struct spi_nor_locking_ops - SPI NOR locking methods
+ * @lock: lock a region of the SPI NOR
+ * @unlock: unlock a region of the SPI NOR
+ * @is_locked: check if a region of the SPI NOR is completely locked
+ */
+struct spi_nor_locking_ops {
+	int (*lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+};
+
+
 static u64 __maybe_unused
 spi_nor_region_is_last(const struct spi_nor_erase_region *region)
 {
-- 
2.17.1
