Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsr5Q-0006Xy-MI
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 09:37:09 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so6738167pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 01:36:47 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: omap2: use nand_base defaults for polled I/O
Date: Tue, 17 Dec 2013 01:36:32 -0800
Message-Id: <1387272992-27948-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The omap_{read,write}_buf{8,16}() functions are identical to the default
nand_base versions. Just let nand_base assign them in the
NAND_OMAP_POLLED case.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/omap2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index e9e2c37c0a80..eadc76a57f45 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1730,13 +1730,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		break;
 
 	case NAND_OMAP_POLLED:
-		if (nand_chip->options & NAND_BUSWIDTH_16) {
-			nand_chip->read_buf   = omap_read_buf16;
-			nand_chip->write_buf  = omap_write_buf16;
-		} else {
-			nand_chip->read_buf   = omap_read_buf8;
-			nand_chip->write_buf  = omap_write_buf8;
-		}
+		/* Use nand_base defaults for {read,write}_buf */
 		break;
 
 	case NAND_OMAP_PREFETCH_DMA:
-- 
1.8.3.2
