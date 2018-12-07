Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-000109-Bo
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
Subject: [RFC PATCH 11/34] mtd: spi-nor: Move S3AN fixups to the manufacturer
 fixups path
Date: Fri,  7 Dec 2018 10:26:14 +0100
Message-Id: <20181207092637.18687-12-boris.brezillon@bootlin.com>
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

All manufacturer fixups are grouped together with the method suffixed
by _post_sfdp_fixups(). Let's do the same for the S3AN fixups.

Note that s3an_nor_scan() was overriding the opcode selection done in
spi_nor_setup(). Now that this function is called before
spi_nor_setup(), we have to set SNOR_F_SKIP_SETUP.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 98 ++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e805976ad784..34d3d632e53b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2243,47 +2243,6 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-static int s3an_nor_scan(struct spi_nor *nor)
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
 static void
 spi_nor_set_read_settings(struct spi_nor_read_command *read,
 			  u8 num_mode_clocks,
@@ -3722,6 +3681,54 @@ static void sst_post_sfdp_fixups(struct spi_nor *nor)
 	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
 }
 
+static int s3an_post_sfdp_fixups(struct spi_nor *nor)
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
+
 static int
 spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 				      struct spi_nor_flash_parameter *params)
@@ -3760,6 +3767,9 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		break;
 	}
 
+	if (nor->info->flags & SPI_S3AN)
+		return s3an_post_sfdp_fixups(nor);
+
 	return 0;
 }
 
@@ -3976,12 +3986,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return -EINVAL;
 	}
 
-	if (info->flags & SPI_S3AN) {
-		ret = s3an_nor_scan(nor);
-		if (ret)
-			return ret;
-	}
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
-- 
2.17.1
