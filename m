Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr2d-0006ZZ-18
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:38:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v5 3/3] mtd: spi-nor: Add a post BFPT fixup for MX25L25635E
Date: Thu,  6 Dec 2018 11:37:36 +0100
Message-Id: <20181206103736.5957-4-boris.brezillon@bootlin.com>
In-Reply-To: <20181206103736.5957-1-boris.brezillon@bootlin.com>
References: <20181206103736.5957-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MX25L25635F and MX25L25635E share the same JEDEC-ID, but the F variant
supports 4-byte opcodes while the E variant doesn't. We need a way to
differentiate those 2 chips and set the SNOR_F_4B_OPCODES flag only for
the F variant.

Luckily, 4-byte opcode support is not the only difference: Fast Read
4-4-4 is only supported by the F variant, and this feature is
advertised in the BFPT table. Use this to decide when to set the
SNOR_F_4B_OPCODES flag.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v5:
- Follow the flash_info entry format

Changes in v4:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7bc9887d9c0a..fdff18cb1196 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1447,6 +1447,31 @@ static int macronix_quad_enable(struct spi_nor *nor);
 		.addr_width = 3,					\
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
+static int
+mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
+			    const struct sfdp_parameter_header *bfpt_header,
+			    const struct sfdp_bfpt *bfpt,
+			    struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * MX25L25635F support 4B opcodes but MX25L25635E does not.
+	 * Unfortunately, Macronix has re-used the same JEDEC ID for both the
+	 * variants which prevents us from defining a new entry in the parts
+	 * table.
+	 * We need a way to differentiate MX25L25635E and MX25L25635F, and it
+	 * seems that the F version advertises support for Fast Read 4-4-4 in
+	 * its BFPT table.
+	 */
+	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx25l25635_fixups = {
+	.post_bfpt = mx25l25635_post_bfpt_fixups,
+};
+
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -1581,7 +1606,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			 SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
+			 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			 .fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-- 
2.17.1
