Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKr-0002TV-AB
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
Subject: [PATCH 5/8] mtd: spi-nor: Make the enable argument passed to
 set_byte() a bool
Date: Wed,  3 Oct 2018 16:40:40 +0200
Message-Id: <20181003144043.21529-6-boris.brezillon@bootlin.com>
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

No need to use an integer when the value is either true or false.
Make it a boolean.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c68e8ccfb357..1f174adb4da0 100644
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
@@ -3554,7 +3554,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, 1);
+		set_4byte(nor, true);
 	}
 
 	return 0;
@@ -3579,7 +3579,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	if ((nor->addr_width == 4) &&
 	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
 	    (nor->flags & SNOR_F_BROKEN_RESET))
-		set_4byte(nor, 0);
+		set_4byte(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-- 
2.14.1
