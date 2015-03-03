Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaK-0004u6-As
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:36 +0000
Received: by wggx13 with SMTP id x13so2616379wgg.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:17 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 40/60] mtd: nand: mxc_nand: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:24 +0100
Message-Id: <1425418844-25177-41-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/mxc_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index a8f550f..a62284c 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1410,7 +1410,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this = &host->nand;
 	mtd = &host->mtd;
 	mtd->priv = this;
-	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
 	mtd->name = DRIVER_NAME;
 
-- 
2.2.2
