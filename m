From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-mtd@lists.infradead.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 1/2] mtd: spi-nor: Add support of sst26wf* flash ICs
 protection ops
Date: Tue,  4 Sep 2018 18:33:41 +0300
Message-Id: <20180904153342.16742-2-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20180904153342.16742-1-Eugeniy.Paltsev@synopsys.com>
References: <20180904153342.16742-1-Eugeniy.Paltsev@synopsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

sst26wf flash series block protection implementation differs
from other SST series, so add specific implementation
flash_lock/flash_unlock/flash_is_locked functions for sst26wf
flash ICs.

NOTE:
this patch is basically following mine u-boot commit port:
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=3d4fed87a5fa3ffedf64ff2811cd95c5ac4503ac

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 177 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 +
 2 files changed, 181 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c44194..6f74c75c9ddc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -598,6 +598,177 @@ static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
 	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
 }
 
+/*
+ * sst26wf016/sst26wf032/sst26wf064 have next block protection:
+ * 4x   - 8  KByte blocks - read & write protection bits - upper addresses
+ * 1x   - 32 KByte blocks - write protection bits
+ * rest - 64 KByte blocks - write protection bits
+ * 1x   - 32 KByte blocks - write protection bits
+ * 4x   - 8  KByte blocks - read & write protection bits - lower addresses
+ *
+ * We'll support only per 64k lock/unlock so lower and upper 64 KByte region
+ * will be treated as single block.
+ */
+#define SST26_BPR_8K_NUM		4
+#define SST26_MAX_BPR_REG_LEN		(18 + 1)
+#define SST26_BOUND_REG_SIZE		((32 + SST26_BPR_8K_NUM * 8) * SZ_1K)
+
+enum lock_ctl {
+	SST26_CTL_LOCK,
+	SST26_CTL_UNLOCK,
+	SST26_CTL_CHECK
+};
+
+static bool sst26_process_bpr(u32 bpr_size, u8 *cmd, u32 bit, enum lock_ctl ctl)
+{
+	switch (ctl) {
+	case SST26_CTL_LOCK:
+		cmd[bpr_size - (bit / 8) - 1] |= BIT(bit % 8);
+		break;
+	case SST26_CTL_UNLOCK:
+		cmd[bpr_size - (bit / 8) - 1] &= ~BIT(bit % 8);
+		break;
+	case SST26_CTL_CHECK:
+		return !!(cmd[bpr_size - (bit / 8) - 1] & BIT(bit % 8));
+	}
+
+	return false;
+}
+
+/*
+ * Lock, unlock or check lock status of the flash region of the flash (depending
+ * on the lock_ctl value)
+ */
+static int sst26_lock_ctl(struct spi_nor *nor, loff_t ofs, uint64_t len, enum lock_ctl ctl)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	u32 i, bpr_ptr, rptr_64k, lptr_64k, bpr_size;
+	bool lower_64k = false, upper_64k = false;
+	u8 bpr_buff[SST26_MAX_BPR_REG_LEN] = {};
+	int ret;
+
+	/* Check length and offset for 64k alignment */
+	if ((ofs & (SZ_64K - 1)) || (len & (SZ_64K - 1))) {
+		dev_err(nor->dev, "length or offset is not 64KiB allighned\n");
+		return -EINVAL;
+	}
+
+	if (ofs + len > mtd->size) {
+		dev_err(nor->dev, "range is more than device size: %#llx + %#llx > %#llx\n",
+			ofs, len, mtd->size);
+		return -EINVAL;
+	}
+
+	/* SST26 family has only 16 Mbit, 32 Mbit and 64 Mbit IC */
+	if (mtd->size != SZ_2M &&
+	    mtd->size != SZ_4M &&
+	    mtd->size != SZ_8M)
+		return -EINVAL;
+
+	bpr_size = 2 + (mtd->size / SZ_64K / 8);
+
+	nor->read_reg(nor, SPINOR_OP_READ_BPR, bpr_buff, bpr_size);
+	if (ret < 0) {
+		dev_err(nor->dev, "fail to read block-protection register\n");
+		return ret;
+	}
+
+	rptr_64k = min_t(u32, ofs + len, mtd->size - SST26_BOUND_REG_SIZE);
+	lptr_64k = max_t(u32, ofs, SST26_BOUND_REG_SIZE);
+
+	upper_64k = ((ofs + len) > (mtd->size - SST26_BOUND_REG_SIZE));
+	lower_64k = (ofs < SST26_BOUND_REG_SIZE);
+
+	/* Lower bits in block-protection register are about 64k region */
+	bpr_ptr = lptr_64k / SZ_64K - 1;
+
+	/* Process 64K blocks region */
+	while (lptr_64k < rptr_64k) {
+		if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
+			return EACCES;
+
+		bpr_ptr++;
+		lptr_64k += SZ_64K;
+	}
+
+	/* 32K and 8K region bits in BPR are after 64k region bits */
+	bpr_ptr = (mtd->size - 2 * SST26_BOUND_REG_SIZE) / SZ_64K;
+
+	/* Process lower 32K block region */
+	if (lower_64k)
+		if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
+			return EACCES;
+
+	bpr_ptr++;
+
+	/* Process upper 32K block region */
+	if (upper_64k)
+		if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
+			return EACCES;
+
+	bpr_ptr++;
+
+	/* Process lower 8K block regions */
+	for (i = 0; i < SST26_BPR_8K_NUM; i++) {
+		if (lower_64k)
+			if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
+				return EACCES;
+
+		/* In 8K area BPR has both read and write protection bits */
+		bpr_ptr += 2;
+	}
+
+	/* Process upper 8K block regions */
+	for (i = 0; i < SST26_BPR_8K_NUM; i++) {
+		if (upper_64k)
+			if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
+				return EACCES;
+
+		/* In 8K area BPR has both read and write protection bits */
+		bpr_ptr += 2;
+	}
+
+	/* If we check region status we don't need to write BPR back */
+	if (ctl == SST26_CTL_CHECK)
+		return 0;
+
+	nor->write_reg(nor, SPINOR_OP_WRITE_BPR, bpr_buff, bpr_size);
+	if (ret < 0) {
+		dev_err(nor->dev, "fail to write block-protection register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sst26_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return sst26_lock_ctl(nor, ofs, len, SST26_CTL_UNLOCK);
+}
+
+static int sst26_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return sst26_lock_ctl(nor, ofs, len, SST26_CTL_LOCK);
+}
+
+/*
+ * Returns EACCES (positive value) if region is locked, 0 if region is unlocked,
+ * and negative on errors.
+ */
+static int sst26_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	/*
+	 * is_locked function is used for check before reading or erasing flash
+	 * region, so offset and length might be not 64k allighned, so adjust
+	 * them to be 64k allighned as sst26_lock_ctl works only with 64k
+	 * allighned regions.
+	 */
+	ofs -= ofs & (SZ_64K - 1);
+	len = len & (SZ_64K - 1) ? (len & ~(SZ_64K - 1)) + SZ_64K : len;
+
+	return sst26_lock_ctl(nor, ofs, len, SST26_CTL_CHECK);
+}
+
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
@@ -2872,6 +3043,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flash_is_locked = stm_is_locked;
 	}
 
+	if (JEDEC_MFR(info) == SNOR_MFR_SST && info->id[1] == 0x26) {
+		nor->flash_lock = sst26_lock;
+		nor->flash_unlock = sst26_unlock;
+		nor->flash_is_locked = sst26_is_locked;
+	}
+
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e60da0d34cc1..246014a73f83 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -93,6 +93,10 @@
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
 
+/* Used for SST26* flashes only. */
+#define SPINOR_OP_READ_BPR	0x72	/* Read block protection register */
+#define SPINOR_OP_WRITE_BPR	0x42	/* Write block protection register */
+
 /* Used for S3AN flashes only */
 #define SPINOR_OP_XSE		0x50	/* Sector erase */
 #define SPINOR_OP_XPP		0x82	/* Page program */
-- 
2.14.4
