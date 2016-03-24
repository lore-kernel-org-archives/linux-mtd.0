Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiuTE-0006iH-EC
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 01:53:57 +0000
Received: by mail-qk0-x229.google.com with SMTP id s68so14603347qkh.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 18:53:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, boris.brezillon@free-electrons.com,
 alex@alex-smith.me.uk, harvey.hunt@imgtec.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: jz4780: fixup, device structure assigned  at probe
Date: Wed, 23 Mar 2016 21:53:27 -0400
Message-Id: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mtd/nand/jz4780_bch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
index 755499c..d74f4ba 100644
--- a/drivers/mtd/nand/jz4780_bch.c
+++ b/drivers/mtd/nand/jz4780_bch.c
@@ -287,7 +287,6 @@ static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
 	bch = platform_get_drvdata(pdev);
 	clk_prepare_enable(bch->clk);
 
-	bch->dev = &pdev->dev;
 	return bch;
 }
 
-- 
2.5.0
