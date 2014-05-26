Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3AA-0000w5-Da
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:34 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 160F8423C2F8
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:14:12 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/27] mtd: nand: atmel_nand: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:29 +0200
Message-Id: <1401142372-14148-5-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/atmel_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 4ce181a..8056c36 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1980,6 +1980,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	host->io_phys = (dma_addr_t)mem->start;
 
 	mtd = &host->mtd;
+	mtd_setup_common_members(mtd, nand_chip, pdev);
 	nand_chip = &host->nand_chip;
 	host->dev = &pdev->dev;
 	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
@@ -1993,8 +1994,6 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	nand_chip->priv = host;		/* link the private data structures */
-	mtd->priv = nand_chip;
-	mtd->owner = THIS_MODULE;
 
 	/* Set address of NAND IO lines */
 	nand_chip->IO_ADDR_R = host->io_base;
@@ -2124,7 +2123,6 @@ static int atmel_nand_probe(struct platform_device *pdev)
 		goto err_scan_tail;
 	}
 
-	mtd->name = "atmel_nand";
 	ppdata.of_node = pdev->dev.of_node;
 	res = mtd_device_parse_register(mtd, NULL, &ppdata,
 			host->board.parts, host->board.num_parts);
-- 
1.8.3.2
