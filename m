Received: from [45.249.212.32] (helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fadyd-0001Oj-ID
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 09:21:32 +0000
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next v3] mtd: spinand: fix missing unlock on error
Date: Wed, 4 Jul 2018 09:30:27 +0000
Message-ID: <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530696061-76467-1-git-send-email-weiyongjun1@huawei.com>
References: <1530696061-76467-1-git-send-email-weiyongjun1@huawei.com>
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

Add the missing unlock before return from function
spinand_mtd_(read|write) in the error handling case.

Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v2 -> v3: remove blank line
v1 -> v2: using break instead of return
---
 drivers/mtd/nand/spi/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17d207a..8998dca 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -561,11 +561,11 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 	nanddev_io_for_each_page(nand, from, ops, &iter) {
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
-			return ret;
+			break;
 
 		ret = spinand_ecc_enable(spinand, enable_ecc);
 		if (ret)
-			return ret;
+			break;
 
 		ret = spinand_read_page(spinand, &iter.req, enable_ecc);
 		if (ret < 0 && ret != -EBADMSG)
@@ -609,11 +609,11 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 	nanddev_io_for_each_page(nand, to, ops, &iter) {
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
-			return ret;
+			break;
 
 		ret = spinand_ecc_enable(spinand, enable_ecc);
 		if (ret)
-			return ret;
+			break;
 
 		ret = spinand_write_page(spinand, &iter.req);
 		if (ret)
