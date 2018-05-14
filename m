Received: from mail-ve1eur01on0050.outbound.protection.outlook.com
 ([104.47.1.50] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIAWv-0002lO-NZ
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 10:17:00 +0000
From: Kimmo Rautkoski <ext-kimmo.rautkoski@vaisala.com>
To: linux-mtd@lists.infradead.org
Cc: cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 Kimmo Rautkoski <ext-kimmo.rautkoski@vaisala.com>
Subject: [PATCH] mtd: spi-nor: Add support for is25wp series chips
Date: Mon, 14 May 2018 13:15:53 +0300
Message-Id: <1526292953-9486-1-git-send-email-ext-kimmo.rautkoski@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added support for is25wp032, is25wp064 and is25wp128.

Signed-off-by: Kimmo Rautkoski <ext-kimmo.rautkoski@vaisala.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 494b7a2..cace1de 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1065,6 +1065,12 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.1.4
