Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPq-000109-1U
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:34 +0000
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
Subject: [RFC PATCH 23/34] mtd: spi-nor: Move ISSI bits out of core.c
Date: Fri,  7 Dec 2018 10:26:26 +0100
Message-Id: <20181207092637.18687-24-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for ISSI chips, and move the
ISSI definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |  1 +
 drivers/mtd/spi-nor/core.c      | 27 +------------
 drivers/mtd/spi-nor/internals.h |  1 +
 drivers/mtd/spi-nor/issi.c      | 67 +++++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+), 26 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/issi.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 3d884b45a174..51399122b497 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -7,6 +7,7 @@ spi-nor-objs			+= everspin.o
 spi-nor-objs			+= fujitsu.o
 spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
+spi-nor-objs			+= issi.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7788d7429318..c1492f4c4f27 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1389,27 +1389,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* ISSI */
-	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
-	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64,
-			SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128,
-			SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
-			SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
-			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
@@ -1459,11 +1438,6 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES)
 	},
 
-	/* PMC */
-	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
-	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
-
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
@@ -1626,6 +1600,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_fujitsu,
 	&spi_nor_gigadevice,
 	&spi_nor_intel,
+	&spi_nor_issi,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index f66bee137899..7e976e12be6c 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -340,6 +340,7 @@ extern const struct spi_nor_manufacturer spi_nor_everspin;
 extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
+extern const struct spi_nor_manufacturer spi_nor_issi;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
new file mode 100644
index 000000000000..cdcf4eec7247
--- /dev/null
+++ b/drivers/mtd/spi-nor/issi.c
@@ -0,0 +1,67 @@
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
+static const struct flash_info issi_parts[] = {
+	/* ISSI */
+	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{
+		"is25lq040b",
+		INFO(0x9d4013, 0, 64 * 1024,   8,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"is25lp080d",
+		INFO(0x9d6014, 0, 64 * 1024,  16,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"is25lp032",
+		INFO(0x9d6016, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+        {
+		"is25lp064",
+		INFO(0x9d6017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+	{
+		"is25lp128",
+		INFO(0x9d6018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+	{
+		"is25lp256",
+		INFO(0x9d6019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+	{
+		"is25wp032",
+		INFO(0x9d7016, 0, 64 * 1024,  64,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"is25wp064",
+		INFO(0x9d7017, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"is25wp128",
+		INFO(0x9d7018, 0, 64 * 1024, 256,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+
+	/* PMC */
+	{ "pm25lv512",   INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
+	{ "pm25lv010",   INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
+	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024, 64, SECT_4K) },
+};
+
+const struct spi_nor_manufacturer spi_nor_issi = {
+	.name = "issi",
+	.parts = issi_parts,
+	.nparts = ARRAY_SIZE(issi_parts),
+};
-- 
2.17.1
