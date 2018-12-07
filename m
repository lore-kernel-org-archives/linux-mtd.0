Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ2-0005hH-Nb
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
Subject: [RFC PATCH 22/34] mtd: spi-nor: Move Intel bits out of core.c
Date: Fri,  7 Dec 2018 10:26:25 +0100
Message-Id: <20181207092637.18687-23-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Intel chips, and move the
Intel definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |  1 +
 drivers/mtd/spi-nor/core.c      | 15 +-------------
 drivers/mtd/spi-nor/intel.c     | 35 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/internals.h |  1 +
 4 files changed, 38 insertions(+), 14 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/intel.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index ab2378d8b497..3d884b45a174 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -6,6 +6,7 @@ spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
 spi-nor-objs			+= fujitsu.o
 spi-nor-objs			+= gigadevice.o
+spi-nor-objs			+= intel.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c452c8adcc46..7788d7429318 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1389,11 +1389,6 @@ static struct spi_nor_fixups mx25l25635_fixups = {
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Intel/Numonyx -- xxxs33b */
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
-
 	/* ISSI */
 	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
 	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8,
@@ -1630,6 +1625,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_everspin,
 	&spi_nor_fujitsu,
 	&spi_nor_gigadevice,
+	&spi_nor_intel,
 };
 
 static const struct flash_info *
@@ -3305,11 +3301,6 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 	}
 }
 
-static void intel_post_sfdp_fixups(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
-}
-
 static void sst_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
@@ -3372,10 +3363,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
 	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_INTEL:
-		intel_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_ST:
 	case SNOR_MFR_MICRON:
 		st_micron_post_sfdp_fixups(nor);
diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
new file mode 100644
index 000000000000..99d49bc045c1
--- /dev/null
+++ b/drivers/mtd/spi-nor/intel.c
@@ -0,0 +1,35 @@
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
+static const struct flash_info intel_parts[] = {
+	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
+        { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
+        { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
+};
+
+static int intel_post_sfdp_fixups(struct spi_nor *nor, 
+				  struct spi_nor_flash_parameter *params)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups intel_fixups = {
+	.post_sfdp = intel_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_intel = {
+	.name = "intel",
+	.parts = intel_parts,
+	.nparts = ARRAY_SIZE(intel_parts),
+	.fixups = &intel_fixups,
+};
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index a21822513c26..f66bee137899 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -339,6 +339,7 @@ extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
 extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
+extern const struct spi_nor_manufacturer spi_nor_intel;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
-- 
2.17.1
