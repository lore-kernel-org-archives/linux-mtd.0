Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnP-0005Lr-GQ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:24 +0000
Received: by wggy19 with SMTP id y19so8971496wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:06 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 53/60] mtd: nand: sunxi_nand: drop owner assignment
Date: Wed, 10 Jun 2015 22:39:07 +0200
Message-Id: <1433968754-10651-54-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/sunxi_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 6f93b29..14f5c50 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1245,7 +1245,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	mtd = &chip->mtd;
 	mtd->dev.parent = dev;
 	mtd->priv = nand;
-	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan_ident(mtd, nsels, NULL);
 	if (ret)
-- 
2.4.0
