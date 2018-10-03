Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKi-0002SL-Hm
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:41:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 4/8] mtd: spi-nor: Stop passing info to set_4byte()
Date: Wed,  3 Oct 2018 16:40:39 +0200
Message-Id: <20181003144043.21529-5-boris.brezillon@bootlin.com>
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

info can be extracted from nor->info, no need to pass it as an
argument.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c321d39aa812..c68e8ccfb357 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -274,14 +274,13 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
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
 	case SNOR_MFR_MICRON:
 		/* Some Micron need WREN command; all will accept it */
 		need_wren = true;
@@ -296,7 +295,7 @@ static int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 			write_disable(nor);
 
 		if (!status && !enable &&
-		    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+		    JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND) {
 			/*
 			 * On Winbond W25Q256FV, leaving 4byte mode causes
 			 * the Extended Address Register to be set to 1, so all
@@ -3555,7 +3554,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, nor->info, 1);
+		set_4byte(nor, 1);
 	}
 
 	return 0;
@@ -3580,7 +3579,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	if ((nor->addr_width == 4) &&
 	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
 	    (nor->flags & SNOR_F_BROKEN_RESET))
-		set_4byte(nor, nor->info, 0);
+		set_4byte(nor, 0);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-- 
2.14.1
