Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsFnO-0007f8-FA
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 19:57:06 +0000
Received: by padhy1 with SMTP id hy1so77081249pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 12:56:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH] mtd: spi-nor: remove unnecessary leading space from dbg print
Date: Fri, 30 Oct 2015 12:56:22 -0700
Message-Id: <1446234982-130911-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As Crille noted [1], this line is wrong.

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-September/061725.html

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..87a722a22f11 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -856,7 +856,7 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
-		dev_dbg(nor->dev, " error %d reading JEDEC ID\n", tmp);
+		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
 		return ERR_PTR(tmp);
 	}
 
-- 
2.6.0.rc2.230.g3dd15c0
