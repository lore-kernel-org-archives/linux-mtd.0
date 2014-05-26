Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3AU-00016E-De
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:54 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 5CD52423C303
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:14:32 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/27] mtd: nand: gpmi: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:32 +0200
Message-Id: <1401142372-14148-8-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index bb77f75..35b0a60 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1682,11 +1682,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* init current chip */
 	this->current_chip	= -1;
 
-	/* init the MTD data structures */
-	mtd->priv		= chip;
-	mtd->name		= "gpmi-nand";
-	mtd->owner		= THIS_MODULE;
-
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	chip->priv		= this;
 	chip->select_chip	= gpmi_select_chip;
@@ -1791,6 +1786,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_nfc_init;
 
+	mtd_setup_common_members(&this->mtd, &this->nand, pdev);
 	ret = gpmi_nand_init(this);
 	if (ret)
 		goto exit_nfc_init;
-- 
1.8.3.2
