Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSN1y-0003uQ-4l
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:11:09 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 6/6] mtd: spi-nor: Move the nor->info assignment earlier in
 the scan func
Date: Thu, 29 Nov 2018 15:10:26 +0100
Message-Id: <20181129141026.24892-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181129141026.24892-1-boris.brezillon@bootlin.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
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

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d2b09f52b1fb..c1d9c2e50bee 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -238,9 +238,10 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 				      ARRAY_SIZE(spi_nor_3to4_erase));
 }
 
-static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
-				      const struct flash_info *info)
+static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
+	const struct flash_info *info = nor->info;
+
 	/* Do some manufacturer fixups first */
 	switch (JEDEC_MFR(info)) {
 	case SNOR_MFR_SPANSION:
@@ -2023,8 +2024,9 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
+static int s3an_nor_scan(struct spi_nor *nor)
 {
+	const struct flash_info *info = nor->info;
 	int ret;
 	u8 val;
 
@@ -3204,10 +3206,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 }
 
 static int spi_nor_init_params(struct spi_nor *nor,
-			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
 	struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
 
 	/* Set legacy flash parameters as default. */
@@ -3472,10 +3474,11 @@ static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
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
@@ -3664,6 +3667,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		}
 	}
 
+	nor->info = info;
+
 	mutex_init(&nor->lock);
 
 	/*
@@ -3675,7 +3680,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
 	/* Parse the Serial Flash Discoverable Parameters table. */
-	ret = spi_nor_init_params(nor, info, &params);
+	ret = spi_nor_init_params(nor, &params);
 	if (ret)
 		return ret;
 
@@ -3752,7 +3757,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - set the SPI protocols for register and memory accesses.
 	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
 	 */
-	ret = spi_nor_setup(nor, info, &params, hwcaps);
+	ret = spi_nor_setup(nor, &params, hwcaps);
 	if (ret)
 		return ret;
 
@@ -3765,7 +3770,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->addr_width = 4;
 		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
 		    info->flags & SPI_NOR_4B_OPCODES)
-			spi_nor_set_4byte_opcodes(nor, info);
+			spi_nor_set_4byte_opcodes(nor);
 	} else {
 		nor->addr_width = 3;
 	}
@@ -3777,13 +3782,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
