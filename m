Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyZ7M-0004UQ-H7
 for linux-mtd@lists.infradead.org; Thu, 13 Apr 2017 07:24:38 +0000
Received: by mail-wm0-x241.google.com with SMTP id d79so10789820wmi.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Apr 2017 00:24:15 -0700 (PDT)
From: Mathias Kresin <dev@kresin.me>
To: linux-mtd@lists.infradead.org
Cc: cyrille.pitchen@atmel.com,
	marek.vasut@gmail.com
Subject: [PATCH] mtd: spi-nor: enable stateless 4b op codes for mx25u25635f
Date: Thu, 13 Apr 2017 09:23:54 +0200
Message-Id: <1492068234-9509-1-git-send-email-dev@kresin.me>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All required stateless 4-byte op codes are supported by this flash
chip. The stateless 4-byte support can't be autodetected due to a
missing 4-byte Address Instruction Table in SFDP.

Fixes hangs on reboot for SoCs expecting the flash chip in 3byte mode.

Signed-off-by: Mathias Kresin <dev@kresin.me>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1ae872b..4b496d8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1017,7 +1017,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
-	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
+	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
-- 
2.7.4
