Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3D4-0004sA-Lv
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:17:35 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 5F35E423C320
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:17:15 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 27/27] mtd: nand: socrates: use mtd_setup_common_members()
Date: Tue, 27 May 2014 00:12:52 +0200
Message-Id: <1401142372-14148-28-git-send-email-holler@ahsoftware.de>
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

Use the new common function mtd_setup_common_members().

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/nand/socrates_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index fe8058a..0b87be2 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -165,10 +165,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	host->dev = &ofdev->dev;
 
 	nand_chip->priv = host;		/* link the private data structures */
-	mtd->priv = nand_chip;
-	mtd->name = "socrates_nand";
-	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &ofdev->dev;
+	mtd_setup_common_members(mtd, nand_chip, ofdev);
 	ppdata.of_node = ofdev->dev.of_node;
 
 	/*should never be accessed directly */
-- 
1.8.3.2
