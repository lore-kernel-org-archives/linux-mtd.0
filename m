Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp39v-0000pt-Df
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:19 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id C4A4A423C2FE
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:13:57 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/27] mtd: nand: orion_nand: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:27 +0200
Message-Id: <1401142372-14148-3-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/orion_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index dd7fe81..3cd43f7 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -91,6 +91,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		goto no_res;
 	}
 	mtd = (struct mtd_info *)(nc + 1);
+	mtd_setup_common_members(mtd, nc, pdev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -132,9 +133,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		board = dev_get_platdata(&pdev->dev);
 	}
 
-	mtd->priv = nc;
-	mtd->owner = THIS_MODULE;
-
 	nc->priv = board;
 	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
 	nc->cmd_ctrl = orion_nand_cmd_ctrl;
@@ -169,7 +167,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		goto no_dev;
 	}
 
-	mtd->name = "orion_nand";
 	ppdata.of_node = pdev->dev.of_node;
 	ret = mtd_device_parse_register(mtd, NULL, &ppdata,
 			board->parts, board->nr_parts);
-- 
1.8.3.2
