Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-000101-Bx
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:21 +0000
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
Subject: [RFC PATCH 08/34] mtd: spi-nor: Add a ->convert_addr() method
Date: Fri,  7 Dec 2018 10:26:11 +0100
Message-Id: <20181207092637.18687-9-boris.brezillon@bootlin.com>
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

In order to separate manufacturer quirks from the core we need to get
rid of all the manufacturer specific flags, like the
SNOR_F_S3AN_ADDR_DEFAULT one.

This can easily be replaced by a ->convert_addr() hook, which when
implemented will provide the core with an easy way to convert an
absolute address into something the flash understands.

Right now the only user are the S3AN chips, but other manufacturers
can implement it if needed.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++----------
 include/linux/mtd/spi-nor.h   | 17 ++++++++++-------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ffea0085b4fe..f6b1c9b8079a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -622,10 +622,9 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
  * Addr can safely be unsigned int, the biggest S3AN device is smaller than
  * 4 MiB.
  */
-static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
+static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
 {
-	unsigned int offset;
-	unsigned int page;
+	u32 offset, page;
 
 	offset = addr % nor->page_size;
 	page = addr / nor->page_size;
@@ -634,6 +633,14 @@ static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
 	return page | offset;
 }
 
+static u32 spi_nor_convert_addr(struct spi_nor *nor, u32 addr)
+{
+	if (!nor->convert_addr)
+		return addr;
+
+	return nor->convert_addr(nor, addr);
+}
+
 /*
  * Initiate the erasure of a single sector
  */
@@ -642,8 +649,7 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
 	int i;
 
-	if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
-		addr = spi_nor_s3an_addr_convert(nor, addr);
+	addr = spi_nor_convert_addr(nor, addr);
 
 	if (nor->erase)
 		return nor->erase(nor, addr);
@@ -2054,8 +2060,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	while (len) {
 		loff_t addr = from;
 
-		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
-			addr = spi_nor_s3an_addr_convert(nor, addr);
+		addr = spi_nor_convert_addr(nor, addr);
 
 		ret = nor->read(nor, addr, len, buf);
 		if (ret == 0) {
@@ -2199,8 +2204,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
 
-		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
-			addr = spi_nor_s3an_addr_convert(nor, addr);
+		addr = spi_nor_convert_addr(nor, addr);
 
 		write_enable(nor);
 		ret = nor->write(nor, addr, page_remain, buf + i);
@@ -2266,7 +2270,7 @@ static int s3an_nor_scan(struct spi_nor *nor)
 		nor->mtd.erasesize = 8 * nor->page_size;
 	} else {
 		/* Flash in Default addressing mode */
-		nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
+		nor->convert_addr = s3an_convert_addr;
 	}
 
 	return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 73dad2a77455..2c8fbd5d614d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -229,13 +229,12 @@ enum spi_nor_option_flags {
 	SNOR_F_USE_FSR		= BIT(0),
 	SNOR_F_HAS_SR_TB	= BIT(1),
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
-	SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
-	SNOR_F_READY_XSR_RDY	= BIT(4),
-	SNOR_F_USE_CLSR		= BIT(5),
-	SNOR_F_BROKEN_RESET	= BIT(6),
-	SNOR_F_4B_OPCODES	= BIT(7),
-	SNOR_F_HAS_LOCK		= BIT(8),
-	SNOR_F_CLR_SW_PROT_BITS	= BIT(9),
+	SNOR_F_READY_XSR_RDY	= BIT(3),
+	SNOR_F_USE_CLSR		= BIT(4),
+	SNOR_F_BROKEN_RESET	= BIT(5),
+	SNOR_F_4B_OPCODES	= BIT(6),
+	SNOR_F_HAS_LOCK		= BIT(7),
+	SNOR_F_CLR_SW_PROT_BITS	= BIT(8),
 };
 
 /**
@@ -365,6 +364,9 @@ struct flash_info;
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  * @set_4byte:		[FLASH-SPECIFIC] put the SPI NOR in 4 byte addressing
  *			mode
+ * @convert_addr:	[FLASH-SPECIFIC] convert an absolute address into
+ *			something the flash will understand. Particularly
+ *			useful when pagesize is not a power-of-2
  * @locking_ops:	[FLASH-SPECIFIC] SPI NOR locking methods
  * @priv:		the private data
  */
@@ -400,6 +402,7 @@ struct spi_nor {
 
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte)(struct spi_nor *nor, bool enable);
+	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 
 	const struct spi_nor_locking_ops *locking_ops;
 
-- 
2.17.1
