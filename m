Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzxAU-00038V-EH
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 01:40:46 +0000
Received: by pabfh17 with SMTP id fh17so136588700pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 17:40:25 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH] mtd: mtk-quadspi: drop unnecessary .owner assignment
Date: Fri, 20 Nov 2015 17:40:13 -0800
Message-Id: <1448070013-139538-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of commit 807f16d4db95 ("mtd: core: set some defaults when
dev.parent is set"), the MTD core will set this for us.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>
---
 drivers/mtd/spi-nor/mtk-quadspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index dd269650cd16..e1dd9fd16fbe 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -390,7 +390,6 @@ static int __init mtk_nor_init(struct mt8173_nor *mt8173_nor,
 	nor->read_reg = mt8173_nor_read_reg;
 	nor->write = mt8173_nor_write;
 	nor->write_reg = mt8173_nor_write_reg;
-	nor->mtd.owner = THIS_MODULE;
 	nor->mtd.name = "mtk_nor";
 	/* initialized with NULL */
 	ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
-- 
2.6.0.rc2.230.g3dd15c0
