Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTtHt-0006NI-Gn
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 16:40:43 +0000
Received: by mail-lf0-x244.google.com with SMTP id q89so2502786lfi.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 08:40:21 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Fix S3AN addressing calculation
Date: Wed, 18 Jan 2017 17:40:16 +0100
Message-Id: <20170118164016.27976-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The page calculation under spi_nor_s3an_addr_convert() was wrong. On
Default Address Mode we need to perform a divide by page_size.

Fixes: 61cba34bd6c1 ("mtd: spi-nor: Add support for S3AN spi-nor devices")
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

v2: Suggested by Marek Vasut <marek.vasut@gmail.com>
  -Use more descriptive name for page

 drivers/mtd/spi-nor/spi-nor.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2a643a1bb45e..f5c3ce8ac48b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -431,11 +431,14 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
  */
 static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
 {
-	unsigned int offset = addr;
+	unsigned int offset;
+	unsigned int page;
 
-	offset %= nor->page_size;
+	offset = addr % nor->page_size;
+	page = addr / nor->page_size;
+	page <<= (nor->page_size > 512) ? 10 : 9;
 
-	return ((addr - offset) << 1) | offset;
+	return page | offset;
 }
 
 /*
-- 
2.11.0
