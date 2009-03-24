Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LluMS-00063V-3y
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 00:19:26 +0000
From: Daniel Mack <daniel@caiaq.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] pxa2xx-flash.c: fix memory leak
Date: Tue, 24 Mar 2009 01:19:03 +0100
Message-Id: <1237853943-6472-1-git-send-email-daniel@caiaq.de>
Cc: Nicolas Pitre <nico@cam.org>, Daniel Mack <daniel@caiaq.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Daniel Mack <daniel@caiaq.de>
Cc: Nicolas Pitre <nico@cam.org>
---
 drivers/mtd/maps/pxa2xx-flash.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 771139c..9d66881 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -70,6 +70,7 @@ static int __init pxa2xx_flash_probe(struct device *dev)
 	if (!info->map.virt) {
 		printk(KERN_WARNING "Failed to ioremap %s\n",
 		       info->map.name);
+		kfree(info);
 		return -ENOMEM;
 	}
 	info->map.cached =
@@ -92,6 +93,7 @@ static int __init pxa2xx_flash_probe(struct device *dev)
 		iounmap((void *)info->map.virt);
 		if (info->map.cached)
 			iounmap(info->map.cached);
+		kfree(info);
 		return -EIO;
 	}
 	info->mtd->owner = THIS_MODULE;
-- 
1.6.2
