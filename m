Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTw2-0001qN-Lc
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:40:36 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v5 4/6] nand: spi: add Micron spi nand support
Date: Mon, 10 Apr 2017 15:51:51 +0800
Message-ID: <1491810713-27795-5-git-send-email-peterpandong@micron.com>
In-Reply-To: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
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
 drivers/mtd/nand/spi/Makefile |   1 +
 drivers/mtd/nand/spi/core.c   |   4 +-
 drivers/mtd/nand/spi/micron.c | 254 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   2 +
 4 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/micron.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index a677a4d..df6c2ea 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_MTD_SPI_NAND) += core.o
+obj-$(CONFIG_MTD_SPI_NAND) += micron.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 52113fc..b2530fa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1252,7 +1252,9 @@ static int spinand_scan_bbt(struct spinand_device *chip)
 	return nand_scan_bbt(nand);
 }
 
-static const struct spinand_manufacturer *spinand_manufacturers[] = {};
+static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&micron_spinand_manufacture
+};
 
 /*
  * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
new file mode 100644
index 0000000..f134194
--- /dev/null
+++ b/drivers/mtd/nand/spi/micron.c
@@ -0,0 +1,254 @@
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
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_MICRON		0x2C
+
+#define SPI_NAND_M7XA_ECC_MASK		0x70
+#define SPI_NAND_M7XA_ECC_0_BIT		0x00
+#define SPI_NAND_M7XA_ECC_1_3_BIT	0x10
+#define SPI_NAND_M7XA_ECC_4_6_BIT	0x30
+#define SPI_NAND_M7XA_ECC_7_8_BIT	0x50
+#define SPI_NAND_M7XA_ECC_UNCORR	0x20
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
+	u32 ecc_steps;
+	u32 rw_mode;
+	const struct mtd_ooblayout_ops *ooblayout_ops;
+	const struct spinand_ecc_engine_ops *ecc_engine_ops;
+};
+
+#define MICRON_SPI_NAND_INFO(nm, did, pagesz, oobsz, pg_per_blk,	\
+			     blk_per_lun, lun_per_chip, ecc_stren,	\
+			     ecc_stps, rwmode, ooblayoutops,		\
+			     ecc_ops)		\
+	{	\
+		.name = (nm), .dev_id = (did),		\
+		.page_size = (pagesz), .oob_size = (oobsz),		\
+		.pages_per_blk = (pg_per_blk),		\
+		.blks_per_lun = (blk_per_lun),		\
+		.luns_per_chip = (lun_per_chip),	\
+		.ecc_strength = (ecc_stren),	\
+		.ecc_steps = (ecc_stps),	\
+		.rw_mode = (rwmode),		\
+		.ooblayout_ops = (ooblayoutops),	\
+		.ecc_engine_ops = (ecc_ops)	\
+	}
+
+static int m7xa_ooblayout_ecc(struct mtd_info *mtd, int section,
+			      struct mtd_oob_region *oobregion)
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
+static int m7xa_ooblayout_free(struct mtd_info *mtd, int section,
+			       struct mtd_oob_region *oobregion)
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
+static const struct mtd_ooblayout_ops m7xa_ooblayout_ops = {
+	.ecc = m7xa_ooblayout_ecc,
+	.free = m7xa_ooblayout_free,
+};
+
+/*
+ * m7xa_get_ecc_status - get M7XA ecc correction info from status register
+ * @chip: SPI NAND device structure
+ * @status: status register value
+ * @corrected: corrected bit flip number
+ * @ecc_error: ecc correction error or not
+ */
+static void m7xa_get_ecc_status(struct spinand_device *chip,
+				unsigned int status, unsigned int *corrected,
+				unsigned int *ecc_error)
+{
+	unsigned int ecc_status = status & SPI_NAND_M7XA_ECC_MASK;
+
+	*ecc_error = (ecc_status == SPI_NAND_M7XA_ECC_UNCORR);
+	switch (ecc_status) {
+	case SPI_NAND_M7XA_ECC_0_BIT:
+		*corrected = 0;
+		break;
+	case SPI_NAND_M7XA_ECC_1_3_BIT:
+		*corrected = 3;
+		break;
+	case SPI_NAND_M7XA_ECC_4_6_BIT:
+		*corrected = 6;
+		break;
+	case SPI_NAND_M7XA_ECC_7_8_BIT:
+		*corrected = 8;
+		break;
+	}
+}
+
+static const struct spinand_ecc_engine_ops m7xa_ecc_engine_ops = {
+	.get_ecc_status = m7xa_get_ecc_status,
+};
+
+static const struct micron_spinand_info micron_spinand_table[] = {
+	MICRON_SPI_NAND_INFO("MT29F2G01ABAGD", 0x24, 2048, 128, 64, 2048, 1,
+			     8, 512, SPINAND_OP_COMMON, &m7xa_ooblayout_ops,
+			     &m7xa_ecc_engine_ops),
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
+ * micron_spinand_scan_id_table - scan chip info in id table
+ * @chip: SPI-NAND device structure
+ * @id: point to manufacture id and device id
+ * Description:
+ *   If found in id table, config chip with table information.
+ */
+static bool micron_spinand_scan_id_table(struct spinand_device *chip, u8 dev_id)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct micron_spinand_info *item = NULL;
+	struct nand_memory_organization *memorg = &nand->memorg;
+	struct spinand_ecc_engine *ecc_engine = NULL;
+	int i = 0;
+
+	for (; i < ARRAY_SIZE(micron_spinand_table); i++) {
+		item = (struct micron_spinand_info *)micron_spinand_table + i;
+		if (dev_id != item->dev_id)
+			continue;
+		chip->name = item->name;
+		memorg->eraseblocksize = item->page_size * item->pages_per_blk;
+		memorg->pagesize = item->page_size;
+		memorg->oobsize = item->oob_size;
+		memorg->diesize = memorg->eraseblocksize * item->blks_per_lun;
+		memorg->ndies = item->luns_per_chip;
+		if (chip->ecc.type == SPINAND_ECC_ONDIE) {
+			ecc_engine = devm_kzalloc(chip->dev,
+						  sizeof(*ecc_engine),
+						  GFP_KERNEL);
+			if (!ecc_engine) {
+				dev_err(chip->dev,
+					"fail to allocate ecc engine.\n");
+				return false;
+			}
+			ecc_engine->ops = item->ecc_engine_ops;
+			ecc_engine->strength = item->ecc_strength;
+			ecc_engine->steps = item->ecc_steps;
+			mtd_set_ooblayout(mtd, item->ooblayout_ops);
+			chip->ecc.engine = ecc_engine;
+		}
+		chip->rw_mode = item->rw_mode;
+
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * micron_spinand_detect - initialize device related part in spinand_device
+ * struct if it is Micron device.
+ * @chip: SPI NAND device structure
+ */
+static bool micron_spinand_detect(struct spinand_device *chip)
+{
+	u8 *id = chip->id.data;
+
+	/*
+	 * Micron SPI NAND read ID need a dummy byte,
+	 * so the first byte in raw_id is dummy.
+	 */
+	if (id[1] != SPINAND_MFR_MICRON)
+		return false;
+
+	return micron_spinand_scan_id_table(chip, id[2]);
+}
+
+/*
+ * micron_spinand_cleanup -  free manufacutre related resources
+ * @chip: SPI NAND device structure
+ */
+static void micron_spinand_cleanup(struct spinand_device *chip)
+{
+	if (chip->ecc.type == SPINAND_ECC_ONDIE)
+		devm_kfree(chip->dev, chip->ecc.engine);
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
+			     & 0x1) << 4);
+	op->n_addr += micron_spinand_get_dummy(chip, op);
+}
+
+static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
+	.detect = micron_spinand_detect,
+	.cleanup = micron_spinand_cleanup,
+	.prepare_op = micron_spinand_prepare_op,
+};
+
+const struct spinand_manufacturer micron_spinand_manufacture = {
+	.id = SPINAND_MFR_MICRON,
+	.name = "Micron",
+	.ops = &micron_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c8bb70..3c6dd48 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -111,6 +111,8 @@ struct spinand_manufacturer {
 	const struct spinand_manufacturer_ops *ops;
 };
 
+extern const struct spinand_manufacturer micron_spinand_manufacture;
+
 struct spinand_ecc_engine_ops {
 	void (*get_ecc_status)(struct spinand_device *chip,
 			       unsigned int status, unsigned int *corrected,
-- 
1.9.1
