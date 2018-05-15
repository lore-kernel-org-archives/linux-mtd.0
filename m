Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIbZP-0005ml-0F
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 15:08:58 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v7 5/5] mtd: nand: spi: Add initial support for Winbond
 W25M02GV
Date: Tue, 15 May 2018 17:08:25 +0200
Message-Id: <20180515150825.19835-6-boris.brezillon@bootlin.com>
In-Reply-To: <20180515150825.19835-1-boris.brezillon@bootlin.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Frieder Schrempf <frieder.schrempf@exceet.de>

Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/winbond.c | 141 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/winbond.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 79a1f1e79221..983a94f7f205 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,2 +1,2 @@
-spinand-objs := core.o micron.o
+spinand-objs := core.o micron.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a4b8906d7084..057adb5e1a0c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -769,6 +769,7 @@ static const struct nand_ops spinand_ops = {
 
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&micron_spinand_manufacturer,
+	&winbond_spinand_manufacturer,
 };
 
 static int spinand_manufacturer_detect(struct spinand_device *spinand)
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
new file mode 100644
index 000000000000..67baa1b32c00
--- /dev/null
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017 exceet electronics GmbH
+ *
+ * Authors:
+ *	Frieder Schrempf <frieder.schrempf@exceet.de>
+ *	Boris Brezillon <boris.brezillon@bootlin.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_WINBOND		0xEF
+
+#define WINBOND_CFG_BUF_READ		BIT(3)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int w25m02gv_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int w25m02gv_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 2;
+	region->length = 6;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25m02gv_ooblayout = {
+	.ecc = w25m02gv_ooblayout_ecc,
+	.free = w25m02gv_ooblayout_free,
+};
+
+static int w25m02gv_select_target(struct spinand_device *spinand,
+				  unsigned int target)
+{
+	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0xc2, 1),
+					  SPI_MEM_OP_NO_ADDR,
+					  SPI_MEM_OP_NO_DUMMY,
+					  SPI_MEM_OP_DATA_OUT(1,
+							spinand->scratchbuf,
+							1));
+
+	*spinand->scratchbuf = target;
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
+static const struct spinand_info winbond_spinand_table[] = {
+	SPINAND_INFO("W25M02GV", 0xAB,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 2),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
+		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
+};
+
+/**
+ * winbond_spinand_detect - initialize device related part in spinand_device
+ * struct if it is a Winbond device.
+ * @spinand: SPI NAND device structure
+ */
+static int winbond_spinand_detect(struct spinand_device *spinand)
+{
+	u8 *id = spinand->id.data;
+	int ret;
+
+	/*
+	 * Winbond SPI NAND read ID need a dummy byte,
+	 * so the first byte in raw_id is dummy.
+	 */
+	if (id[1] != SPINAND_MFR_WINBOND)
+		return 0;
+
+	ret = spinand_match_and_init(spinand, winbond_spinand_table,
+				     ARRAY_SIZE(winbond_spinand_table), id[2]);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static int winbond_spinand_init(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	unsigned int i;
+
+	/*
+	 * Make sure all dies are in buffer read mode and not continuous read
+	 * mode.
+	 */
+	for (i = 0; i < nand->memorg.ntargets; i++) {
+		spinand_select_target(spinand, i);
+		spinand_upd_cfg(spinand, WINBOND_CFG_BUF_READ,
+				WINBOND_CFG_BUF_READ);
+	}
+
+	return 0;
+}
+
+static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
+	.detect = winbond_spinand_detect,
+	.init = winbond_spinand_init,
+};
+
+const struct spinand_manufacturer winbond_spinand_manufacturer = {
+	.id = SPINAND_MFR_WINBOND,
+	.name = "Winbond",
+	.ops = &winbond_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 11a18c1993e8..31d993628a0d 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -194,6 +194,7 @@ struct spinand_manufacturer {
 
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
+extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 
 /**
  * struct spinand_op_variants - SPI NAND operation variants
-- 
2.14.1
