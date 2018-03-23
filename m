Received: from mail-bn3nam01on0044.outbound.protection.outlook.com
 ([104.47.33.44] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLjF-0006VL-QR
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:23:50 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [RFC PATCH 2/5] mtd: spi-nor: Add support for Zynq QSPI controller
Date: Fri, 23 Mar 2018 17:51:59 +0530
Message-ID: <1521807722-21626-3-git-send-email-nagasure@xilinx.com>
In-Reply-To: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds necessary changes required to support Zynq
QSPI Controller driver.

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 194 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  13 ++-
 include/linux/spi/spi.h       |   5 +-
 3 files changed, 192 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d445a4d..7698a92 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -23,6 +23,7 @@
 #include <linux/of_platform.h>
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/spi/spi.h>
 
 /* Define max times to check status register before we give up. */
 
@@ -292,6 +293,35 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 	}
 }
 
+/**
+ * read_ear - Get the extended/bank address register value
+ * @nor:	Pointer to the flash control structure
+ *
+ * This routine reads the Extended/bank address register value
+ *
+ * Return:	Negative if error occurred.
+ */
+static int read_ear(struct spi_nor *nor, struct flash_info *info)
+{
+	int ret;
+	u8 val;
+	u8 code;
+
+	/* This is actually Spansion */
+	if (JEDEC_MFR(info) == CFI_MFR_AMD)
+		code = SPINOR_OP_BRRD;
+	/* This is actually Micron */
+	else if (JEDEC_MFR(info) == CFI_MFR_ST)
+		code = SPINOR_OP_RDEAR;
+	else
+		return -EINVAL;
+
+	ret = nor->read_reg(nor, code, &val, 1);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
 static int s3an_sr_ready(struct spi_nor *nor)
 {
 	int ret;
@@ -401,15 +431,60 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
 }
 
 /*
+ * Update Extended Address/bank selection Register.
+ * Call with flash->lock locked.
+ */
+static int write_ear(struct spi_nor *nor, u32 addr)
+{
+	u8 code;
+	u8 ear;
+	int ret;
+	struct mtd_info *mtd = &nor->mtd;
+
+	/* Wait until finished previous write command. */
+	if (spi_nor_wait_till_ready(nor))
+		return 1;
+
+	if (mtd->size <= (0x1000000) << nor->shift)
+		return 0;
+
+	addr = addr % (u32) mtd->size;
+	ear = addr >> 24;
+
+	if (ear == nor->curbank)
+		return 0;
+
+	if (nor->jedec_id == CFI_MFR_AMD)
+		code = SPINOR_OP_BRWR;
+	if (nor->jedec_id == CFI_MFR_ST) {
+		write_enable(nor);
+		code = SPINOR_OP_WREAR;
+	}
+	nor->cmd_buf[0] = ear;
+
+	ret = nor->write_reg(nor, code, nor->cmd_buf, 1);
+	if (ret < 0)
+		return ret;
+
+	nor->curbank = ear;
+
+	return 0;
+}
+/*
  * Erase the whole flash memory
  *
  * Returns 0 if successful, non-zero otherwise.
  */
 static int erase_chip(struct spi_nor *nor)
 {
+	u32 ret;
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
-	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
+	ret = nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
+	if (ret)
+		return ret;
+
+	return ret;
 }
 
 static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
@@ -490,7 +565,7 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 addr, len;
+	u32 addr, len, offset;
 	uint32_t rem;
 	int ret;
 
@@ -540,9 +615,23 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else {
 		while (len) {
+
+			write_enable(nor);
+			offset = addr;
+
+			if (nor->addr_width == 3) {
+				/* Update Extended Address Register */
+				ret = write_ear(nor, offset);
+				if (ret)
+					goto erase_err;
+			}
+			ret = spi_nor_wait_till_ready(nor);
+			if (ret)
+				goto erase_err;
+
 			write_enable(nor);
 
-			ret = spi_nor_erase_sector(nor, addr);
+			ret = spi_nor_erase_sector(nor, offset);
 			if (ret)
 				goto erase_err;
 
@@ -1265,6 +1354,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
+	u32 offset = from;
+	u32 read_len = 0;
+	u32 rem_bank_len = 0;
+	u8 bank;
+	loff_t addr = 0;
+
+#define OFFSET_16_MB 0x1000000
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
@@ -1273,7 +1369,25 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return ret;
 
 	while (len) {
-		loff_t addr = from;
+		if (nor->addr_width == 3) {
+			bank = (u32)from / (OFFSET_16_MB << nor->shift);
+			rem_bank_len = ((OFFSET_16_MB << nor->shift) *
+							(bank + 1)) - from;
+		}
+		offset = from;
+
+		/* Die cross over issue is not handled */
+		if (nor->addr_width == 3)
+			write_ear(nor, offset);
+		if (len < rem_bank_len)
+			read_len = len;
+		else
+			read_len = rem_bank_len;
+
+		/* Wait till previous write/erase is done. */
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto read_err;
 
 		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
 			addr = spi_nor_s3an_addr_convert(nor, addr);
@@ -1390,6 +1504,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
+	u8 bank = 0;
+	u32 rem_bank_len = 0;
+#define OFFSET_16_MB 0x1000000
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -1401,6 +1518,14 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ssize_t written;
 		loff_t addr = to + i;
 
+		if (nor->addr_width == 3) {
+			bank = (u32)to / (OFFSET_16_MB << nor->shift);
+			rem_bank_len = ((OFFSET_16_MB << nor->shift) *
+							(bank + 1)) - to;
+		}
+
+		page_offset = ((to + i)) & (nor->page_size - 1);
+
 		/*
 		 * If page_size is a power of two, the offset can be quickly
 		 * calculated with an AND operation. On the other cases we
@@ -1416,9 +1541,14 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			page_offset = do_div(aux, nor->page_size);
 		}
-		/* the size of data remaining on the first page */
-		page_remain = min_t(size_t,
+		/* Die cross over issue is not handled */
+		if (nor->addr_width == 3)
+			write_ear(nor, addr);
+		else {
+			/* the size of data remaining on the first page */
+			page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
+		}
 
 		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
 			addr = spi_nor_s3an_addr_convert(nor, addr);
@@ -2760,10 +2890,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
 	struct spi_nor_flash_parameter params;
-	const struct flash_info *info = NULL;
+	struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
 	struct device_node *np = spi_nor_get_flash_node(nor);
+	struct device_node *np_spi;
 	int ret;
 	int i;
 
@@ -2777,10 +2908,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->write_proto = SNOR_PROTO_1_1_1;
 
 	if (name)
-		info = spi_nor_match_id(name);
+		info = (struct flash_info *)spi_nor_match_id(name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
-		info = spi_nor_read_id(nor);
+		info = (struct flash_info *)spi_nor_read_id(nor);
 	if (IS_ERR_OR_NULL(info))
 		return -ENOENT;
 
@@ -2804,7 +2935,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			 */
 			dev_warn(dev, "found %s, expected %s\n",
 				 jinfo->name, info->name);
-			info = jinfo;
+			info = (struct flash_info *)jinfo;
 		}
 	}
 
@@ -2863,9 +2994,17 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
 
-	if (info->flags & SPI_NOR_NO_ERASE)
-		mtd->flags |= MTD_NO_ERASE;
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	/* prefer "small sector" erase if possible */
+	if (info->flags & SECT_4K ||
+			info->flags & SECT_4K_PMC) {
+		mtd->erasesize = 4096 << nor->shift;
+	} else
+#endif
+		if (info->flags & SPI_NOR_NO_ERASE)
+			mtd->flags |= MTD_NO_ERASE;
 
+	nor->jedec_id = info->id[0];
 	mtd->dev.parent = dev;
 	nor->page_size = params.page_size;
 	mtd->writebufsize = nor->page_size;
@@ -2901,11 +3040,32 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
 	} else if (mtd->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
-		    info->flags & SPI_NOR_4B_OPCODES)
-			spi_nor_set_4byte_opcodes(nor, info);
+#ifdef CONFIG_OF
+		np_spi = of_get_next_parent(np);
+		if (of_property_match_string(np_spi, "compatible",
+					     "xlnx,zynq-qspi-1.0") >= 0) {
+			int status;
+
+			nor->addr_width = 3;
+			set_4byte(nor, info, 0);
+			status = read_ear(nor, info);
+			if (status < 0)
+				dev_warn(dev, "failed to read ear reg\n");
+			else
+				nor->curbank = status & EAR_SEGMENT_MASK;
+		} else {
+#endif
+			/*
+			 * enable 4-byte addressing
+			 * if the device exceeds 16MiB
+			 */
+			nor->addr_width = 4;
+			if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
+			    info->flags & SPI_NOR_4B_OPCODES)
+				spi_nor_set_4byte_opcodes(nor, info);
+#ifdef CONFIG_OF
+		}
+#endif
 	} else {
 		nor->addr_width = 3;
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index de36969..64232b1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -62,6 +62,9 @@
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
+#define SPINOR_OP_WREAR		0xc5	/* Write Extended Address Register */
+#define SPINOR_OP_RDEAR		0xc8	/* Read Extended Address Register */
+
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
@@ -106,6 +109,7 @@
 
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
+#define	SPINOR_OP_BRRD		0x16	/* Bank register read */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 
 /* Used for Micron flashes only. */
@@ -139,6 +143,7 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
+#define EAR_SEGMENT_MASK	0x7 /* 128 Mb segment mask */
 /* Status Register 2 bits. */
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
@@ -281,6 +286,7 @@ struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	struct spi_device       *spi;
 	const struct flash_info	*info;
 	u32			page_size;
 	u8			addr_width;
@@ -288,11 +294,16 @@ struct spi_nor {
 	u8			read_opcode;
 	u8			read_dummy;
 	u8			program_opcode;
+	u32			jedec_id;
+	u16			curbank;
+	u16			n_sectors;
+	u32			sector_size;
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
-	u32			flags;
+	bool			shift;
+	u8			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index bc6bb32..576dea1 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -451,7 +451,8 @@ struct spi_controller {
 #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* requires tx */
 
 #define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
-
+#define SPI_MASTER_QUAD_MODE		BIT(6)	/* support quad mode */
+#define SPI_MASTER_U_PAGE		BIT(9)	/* select upper flash */
 	/* flag indicating this is an SPI slave controller */
 	bool			slave;
 
@@ -797,7 +798,7 @@ struct spi_transfer {
 	u8		bits_per_word;
 	u16		delay_usecs;
 	u32		speed_hz;
-
+	u32		dummy;
 	struct list_head transfer_list;
 };
 
-- 
2.7.4
