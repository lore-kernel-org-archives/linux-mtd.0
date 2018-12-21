Received: from smtpbg298.qq.com ([184.105.67.102])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaCKY-000094-NC
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 04:22:36 +0000
From: Ding Tao <miyatsu@qq.com>
To: marek.vasut@gmail.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ding Tao <miyatsu@qq.com>
Subject: [PATCH] mtd: spi-nor: Add support for Macronix mx25u3235f
Date: Fri, 21 Dec 2018 12:19:57 +0800
Message-Id: <20181221041957.84474-1-miyatsu@qq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some ESPRESSObin board from GlobalScale have mx25u3235f spi nor flash
attached, add support for it.

Minimal tested with u-boot tools fw_printenv/fw_setenv on GlobalScale
ESPRESSObin v5 board.

Signed-off-by: Ding Tao <miyatsu@qq.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1fdd2834fbcb..f3e337c61621 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1377,6 +1377,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
+	{ "mx25u3235f",  INFO(0xc22536, 0, 64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-- 
2.17.1
