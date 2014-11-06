Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmDh6-0003CZ-9k
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 03:25:09 +0000
From: Huang Shijie <shijie.huang@intel.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: spi-nor: remove the jedec_id/ext_id
Date: Thu,  6 Nov 2014 11:24:33 +0800
Message-Id: <1415244273-8230-1-git-send-email-shijie.huang@intel.com>
In-Reply-To: <20141105111631.GJ22361@norris-Latitude-E6410>
References: <20141105111631.GJ22361@norris-Latitude-E6410>
Cc: marex@denx.de, Huang Shijie <shijie.huang@intel.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org, zajec5@gmail.com
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
  rebase this patch on the latest l2-mtd
---
 drivers/mtd/spi-nor/spi-nor.c |   98 +++++++++++++++++++----------------------
 1 files changed, 45 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8d6b832..182dd42 100644
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
 
 static const struct spi_device_id *spi_nor_match_id(const char *name);
 
@@ -138,13 +169,14 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
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
@@ -413,49 +445,9 @@ err:
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
@@ -872,11 +864,11 @@ static int spansion_quad_enable(struct spi_nor *nor)
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
@@ -925,7 +917,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	info = (void *)id->driver_data;
 
-	if (info->jedec_id) {
+	if (info->id_len) {
 		const struct spi_device_id *jid;
 
 		jid = spi_nor_read_id(nor);
@@ -953,9 +945,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
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
@@ -970,7 +962,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_read = spi_nor_read;
 
 	/* nor protection support for STmicro chips */
-	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
+	if (JEDEC_MFR(info) == CFI_MFR_ST) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
 	}
@@ -1023,7 +1015,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	/* Quad/Dual-read mode takes precedence over fast/normal */
 	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
-		ret = set_quad_mode(nor, info->jedec_id);
+		ret = set_quad_mode(nor, info);
 		if (ret) {
 			dev_err(dev, "quad mode not supported\n");
 			return ret;
@@ -1059,7 +1051,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
+		if (JEDEC_MFR(info) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
 			case SPI_NOR_QUAD:
@@ -1080,7 +1072,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
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
