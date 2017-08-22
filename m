Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkG4t-0003Va-2x
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 20:47:16 +0000
Received: by mail-wr0-x241.google.com with SMTP id f8so18505913wrf.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Aug 2017 13:46:50 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v8 1/2] mtd: spi-nor: add spi_nor_init() function
Date: Tue, 22 Aug 2017 16:45:21 -0400
Message-Id: <1503434722-5429-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
References: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch extracts some chunks from spi_nor_init_params and spi_nor_scan()
 and moves them into a new spi_nor_init() function.

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
---
 drivers/mtd/spi-nor/spi-nor.c | 54 ++++++++++++++++++++++++++++---------------
 include/linux/mtd/spi-nor.h   | 10 ++++++++
 2 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1413828..ab98ecff 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1832,14 +1832,42 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
 	/* Enable Quad I/O if needed. */
 	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
 			  spi_nor_get_protocol_width(nor->write_proto) == 4);
-	if (enable_quad_io && params->quad_enable) {
-		err = params->quad_enable(nor);
+	if (enable_quad_io && params->quad_enable)
+		nor->quad_enable = params->quad_enable;
+
+	return 0;
+}
+
+static int spi_nor_init(struct spi_nor *nor)
+{
+	int err;
+
+	/*
+	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
+	 * with the software protection bits set
+	 */
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
+	    nor->info->flags & SPI_NOR_HAS_LOCK) {
+		write_enable(nor);
+		write_sr(nor, 0);
+		spi_nor_wait_till_ready(nor);
+	}
+
+	if (nor->quad_enable) {
+		err = nor->quad_enable(nor);
 		if (err) {
 			dev_err(nor->dev, "quad mode not supported\n");
 			return err;
 		}
 	}
 
+	if ((nor->addr_width == 4) &&
+	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
+	    !(nor->info->flags & SPI_NOR_4B_OPCODES))
+		set_4byte(nor, nor->info, 1);
+
 	return 0;
 }
 
@@ -1910,20 +1938,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
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
@@ -2002,8 +2016,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
 		    info->flags & SPI_NOR_4B_OPCODES)
 			spi_nor_set_4byte_opcodes(nor, info);
-		else
-			set_4byte(nor, info, 1);
 	} else {
 		nor->addr_width = 3;
 	}
@@ -2020,6 +2032,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			return ret;
 	}
 
+	/* Send all the required SPI flash commands to initialize device */
+	nor->info = info;
+	ret = spi_nor_init(nor);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 55faa2f..247f8fb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -221,10 +221,17 @@ enum spi_nor_option_flags {
 };
 
 /**
+ * struct flash_info - Forward declaration of a structure used internally by
+ *		       spi_nor_scan()
+ */
+struct flash_info;
+
+/**
  * struct spi_nor - Structure for defining a the SPI NOR layer
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		point to a spi device, or a spi nor controller device.
+ * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
@@ -251,6 +258,7 @@ enum spi_nor_option_flags {
  * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
+ * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  *			completely locked
  * @priv:		the private data
  */
@@ -258,6 +266,7 @@ struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	const struct flash_info	*info;
 	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
@@ -285,6 +294,7 @@ struct spi_nor {
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*quad_enable)(struct spi_nor *nor);
 
 	void *priv;
 };
-- 
1.9.1
