Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqpmZ-0005yp-Ue
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 23:35:15 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 6BAE743618
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:34:50 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, jartur@cadence.com,
 kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v5 3/6] mtd: spi-nor: add spi_nor_init() function
Date: Thu, 23 Mar 2017 00:33:53 +0100
Message-Id: <8d88fd247815979bee2a6d3be50fa57a80c2f229.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch extracts some chunks from spi_nor_scan() and moves them into
a new spi_nor_init() function.

Indeed, spi_nor_init() regroups all the required SPI flash commands to be
sent to the SPI flash memory before performing any runtime operations
(Fast Read, Page Program, Sector Erase, ...). Hence spi_nor_init():
1) removes the flash protection if applicable for certain vendors.
2) sets the Quad Enable bit, if needed, before using Quad SPI protocols.
3) makes the memory enter its (stateful) 4-byte address mode, if needed,
   for SPI flash memory > 128Mbits not supporting the 4-byte address
   instruction set.

spi_nor_scan() now ends by calling spi_nor_init() once the probe phase has
completed. Further patches could also use spi_nor_init() to implement the
mtd->_resume() handler for the spi-nor framework.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 71 ++++++++++++++++++++++++++++---------------
 include/linux/mtd/spi-nor.h   |  8 +++++
 2 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cc443c6cbae8..f648374d6824 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -255,6 +255,8 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
+
+	nor->flags |= SNOR_F_4B_OPCODES;
 }
 
 /* Enable/disable 4-byte addressing mode. */
@@ -1809,6 +1811,45 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
 	return 0;
 }
 
+static int spi_nor_init(struct spi_nor *nor)
+{
+	const struct flash_info *info = nor->info;
+	struct device *dev = nor->dev;
+	int ret;
+
+	/*
+	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
+	 * with the software protection bits set
+	 */
+
+	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_SST ||
+	    info->flags & SPI_NOR_HAS_LOCK) {
+		write_enable(nor);
+		write_sr(nor, 0);
+		spi_nor_wait_till_ready(nor);
+	}
+
+	/* Set the Quad Enable bit, if needed. */
+	if (nor->flash_quad_enable) {
+		ret = nor->flash_quad_enable(nor);
+		if (ret) {
+			dev_err(dev, "quad mode not supported\n");
+			return ret;
+		}
+	}
+
+	/*
+	 * For SPI flash memories above 128Mib, enter the 4-byte address mode
+	 * only if the 4-byte address instruction set is not supported.
+	 */
+	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES))
+		set_4byte(nor, info, 1);
+
+	return 0;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -1876,20 +1917,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_S3AN)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
-	/*
-	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
-	 * with the software protection bits set
-	 */
-
-	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST ||
-	    info->flags & SPI_NOR_HAS_LOCK) {
-		write_enable(nor);
-		write_sr(nor, 0);
-		spi_nor_wait_till_ready(nor);
-	}
-
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->priv = nor;
@@ -1960,14 +1987,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->flash_quad_enable) {
-		ret = nor->flash_quad_enable(nor);
-		if (ret) {
-			dev_err(dev, "quad mode not supported\n");
-			return ret;
-		}
-	}
-
 	if (info->addr_width)
 		nor->addr_width = info->addr_width;
 	else if (mtd->size > 0x1000000) {
@@ -1976,8 +1995,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
 		    info->flags & SPI_NOR_4B_OPCODES)
 			spi_nor_set_4byte_opcodes(nor, info);
-		else
-			set_4byte(nor, info, 1);
 	} else {
 		nor->addr_width = 3;
 	}
@@ -1994,6 +2011,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			return ret;
 	}
 
+	/* Send all the required SPI flash commands to initialize the memory. */
+	nor->info = info;
+	ret = spi_nor_init(nor);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 732ee6cd5330..d270788f5ab6 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -212,9 +212,16 @@ enum spi_nor_option_flags {
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
 	SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
 	SNOR_F_READY_XSR_RDY	= BIT(4),
+	SNOR_F_4B_OPCODES	= BIT(5),
 };
 
 /**
+ * struct flash_info -	Forward declaration of a structure used internally by
+ *			spi_nor_scan() and spi_nor_init().
+ */
+struct flash_info;
+
+/**
  * struct spi_nor - Structure for defining a the SPI NOR layer
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
@@ -253,6 +260,7 @@ struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	const struct flash_info	*info;
 	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
-- 
2.9.3
