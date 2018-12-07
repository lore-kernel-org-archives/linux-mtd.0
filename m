Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPq-000101-0V
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
Subject: [RFC PATCH 20/34] mtd: spi-nor: Move Fujitsu bits out of
 spi-nor-core.c
Date: Fri,  7 Dec 2018 10:26:23 +0100
Message-Id: <20181207092637.18687-21-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Fujitsu chips, and move the
Fujitsu definitions outside of spi-nor-core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |  1 +
 drivers/mtd/spi-nor/core.c      |  4 +---
 drivers/mtd/spi-nor/fujitsu.c   | 20 ++++++++++++++++++++
 drivers/mtd/spi-nor/internals.h |  1 +
 4 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/fujitsu.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 9a9f499a299d..fc85f8602d11 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -4,6 +4,7 @@ spi-nor-objs			+= atmel.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
+spi-nor-objs			+= fujitsu.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3de5c6b4a49f..4e83cd640128 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1401,9 +1401,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
-
 	/* GigaDevice */
 	{
 		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
@@ -1681,6 +1678,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
+	&spi_nor_fujitsu,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
new file mode 100644
index 000000000000..5cd6aa7f5417
--- /dev/null
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -0,0 +1,20 @@
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
+static const struct flash_info fujitsu_parts[] = {
+	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
+};
+
+const struct spi_nor_manufacturer spi_nor_fujitsu = {
+	.name = "fujitsu",
+	.parts = fujitsu_parts,
+	.nparts = ARRAY_SIZE(fujitsu_parts),
+};
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 8b6adcfed798..5dffc0c51826 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -337,6 +337,7 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
+extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
-- 
2.17.1
