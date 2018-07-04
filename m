Received: from [45.249.212.35] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fad6z-0000Jo-UQ
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 08:26:12 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Peter Pan <peterpandong@micron.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] mtd: spinand: Fix error return code in spinand_init()
Date: Wed, 4 Jul 2018 08:34:58 +0000
Message-ID: <1530693298-14271-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix to return error code -ENOMEM from the kzalloc() error handling
case instead of 0, as done elsewhere in this function.

Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/nand/spi/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17d207a..011683e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -985,8 +985,10 @@ static int spinand_init(struct spinand_device *spinand)
 	spinand->databuf = kzalloc(nanddev_page_size(nand) +
 			       nanddev_per_page_oobsize(nand),
 			       GFP_KERNEL);
-	if (!spinand->databuf)
+	if (!spinand->databuf) {
+		ret = -ENOMEM;
 		goto err_free_bufs;
+	}
 
 	spinand->oobbuf = spinand->databuf + nanddev_page_size(nand);
