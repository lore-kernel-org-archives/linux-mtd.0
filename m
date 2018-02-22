Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eontE-0000hj-4b
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 10:14:13 +0000
From: Felix Fietkau <nbd@nbd.name>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: allow NOR driver to write fewer bytes than
 requested
Date: Thu, 22 Feb 2018 11:13:58 +0100
Message-Id: <20180222101358.20035-1-nbd@nbd.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The write size can be constrained by the maximum message/transfer size
of the SPI controller. Only check for ret = 0 to avoid an infinite loop.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/mtd/spi-nor/spi-nor.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 61de4cc3bd7f..c60802eb6aa3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1392,7 +1392,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		write_enable(nor);
 		ret = nor->write(nor, addr, page_remain, buf + i);
-		if (ret < 0)
+		if (ret <= 0)
 			goto write_err;
 		written = ret;
 
@@ -1401,13 +1401,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			goto write_err;
 		*retlen += written;
 		i += written;
-		if (written != page_remain) {
-			dev_err(nor->dev,
-				"While writing %zu bytes written %zd bytes\n",
-				page_remain, written);
-			ret = -EIO;
-			goto write_err;
-		}
 	}
 
 write_err:
-- 
2.14.2
