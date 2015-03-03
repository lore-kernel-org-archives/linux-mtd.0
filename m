Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaP-0004u7-2X
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:41 +0000
Received: by wghb13 with SMTP id b13so42785110wgh.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:19 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 42/60] mtd: nand: nuc900_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:26 +0100
Message-Id: <1425418844-25177-43-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/nuc900_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index e58c644..f0687f7 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -250,7 +250,7 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	chip = &(nuc900_nand->chip);
 
 	nuc900_nand->mtd.priv	= chip;
-	nuc900_nand->mtd.owner	= THIS_MODULE;
+	nuc900_nand->mtd.dev.parent = &pdev->dev;
 	spin_lock_init(&nuc900_nand->lock);
 
 	nuc900_nand->clk = devm_clk_get(&pdev->dev, NULL);
-- 
2.2.2
