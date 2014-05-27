Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpAt3-0007nF-Rg
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 06:29:26 +0000
Received: from eiche.ahsoftware (p57B22414.dip0.t-ipconnect.de [87.178.36.20])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 570CC423C2E3
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 08:29:04 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/27 v2] mtd: nand: pxa3xx: show device structure in sysfs
Date: Tue, 27 May 2014 08:28:30 +0200
Message-Id: <1401172110-3910-1-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Alexander Shiyan <shc_work@mail.ru>, Alexander Holler <holler@ahsoftware.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a common error in nand-drivers which do not set up a parent device for
the mtd-device by using a new inline function.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 Changes to v1: add owner to module

 drivers/mtd/nand/pxa3xx_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 7588fe2..9d4c914 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1584,8 +1584,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		host->mtd = mtd;
 		host->cs = cs;
 		host->info_data = info;
-		mtd->priv = host;
-		mtd->owner = THIS_MODULE;
+		mtd_setup_common_members(mtd, host, pdev);
 
 		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
 		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
@@ -1862,6 +1861,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 static struct platform_driver pxa3xx_nand_driver = {
 	.driver = {
 		.name	= "pxa3xx-nand",
+		.owner	= THIS_MODULE,
 		.of_match_table = pxa3xx_nand_dt_ids,
 	},
 	.probe		= pxa3xx_nand_probe,
-- 
1.8.3.2
