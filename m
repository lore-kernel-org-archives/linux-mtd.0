Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPq-00010A-5g
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:39 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 28/34] mtd: spi-nor: Move Winbond bits out of core.c
Date: Fri,  7 Dec 2018 10:26:31 +0100
Message-Id: <20181207092637.18687-29-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Create a SPI NOR manufacturer driver for Winbond chips, and move the
Winbond definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      |  88 +-----------------------
 drivers/mtd/spi-nor/internals.h |   1 +
 drivers/mtd/spi-nor/winbond.c   | 116 ++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+), 87 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/winbond.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index c41804252e27..f74628184261 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -12,6 +12,7 @@ spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
 spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
+spi-nor-objs			+= winbond.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4721cf812dfe..ff6485473a90 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1364,57 +1364,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
-	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
-	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
-	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
-	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
-	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
-	{
-		"w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
-	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
-	{
-		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
-	{
-		"w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
-			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
-
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
@@ -1449,6 +1398,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_spansion,
 	&spi_nor_sst,
 	&spi_nor_st,
+	&spi_nor_winbond,
 };
 
 static const struct flash_info *
@@ -2991,33 +2941,6 @@ int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)
 	return ret;
 }
 
-static int winbond_set_4byte(struct spi_nor *nor, bool enable)
-{
-	int ret;
-
-	ret = en4_ex4_set_4byte(nor, enable);
-	if (ret || enable)
-		return ret;
-
-	/*
-	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
-	 * Register to be set to 1, so all 3-byte-address reads come from the
-	 * second 16M.
-	 * We must clear the register to enable normal behavior.
-	 */
-	write_enable(nor);
-	nor->cmd_buf[0] = 0;
-	nor->write_reg(nor, SPINOR_OP_WREAR, nor->cmd_buf, 1);
-	write_disable(nor);
-
-	return ret;
-}
-
-static void winbond_post_sfdp_fixups(struct spi_nor *nor)
-{
-	nor->set_4byte = winbond_set_4byte;
-}
-
 static int s3an_post_sfdp_fixups(struct spi_nor *nor)
 {
 	int ret;
@@ -3074,15 +2997,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 	    nor->manufacturer->fixups->post_sfdp)
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_WINBOND:
-		winbond_post_sfdp_fixups(nor);
-		break;
-
-	default:
-		break;
-	}
-
 	if (nor->info->flags & SPI_S3AN)
 		return s3an_post_sfdp_fixups(nor);
 
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 298b4a855774..9030bb49c2a7 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -346,6 +346,7 @@ extern const struct spi_nor_manufacturer spi_nor_micron;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_st;
+extern const struct spi_nor_manufacturer spi_nor_winbond;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
new file mode 100644
index 000000000000..fceaf8392a16
--- /dev/null
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/wait.h>
+#include <linux/mtd/spi-nor.h>
+
+#include "internals.h"
+
+static const struct flash_info winbond_parts[] = {
+	{ "w25x05", INFO(0xef3010, 0, 64 * 1024, 1, SECT_4K) },
+	{ "w25x10", INFO(0xef3011, 0, 64 * 1024, 2, SECT_4K) },
+	{ "w25x20", INFO(0xef3012, 0, 64 * 1024, 4, SECT_4K) },
+	{ "w25x40", INFO(0xef3013, 0, 64 * 1024, 8, SECT_4K) },
+	{ "w25x80", INFO(0xef3014, 0, 64 * 1024, 16, SECT_4K) },
+	{ "w25x16", INFO(0xef3015, 0, 64 * 1024, 32, SECT_4K) },
+	{
+		"w25q16dw",
+		INFO(0xef6015, 0, 64 * 1024,  32,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{ "w25x32", INFO(0xef3016, 0, 64 * 1024, 64, SECT_4K) },
+	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024, 4, SECT_4K) },
+	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024, 4, SECT_4K) },
+	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024, 4, SECT_4K) },
+	{ "w25q32", INFO(0xef4016, 0, 64 * 1024, 64, SECT_4K) },
+	{
+		"w25q32dw",
+		INFO(0xef6016, 0, 64 * 1024,  64,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"w25q32jv",
+		INFO(0xef7016, 0, 64 * 1024, 64,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{
+		"w25q64dw",
+		INFO(0xef6017, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"w25q128fw",
+		INFO(0xef6018, 0, 64 * 1024, 256,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"w25q128jv",
+		INFO(0xef7018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{ "w25q80", INFO(0xef5014, 0, 64 * 1024, 16, SECT_4K) },
+	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024, 16, SECT_4K) },
+	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
+	{
+		"w25q256",
+		INFO(0xef4019, 0, 64 * 1024, 512,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"w25m512jv",
+		INFO(0xef7119, 0, 64 * 1024, 1024,
+		     SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ)
+	},
+};
+
+static int winbond_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = en4_ex4_set_4byte(nor, enable);
+	if (ret || enable)
+		return ret;
+
+	/*
+	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
+	 * Register to be set to 1, so all 3-byte-address reads come from the
+	 * second 16M.
+	 * We must clear the register to enable normal behavior.
+	 */
+	write_enable(nor);
+	nor->cmd_buf[0] = 0;
+	nor->write_reg(nor, SPINOR_OP_WREAR, nor->cmd_buf, 1);
+	write_disable(nor);
+
+	return ret;
+}
+
+static int winbond_post_sfdp_fixups(struct spi_nor *nor,
+				    struct spi_nor_flash_parameter *params)
+{
+	nor->set_4byte = winbond_set_4byte;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_fixups = {
+	.post_sfdp = winbond_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_winbond = {
+	.name = "winbond",
+	.parts = winbond_parts,
+	.nparts = ARRAY_SIZE(winbond_parts),
+	.fixups = &winbond_fixups,
+};
-- 
2.17.1
