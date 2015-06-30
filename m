Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9sFJ-0008Um-Vv
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 09:54:30 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-02.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1Z9sEv-0001ba-JP from Alexey_Firago@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 02:54:05 -0700
From: Alexey Firago <alexey_firago@mentor.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: set SECT_4K for n25q064 SPI flash
Date: Tue, 30 Jun 2015 12:53:46 +0300
Message-ID: <1435658026-10627-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alexey Firago <alexey_firago@mentor.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron n25q064 flash supports 4 KiB erase sectors.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..b2e8c3b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -589,7 +589,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 
 	/* Micron */
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SPI_NOR_QUAD_READ) },
+	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-- 
1.9.1
