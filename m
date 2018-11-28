Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRuoH-0004Ti-9J
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 08:03:03 +0000
From: Huijin Park <huijin.park@samsung.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huijin Park <huijin.park@samsung.com>,
 bbanghj.park@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3] mtd: spi-nor: cast to u64 to avoid uint overflows
Date: Wed, 28 Nov 2018 03:02:14 -0500
Message-id: <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
References: <CGME20181128080244eucas1p15d9478c4fdbb0609005a12d24703d6d8@eucas1p1.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "huijin.park" <huijin.park@samsung.com>

The "params->size" is defined as "u64".
And "info->sector_size" and "info->n_sectors" are defined as
unsigned int and u16.
Thus, u64 data might have strange data(loss data) if the result
overflows an unsigned int.
This patch casts "info->sector_size" to an u64.

Signed-off-by: huijin.park <huijin.park@samsung.com>
---

Changes since v1:
 * Made commit subject and message more clear.
Changes since v2:
 * Adding the cast to only the first operand.
---
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c..59a1075 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
-	params->size = info->sector_size * info->n_sectors;
+	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
 	/* (Fast) Read settings. */
-- 
1.7.9.5
