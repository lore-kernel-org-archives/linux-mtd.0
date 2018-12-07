Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCQ2-0005hV-Me
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:38 +0000
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
Subject: [RFC PATCH 30/34] mtd: spi-nor: Move Xilinx bits out of core.c
Date: Fri,  7 Dec 2018 10:26:33 +0100
Message-Id: <20181207092637.18687-31-boris.brezillon@bootlin.com>
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

Create a SPI NOR manufacturer driver for Xilinx chips, and move the
Xilinx definitions outside of core.c.

While at it, remove the SPI_S3AN flag which is now useless.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/Makefile    |   1 +
 drivers/mtd/spi-nor/core.c      | 106 ++++----------------------------
 drivers/mtd/spi-nor/internals.h |  13 +---
 drivers/mtd/spi-nor/xilinx.c    |  97 +++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+), 105 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/xilinx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 1b5fcf20f6fc..9b89f3b4401a 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -14,6 +14,7 @@ spi-nor-objs			+= micron-st.o
 spi-nor-objs			+= spansion.o
 spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
+spi-nor-objs			+= xilinx.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 501322e87dbe..c14543fd4af6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -358,26 +358,6 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 	mutex_unlock(&nor->lock);
 }
 
-/*
- * This code converts an address to the Default Address Mode, that has non
- * power of two page sizes. We must support this mode because it is the default
- * mode supported by Xilinx tools, it can access the whole flash area and
- * changing over to the Power-of-two mode is irreversible and corrupts the
- * original data.
- * Addr can safely be unsigned int, the biggest S3AN device is smaller than
- * 4 MiB.
- */
-static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
-{
-	u32 offset, page;
-
-	offset = addr % nor->page_size;
-	page = addr / nor->page_size;
-	page <<= (nor->page_size > 512) ? 10 : 9;
-
-	return page | offset;
-}
-
 static u32 spi_nor_convert_addr(struct spi_nor *nor, u32 addr)
 {
 	if (!nor->convert_addr)
@@ -1364,13 +1344,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Xilinx S3AN Internal Flash */
-	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
-	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
-	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
-
 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -1393,6 +1366,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_sst,
 	&spi_nor_st,
 	&spi_nor_winbond,
+	&spi_nor_xilinx,
 };
 
 static const struct flash_info *
@@ -2935,81 +2909,25 @@ int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)
 	return ret;
 }
 
