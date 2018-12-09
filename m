Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW2V1-0007yw-5D
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2018 17:04:13 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	Piotr Dymacz <pepe2k@gmail.com>
Subject: [PATCH 1/2] mtd: spi-nor: Add support for EON EN25Q128
Date: Sun,  9 Dec 2018 18:03:41 +0100
Message-Id: <20181209170342.9554-2-hauke@hauke-m.de>
In-Reply-To: <20181209170342.9554-1-hauke@hauke-m.de>
References: <20181209170342.9554-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Piotr Dymacz <pepe2k@gmail.com>

The datasheet can be found here:
https://tonyho.github.io/static/SPINorFlash/docs/EN25Q128.pdf

Signed-off-by: Piotr Dymacz <pepe2k@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0e9bbde30be0..a21b1a26130d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1286,6 +1286,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25q128",   INFO(0x1c3018, 0, 64 * 1024,  256, SECT_4K) },
 	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
-- 
2.11.0
