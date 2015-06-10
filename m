Received: from mail-wg0-x243.google.com ([2a00:1450:400c:c00::243])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmi-00057E-Ta
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:41 +0000
Received: by wggx12 with SMTP id x12so8978403wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:24 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 14/60] mtd: maps: lantiq-flash: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:28 +0200
Message-Id: <1433968754-10651-15-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/lantiq-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 33d26f5..0cef3ba 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -161,7 +161,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	ltq_mtd->mtd->owner = THIS_MODULE;
+	ltq_mtd->mtd->dev.parent = &pdev->dev;
 
 	cfi = ltq_mtd->map->fldrv_priv;
 	cfi->addr_unlock1 ^= 1;
-- 
2.4.0
