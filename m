Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPq-0000zf-1v
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:35 +0000
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
Subject: [RFC PATCH 26/34] mtd: spi-nor: Move Spansion bits out of core.c
Date: Fri,  7 Dec 2018 10:26:29 +0100
Message-Id: <20181207092637.18687-27-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Spansion chips, and move the
Spansion definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      |  50 +-----------
 drivers/mtd/spi-nor/internals.h |   1 +
 drivers/mtd/spi-nor/spansion.c  | 137 ++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+), 49 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/spansion.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 3cbd445518e9..81edb2734e90 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -10,6 +10,7 @@ spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
+spi-nor-objs			+= spansion.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7282c261da88..a7f309ffe28c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1364,38 +1364,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Spansion/Cypress -- single (large) sector size only, at least
-	 * for the chips listed here (without boot sectors).
-	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
-	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
-	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
-	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
@@ -1493,6 +1461,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_issi,
 	&spi_nor_macronix,
 	&spi_nor_micron,
+	&spi_nor_spansion,
 	&spi_nor_st,
 };
 
@@ -3142,19 +3111,6 @@ static void winbond_post_sfdp_fixups(struct spi_nor *nor)
 	nor->set_4byte = winbond_set_4byte;
 }
 
-static void spansion_post_sfdp_fixups(struct spi_nor *nor)
-{
-	struct mtd_info *mtd = &nor->mtd;
-
-	if (mtd->size > SZ_16M) {
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-		/* No small sector erase for 4-byte command set */
-		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = nor->info->sector_size;
-	}
-}
-
 static void sst_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
@@ -3217,10 +3173,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
 	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_SPANSION:
-		spansion_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_SST:
 		sst_post_sfdp_fixups(nor);
 		break;
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 888ef8d25f6b..b68c16194978 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -343,6 +343,7 @@ extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
+extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_st;
 
 /* Core helpers. */
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
new file mode 100644
index 000000000000..964f6e072d6c
--- /dev/null
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/sizes.h>
+#include <linux/wait.h>
+#include <linux/mtd/spi-nor.h>
+
+#include "internals.h"
+
+static const struct flash_info spansion_parts[] = {
+	{
+		"s25sl032p",
+		INFO(0x010215, 0x4d00, 64 * 1024, 64,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"s25sl064p",
+		INFO(0x010216, 0x4d00, 64 * 1024, 128,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"s25fl256s0",
+		INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR)
+	},
+	{
+		"s25fl256s1",
+		INFO(0x010219, 0x4d01, 64 * 1024, 512,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	},
+	{
+		"s25fl512s",
+		INFO(0x010220, 0x4d00, 256 * 1024, 256,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	},
+	{ "s70fl01gs", INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
+	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
+	{ "s25sl12801", INFO(0x012018, 0x0301, 64 * 1024, 256, 0) },
+	{
+		"s25fl128s",
+		INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
+		      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	},
+	{
+		"s25fl129p0",
+		INFO(0x012018, 0x4d00, 256 * 1024, 64,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	},
+	{
+		"s25fl129p1",
+		INFO(0x012018, 0x4d01, 64 * 1024, 256,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	},
+	{ "s25sl004a", INFO(0x010212, 0,  64 * 1024,   8, 0) },
+	{ "s25sl008a", INFO(0x010213, 0,  64 * 1024,  16, 0) },
+	{ "s25sl016a", INFO(0x010214, 0,  64 * 1024,  32, 0) },
+	{ "s25sl032a", INFO(0x010215, 0,  64 * 1024,  64, 0) },
+	{ "s25sl064a", INFO(0x010216, 0,  64 * 1024, 128, 0) },
+	{
+		"s25fl004k",
+		INFO(0xef4013, 0, 64 * 1024, 8,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"s25fl008k",
+		INFO(0xef4014, 0, 64 * 1024, 16,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"s25fl016k",
+		INFO(0xef4015, 0, 64 * 1024, 32,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{ "s25fl064k", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{
+		"s25fl116k",
+		INFO(0x014015, 0, 64 * 1024, 32,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{ "s25fl132k", INFO(0x014016, 0, 64 * 1024, 64, SECT_4K) },
+	{ "s25fl164k", INFO(0x014017, 0, 64 * 1024, 128, SECT_4K) },
+	{
+		"s25fl204k",
+		INFO(0x014013, 0, 64 * 1024, 8, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+	{
+		"s25fl208k",
+		INFO(0x014014, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_DUAL_READ)
+	},
+	{
+		"s25fl064l",
+		INFO(0x016017, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_4B_OPCODES)
+	},
+	{
+		"s25fl128l",
+		INFO(0x016018, 0, 64 * 1024, 256,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_4B_OPCODES)
+	},
+	{
+		"s25fl256l",
+		INFO(0x016019, 0, 64 * 1024, 512,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_4B_OPCODES)
+	},
+};
+
+static int spansion_post_sfdp_fixups(struct spi_nor *nor,
+				     struct spi_nor_flash_parameter *params)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	if (mtd->size > SZ_16M) {
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = nor->info->sector_size;
+	}
+
+	return 0;
+}
+
+static const struct spi_nor_fixups spansion_fixups = {
+	.post_sfdp = spansion_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_spansion = {
+	.name = "spansion",
+	.parts = spansion_parts,
+	.nparts = ARRAY_SIZE(spansion_parts),
+	.fixups = &spansion_fixups,
+};
-- 
2.17.1
