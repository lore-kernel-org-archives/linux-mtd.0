Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3C6-0003f7-Lp
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:16:35 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 7FD6C423C312
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:16:15 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 18/27] mtd: nand: mxc: use mtd_setup_common_members()
Date: Tue, 27 May 2014 00:12:43 +0200
Message-Id: <1401142372-14148-19-git-send-email-holler@ahsoftware.de>
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
 drivers/mtd/nand/mxc_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index dba262b..31114db4 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1413,10 +1413,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	/* structures must be linked */
 	this = &host->nand;
 	mtd = &host->mtd;
-	mtd->priv = this;
-	mtd->owner = THIS_MODULE;
-	mtd->dev.parent = &pdev->dev;
-	mtd->name = DRIVER_NAME;
+	mtd_setup_common_members(mtd, this, pdev);
 
 	/* 50 us command delay time */
 	this->chip_delay = 5;
-- 
1.8.3.2
