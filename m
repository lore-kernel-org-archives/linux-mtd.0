Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ2-0005hK-Lq
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:36 +0000
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
Subject: [RFC PATCH 27/34] mtd: spi-nor: Move SST bits out of core.c
Date: Fri,  7 Dec 2018 10:26:30 +0100
Message-Id: <20181207092637.18687-28-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for SST chips, and move the
SST definitions outside of core.c.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      | 111 +--------------------------
 drivers/mtd/spi-nor/internals.h |   1 +
 drivers/mtd/spi-nor/sst.c       | 132 ++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 109 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/sst.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 81edb2734e90..c41804252e27 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -11,6 +11,7 @@ spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
 spi-nor-objs			+= spansion.o
+spi-nor-objs			+= sst.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a7f309ffe28c..4721cf812dfe 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1364,21 +1364,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
-	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
@@ -1462,6 +1447,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_macronix,
 	&spi_nor_micron,
 	&spi_nor_spansion,
+	&spi_nor_sst,
 	&spi_nor_st,
 };
 
@@ -1551,85 +1537,6 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return ret;
 }
 
-static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
-		size_t *retlen, const u_char *buf)
-{
-	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	size_t actual;
-	int ret;
-
-	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
-
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
-	if (ret)
-		return ret;
-
-	write_enable(nor);
-
-	nor->sst_write_second = false;
-
-	actual = to % 2;
-	/* Start write from odd address. */
-	if (actual) {
-		nor->program_opcode = SPINOR_OP_BP;
-
-		/* write one byte. */
-		ret = nor->write(nor, to, 1, buf);
-		if (ret < 0)
-			goto sst_write_err;
-		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
-		     (int)ret);
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto sst_write_err;
-	}
-	to += actual;
-
-	/* Write out most of the data here. */
-	for (; actual < len - 1; actual += 2) {
-		nor->program_opcode = SPINOR_OP_AAI_WP;
-
-		/* write two bytes. */
-		ret = nor->write(nor, to, 2, buf + actual);
-		if (ret < 0)
-			goto sst_write_err;
-		WARN(ret != 2, "While writing 2 bytes written %i bytes\n",
-		     (int)ret);
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto sst_write_err;
-		to += 2;
-		nor->sst_write_second = true;
-	}
-	nor->sst_write_second = false;
-
-	write_disable(nor);
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret)
-		goto sst_write_err;
-
-	/* Write out trailing byte if it exists. */
-	if (actual != len) {
-		write_enable(nor);
-
-		nor->program_opcode = SPINOR_OP_BP;
-		ret = nor->write(nor, to, 1, buf + actual);
-		if (ret < 0)
-			goto sst_write_err;
-		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
-		     (int)ret);
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			goto sst_write_err;
-		write_disable(nor);
-		actual += 1;
-	}
-sst_write_err:
-	*retlen += actual;
-	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
-	return ret;
-}
-
 /*
  * Write an address range to the nor chip.  Data must be written in
  * FLASH_PAGESIZE chunks.  The address range may be any size provided
@@ -3111,11 +3018,6 @@ static void winbond_post_sfdp_fixups(struct spi_nor *nor)
 	nor->set_4byte = winbond_set_4byte;
 }
 
-static void sst_post_sfdp_fixups(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
-}
-
 static int s3an_post_sfdp_fixups(struct spi_nor *nor)
 {
 	int ret;
@@ -3173,10 +3075,6 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		return nor->manufacturer->fixups->post_sfdp(nor, params);
 
 	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_SST:
-		sst_post_sfdp_fixups(nor);
-		break;
-
 	case SNOR_MFR_WINBOND:
 		winbond_post_sfdp_fixups(nor);
 		break;
@@ -3307,12 +3205,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
-
-	/* sst nor chips use AAI word program */
-	if (info->flags & SST_WRITE)
-		mtd->_write = sst_write;
-	else
-		mtd->_write = spi_nor_write;
+	mtd->_write = spi_nor_write;
 
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index b68c16194978..298b4a855774 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -344,6 +344,7 @@ extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
 extern const struct spi_nor_manufacturer spi_nor_spansion;
+extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_st;
 
 /* Core helpers. */
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
new file mode 100644
index 000000000000..8d9a8fbfbcd9
--- /dev/null
+++ b/drivers/mtd/spi-nor/sst.c
@@ -0,0 +1,132 @@
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
+static const struct flash_info sst_parts[] = {
+	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024, 8, SECT_4K | SST_WRITE) },
+	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
+	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
+	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
+	{ "sst25wf512", INFO(0xbf2501, 0, 64 * 1024, 1, SECT_4K | SST_WRITE) },
+	{ "sst25wf010", INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
+	{ "sst25wf020", INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
+	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
+	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
+	{ "sst25wf040", INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
+	{ "sst25wf080", INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{
+		"sst26vf064b",
+		INFO(0xbf2643, 0, 64 * 1024, 128,
+		     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
+};
+
+static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
+		     size_t *retlen, const u_char *buf)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	size_t actual;
+	int ret;
+
+	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
+	if (ret)
+		return ret;
+
+	write_enable(nor);
+
+	nor->sst_write_second = false;
+
+	actual = to % 2;
+	/* Start write from odd address. */
+	if (actual) {
+		nor->program_opcode = SPINOR_OP_BP;
+
+		/* write one byte. */
+		ret = nor->write(nor, to, 1, buf);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
+		     (int)ret);
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto sst_write_err;
+	}
+	to += actual;
+
+	/* Write out most of the data here. */
+	for (; actual < len - 1; actual += 2) {
+		nor->program_opcode = SPINOR_OP_AAI_WP;
+
+		/* write two bytes. */
+		ret = nor->write(nor, to, 2, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 2, "While writing 2 bytes written %i bytes\n",
+		     (int)ret);
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto sst_write_err;
+		to += 2;
+		nor->sst_write_second = true;
+	}
+	nor->sst_write_second = false;
+
+	write_disable(nor);
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		goto sst_write_err;
+
+	/* Write out trailing byte if it exists. */
+	if (actual != len) {
+		write_enable(nor);
+
+		nor->program_opcode = SPINOR_OP_BP;
+		ret = nor->write(nor, to, 1, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
+		     (int)ret);
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto sst_write_err;
+		write_disable(nor);
+		actual += 1;
+	}
+sst_write_err:
+	*retlen += actual;
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
+	return ret;
+}
+
+static int sst_post_sfdp_fixups(struct spi_nor *nor,
+				struct spi_nor_flash_parameter *params)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+
+	/* sst nor chips use AAI word program */
+	if (nor->info->flags & SST_WRITE)
+		nor->mtd._write = sst_write;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups sst_fixups = {
+	.post_sfdp = sst_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_sst = {
+	.name = "sst",
+	.parts = sst_parts,
+	.nparts = ARRAY_SIZE(sst_parts),
+	.fixups = &sst_fixups,
+};
-- 
2.17.1
