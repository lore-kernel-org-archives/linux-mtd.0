Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ2-0005hJ-M7
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
Subject: [RFC PATCH 24/34] mtd: spi-nor: Move Macronix bits out of core.c
Date: Fri,  7 Dec 2018 10:26:27 +0100
Message-Id: <20181207092637.18687-25-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Macronix chips, and move the
Macronix definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      |  63 +------------------
 drivers/mtd/spi-nor/internals.h |   1 +
 drivers/mtd/spi-nor/macronix.c  | 105 ++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+), 62 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/macronix.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 51399122b497..c8ba7009e3ac 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -8,6 +8,7 @@ spi-nor-objs			+= fujitsu.o
 spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
+spi-nor-objs			+= macronix.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c1492f4c4f27..0118fafd7c65 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1352,31 +1352,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-static int
-mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
-			    const struct sfdp_parameter_header *bfpt_header,
-			    const struct sfdp_bfpt *bfpt,
-			    struct spi_nor_flash_parameter *params)
-{
-	/*
-	 * MX25L25635F supports 4B opcodes but MX25L25635E does not.
-	 * Unfortunately, Macronix has re-used the same JEDEC ID for both
-	 * variants which prevents us from defining a new entry in the parts
-	 * table.
-	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
-	 * seems that the F version advertises support for Fast Read 4-4-4 in
-	 * its BFPT table.
-	 */
-	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	return 0;
-}
-
-static struct spi_nor_fixups mx25l25635_fixups = {
-	.post_bfpt = mx25l25635_post_bfpt_fixups,
-};
-
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -1389,33 +1364,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Macronix */
-	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
-	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
-			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-			 .fixups = &mx25l25635_fixups },
-	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
-
 	/* Micron <--> ST Micro */
 	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
@@ -1601,6 +1549,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_gigadevice,
 	&spi_nor_intel,
 	&spi_nor_issi,
+	&spi_nor_macronix,
 };
 
 static const struct flash_info *
@@ -3252,12 +3201,6 @@ static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
 	nor->quad_enable = no_quad_enable;
 }
 
-static void macronix_post_sfdp_fixups(struct spi_nor *nor)
-{
-	nor->set_4byte = en4_ex4_set_4byte;
-	nor->quad_enable = sr1_bit6_quad_enable;
-}
-
 static void winbond_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->set_4byte = winbond_set_4byte;
@@ -3343,10 +3286,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		st_micron_post_sfdp_fixups(nor);
 		break;
 
-	case SNOR_MFR_MACRONIX:
-		macronix_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_SPANSION:
 		spansion_post_sfdp_fixups(nor);
 		break;
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 7e976e12be6c..cb8968824098 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -341,6 +341,7 @@ extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
+extern const struct spi_nor_manufacturer spi_nor_macronix;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
new file mode 100644
index 000000000000..cddd9c302826
--- /dev/null
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -0,0 +1,105 @@
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
+static int
+mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
+			    const struct sfdp_parameter_header *bfpt_header,
+			    const struct sfdp_bfpt *bfpt,
+			    struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * MX25L25635F supports 4B opcodes but MX25L25635E does not.
+	 * Unfortunately, Macronix has re-used the same JEDEC ID for both the
+	 * variants which prevents us from defining a new entry in the parts
+	 * table.
+	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
+	 * seems that the F version advertises support for Fast Read 4-4-4 in
+	 * its BFPT table.
+	 */
+	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l25635_fixups = {
+	.post_bfpt = mx25l25635_post_bfpt_fixups,
+};
+
+static const struct flash_info macronix_parts[] = {
+	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
+	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
+	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
+	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
+	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
+	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
+	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
+	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{
+		"mx25u12835f",
+		INFO(0xc22538, 0, 64 * 1024, 256,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{
+		"mx25l25635e",
+		INFO(0xc22019, 0, 64 * 1024, 512,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &mx25l25635_fixups,
+	},
+	{
+		"mx25u25635f",
+		INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES)
+	},
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
+	{
+		"mx66l51235l",
+		INFO(0xc2201a, 0, 64 * 1024, 1024,
+		     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+	},
+	{
+		"mx66u51235f",
+		INFO(0xc2253a, 0, 64 * 1024, 1024,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+		     SPI_NOR_4B_OPCODES)
+	},
+	{
+		"mx66l1g45g",
+		INFO(0xc2201b, 0, 64 * 1024, 2048,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+	{ "mx66l1g55g", INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
+};
+
+static int macronix_post_sfdp_fixups(struct spi_nor *nor,
+				     struct spi_nor_flash_parameter *params)
+{
+        nor->set_4byte = en4_ex4_set_4byte;
+        nor->quad_enable = sr1_bit6_quad_enable;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups macronix_fixups = {
+	.post_sfdp = macronix_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_macronix = {
+	.name = "macronix",
+	.parts = macronix_parts,
+	.nparts = ARRAY_SIZE(macronix_parts),
+	.fixups = &macronix_fixups,
+};
-- 
2.17.1
