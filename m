Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3Bw-0003TZ-Lp
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:16:25 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id DF6E6423C30D
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:16:02 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/27] mtd: nand: lpc32xx_mlc: use mtd_setup_common_members()
Date: Tue, 27 May 2014 00:12:41 +0200
Message-Id: <1401142372-14148-17-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Alexander Holler <holler@ahsoftware.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the new common function mtd_setup_common_members()

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/nand/lpc32xx_mlc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 687478c..4fa7b13 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -681,9 +681,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	host->pdata = dev_get_platdata(&pdev->dev);
 
 	nand_chip->priv = host;		/* link the private data structures */
-	mtd->priv = nand_chip;
-	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
+	mtd_setup_common_members(mtd, nand_chip, pdev);
 
 	/* Get NAND clock */
 	host->clk = clk_get(&pdev->dev, NULL);
@@ -790,8 +788,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto err_exit4;
 	}
 
-	mtd->name = DRV_NAME;
-
 	ppdata.of_node = pdev->dev.of_node;
 	res = mtd_device_parse_register(mtd, NULL, &ppdata, host->ncfg->parts,
 					host->ncfg->num_parts);
-- 
1.8.3.2
