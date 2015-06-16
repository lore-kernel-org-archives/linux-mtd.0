Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4mLA-0001YN-9G
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 08:35:29 +0000
Received: by lbbqq2 with SMTP id qq2so5999651lbb.3
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 01:35:01 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V3] mtd: spi-nor: add Spansion S25FL204K support
Date: Tue, 16 Jun 2015 11:37:04 +0300
Message-Id: <1434443824-27077-1-git-send-email-antonynpavlov@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
with Uniform 4 kB Sectors.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..1a1494305 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -626,6 +626,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
+	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-- 
2.1.4
