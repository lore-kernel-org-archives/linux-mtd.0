Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mml-000579-Fl
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:44 +0000
Received: by wggy19 with SMTP id y19so8965535wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:22 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 13/60] mtd: maps: ixp4xx: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:27 +0200
Message-Id: <1433968754-10651-14-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/maps/ixp4xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index b443074..e3180d5 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -226,7 +226,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 		err = -ENXIO;
 		goto Error;
 	}
-	info->mtd->owner = THIS_MODULE;
+	info->mtd->dev.parent = &dev->dev;
 
 	/* Use the fast version */
 	info->map.write = ixp4xx_write16;
-- 
2.4.0