-static int s3an_post_sfdp_fixups(struct spi_nor *nor)
-{
-	int ret;
-	u8 val;
-
-	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
-	if (ret < 0) {
-		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
-		return ret;
-	}
-
-	/*
-	 * We choose the opcodes we want to use, so let's add
-	 * SNOR_F_SKIP_SETUP to prevent spi_nor_setup() from changing
-	 * them behind our back.
-	 */
-	nor->flags |= SNOR_F_SKIP_SETUP;
-	nor->erase_opcode = SPINOR_OP_XSE;
-	nor->program_opcode = SPINOR_OP_XPP;
-	nor->read_opcode = SPINOR_OP_READ;
-	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-
-	/*
-	 * This flashes have a page size of 264 or 528 bytes (known as
-	 * Default addressing mode). It can be changed to a more standard
-	 * Power of two mode where the page size is 256/512. This comes
-	 * with a price: there is 3% less of space, the data is corrupted
-	 * and the page size cannot be changed back to default addressing
-	 * mode.
-	 *
-	 * The current addressing mode can be read from the XRDSR register
-	 * and should not be changed, because is a destructive operation.
-	 */
-	if (val & XSR_PAGESIZE) {
-		/* Flash in Power of 2 mode */
-		nor->page_size = (nor->page_size == 264) ? 256 : 512;
-		nor->mtd.writebufsize = nor->page_size;
-		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
-		nor->mtd.erasesize = 8 * nor->page_size;
-	} else {
-		/* Flash in Default addressing mode */
-		nor->convert_addr = s3an_convert_addr;
-	}
-
-	return 0;
-}
-
-
-static int
-spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
-				      struct spi_nor_flash_parameter *params)
-{
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		return nor->manufacturer->fixups->post_sfdp(nor, params);
-
-	if (nor->info->flags & SPI_S3AN)
-		return s3an_post_sfdp_fixups(nor);
-
-	return 0;
-}
-
 static int spi_nor_post_sfdp_fixups(struct spi_nor *nor,
 				    struct spi_nor_flash_parameter *params)
 {
 	int ret;
 
-	ret = spi_nor_manufacturer_post_sfdp_fixups(nor, params);
-	if (ret)
-		return ret;
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_sfdp) {
+		ret = nor->manufacturer->fixups->post_sfdp(nor, params);
+		if (ret)
+			return ret;
+	}
 
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+	if (nor->info->fixups && nor->info->fixups->post_sfdp) {
 		ret = nor->info->fixups->post_sfdp(nor, params);
+		if (ret)
+			return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index 2b329b8ea6ef..c24c9eb1c2e2 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -245,16 +245,6 @@ struct flash_info {
 #define SPI_NOR_XSR_RDY		BIT(10)	/*
 					 * S3AN flashes have specific opcode to
 					 * read the status register.
-					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
-					 * use the same bit as one implies the
-					 * other, but we will get rid of
-					 * SPI_S3AN soon.
-					 */
-#define	SPI_S3AN		BIT(10)	/*
-					 * Xilinx Spartan 3AN In-System Flash
-					 * (MFR cannot be used for probing
-					 * because it has the same value as
-					 * ATMEL flashes)
 					 */
 #define SPI_NOR_4B_OPCODES	BIT(11)	/*
 					 * Use dedicated 4byte address op codes
@@ -316,7 +306,7 @@ struct flash_info {
 		.n_sectors = (_n_sectors),				\
 		.page_size = _page_size,				\
 		.addr_width = 3,					\
-		.flags = SPI_NOR_NO_FR | SPI_S3AN,
+		.flags = SPI_NOR_NO_FR | SPI_NOR_XSR_RDY,
 
 /**
  * struct spi_nor_manufacturer - SPI NOR manufacturer object
@@ -348,6 +338,7 @@ extern const struct spi_nor_manufacturer spi_nor_spansion;
 extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_st;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
+extern const struct spi_nor_manufacturer spi_nor_xilinx;
 
 /* Core helpers. */
 int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
new file mode 100644
index 000000000000..f64b5952a9aa
--- /dev/null
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -0,0 +1,97 @@
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
+static const struct flash_info xilinx_parts[] = {
+	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
+	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
+	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
+	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
+	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
+};
+
+/*
+ * This code converts an address to the Default Address Mode, that has non
+ * power of two page sizes. We must support this mode because it is the default
+ * mode supported by Xilinx tools, it can access the whole flash area and
+ * changing over to the Power-of-two mode is irreversible and corrupts the
+ * original data.
+ * Addr can safely be unsigned int, the biggest S3AN device is smaller than
+ * 4 MiB.
+ */
+static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
+{
+	u32 offset, page;
+
+	offset = addr % nor->page_size;
+	page = addr / nor->page_size;
+	page <<= (nor->page_size > 512) ? 10 : 9;
+
+	return page | offset;
+}
+
+static int xilinx_post_sfdp_fixups(struct spi_nor *nor,
+				   struct spi_nor_flash_parameter *params)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
+		return ret;
+	}
+
+	/*
+	 * We choose the opcodes we want to use, so let's add
+	 * SNOR_F_SKIP_SETUP to prevent spi_nor_setup() from changing
+	 * them behind our back.
+	 */
+	nor->flags |= SNOR_F_SKIP_SETUP;
+	nor->erase_opcode = SPINOR_OP_XSE;
+	nor->program_opcode = SPINOR_OP_XPP;
+	nor->read_opcode = SPINOR_OP_READ;
+	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
+
+	/*
+	 * This flashes have a page size of 264 or 528 bytes (known as
+	 * Default addressing mode). It can be changed to a more standard
+	 * Power of two mode where the page size is 256/512. This comes
+	 * with a price: there is 3% less of space, the data is corrupted
+	 * and the page size cannot be changed back to default addressing
+	 * mode.
+	 *
+	 * The current addressing mode can be read from the XRDSR register
+	 * and should not be changed, because is a destructive operation.
+	 */
+	if (val & XSR_PAGESIZE) {
+		/* Flash in Power of 2 mode */
+		nor->page_size = (nor->page_size == 264) ? 256 : 512;
+		nor->mtd.writebufsize = nor->page_size;
+		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
+		nor->mtd.erasesize = 8 * nor->page_size;
+	} else {
+		/* Flash in Default addressing mode */
+		nor->convert_addr = s3an_convert_addr;
+	}
+
+	return 0;
+}
+
+static const struct spi_nor_fixups xilinx_fixups = {
+	.post_sfdp = xilinx_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_xilinx = {
+	.name = "xilinx",
+	.parts = xilinx_parts,
+	.nparts = ARRAY_SIZE(xilinx_parts),
+	.fixups = &xilinx_fixups,
+};
-- 
2.17.1
