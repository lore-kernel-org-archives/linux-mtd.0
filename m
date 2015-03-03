Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua4-0004s6-Km
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:21 +0000
Received: by wevm14 with SMTP id m14so42544643wev.13
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:58 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 20/60] mtd: maps: rbtx4939-flash: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:04 +0100
Message-Id: <1425418844-25177-21-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/maps/rbtx4939-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 5a7551a..18ee3614 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -96,7 +96,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 		err = -ENXIO;
 		goto err_out;
 	}
-	info->mtd->owner = THIS_MODULE;
+	info->mtd.dev.parent = &dev->dev;
 	err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
 					pdata->nr_parts);
 
-- 
2.2.2
