Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZz-0004s4-Je
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:15 +0000
Received: by wggy19 with SMTP id y19so42753748wgg.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:57 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 19/60] mtd: maps: pxa2xx-flash: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:03 +0100
Message-Id: <1425418844-25177-20-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/pxa2xx-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 12fa75d..9adc4ef 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -93,7 +93,7 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 			iounmap(info->map.cached);
 		return -EIO;
 	}
-	info->mtd->owner = THIS_MODULE;
+	info->mtd->dev.parent = &pdev->dev;
 
 	mtd_device_parse_register(info->mtd, probes, NULL, flash->parts,
 				  flash->nr_parts);
-- 
2.2.2
