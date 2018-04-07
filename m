Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4nTG-0007eT-Q2
 for linux-mtd@lists.infradead.org; Sat, 07 Apr 2018 13:01:32 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Angelo Dureghello <angelo@sysam.it>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: spi-nor: add support for ISSI is25lp256
Date: Sat,  7 Apr 2018 15:01:05 +0200
Message-Id: <20180407130105.24671-1-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for ISSI is25lp256 spi nor flash.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Angelo Dureghello <angelo@sysam.it>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e95f35..a9e3f0ff0974 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1049,6 +1049,8 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.16.2
