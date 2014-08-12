Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XH0NJ-0003MR-Bv
 for linux-mtd@lists.infradead.org; Tue, 12 Aug 2014 00:55:41 +0000
From: Huang Shijie <shijie.huang@intel.com>
To: computersforpeace@gmail.com
Subject: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
Date: Tue, 12 Aug 2014 08:54:55 +0800
Message-Id: <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
In-Reply-To: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Huang Shijie <shijie.huang@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "id" array contains all the information about the JEDEC and the
manufacturer ID info, this patch remove the jedec_id/ext_id from the
flash_info.

Signed-off-by: Huang Shijie <shijie.huang@intel.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   98 +++++++++++++++++++----------------------
 1 files changed, 45 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0b69072..a0923b0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -26,7 +26,38 @@
 /* Define max times to check status register before we give up. */
 #define	MAX_READY_WAIT_JIFFIES	(40 * HZ) /* M25P16 specs 40s max chip erase */
 
-#define JEDEC_MFR(_jedec_id)	((_jedec_id) >> 16)
+#define SPI_NOR_MAX_ID_LEN	6
+
+struct flash_info {
+	/*
+	 * This array stores the ID bytes.
+	 * The first three bytes are the JEDIC id.
+	 * JEDEC id zero means "no ID" (most older chips);
+	 */
+	u8		id[SPI_NOR_MAX_ID_LEN];
+	u8		id_len;
+
+	/* The size listed here is what works with SPINOR_OP_SE, which isn't
+	 * necessarily called a "sector" by the vendor.
+	 */
+	unsigned	sector_size;
+	u16		n_sectors;
+
+	u16		page_size;
+	u16		addr_width;
+
+	u16		flags;
+#define	SECT_4K			0x01	/* SPINOR_OP_BE_4K works uniformly */
+#define	SPI_NOR_NO_ERASE	0x02	/* No erase command needed */
+#define	SST_WRITE		0x04	/* use SST byte programming */
+#define	SPI_NOR_NO_FR		0x08	/* Can't do fastread */
+#define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works uniformly */
+#define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
+#define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
+#define	USE_FSR			0x80	/* use flag status register */
+};
+
+#define JEDEC_MFR(info)	((info)->id[0])
 
 /*
  * Read the status register, returning its value in the location
@@ -136,13 +167,14 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 }
 
 /* Enable/disable 4-byte addressing mode. */
-static inline int set_4byte(struct spi_nor *nor, u32 jedec_id, int enable)
+static inline int
+set_4byte(struct spi_nor *nor, struct flash_info *info, int enable)
 {
 	int status;
 	bool need_wren = false;
 	u8 cmd;
 
-	switch (JEDEC_MFR(jedec_id)) {
+	switch (JEDEC_MFR(info)) {
 	case CFI_MFR_ST: /* Micron, actually */
 		/* Some Micron need WREN command; all will accept it */
 		need_wren = true;
@@ -422,49 +454,9 @@ err:
 	return ret;
 }
 
-#define SPI_NOR_MAX_ID_LEN	6
-
-struct flash_info {
-	/* JEDEC id zero means "no ID" (most older chips); otherwise it has
-	 * a high byte of zero plus three data bytes: the manufacturer id,
-	 * then a two byte device id.
-	 */
-	u32		jedec_id;
-	u16             ext_id;
-
-	/*
-	 * This array stores the ID bytes.
-	 * The first three bytes are the JEDIC id.
-	 * JEDEC id zero means "no ID" (most older chips);
-	 */
-	u8		id[SPI_NOR_MAX_ID_LEN];
-	u8		id_len;
-
-	/* The size listed here is what works with SPINOR_OP_SE, which isn't
-	 * necessarily called a "sector" by the vendor.
-	 */
-	unsigned	sector_size;
-	u16		n_sectors;
-
-	u16		page_size;
-	u16		addr_width;
-
-	u16		flags;
-#define	SECT_4K			0x01	/* SPINOR_OP_BE_4K works uniformly */
-#define	SPI_NOR_NO_ERASE	0x02	/* No erase command needed */
-#define	SST_WRITE		0x04	/* use SST byte programming */
-#define	SPI_NOR_NO_FR		0x08	/* Can't do fastread */
-#define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works uniformly */
-#define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
-#define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
-#define	USE_FSR			0x80	/* use flag status register */
-};
-
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 	((kernel_ulong_t)&(struct flash_info) {				\
-		.jedec_id = (_jedec_id),				\
-		.ext_id = (_ext_id),					\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
 			((_jedec_id) >> 8) & 0xff,			\
@@ -889,11 +881,11 @@ static int spansion_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-static int set_quad_mode(struct spi_nor *nor, u32 jedec_id)
+static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
 {
 	int status;
 
-	switch (JEDEC_MFR(jedec_id)) {
+	switch (JEDEC_MFR(info)) {
 	case CFI_MFR_MACRONIX:
 		status = macronix_quad_enable(nor);
 		if (status) {
@@ -966,7 +958,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 
 	info = (void *)id->driver_data;
 
-	if (info->jedec_id) {
+	if (info->id_len) {
 		const struct spi_device_id *jid;
 
 		jid = jedec_probe(nor);
@@ -994,9 +986,9 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	 * up with the software protection bits set
 	 */
 
-	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ATMEL ||
-	    JEDEC_MFR(info->jedec_id) == CFI_MFR_INTEL ||
-	    JEDEC_MFR(info->jedec_id) == CFI_MFR_SST) {
+	if (JEDEC_MFR(info) == CFI_MFR_ATMEL ||
+	    JEDEC_MFR(info) == CFI_MFR_INTEL ||
+	    JEDEC_MFR(info) == CFI_MFR_SST) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
@@ -1014,7 +1006,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	mtd->_read = spi_nor_read;
 
 	/* nor protection support for STmicro chips */
-	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
+	if (JEDEC_MFR(info) == CFI_MFR_ST) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
 	}
@@ -1065,7 +1057,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 
 	/* Quad/Dual-read mode takes precedence over fast/normal */
 	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
-		ret = set_quad_mode(nor, info->jedec_id);
+		ret = set_quad_mode(nor, info);
 		if (ret) {
 			dev_err(dev, "quad mode not supported\n");
 			return ret;
@@ -1101,7 +1093,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
+		if (JEDEC_MFR(info) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
 			case SPI_NOR_QUAD:
@@ -1122,7 +1114,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 			nor->erase_opcode = SPINOR_OP_SE_4B;
 			mtd->erasesize = info->sector_size;
 		} else
-			set_4byte(nor, info->jedec_id, 1);
+			set_4byte(nor, info, 1);
 	} else {
 		nor->addr_width = 3;
 	}
-- 
1.7.7.6
