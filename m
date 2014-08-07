Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO7-0002zU-5y
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:03 +0000
Received: by mail-pd0-f179.google.com with SMTP id ft15so4262809pdb.10
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:42 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/8] mtd: spi-nor: handle timeout errors in spi_nor_write()
Date: Wed,  6 Aug 2014 18:16:56 -0700
Message-Id: <1407374222-8448-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error label was unused here. It looks like we're missing at least
one case that should be doing 'goto write_err'.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5825b8a12cee..d77c93232b76 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -809,7 +809,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			if (page_size > nor->page_size)
 				page_size = nor->page_size;
 
-			wait_till_ready(nor);
+			ret = wait_till_ready(nor);
+			if (ret)
+				goto write_err;
+
 			write_enable(nor);
 
 			nor->write(nor, to + i, page_size, retlen, buf + i);
@@ -818,7 +821,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
-	return 0;
+	return ret;
 }
 
 static int macronix_quad_enable(struct spi_nor *nor)
-- 
1.9.1
