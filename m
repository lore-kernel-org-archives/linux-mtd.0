Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbGk0-0003ML-U9
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 22:59:09 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: add support for the Winbond W25X05 flash
Date: Thu, 26 Mar 2015 23:58:02 +0100
Message-Id: <1427410682-22753-1-git-send-email-juhosg@openwrt.org>
Cc: Luka Perkov <luka@openwrt.org>, Gabor Juhos <juhosg@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
Signed-off-by: Luka Perkov <luka@openwrt.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b6a5a0c..1f51924 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -648,6 +648,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
+	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
 	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
 	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
-- 
2.3.3
