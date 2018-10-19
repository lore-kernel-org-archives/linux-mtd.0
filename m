Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPXV-0003SZ-FU
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:49:55 +0000
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
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 05/15] mtd: maps: physmap: Use devm_ioremap_resource()
Date: Fri, 19 Oct 2018 09:48:58 +0200
Message-Id: <20181019074908.13226-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_ioremap_resource() to replace the devm_request_mem_region() +
devm_ioremap() combination.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changes in v2:
- Add Ricardo's R-b
---
 drivers/mtd/maps/physmap.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index b98072a67d74..1d0f6f034a03 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -129,17 +129,15 @@ static int physmap_flash_probe(struct platform_device *dev)
 		if (!res)
 			break;
 
-		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
-			   res);
-
-		if (!devm_request_mem_region(&dev->dev, res->start,
-					     resource_size(res),
-					     dev_name(&dev->dev))) {
-			dev_err(&dev->dev, "Could not reserve memory region\n");
-			err = -ENOMEM;
+		info->maps[i].virt = devm_ioremap_resource(&dev->dev, res);
+		if (IS_ERR(info->maps[i].virt)) {
+			err = PTR_ERR(info->maps[i].virt);
 			goto err_out;
 		}
 
+		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
+			   res);
+
 		info->maps[i].name = dev_name(&dev->dev);
 		info->maps[i].phys = res->start;
 		info->maps[i].size = resource_size(res);
@@ -148,15 +146,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 		info->maps[i].pfow_base = physmap_data->pfow_base;
 		info->maps[i].map_priv_1 = (unsigned long)dev;
 
-		info->maps[i].virt = devm_ioremap(&dev->dev,
-						  info->maps[i].phys,
-						  info->maps[i].size);
-		if (info->maps[i].virt == NULL) {
-			dev_err(&dev->dev, "Failed to ioremap flash region\n");
-			err = -EIO;
-			goto err_out;
-		}
-
 		simple_map_init(&info->maps[i]);
 
 		probe_type = rom_probe_types;
-- 
2.14.1
