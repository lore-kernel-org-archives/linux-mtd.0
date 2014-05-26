Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3B3-0002YC-Dx
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:15:29 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 28316423C30B
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:15:06 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/27] mtd: nand: sharpsl: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:37 +0200
Message-Id: <1401142372-14148-13-git-send-email-holler@ahsoftware.de>
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

Fix a common error in nand-drivers which do not set up a parent device for
the mtd-device by using a new inline function.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/nand/sharpsl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index e81059b..1a9824a 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -142,10 +142,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	/* Link the private data with the MTD structure */
-	sharpsl->mtd.priv = this;
-	sharpsl->mtd.owner = THIS_MODULE;
-
+	mtd_setup_common_members(&sharpsl->mtd, this, pdev);
 	platform_set_drvdata(pdev, sharpsl);
 
 	/*
@@ -178,8 +175,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 		goto err_scan;
 
 	/* Register the partitions */
-	sharpsl->mtd.name = "sharpsl-nand";
-
 	err = mtd_device_parse_register(&sharpsl->mtd, NULL, NULL,
 					data->partitions, data->nr_partitions);
 	if (err)
-- 
1.8.3.2
