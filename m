Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dthXO-0006QZ-0J
 for linux-mtd@lists.infradead.org; Sun, 17 Sep 2017 21:55:42 +0000
Received: by mail-lf0-x243.google.com with SMTP id l196so3620555lfl.3
 for <linux-mtd@lists.infradead.org>; Sun, 17 Sep 2017 14:55:16 -0700 (PDT)
Received: from localhost.localdomain ([213.175.92.61])
 by smtp.googlemail.com with ESMTPSA id 26sm1196568lfx.50.2017.09.17.14.55.13
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 17 Sep 2017 14:55:13 -0700 (PDT)
From: Roman Yeryomin <leroi.lists@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: spi-nor: add GigaDevice gd25q512
Date: Mon, 18 Sep 2017 00:54:49 +0300
Message-Id: <1505685289-5042-1-git-send-email-roman@advem.lv>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Roman Yeryomin <roman@advem.lv>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1d0e114..a6e56f4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -984,6 +984,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25q512", INFO(0xc84020, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4B_OPCODES)
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-- 
2.7.4
