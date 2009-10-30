Received: from mx2.zhaw.ch ([160.85.104.51])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3uki-0000u3-Hb
	for linux-mtd@lists.infradead.org; Fri, 30 Oct 2009 16:55:09 +0000
From: Tobias Klauser <tklauser@distanz.ch>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] maps/ixp4xx: Use resource_size
Date: Fri, 30 Oct 2009 17:54:33 +0100
Message-Id: <1256921673-19745-1-git-send-email-tklauser@distanz.ch>
Cc: Tobias Klauser <tklauser@distanz.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the resource_size inline function instead of manually calculating
the resource size. This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/mtd/maps/ixp4xx.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 7214b87..7b05152 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -210,7 +210,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	 * not attempt to do a direct access on us.
 	 */
 	info->map.phys = NO_XIP;
-	info->map.size = dev->resource->end - dev->resource->start + 1;
+	info->map.size = resource_size(dev->resource);
 
 	/*
 	 * We only support 16-bit accesses for now. If and when
@@ -224,7 +224,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	info->map.copy_from = ixp4xx_copy_from,
 
 	info->res = request_mem_region(dev->resource->start,
-			dev->resource->end - dev->resource->start + 1,
+			resource_size(dev->resource),
 			"IXP4XXFlash");
 	if (!info->res) {
 		printk(KERN_ERR "IXP4XXFlash: Could not reserve memory region\n");
@@ -233,7 +233,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	}
 
 	info->map.virt = ioremap(dev->resource->start,
-				 dev->resource->end - dev->resource->start + 1);
+				 resource_size(dev->resource));
 	if (!info->map.virt) {
 		printk(KERN_ERR "IXP4XXFlash: Failed to ioremap region\n");
 		err = -EIO;
-- 
1.6.3.3
