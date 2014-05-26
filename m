Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3C1-0003Zg-Lu
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:16:30 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 2ACAF423C310
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:16:09 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/27] mtd: nand: lpc32xx_slc: use mtd_setup_common_members()
Date: Tue, 27 May 2014 00:12:42 +0200
Message-Id: <1401142372-14148-18-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/lpc32xx_slc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 53a6742..c8fb46b 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -799,9 +799,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = &host->mtd;
 	chip = &host->nand_chip;
 	chip->priv = host;
-	mtd->priv = chip;
-	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
+	mtd_setup_common_members(mtd, chip, pdev);
 
 	/* Get NAND clock */
 	host->clk = devm_clk_get(&pdev->dev, NULL);
-- 
1.8.3.2
