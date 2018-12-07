Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ0-0001T5-Ah
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
Subject: [RFC PATCH 25/34] mtd: spi-nor: Move Micron/ST bits out of core.c
Date: Fri,  7 Dec 2018 10:26:28 +0100
Message-Id: <20181207092637.18687-26-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Micron/ST chips, and move the
Micron/ST definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      |  73 +------------------
 drivers/mtd/spi-nor/internals.h |   2 +
 drivers/mtd/spi-nor/micron-st.c | 121 ++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+), 71 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/micron-st.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index c8ba7009e3ac..3cbd445518e9 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -9,6 +9,7 @@ spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
+spi-nor-objs			+= micron-st.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0118fafd7c65..7282c261da88 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1364,28 +1364,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Micron <--> ST Micro */
-	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
-	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
-	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
-
-	/* Micron */
-	{
-		"mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
-			SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES)
-	},
-
 	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
@@ -1433,42 +1411,6 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
-	/* ST Microelectronics -- newer production may have feature updates */
-	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
-	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
-	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
-	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
-	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
-	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
-	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
-
-	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
-	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
-	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4, 0) },
-	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8, 0) },
-	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16, 0) },
-	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32, 0) },
-	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64, 0) },
-	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128, 0) },
-	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
-
-	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
-	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
-	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
-
-	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
-	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
-	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
-
-	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
-	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
-	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
-
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
@@ -1550,6 +1492,8 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_intel,
 	&spi_nor_issi,
 	&spi_nor_macronix,
+	&spi_nor_micron,
+	&spi_nor_st,
 };
 
 static const struct flash_info *
@@ -3193,14 +3137,6 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 	return ret;
 }
 
-static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
-{
-	/* All ST/Micron NORs support the unlock/lock operations. */
-	nor->flags |= SNOR_F_HAS_LOCK;
-	nor->set_4byte = en4_ex4_wen_set_4byte;
-	nor->quad_enable = no_quad_enable;
-}
-
 static void winbond_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->set_4byte = winbond_set_4byte;
@@ -3281,11 +3217,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
 	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_ST:
-	case SNOR_MFR_MICRON:
-		st_micron_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_SPANSION:
 		spansion_post_sfdp_fixups(nor);
 		break;
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index cb8968824098..888ef8d25f6b 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -342,6 +342,8 @@ extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
+extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_st;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
new file mode 100644
index 000000000000..7d9574d587a9
--- /dev/null
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -0,0 +1,121 @@
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
+static int micron_st_post_sfdp_fixups(struct spi_nor *nor,
+				      struct spi_nor_flash_parameter *params)
+{
+	/* All ST/Micron NORs support the unlock/lock operations. */
+	nor->flags |= SNOR_F_HAS_LOCK;
+	nor->set_4byte = en4_ex4_wen_set_4byte;
+	nor->quad_enable = no_quad_enable;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups micron_st_fixups = {
+	.post_sfdp = micron_st_post_sfdp_fixups,
+};
+
+static const struct flash_info micron_parts[] = {
+	{
+		"mt35xu512aba",
+		INFO(0x2c5b1a, 0, 128 * 1024, 512,
+		     SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES)
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_micron = {
+	.name = "micron",
+	.parts = micron_parts,
+	.nparts = ARRAY_SIZE(micron_parts),
+	.fixups = &micron_st_fixups,
+};
+
+static const struct flash_info st_parts[] = {
+	{
+		"n25q016a",
+		INFO(0x20bb15, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q032",
+		INFO(0x20ba16, 0, 64 * 1024, 64, SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q032a",
+		INFO(0x20bb16, 0, 64 * 1024, 64, SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q064",
+		INFO(0x20ba17, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q064a",
+		INFO(0x20bb17, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q128a11",
+		INFO(0x20bb18, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q128a13",
+		INFO(0x20ba18, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q256a",
+		INFO(0x20ba19, 0, 64 * 1024, 512,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q256ax1",
+		INFO(0x20bb19, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q512a",
+		INFO(0x20bb20, 0, 64 * 1024, 1024,
+		     SECT_4K | USE_FSR | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q512ax3",
+		INFO(0x20ba20, 0, 64 * 1024, 1024,
+		     SECT_4K | USE_FSR | SPI_NOR_QUAD_READ)
+	},
+	{
+		"n25q00",
+		INFO(0x20ba21, 0, 64 * 1024, 2048,
+		     SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE)
+	},
+	{
+		"n25q00a",
+		INFO(0x20bb21, 0, 64 * 1024, 2048,
+		     SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE)
+	},
+	{
+		"mt25qu02g",
+		INFO(0x20bb22, 0, 64 * 1024, 4096,
+		     SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE)
+	},
+	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
+	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
+	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
+	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
+	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
+	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
+	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
+	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
+	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
+};
+
+const struct spi_nor_manufacturer spi_nor_st = {
+	.name = "st",
+	.parts = st_parts,
+	.nparts = ARRAY_SIZE(st_parts),
+	.fixups = &micron_st_fixups,
+};
-- 
2.17.1
