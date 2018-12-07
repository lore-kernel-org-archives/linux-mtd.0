Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPv-0001KW-Au
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:46 +0000
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
Subject: [RFC PATCH 16/34] mtd: spi-nor: Move Atmel bits out of core.c
Date: Fri,  7 Dec 2018 10:26:19 +0100
Message-Id: <20181207092637.18687-17-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Atmel chips, and move the
Atmel definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |  1 +
 drivers/mtd/spi-nor/atmel.c     | 47 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c      | 29 +++-----------------
 drivers/mtd/spi-nor/internals.h |  3 +++
 4 files changed, 54 insertions(+), 26 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/atmel.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 0d6c4967a445..fd8454d38b17 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 spi-nor-objs			:= core.o
+spi-nor-objs			+= atmel.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
new file mode 100644
index 000000000000..a700a17fdead
--- /dev/null
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -0,0 +1,47 @@
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
+static const struct flash_info atmel_parts[] = {
+	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
+	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
+	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
+
+	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
+	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
+	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
+	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
+
+	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
+	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
+	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
+	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
+
+	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
+};
+
+static int atmel_post_sfdp_fixups(struct spi_nor *nor,
+				  struct spi_nor_flash_parameter *params)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups atmel_fixups = {
+	.post_sfdp = atmel_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_atmel = {
+	.name = "atmel",
+	.parts = atmel_parts,
+	.nparts = ARRAY_SIZE(atmel_parts),
+	.fixups = &atmel_fixups,
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bdbedb464c1..28b0d46aa3a0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1401,22 +1401,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
-
-	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
-	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
-
-	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
-	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
-	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
-	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
-
-	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
-
 	/* EON -- en25xxx */
 	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
 	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
@@ -1714,7 +1698,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ },
 };
 
-static const struct spi_nor_manufacturer *manufacturers[0];
+static const struct spi_nor_manufacturer *manufacturers[] = {
+	&spi_nor_atmel,
+};
 
 static const struct flash_info *
 spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
@@ -3394,11 +3380,6 @@ static void intel_post_sfdp_fixups(struct spi_nor *nor)
 	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
 }
 
-static void atmel_post_sfdp_fixups(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
-}
-
 static void sst_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
@@ -3461,10 +3442,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
 	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_ATMEL:
-		atmel_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_INTEL:
 		intel_post_sfdp_fixups(nor);
 		break;
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 5ed65f46333d..9ad903a51846 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -332,6 +332,9 @@ struct spi_nor_manufacturer {
 	const struct spi_nor_fixups *fixups;
 };
 
+/* Manufacturer drivers. */
+extern const struct spi_nor_manufacturer spi_nor_atmel;
+
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
 int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable);
-- 
2.17.1
