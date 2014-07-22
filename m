Received: from nasmtp02.atmel.com ([204.2.163.16] helo=SJOEDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9W8Q-0005RO-Su
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 09:13:24 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: atmel_nand: incease the chip_delay to support some
 4k-page flash
Date: Tue, 22 Jul 2014 17:12:31 +0800
Message-ID: <1406020351-23280-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For MT29F8G08ABABA nand flash, the time read a page (tR) is 25us.
To support it, we need increase the chip_delay to 25us.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index e321c56..371afdd 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2099,7 +2099,11 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	nand_chip->ecc.mode = host->board.ecc_mode;
-	nand_chip->chip_delay = 20;		/* 20us command delay time */
+
+	/* For support 4k-page flash, incease the delay time to 25us.
+	 * In P.108 of MT29F8G08ABABA datasheet, tR max is 25us.
+	 */
+	nand_chip->chip_delay = 25;
 
 	if (host->board.bus_width_16)	/* 16-bit bus width */
 		nand_chip->options |= NAND_BUSWIDTH_16;
-- 
1.9.1
