Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsk2f-0005gJ-NC
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2018 07:28:31 +0000
From: Huijin Park <huijin.park@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Huijin Park
 <huijin.park@samsung.com>, bbanghj.park@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cast to u64 to avoid unexpected error
Date: Thu, 23 Aug 2018 03:28:02 -0400
Message-id: <1535009282-1480-1-git-send-email-huijin.park@samsung.com>
References: <CGME20180823072813eucas1p2a534b4be94a3a2bc3480adcefca2ca22@eucas1p2.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "huijin.park" <huijin.park@samsung.com>

the params->size is defined as "u64"
and, "info->sector_size" and "info->n_sectors" is defined as unsgined and u16
thus, u64 data might have strange data(loss data) if data is overflow.
this patch cast it to u64.

Signed-off-by: huijin.park <huijin.park@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c..527f281 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
-	params->size = info->sector_size * info->n_sectors;
+	params->size = (u64)info->sector_size * (u64)info->n_sectors;
 	params->page_size = info->page_size;
 
 	/* (Fast) Read settings. */
-- 
1.7.9.5
