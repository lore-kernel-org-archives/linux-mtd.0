Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac2eP-0004EQ-Ps
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 03:13:06 +0000
Received: by mail-pf0-x234.google.com with SMTP id x188so21763761pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 19:12:45 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] mtd: nand: pxa3xx_nand: kill unused field 'drcmr_cmd'
Date: Fri,  4 Mar 2016 19:12:33 -0800
Message-Id: <1457147553-71596-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index f100c4da0423..a60c413c8d7f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -211,7 +211,6 @@ struct pxa3xx_nand_info {
 	struct dma_chan		*dma_chan;
 	dma_cookie_t		dma_cookie;
 	int			drcmr_dat;
-	int			drcmr_cmd;
 
 	unsigned char		*data_buff;
 	unsigned char		*oob_buff;
@@ -1812,7 +1811,6 @@ static int alloc_nand_resource(struct platform_device *pdev)
 			ret = -ENXIO;
 			goto fail_disable_clk;
 		}
-		info->drcmr_cmd = r->start;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.7.0.rc3.207.g0ac5344
