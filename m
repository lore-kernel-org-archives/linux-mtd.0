Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaT-0004w3-JK
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:46 +0000
Received: by wiwl15 with SMTP id l15so26289401wiw.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:23 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 47/60] mtd: nand: pxa3xx_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:31 +0100
Message-Id: <1425418844-25177-48-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 96b0b1d..f908c6d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1589,7 +1589,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		host->cs = cs;
 		host->info_data = info;
 		mtd->priv = host;
-		mtd->owner = THIS_MODULE;
+		mtd->dev.parent = &pdev->dev;
 
 		chip->ecc.read_page	= pxa3xx_nand_read_page_hwecc;
 		chip->ecc.write_page	= pxa3xx_nand_write_page_hwecc;
-- 
2.2.2
