Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpJ-0002ML-O3
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:41 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 5/6] nand: spi: add Micron spi nand support
Date: Wed, 1 Mar 2017 16:52:09 +0800
Message-ID: <1488358330-23832-6-git-send-email-peterpandong@micron.com>
In-Reply-To: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
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
 drivers/mtd/nand/spi/Makefile         |   1 +
 drivers/mtd/nand/spi/spinand_ids.c    |   5 ++
 drivers/mtd/nand/spi/spinand_micron.c | 133 ++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/spinand_micron.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 6f0d622..84b9bcc 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MTD_SPI_NAND) += spinand_base.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand_ids.o
+obj-$(CONFIG_MTD_SPI_NAND) += spinand_micron.o
diff --git a/drivers/mtd/nand/spi/spinand_ids.c b/drivers/mtd/nand/spi/spinand_ids.c
index 7706ae3..10f74f1 100644
--- a/drivers/mtd/nand/spi/spinand_ids.c
+++ b/drivers/mtd/nand/spi/spinand_ids.c
@@ -18,11 +18,16 @@
 #include <linux/mtd/spinand.h>
 
 struct spinand_flash spinand_table[] = {
+	SPI_NAND_INFO("MT29F2G01ABAGD", 0x2C, 0x24, 2048, 128, 64, 2048,
+			1, 8, SPINAND_OP_COMMON),
 	{.name = NULL},
 };
 
 
+extern struct spinand_manufacturer_ops micron_spinand_manuf_ops;
+
 struct spinand_manufacturer spinand_manuf_ids[] = {
+	{SPINAND_MFR_MICRON, "Micron", &micron_spinand_manuf_ops},
 	{0x0, "Unknown"}
 };
 
diff --git a/drivers/mtd/nand/spi/spinand_micron.c b/drivers/mtd/nand/spi/spinand_micron.c
new file mode 100644
index 0000000..d978935
--- /dev/null
+++ b/drivers/mtd/nand/spi/spinand_micron.c
@@ -0,0 +1,133 @@
+/**
+* spi-nand-base.c
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+
+#include <linux/mtd/spinand.h>
+
+#define SPI_NAND_MT29F_ECC_MASK		0x70
+#define SPI_NAND_MT29F_ECC_0_BIT	0x00
+#define SPI_NAND_MT29F_ECC_1_3_BIT	0x10
+#define SPI_NAND_MT29F_ECC_4_6_BIT	0x30
+#define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
+#define SPI_NAND_MT29F_ECC_UNCORR	0x20
+
+
+static int micron_ooblayout_ecc_128(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
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
+				  struct mtd_oob_region *oobregion)
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
+static void mt29f_get_ecc_status(struct spinand_device *chip,
+					unsigned int status,
+					unsigned int *corrected,
+					unsigned int *ecc_error)
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
+static void mt29f_build_column_addr(struct spinand_device *chip,
+				           struct spinand_op *op,
+				           u32 page, u32 column)
+{
+	struct nand_device *nand = &chip->base;
+
+	op->n_addr = 2;
+	op->addr[0] = (u8)(column >> 8);
+	op->addr[0] |= (u8)((nand_page_to_eraseblock(nand, page)
+				& 0x1) << 4);
+	op->addr[1] = (u8)column;
+}
+
+static int micron_spinand_get_dummy(struct spinand_device *chip,
+				             struct spinand_op *op)
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
+static struct spinand_ecc_engine_ops generic_spi_ecc_engine_ops = {
+	.get_ecc_status = mt29f_get_ecc_status,
+};
+
+static int micron_spinand_init(struct spinand_device *chip)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	chip->ecc_engine.ops = &generic_spi_ecc_engine_ops;
+	if (nand_per_page_oobsize(nand) == 128)
+		mtd_set_ooblayout(mtd, &micron_ooblayout_128_ops);
+
+	return 0;
+}
+
+const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
+	.init = micron_spinand_init,
+	.build_column_addr = mt29f_build_column_addr,
+	.get_dummy = micron_spinand_get_dummy,
+};
-- 
1.9.1
