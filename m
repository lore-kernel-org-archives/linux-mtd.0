Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaK-0003Jc-Os
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:37 +0000
Received: by widex7 with SMTP id ex7so24665299wid.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:14 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 37/60] mtd: nand: jz4740_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:21 +0100
Message-Id: <1425418844-25177-38-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/jz4740_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index ebf2cce..dc4e844 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -434,7 +434,7 @@ static int jz_nand_probe(struct platform_device *pdev)
 	mtd		= &nand->mtd;
 	chip		= &nand->chip;
 	mtd->priv	= chip;
-	mtd->owner	= THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 	mtd->name	= "jz4740-nand";
 
 	chip->ecc.hwctl		= jz_nand_hwctl;
-- 
2.2.2
