Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coP1a-0008TO-RS
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 06:36:40 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v3 6/8] nand: spi: add Micron spi nand support
Date: Thu, 16 Mar 2017 14:47:35 +0800
Message-ID: <1489646857-10112-7-git-send-email-peterpandong@micron.com>
In-Reply-To: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
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

This commit is to add support for Micron MT29F2G01ABAGD
spi nand chip.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/Makefile       |   1 +
 drivers/mtd/nand/spi/manufactures.c |   3 +
 drivers/mtd/nand/spi/micron.c       | 243 ++++++++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/micron.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index eabdb81..db0b91b 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NAND) += core.o
 obj-$(CONFIG_MTD_SPI_NAND) += manufactures.o
+obj-$(CONFIG_MTD_SPI_NAND) += micron.o
diff --git a/drivers/mtd/nand/spi/manufactures.c b/drivers/mtd/nand/spi/manufactures.c
index 7e0b42d..40dae11 100644
--- a/drivers/mtd/nand/spi/manufactures.c
+++ b/drivers/mtd/nand/spi/manufactures.c
@@ -16,9 +16,12 @@
 #include <linux/module.h>
 #include <linux/mtd/spinand.h>
 
+extern struct spinand_manufacturer micron_spinand_manufacture;
+
 struct spinand_manufacturer spinand_manufacturer_end = {0x0, "Unknown", NULL};
 
 struct spinand_manufacturer *spinand_manufacturers[] = {
+	&micron_spinand_manufacture,
 	&spinand_manufacturer_end,
 };
 EXPORT_SYMBOL(spinand_manufacturers);
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
new file mode 100644
index 0000000..fc7e91d
--- /dev/null
+++ b/drivers/mtd/nand/spi/micron.c
@@ -0,0 +1,243 @@
+/*
+ *
+ * Copyright (c) 2009-2017 Micron Technology, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_MICRON		0x2C
+
+#define SPI_NAND_MT29F_ECC_MASK		0x70
+#define SPI_NAND_MT29F_ECC_0_BIT	0x00
+#define SPI_NAND_MT29F_ECC_1_3_BIT	0x10
+#define SPI_NAND_MT29F_ECC_4_6_BIT	0x30
+#define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
+#define SPI_NAND_MT29F_ECC_UNCORR	0x20
+
+struct micron_spinand_info {
+	char *name;
+	u8 dev_id;
+	u32 page_size;
+	u32 oob_size;
+	u32 pages_per_blk;
+	u32 blks_per_lun;
+	u32 luns_per_chip;
+	u32 ecc_strength;
+	u32 rw_mode;
+};
+
+#define MICRON_SPI_NAND_INFO(nm, did, pagesz, oobsz, pg_per_blk,	\
+		      blk_per_lun, lun_per_chip, ecc_stren, rwmode)	\
+	{	\
+		.name = (nm), .dev_id = (did),		\
+		.page_size = (pagesz), .oob_size = (oobsz),		\
+		.pages_per_blk = (pg_per_blk),		\
+		.blks_per_lun = (blk_per_lun),		\
+		.luns_per_chip = (lun_per_chip),	\
+		.ecc_strength = (ecc_stren),	\
+		.rw_mode = (rwmode)		\
+	}
+
+static const struct micron_spinand_info micron_spinand_table[] = {
+	MICRON_SPI_NAND_INFO("MT29F2G01ABAGD", 0x24, 2048, 128, 64, 2048,
+			     1, 8, SPINAND_OP_COMMON),
+	{.name = NULL},
+};
+
+/*
+ * micron_spinand_scan_id_table - scan chip info in id table
+ * @chip: SPI-NAND device structure
+ * @id: point to manufacture id and device id
+ * Description:
+ *   If found in id table, config chip with table information.
+ */
+static bool micron_spinand_scan_id_table(struct spinand_device *chip, u8 *id)
+{
+	struct nand_device *nand = &chip->base;
+	struct micron_spinand_info *type = NULL;
+	struct nand_memory_organization *memorg = &nand->memorg;
+	struct spinand_ecc_engine *ecc_engine = chip->ecc.engine;
+
+	for (type = (struct micron_spinand_info *)micron_spinand_table;
+	     type->name; type++) {
+		if (id[SPINAND_DEV_ID] != type->dev_id)
+			continue;
+		chip->name = type->name;
+		memorg->eraseblocksize = type->page_size
+				* type->pages_per_blk;
+		memorg->pagesize = type->page_size;
+		memorg->oobsize = type->oob_size;
+		memorg->diesize = memorg->eraseblocksize * type->blks_per_lun;
+		memorg->ndies = type->luns_per_chip;
+		ecc_engine->strength = type->ecc_strength;
+		chip->rw_mode = type->rw_mode;
+
+		return true;
+	}
+
+	return false;
+}
+
+static int micron_ooblayout_ecc_128(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = 64;
+	oobregion->offset = 64;
+
+	return 0;
+}
+
+static int micron_ooblayout_free_128(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = 62;
+	oobregion->offset = 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_ooblayout_128_ops = {
+	.ecc = micron_ooblayout_ecc_128,
+	.free = micron_ooblayout_free_128,
+};
+
+static int micron_spinand_get_dummy(struct spinand_device *chip,
+				    struct spinand_op *op)
+{
+	u8 opcode = op->cmd;
+
+	switch (opcode) {
+	case SPINAND_CMD_READ_FROM_CACHE:
+	case SPINAND_CMD_READ_FROM_CACHE_FAST:
+	case SPINAND_CMD_READ_FROM_CACHE_X2:
+	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
+	case SPINAND_CMD_READ_FROM_CACHE_X4:
+	case SPINAND_CMD_READ_ID:
+		return 1;
+	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
+		return 2;
+	default:
+		return 0;
+	}
+}
+
+/*
+ * mt29f_get_ecc_status - get ecc correction information from status register
+ * @chip: SPI NAND device structure
+ * @status: status register value
+ * @corrected: corrected bit flip number
+ * @ecc_error: ecc correction error or not
+ */
+static void mt29f_get_ecc_status(struct spinand_device *chip,
+				 unsigned int status, unsigned int *corrected,
+				 unsigned int *ecc_error)
+{
+	unsigned int ecc_status = status & SPI_NAND_MT29F_ECC_MASK;
+
+	*ecc_error = (ecc_status == SPI_NAND_MT29F_ECC_UNCORR);
+	switch (ecc_status) {
+	case SPI_NAND_MT29F_ECC_0_BIT:
+		*corrected = 0;
+		break;
+	case SPI_NAND_MT29F_ECC_1_3_BIT:
+		*corrected = 3;
+		break;
+	case SPI_NAND_MT29F_ECC_4_6_BIT:
+		*corrected = 6;
+		break;
+	case SPI_NAND_MT29F_ECC_7_8_BIT:
+		*corrected = 8;
+		break;
+	}
+}
+
+static struct spinand_ecc_engine_ops generic_spi_ecc_engine_ops = {
+	.get_ecc_status = mt29f_get_ecc_status,
+};
+
+/*
+ * micron_spinand_detect - initialize device related part in spinand_device
+ * struct if it is Micron device.
+ * @chip: SPI NAND device structure
+ * @raw_id: raw id buffer. raw id is read by spinand_read_id(), should be
+ *          decoded by manufacturers
+ * @id: real id buffer. manufacturer's ->detect() should put real id in
+ *      this buffer.
+ */
+static bool micron_spinand_detect(struct spinand_device *chip,
+				  u8 *raw_id, u8 *id)
+{
+	/*
+	 * Micron SPI NAND read ID need a dummy byte,
+	 * so the first byte in raw_id is dummy.
+	 */
+	if (raw_id[1] != SPINAND_MFR_MICRON)
+		return false;
+
+	id[SPINAND_MFR_ID] = raw_id[1];
+	id[SPINAND_DEV_ID] = raw_id[2];
+
+	return micron_spinand_scan_id_table(chip, id);
+}
+
+/*
+ * micron_spinand_init - Micron device specified initialization function.
+ * @chip: SPI NAND device structure
+ *
+ * Set Micron device ->get_ecc_status() and OOB layout.
+ */
+static int micron_spinand_init(struct spinand_device *chip)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	chip->ecc.engine->ops = &generic_spi_ecc_engine_ops;
+	if (nand_per_page_oobsize(nand) == 128)
+		mtd_set_ooblayout(mtd, &micron_ooblayout_128_ops);
+
+	return 0;
+}
+
+/*
+ * micron_spinand_prepare_op - Fix address for cache operation.
+ * @chip: SPI NAND device structure
+ * @op: pointer to spinand_op struct
+ * @page: page address
+ * @column: column address
+ */
+static void micron_spinand_prepare_op(struct spinand_device *chip,
+				      struct spinand_op *op, u32 page,
+				      u32 column)
+{
+	op->addr[0] |= (u8)((nand_page_to_eraseblock(&chip->base, page)
+				& 0x1) << 4);
+	op->n_addr += micron_spinand_get_dummy(chip, op);
+}
+
+static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
+	.detect = micron_spinand_detect,
+	.init = micron_spinand_init,
+	.prepare_op = micron_spinand_prepare_op,
+};
+
+const struct spinand_manufacturer micron_spinand_manufacture = {
+	.id = SPINAND_MFR_MICRON,
+	.name = "Micron",
+	.ops = &micron_spinand_manuf_ops,
+};
-- 
1.9.1
