Received: from mailout.micron.com ([137.201.242.129])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQIG-0004zO-Ag
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:23 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 13/15] nand: spi: add Micron spi nand support
Date: Wed, 24 May 2017 15:07:09 +0800
Message-ID: <1495609631-18880-14-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
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
 drivers/mtd/nand/spi/micron.c | 157 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   2 +
 4 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/micron.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index a677a4d..df6c2ea 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_MTD_SPI_NAND) += core.o
+obj-$(CONFIG_MTD_SPI_NAND) += micron.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 345d04f..05610c6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1129,7 +1129,9 @@ static int spinand_scan_bbt(struct spinand_device *spinand)
 	return nand_scan_bbt(nand);
 }
 
-static const struct spinand_manufacturer *spinand_manufacturers[] = {};
+static const struct spinand_manufacturer *spinand_manufacturers[] = {
+	&micron_spinand_manufacturer
+};
 
 /**
  * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
new file mode 100644
index 0000000..43784db
--- /dev/null
+++ b/drivers/mtd/nand/spi/micron.c
@@ -0,0 +1,157 @@
+/*
+ *
+ * Copyright (c) 2016-2017 Micron Technology, Inc.
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
+};
+
+#define MICRON_SPI_NAND_INFO(nm, did, pagesz, oobsz, pg_per_blk,	\
+			     blk_per_lun, lun_per_chip, ecc_stren,	\
+			     ecc_stps, rwmode)		\
+	{	\
+		.name = (nm),	\
+		.dev_id = (did),	\
+		.page_size = (pagesz),	\
+		.oob_size = (oobsz),	\
+		.pages_per_blk = (pg_per_blk),	\
+		.blks_per_lun = (blk_per_lun),	\
+		.luns_per_chip = (lun_per_chip),\
+		.ecc_strength = (ecc_stren),	\
+		.ecc_steps = (ecc_stps),	\
+		.rw_mode = (rwmode)	\
+	}
+
+static const struct micron_spinand_info micron_spinand_table[] = {
+	MICRON_SPI_NAND_INFO("MT29F2G01ABAGD", 0x24, 2048, 128, 64, 2048, 1,
+			     8, 512, SPINAND_OP_COMMON),
+};
+
+static int micron_spinand_get_dummy(struct spinand_device *spinand,
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
+
+	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
+		return 2;
+
+	default:
+		return 0;
+	}
+}
+
+/**
+ * micron_spinand_scan_id_table - scan SPI NAND info in id table
+ * @spinand: SPI NAND device structure
+ * @id: point to manufacture id and device id
+ * Description:
+ *   If found in id table, config device with table information.
+ */
+static bool micron_spinand_scan_id_table(struct spinand_device *spinand,
+					 u8 dev_id)
+{
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct micron_spinand_info *item = NULL;
+	struct nand_memory_organization *memorg = &nand->memorg;
+	int i = 0;
+
+	for (; i < ARRAY_SIZE(micron_spinand_table); i++) {
+		item = (struct micron_spinand_info *)micron_spinand_table + i;
+		if (dev_id != item->dev_id)
+			continue;
+
+		spinand->name = item->name;
+		memorg->eraseblocksize = item->page_size * item->pages_per_blk;
+		memorg->pagesize = item->page_size;
+		memorg->oobsize = item->oob_size;
+		memorg->diesize = memorg->eraseblocksize * item->blks_per_lun;
+		memorg->ndies = item->luns_per_chip;
+		spinand->rw_mode = item->rw_mode;
+
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * micron_spinand_detect - initialize device related part in spinand_device
+ * struct if it is Micron device.
+ * @spinand: SPI NAND device structure
+ */
+static bool micron_spinand_detect(struct spinand_device *spinand)
+{
+	u8 *id = spinand->id.data;
+
+	/*
+	 * Micron SPI NAND read ID need a dummy byte,
+	 * so the first byte in raw_id is dummy.
+	 */
+	if (id[1] != SPINAND_MFR_MICRON)
+		return false;
+
+	return micron_spinand_scan_id_table(spinand, id[2]);
+}
+
+/**
+ * micron_spinand_prepare_op - Fix address for cache operation.
+ * @spinand: SPI NAND device structure
+ * @op: pointer to spinand_op struct
+ * @page: page address
+ * @column: column address
+ */
+static void micron_spinand_prepare_op(struct spinand_device *spinand,
+				      struct spinand_op *op, u32 page,
+				      u32 column)
+{
+	op->addr[0] |= (u8)((nand_page_to_eraseblock(&spinand->base, page)
+			     & 0x1) << 4);
+	op->n_addr += micron_spinand_get_dummy(spinand, op);
+}
+
+static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
+	.detect = micron_spinand_detect,
+	.prepare_op = micron_spinand_prepare_op,
+};
+
+const struct spinand_manufacturer micron_spinand_manufacturer = {
+	.id = SPINAND_MFR_MICRON,
+	.name = "Micron",
+	.ops = &micron_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 04ad1dd..8ef2c69 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -125,6 +125,8 @@ struct spinand_manufacturer {
 	const struct spinand_manufacturer_ops *ops;
 };
 
+extern const struct spinand_manufacturer micron_spinand_manufacturer;
+
 #define SPINAND_CAP_RD_X1	BIT(0)
 #define SPINAND_CAP_RD_X2	BIT(1)
 #define SPINAND_CAP_RD_X4	BIT(2)
-- 
1.9.1
