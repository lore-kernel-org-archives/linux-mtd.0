Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRdtx-0004io-1k
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 13:59:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so17163180wrr.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 05:59:34 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC] mtd: spinand: Add initial support for Toshiba TC58CVG2S0F
Date: Tue, 27 Nov 2018 14:59:23 +0100
Message-Id: <20181127135923.13787-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for Toshiba chip TC58CVG2S0F

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Hi,

Thanks a lot for adding this framework to Linux it's very nice and easy to read.

This is my first SPI Nand/Nand board so I'm still unfamiliar with those BBM and OOB features.

In the ECC status maybe I should return the Maximum Bit Flip Count (page 34 of the DS) like it's done for Macronix.

Datasheet could be found here: https://media.digikey.com/pdf/Data%20Sheets/Toshiba%20PDFs/TC58CVG2S0HxAIx_Rev1.1_2016-11-08.pdf


Also this has not been fully tested and untested with a QuadSPI controller.

Thanks,
Clement


 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |   1 +
 drivers/mtd/nand/spi/toshiba.c | 112 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   1 +
 4 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/toshiba.c

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index b74e074b363a..be5f73512ece 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o macronix.o micron.o winbond.o
+spinand-objs := core.o macronix.o micron.o toshiba.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 30f83649c481..87bdf2a7b724 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -766,6 +766,7 @@ static const struct nand_ops spinand_ops = {
 static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
+	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
 };
 
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
new file mode 100644
index 000000000000..6ff65949ddd0
--- /dev/null
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Clément Péron <peron.clem@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_TOSHIBA		0x98
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int tc58_ooblayout_ecc(struct mtd_info *mtd, int section,
+			      struct mtd_oob_region *region)
+{
+	/* ECC not accesible when Internal ECC is turned on. */
+	return -ERANGE;
+}
+
+static int tc58_ooblayout_free(struct mtd_info *mtd, int section,
+			       struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = 126;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops tc58_ooblayout = {
+	.ecc = tc58_ooblayout_ecc,
+	.free = tc58_ooblayout_free,
+};
+
+static int tc58_ecc_get_status(struct spinand_device *spinand,
+			       u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		return 4;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		return 8;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info toshiba_spinand_table[] = {
+	SPINAND_INFO("TC58CVG2S0F", 0xCD,
+		     NAND_MEMORG(1, SZ_4K, 256, 64, 2048, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58_ooblayout, tc58_ecc_get_status)),
+};
+/**
+ * toshiba_spinand_detect - initialize device related part in spinand_device
+ * struct if it is a Toshiba device.
+ * @spinand: SPI NAND device structure
+ */
+static int toshiba_spinand_detect(struct spinand_device *spinand)
+{
+	u8 *id = spinand->id.data;
+	int ret;
+
+	/*
+	 * Toshiba SPI NAND read ID need a dummy byte,
+	 * so the first byte in raw_id is dummy.
+	 */
+	if (id[1] != SPINAND_MFR_TOSHIBA)
+		return 0;
+
+	ret = spinand_match_and_init(spinand, toshiba_spinand_table,
+				     ARRAY_SIZE(toshiba_spinand_table), id[2]);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {
+	.detect = toshiba_spinand_detect,
+};
+
+const struct spinand_manufacturer toshiba_spinand_manufacturer = {
+	.id = SPINAND_MFR_TOSHIBA,
+	.name = "Toshiba",
+	.ops = &toshiba_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 088ff96c3eb6..816c4b00abca 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -196,6 +196,7 @@ struct spinand_manufacturer {
 /* SPI NAND manufacturers */
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
+extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 
 /**
-- 
2.19.1
