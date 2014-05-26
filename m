Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3Cu-0004bP-Lw
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:17:25 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 8BF38423C327
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:17:02 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 25/27] mtd: nand: ndfc: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:50 +0200
Message-Id: <1401142372-14148-26-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/ndfc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 69eaba6..66366e0 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -170,9 +170,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	chip->ecc.strength = 1;
 	chip->priv = ndfc;
 
-	ndfc->mtd.priv = chip;
-	ndfc->mtd.owner = THIS_MODULE;
-
 	flash_np = of_get_next_child(node, NULL);
 	if (!flash_np)
 		return -ENODEV;
@@ -248,6 +245,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 		out_be32(ndfc->ndfcbase + offset, be32_to_cpup(reg));
 	}
 
+	mtd_setup_common_members(&ndfc->mtd, &ndfc->chip, ofdev);
 	err = ndfc_chip_init(ndfc, ofdev->dev.of_node);
 	if (err) {
 		iounmap(ndfc->ndfcbase);
-- 
1.8.3.2
