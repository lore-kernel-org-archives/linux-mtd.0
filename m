Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSN1m-0003sm-0e
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:10:57 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/6] mtd: spi-nor: Make the enable argument passed to
 set_byte() a bool
Date: Thu, 29 Nov 2018 15:10:24 +0100
Message-Id: <20181129141026.24892-5-boris.brezillon@bootlin.com>
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

No need to use an integer when the value is either true or false.
Make it a boolean.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- None
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6da50684f303..ed1d7ad2dcbb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -274,7 +274,7 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 }
 
 /* Enable/disable 4-byte addressing mode. */
-static int set_4byte(struct spi_nor *nor, int enable)
+static int set_4byte(struct spi_nor *nor, bool enable)
 {
 	int status;
 	bool need_wren = false;
@@ -3573,7 +3573,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, 1);
+		set_4byte(nor, true);
 	}
 
 	return 0;
@@ -3599,7 +3599,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
 	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
 	    (nor->flags & SNOR_F_BROKEN_RESET))
-		set_4byte(nor, 0);
+		set_4byte(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-- 
2.17.1
