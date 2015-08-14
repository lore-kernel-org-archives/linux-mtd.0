Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQI4V-00052n-M1
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 16:43:12 +0000
Received: by lbbsx3 with SMTP id sx3so48743667lbb.0
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 09:42:49 -0700 (PDT)
From: Joachim Eastwood <manabian@gmail.com>
To: computersforpeace@gmail.com
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, zajec5@gmail.com,
 Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH] mtd: spi-nor: s25sl064p supports both dual and quad I/O
Date: Fri, 14 Aug 2015 18:42:32 +0200
Message-Id: <1439570552-24825-1-git-send-email-manabian@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This chip can be found on Hitex LPC4350 Evaluation Board.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---

Based on mtd master.

 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 47df4b5eae2f..ae705987ac54 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -606,7 +606,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	 * for the chips listed here (without boot sectors).
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
+	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
1.8.0
