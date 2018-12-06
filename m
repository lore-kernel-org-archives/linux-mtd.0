Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr6F-0000Wf-C1
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:41:46 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/5] mtd: spi-nor: Stop passing flash_info around
Date: Thu,  6 Dec 2018 11:41:18 +0100
Message-Id: <20181206104120.6280-4-boris.brezillon@bootlin.com>
In-Reply-To: <20181206104120.6280-1-boris.brezillon@bootlin.com>
References: <20181206104120.6280-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some functions called from spi_nor_scan() need a flash_info object.
Let's assign nor->info early on to avoid passing info as an extra
argument to each of these sub-functions.

We also stop passing a flash_info object to set_4byte() and use
nor->info directly.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- Merged 2 patches doing pretty much the same thing
- Drop local flash_info vars and dereference nor->info directly

Changes in v2:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 38 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b440f29637ab..7d6e8e264cd6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -434,15 +434,14 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 				      ARRAY_SIZE(spi_nor_3to4_erase));
 }
 
-static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
-				      const struct flash_info *info)
+static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
 	/* Do some manufacturer fixups first */
-	switch (JEDEC_MFR(info)) {
+	switch (JEDEC_MFR(nor->info)) {
 	case SNOR_MFR_SPANSION:
 		/* No small sector erase for 4-byte command set */
 		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = info->sector_size;
+		nor->mtd.erasesize = nor->info->sector_size;
 		break;
 
 	default:
@@ -467,14 +466,13 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 }
 
 /* Enable/disable 4-byte addressing mode. */
-static int set_4byte(struct spi_nor *nor, const struct flash_info *info,
-		     int enable)
+static int set_4byte(struct spi_nor *nor, int enable)
 {
 	int status;
 	bool need_wren = false;
 	u8 cmd;
 
-	switch (JEDEC_MFR(info)) {
+	switch (JEDEC_MFR(nor->info)) {
 	case SNOR_MFR_ST:
 	case SNOR_MFR_MICRON:
 		/* Some Micron need WREN command; all will accept it */
@@ -491,7 +489,7 @@ static int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 			write_disable(nor);
 
 		if (!status && !enable &&
-		    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+		    JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND) {
 			/*
 			 * On Winbond W25Q256FV, leaving 4byte mode causes
 			 * the Extended Address Register to be set to 1, so all
@@ -2251,7 +2249,7 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
+static int s3an_nor_scan(struct spi_nor *nor)
 {
 	int ret;
 	u8 val;
@@ -2282,7 +2280,7 @@ static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
 		/* Flash in Power of 2 mode */
 		nor->page_size = (nor->page_size == 264) ? 256 : 512;
 		nor->mtd.writebufsize = nor->page_size;
-		nor->mtd.size = 8 * nor->page_size * info->n_sectors;
+		nor->mtd.size = 8 * nor->page_size * nor->info->n_sectors;
 		nor->mtd.erasesize = 8 * nor->page_size;
 	} else {
 		/* Flash in Default addressing mode */
@@ -3270,10 +3268,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 }
 
 static int spi_nor_init_params(struct spi_nor *nor,
-			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
 	struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
 
 	/* Set legacy flash parameters as default. */
@@ -3539,10 +3537,11 @@ static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
 	return 0;
 }
 
-static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
+static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_flash_parameter *params,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
+	const struct flash_info *info = nor->info;
 	u32 ignored_mask, shared_mask;
 	bool enable_quad_io;
 	int err;
@@ -3635,7 +3634,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, nor->info, 1);
+		set_4byte(nor, 1);
 	}
 
 	return 0;
@@ -3659,7 +3658,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
-		set_4byte(nor, nor->info, 0);
+		set_4byte(nor, 0);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
@@ -3727,6 +3726,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		}
 	}
 
+	nor->info = info;
+
 	mutex_init(&nor->lock);
 
 	/*
@@ -3738,7 +3739,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
 	/* Parse the Serial Flash Discoverable Parameters table. */
-	ret = spi_nor_init_params(nor, info, &params);
+	ret = spi_nor_init_params(nor, &params);
 	if (ret)
 		return ret;
 
@@ -3815,7 +3816,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - set the SPI protocols for register and memory accesses.
 	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
 	 */
-	ret = spi_nor_setup(nor, info, &params, hwcaps);
+	ret = spi_nor_setup(nor, &params, hwcaps);
 	if (ret)
 		return ret;
 
@@ -3835,7 +3836,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_4B_OPCODES;
 
 	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES)
-		spi_nor_set_4byte_opcodes(nor, info);
+		spi_nor_set_4byte_opcodes(nor);
 
 	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
 		dev_err(dev, "address width is too large: %u\n",
@@ -3844,13 +3845,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	}
 
 	if (info->flags & SPI_S3AN) {
-		ret = s3an_nor_scan(info, nor);
+		ret = s3an_nor_scan(nor);
 		if (ret)
 			return ret;
 	}
 
 	/* Send all the required SPI flash commands to initialize device */
-	nor->info = info;
 	ret = spi_nor_init(nor);
 	if (ret)
 		return ret;
-- 
2.17.1
