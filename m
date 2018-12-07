Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPT-0000ww-8n
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:00 +0000
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
Subject: [RFC PATCH 04/34] mtd: spi-nor: Add spansion_fixups()
Date: Fri,  7 Dec 2018 10:26:07 +0100
Message-Id: <20181207092637.18687-5-boris.brezillon@bootlin.com>
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

Add a spansion_post_sfdp_fixups() function to fix the erase opcode,
erase sector size and set the SNOR_F_4B_OPCODES flag.
This way, all spansion related quirks are placed in the
spansion_post_sfdp_fixups() function.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bea267c446b5..fd88b0a13115 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -438,18 +438,6 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
-	/* Do some manufacturer fixups first */
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_SPANSION:
-		/* No small sector erase for 4-byte command set */
-		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = nor->info->sector_size;
-		break;
-
-	default:
-		break;
-	}
-
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
@@ -3689,6 +3677,19 @@ static void winbond_post_sfdp_fixups(struct spi_nor *nor)
 	nor->set_4byte = winbond_set_4byte;
 }
 
+static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	if (mtd->size > SZ_16M) {
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = nor->info->sector_size;
+	}
+}
+
 static int
 spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 				      struct spi_nor_flash_parameter *params)
@@ -3703,6 +3704,10 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		macronix_post_sfdp_fixups(nor);
 		break;
 
+	case SNOR_MFR_SPANSION:
+		spansion_post_sfdp_fixups(nor);
+		break;
+
 	case SNOR_MFR_WINBOND:
 		winbond_post_sfdp_fixups(nor);
 		break;
@@ -3910,8 +3915,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->addr_width = 3;
 	}
 
-	if (info->flags & SPI_NOR_4B_OPCODES ||
-	    (JEDEC_MFR(info) == SNOR_MFR_SPANSION && mtd->size > SZ_16M))
+	if (info->flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
 	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES)
-- 
2.17.1
