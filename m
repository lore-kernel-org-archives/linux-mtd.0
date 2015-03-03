Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua5-0004sE-Ou
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:22 +0000
Received: by wghl18 with SMTP id l18so42781364wgh.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:03 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 25/60] mtd: nand: bf5xx_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:09 +0100
Message-Id: <1425418844-25177-26-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/bf5xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4d8d4ba..acec344 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -782,7 +782,7 @@ static int bf5xx_nand_probe(struct platform_device *pdev)
 	/* initialise mtd info data struct */
 	mtd 		= &info->mtd;
 	mtd->priv	= chip;
-	mtd->owner	= THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	/* initialise the hardware */
 	err = bf5xx_nand_hw_init(info);
-- 
2.2.2
