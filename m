Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPz-0000zd-Eb
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:57 +0000
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
Subject: [RFC PATCH 32/34] mtd: spi-nor: Get rid of the now empty
 spi_nor_ids[] table
Date: Fri,  7 Dec 2018 10:26:35 +0100
Message-Id: <20181207092637.18687-33-boris.brezillon@bootlin.com>
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

All entries have been moved to manufacturer drivers. Get rid of this
empty table.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ffae10327de2..6ed562bddddb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1332,21 +1332,6 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-/* NOTE: double check command sets and memory organization when you add
- * more nor chips.  This current list focusses on newer chips, which
- * have been converging on command sets which including JEDEC ID.
- *
- * All newly added entries should describe *hardware* and should use SECT_4K
- * (or SECT_4K_PMC) if hardware supports erasing 4 KiB sectors. For usage
- * scenarios excluding small sectors there is config option that can be
- * disabled: CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
- * For historical (and compatibility) reasons (before we got above config) some
- * old entries may be missing 4K flag.
- */
-static const struct flash_info spi_nor_ids[] = {
-	{ },
-};
-
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
 	&spi_nor_catalyst,
@@ -1404,11 +1389,6 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 		}
 	}
 
-	info = spi_nor_search_part_by_id(spi_nor_ids,
-					 ARRAY_SIZE(spi_nor_ids) - 1, id);
-	if (info)
-		return info;
-
 	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
 		id[0], id[1], id[2]);
 	return ERR_PTR(-ENODEV);
@@ -2933,11 +2913,6 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 {
 	unsigned int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(spi_nor_ids) - 1; i++) {
-		if (!strcmp(name, spi_nor_ids[i].name))
-			return &spi_nor_ids[i];
-	}
-
 	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j = 0; j < manufacturers[i]->nparts; j++) {
 			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
-- 
2.17.1
