Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPq-00010C-0B
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
Subject: [RFC PATCH 19/34] mtd: spi-nor: Move Everspin bits out of core.c
Date: Fri,  7 Dec 2018 10:26:22 +0100
Message-Id: <20181207092637.18687-20-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Everspin chips, and move the
Everspin definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |  1 +
 drivers/mtd/spi-nor/core.c      |  7 +-----
 drivers/mtd/spi-nor/everspin.c  | 39 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/internals.h |  1 +
 4 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/everspin.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index cf9dd268efd3..9a9f499a299d 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -3,6 +3,7 @@ spi-nor-objs			:= core.o
 spi-nor-objs			+= atmel.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
+spi-nor-objs			+= everspin.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6d11f2cec49b..3de5c6b4a49f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1401,12 +1401,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Everspin */
-	{ "mr25h128", CAT25_INFO( 16 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-
 	/* Fujitsu */
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
@@ -1686,6 +1680,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
 	&spi_nor_eon,
 	&spi_nor_esmt,
+	&spi_nor_everspin,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
new file mode 100644
index 000000000000..d04b7215df25
--- /dev/null
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -0,0 +1,39 @@
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
+static const struct flash_info everspin_parts[] = {
+	{
+		"mr25h128",
+		CAT25_INFO(16 * 1024, 1, 256, 2,
+			   SPI_NOR_NO_ERASE | SPI_NOR_NO_FR)
+	},
+	{
+		"mr25h256",
+		CAT25_INFO(32 * 1024, 1, 256, 2,
+			   SPI_NOR_NO_ERASE | SPI_NOR_NO_FR)
+	},
+	{
+		"mr25h10",
+		CAT25_INFO(128 * 1024, 1, 256, 3,
+			   SPI_NOR_NO_ERASE | SPI_NOR_NO_FR)
+	},
+	{
+		"mr25h40",
+		CAT25_INFO(512 * 1024, 1, 256, 3,
+			   SPI_NOR_NO_ERASE | SPI_NOR_NO_FR)
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_everspin = {
+	.name = "everspin",
+	.parts = everspin_parts,
+	.nparts = ARRAY_SIZE(everspin_parts),
+};
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 4dafa2b19c86..8b6adcfed798 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -336,6 +336,7 @@ struct spi_nor_manufacturer {
 extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
+extern const struct spi_nor_manufacturer spi_nor_everspin;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
-- 
2.17.1
