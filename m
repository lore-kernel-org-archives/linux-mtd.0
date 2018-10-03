Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKr-0002Td-AC
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:41:10 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 8/8] mtd: spi-nor: Move Spansion erase related fixup to a
 dedicated function
Date: Wed,  3 Oct 2018 16:40:43 +0200
Message-Id: <20181003144043.21529-9-boris.brezillon@bootlin.com>
In-Reply-To: <20181003144043.21529-1-boris.brezillon@bootlin.com>
References: <20181003144043.21529-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

spi_nor_set_4byte_opcodes() is changing the erase size for Spansion
chips operating in 4B addressing mode. Let's move this code to
spansion_fixups() and call it from spi_nor_manufacturer_fixups().

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f2e00755813d..1a9b3e6a181d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -244,18 +244,6 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 				      const struct flash_info *info)
 {
-	/* Do some manufacturer fixups first */
-	switch (JEDEC_MFR(info)) {
-	case SNOR_MFR_SPANSION:
-		/* No small sector erase for 4-byte command set */
-		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = info->sector_size;
-		break;
-
-	default:
-		break;
-	}
-
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
@@ -3608,6 +3596,15 @@ static void winbond_fixups(struct spi_nor *nor)
 	nor->set_4byte = winbond_set_4byte;
 }
 
+static void spansion_fixups(struct spi_nor *nor)
+{
+	if (nor->flags & SPI_NOR_4B_OPCODES) {
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE_4B;
+		nor->mtd.erasesize = nor->info->sector_size;
+	}
+}
+
 static void spi_nor_manufacturer_fixups(struct spi_nor *nor)
 {
 	switch (JEDEC_MFR(nor->info)) {
@@ -3623,6 +3620,10 @@ static void spi_nor_manufacturer_fixups(struct spi_nor *nor)
 		winbond_fixups(nor);
 		break;
 
+	case SNOR_MFR_SPANSION:
+		spansion_fixups(nor);
+		break;
+
 	default:
 		break;
 	}
-- 
2.14.1
