Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUQjz-0006WC-SP
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 06:33:02 +0000
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, js07.lee@samsung.com, js07.lee@gmail.com
Subject: [RFC PATCH 1/2] mtd: spi-nor: add 4bit block protection support
Date: Wed, 05 Dec 2018 15:32:19 +0900
Message-id: <20181205063220.22279-1-js07.lee@samsung.com>
References: <CGME20181205063243eucas1p1792e0cf7d0e8a3cfb928a091f5548550@eucas1p1.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, we are supporting block protection only for
flash chips with 3 block protection bits in the SR register.
This patch enables block protection support for some flash with
4 block protection bits(bp0-3).

Because this feature is not universal to all flash that support
lock/unlock, control it via a new flag.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 61 ++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |  4 +++
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1fdd2834fbcb..c261d8f7bef4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -90,6 +90,7 @@ struct flash_info {
 #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
+#define SPI_NOR_HAS_BP3		BIT(15)	/* use 4 bits field for block protect */
 
 	int	(*quad_enable)(struct spi_nor *nor);
 };
@@ -898,18 +899,36 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	int shift = ffs(mask) - 1;
 	int pow;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask |= SR_BP3;
+
 	if (!(sr & mask)) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
+		return;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		u8 temp = sr & mask;
+
+		if (temp & SR_BP3)
+			temp = (temp & ~SR_BP3) | BIT(5);
+
+		pow = ilog2(nor->n_sectors) + 1 - (temp >> shift);
+		if (pow > 0)
+			*len = mtd->size >> pow;
+		else
+			*len = mtd->size;
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
 	}
+
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -989,6 +1008,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask |= SR_BP3;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -1028,7 +1050,16 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << shift);
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) + 1 - pow;
+		val = val << shift;
+		if (val & BIT(5))
+			val = (val & ~BIT(5)) | SR_BP3;
+	} else {
+		val = mask - (pow << shift);
+	}
+
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1069,6 +1100,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask |= SR_BP3;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -1110,13 +1144,19 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) + 1 - pow;
+		val = val << shift;
+		if (val & BIT(5))
+			val = (val & ~BIT(5)) | SR_BP3;
 	} else {
 		val = mask - (pow << shift);
-		/* Some power-of-two sizes are not supported */
-		if (val & ~mask)
-			return -EINVAL;
 	}
 
+	/* Some power-of-two sizes are not supported */
+	if (val & ~mask)
+		return -EINVAL;
+
 	status_new = (status_old & ~mask & ~SR_TB) | val;
 
 	/* Don't protect status register if we're fully unlocked */
@@ -2114,6 +2154,7 @@ enum spi_nor_pp_command_index {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				n_sectors;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -3251,6 +3292,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
+	params->n_sectors = info->n_sectors;
 	params->size = info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
@@ -3793,12 +3835,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
+	if (info->flags & SPI_NOR_HAS_BP3)
+		nor->flags |= SNOR_F_HAS_SR_BP3;
 
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
 	nor->page_size = params.page_size;
+	nor->n_sectors = params.n_sectors;
 	mtd->writebufsize = nor->page_size;
 
 	if (np) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7f0c7303575e..5b7391feb308 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -122,6 +122,7 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB			BIT(5)	/* Top/Bottom protect */
+#define SR_BP3			BIT(6)	/* Block protect 3 */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
@@ -236,6 +237,7 @@ enum spi_nor_option_flags {
 	SNOR_F_READY_XSR_RDY	= BIT(4),
 	SNOR_F_USE_CLSR		= BIT(5),
 	SNOR_F_BROKEN_RESET	= BIT(6),
+	SNOR_F_HAS_SR_BP3	= BIT(7),
 };
 
 /**
@@ -339,6 +341,7 @@ struct flash_info;
  * @dev:		point to a spi device, or a spi nor controller device.
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
+ * @n_sectors:		number of sector
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -375,6 +378,7 @@ struct spi_nor {
 	struct device		*dev;
 	const struct flash_info	*info;
 	u32			page_size;
+	u16			n_sectors;
 	u8			addr_width;
 	u8			erase_opcode;
 	u8			read_opcode;
-- 
2.17.1
