Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHrkg-0000qy-4S
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2018 14:45:48 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH v3 1/2] mtd: spi-nor: Make sure SFDP-based 4B_OPCODE support
 detection works correctly
Date: Wed, 31 Oct 2018 15:45:03 +0100
Message-Id: <20181031144504.19405-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flash_info entries have the SPI_NOR_4B_OPCODES flag set to let the
core know that the flash supports 4B opcode. While this solution works
fine for id-based caps detection, it doesn't work that well when relying
on SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so that
spi_nor_parse_bfpt() can add it when the BFPT_DWORD1_ADDRESS_BYTES
field is set to BFPT_DWORD1_ADDRESS_BYTES_4_ONLY.

Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes in v3:
- Clear SNOR_F_4B_OPCODES flag when SFDP fails
- Add Alexandre R-b

Changes in v2:
- Fix the commit message
- Fix the ->addr_width check
- Add a comma at the end of the SNOR_F_4B_OPCODES definition
---
 drivers/mtd/spi-nor/spi-nor.c | 12 +++++++++---
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3e54e31889c7..798915b5c2b0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
+		nor->flags |= SNOR_F_4B_OPCODES;
 		nor->addr_width = 4;
 		break;
 
@@ -3252,6 +3253,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 
 		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
 			nor->addr_width = 0;
+			nor->flags &= ~SNOR_F_4B_OPCODES;
 			/* restore previous erase map */
 			memcpy(&nor->erase_map, &prev_map,
 			       sizeof(nor->erase_map));
@@ -3554,7 +3556,7 @@ static int spi_nor_init(struct spi_nor *nor)
 
 	if ((nor->addr_width == 4) &&
 	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
-	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
+	    !(nor->flags & SNOR_F_4B_OPCODES)) {
 		/*
 		 * If the RESET# pin isn't hooked up properly, or the system
 		 * otherwise doesn't perform a reset command in the boot
@@ -3588,7 +3590,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if ((nor->addr_width == 4) &&
 	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
-	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
+	    !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    (nor->flags & SNOR_F_BROKEN_RESET))
 		set_4byte(nor, nor->info, 0);
 }
@@ -3746,11 +3748,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->addr_width = 4;
 		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
 		    info->flags & SPI_NOR_4B_OPCODES)
-			spi_nor_set_4byte_opcodes(nor, info);
+			nor->flags |= SNOR_F_4B_OPCODES;
 	} else {
 		nor->addr_width = 3;
 	}
 
+	if (nor->addr_width == 4 &&
+	    nor->flags & SNOR_F_4B_OPCODES)
+		spi_nor_set_4byte_opcodes(nor, info);
+
 	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
 		dev_err(dev, "address width is too large: %u\n",
 			nor->addr_width);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7f0c7303575e..5bc75110d5ea 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -236,6 +236,7 @@ enum spi_nor_option_flags {
 	SNOR_F_READY_XSR_RDY	= BIT(4),
 	SNOR_F_USE_CLSR		= BIT(5),
 	SNOR_F_BROKEN_RESET	= BIT(6),
+	SNOR_F_4B_OPCODES	= BIT(7),
 };
 
 /**
-- 
2.17.1
