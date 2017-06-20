Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNKT0-0004I2-Ji
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 14:49:20 +0000
Received: by mail-pf0-x243.google.com with SMTP id y7so23616315pfd.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 07:48:58 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4] spi-nor: Add Winbond w25m512jv
Date: Wed, 21 Jun 2017 00:18:43 +0930
Message-Id: <20170620144843.23913-1-joel@jms.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Similar to the other ones, different size. The "JV" suffix is in
the datasheet, I haven't seen mentions of a different one.

The the datasheet indicates DUAL and QUAD are supported.

 http://www.winbond.com/resource-files/w25m512jv%20revc%2001062017.pdf

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: Get the name of the chip correct
v3: Added the DUAL and QUAD flags for Ben. Tested with aspeed-smc driver.

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index eef55b597ec7..43de5adafcb7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1146,6 +1146,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
+	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-- 
2.11.0
