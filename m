Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9brg-000693-LY
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2018 20:10:57 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 03/14] mtd: maps: physmap: Use platform_get_resource() to
 retrieve iomem resources
Date: Mon,  8 Oct 2018 22:10:16 +0200
Message-Id: <20181008201027.17952-4-boris.brezillon@bootlin.com>
In-Reply-To: <20181008201027.17952-1-boris.brezillon@bootlin.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stop manipulating the dev->resource array directly and use the
platform_get_resource() helper instead.

While at it, fix the loop check so that we never overflow the info->maps
and info->mtds array even if the number of resources attached to the
platform dev is higher than MAX_RESOURCES.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 4010afee4a33..e5b15ec2cb04 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -122,23 +122,28 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	platform_set_drvdata(dev, info);
 
-	for (i = 0; i < dev->num_resources; i++) {
+	for (i = 0; i < MAX_RESOURCES; i++) {
+		struct resource *res;
+
+		res = platform_get_resource(dev, IORESOURCE_MEM, i);
+		if (res)
+			break;
+
 		printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
-		       (unsigned long long)resource_size(&dev->resource[i]),
-		       (unsigned long long)dev->resource[i].start);
+		       (unsigned long long)resource_size(res),
+		       (unsigned long long)res->start);
 
-		if (!devm_request_mem_region(&dev->dev,
-			dev->resource[i].start,
-			resource_size(&dev->resource[i]),
-			dev_name(&dev->dev))) {
+		if (!devm_request_mem_region(&dev->dev, res->start,
+					     resource_size(res),
+					     dev_name(&dev->dev))) {
 			dev_err(&dev->dev, "Could not reserve memory region\n");
 			err = -ENOMEM;
 			goto err_out;
 		}
 
 		info->maps[i].name = dev_name(&dev->dev);
-		info->maps[i].phys = dev->resource[i].start;
-		info->maps[i].size = resource_size(&dev->resource[i]);
+		info->maps[i].phys = res->start;
+		info->maps[i].size = resource_size(res);
 		info->maps[i].bankwidth = physmap_data->width;
 		info->maps[i].set_vpp = physmap_set_vpp;
 		info->maps[i].pfow_base = physmap_data->pfow_base;
@@ -172,9 +177,11 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->mtds[i]->dev.parent = &dev->dev;
 	}
 
-	if (devices_found == 1) {
+	if (!devices_found) {
+		err = -ENODEV;
+	} else if (devices_found == 1) {
 		info->cmtd = info->mtds[0];
-	} else if (devices_found > 1) {
+	} else {
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-- 
2.14.1
