Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ3-0005hI-EZ
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:37 +0000
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
Subject: [RFC PATCH 21/34] mtd: spi-nor: Move GigaDevice bits out of core.c
Date: Fri,  7 Dec 2018 10:26:24 +0100
Message-Id: <20181207092637.18687-22-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for GigaDevice chips, and move the
GigaDevice definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile     |  1 +
 drivers/mtd/spi-nor/core.c       | 51 +---------------------
 drivers/mtd/spi-nor/gigadevice.c | 74 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/internals.h  |  1 +
 4 files changed, 77 insertions(+), 50 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/gigadevice.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index fc85f8602d11..ab2378d8b497 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -5,6 +5,7 @@ spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
 spi-nor-objs			+= fujitsu.o
+spi-nor-objs			+= gigadevice.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4e83cd640128..c452c8adcc46 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1352,18 +1352,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-static int gd25q256_post_sfdp_fixups(struct spi_nor *nor,
-				     struct spi_nor_flash_parameter *params)
-{
-	params->quad_enable = sr1_bit6_quad_enable;
-
-	return 0;
-}
-
-static const struct spi_nor_fixups gd25q256_fixups = {
-	.post_sfdp = gd25q256_post_sfdp_fixups,
-};
-
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -1401,44 +1389,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* GigaDevice */
-	{
-		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-	},
-	{
-		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-		.fixups = &gd25q256_fixups,
-	},
-
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
 	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
@@ -1679,6 +1629,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_esmt,
 	&spi_nor_everspin,
 	&spi_nor_fujitsu,
+	&spi_nor_gigadevice,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
new file mode 100644
index 000000000000..34c64b6fd549
--- /dev/null
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -0,0 +1,74 @@
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
+static int gd25q256_post_sfdp_fixups(struct spi_nor *nor,
+                                     struct spi_nor_flash_parameter *params)
+{
+	params->quad_enable = sr1_bit6_quad_enable;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups gd25q256_fixups = {
+	.post_sfdp = gd25q256_post_sfdp_fixups,
+};
+
+static const struct flash_info gigadevice_parts[] = {
+	{
+		"gd25q16",
+		INFO(0xc84015, 0, 64 * 1024,  32,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q32",
+		INFO(0xc84016, 0, 64 * 1024,  64,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lq32",
+		INFO(0xc86016, 0, 64 * 1024, 64,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q64",
+		INFO(0xc84017, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lq64c",
+		INFO(0xc86017, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q128",
+		INFO(0xc84018, 0, 64 * 1024, 256,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q256",
+		INFO(0xc84019, 0, 64 * 1024, 512,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		.fixups = &gd25q256_fixups,
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_gigadevice = {
+	.name = "gigadevice",
+	.parts = gigadevice_parts,
+	.nparts = ARRAY_SIZE(gigadevice_parts),
+};
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 5dffc0c51826..a21822513c26 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -338,6 +338,7 @@ extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
 extern const struct spi_nor_manufacturer spi_nor_fujitsu;
+extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
-- 
2.17.1
