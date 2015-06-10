Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnR-0003qo-Ca
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:25 +0000
Received: by wivr20 with SMTP id r20so11925082wiv.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:08 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 55/60] mtd: nand: txx9ndfmc: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:39:09 +0200
Message-Id: <1433968754-10651-56-git-send-email-fransklaver@gmail.com>
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

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/txx9ndfmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 9c0bc45..8572519 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -323,7 +323,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 			continue;
 		chip = &txx9_priv->chip;
 		mtd = &txx9_priv->mtd;
-		mtd->owner = THIS_MODULE;
+		mtd->dev.parent = &dev->dev;
 
 		mtd->priv = chip;
 
-- 
2.4.0
