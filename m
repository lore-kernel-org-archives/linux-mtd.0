Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn3hO-0006OP-Bc
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 08:15:36 +0000
Received: from kubuntu.fritz.box (pD9FFB8BA.dip.t-dialin.net [217.255.184.186])
 by smtp.strato.de (joses mo47) (RZmta 29.19 DYNA|AUTH)
 with ESMTPA id K02a34o667rx66 for <linux-mtd@lists.infradead.org>;
 Fri, 6 Jul 2012 10:15:28 +0200 (CEST)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: physmap_of: Convert to devm_kzalloc() and
 devm_request_and_ioremap()
Date: Fri,  6 Jul 2012 10:15:26 +0200
Message-Id: <1341562526-18503-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Saves some error handling and a small amount of code.

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/physmap_of.c | 54 +++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 2e6fb68..11b31ac 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -59,18 +59,8 @@ static int of_flash_remove(struct platform_device *dev)
 	for (i = 0; i < info->list_size; i++) {
 		if (info->list[i].mtd)
 			map_destroy(info->list[i].mtd);
-
-		if (info->list[i].map.virt)
-			iounmap(info->list[i].map.virt);
-
-		if (info->list[i].res) {
-			release_resource(info->list[i].res);
-			kfree(info->list[i].res);
-		}
 	}
 
-	kfree(info);
-
 	return 0;
 }
 
@@ -116,7 +106,8 @@ static struct mtd_info * __devinit obsolete_probe(struct platform_device *dev,
    information. */
 static const char *part_probe_types_def[] = { "cmdlinepart", "RedBoot",
 					"ofpart", "ofoldpart", NULL };
-static const char ** __devinit of_get_probes(struct device_node *dp)
+static const char ** __devinit of_get_probes(struct platform_device *dev,
+					     struct device_node *dp)
 {
 	const char *cp;
 	int cplen;
@@ -133,7 +124,7 @@ static const char ** __devinit of_get_probes(struct device_node *dp)
 		if (cp[l] == 0)
 			count++;
 
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
+	res = devm_kzalloc(&dev->dev, (count + 1)*sizeof(*res), GFP_KERNEL);
 	count = 0;
 	while (cplen > 0) {
 		res[count] = cp;
@@ -167,7 +158,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	const __be32 *p;
 	int reg_tuple_size;
 	struct mtd_info **mtd_list = NULL;
-	resource_size_t res_size;
 	struct mtd_part_parser_data ppdata;
 
 	match = of_match_device(of_flash_match, &dev->dev);
@@ -188,21 +178,22 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 		dev_err(&dev->dev, "Malformed reg property on %s\n",
 				dev->dev.of_node->full_name);
 		err = -EINVAL;
-		goto err_flash_remove;
+		goto err_out;
 	}
 	count /= reg_tuple_size;
 
 	err = -ENOMEM;
-	info = kzalloc(sizeof(struct of_flash) +
+	info = devm_kzalloc(&dev->dev, sizeof(struct of_flash) +
 		       sizeof(struct of_flash_list) * count, GFP_KERNEL);
 	if (!info)
-		goto err_flash_remove;
+		goto err_out;
 
 	dev_set_drvdata(&dev->dev, info);
 
-	mtd_list = kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
+	mtd_list = devm_kzalloc(&dev->dev, sizeof(*mtd_list) * count,
+				GFP_KERNEL);
 	if (!mtd_list)
-		goto err_flash_remove;
+		goto err_out;
 
 	for (i = 0; i < count; i++) {
 		err = -ENXIO;
@@ -216,12 +207,14 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 
 		dev_dbg(&dev->dev, "of_flash device: %pR\n", &res);
 
-		err = -EBUSY;
-		res_size = resource_size(&res);
-		info->list[i].res = request_mem_region(res.start, res_size,
-						       dev_name(&dev->dev));
-		if (!info->list[i].res)
+		err = -ENOMEM;
+		info->list[i].map.virt = devm_request_and_ioremap(&dev->dev,
+								  &res);
+		if (!info->list[i].map.virt) {
+			dev_err(&dev->dev,
+				"Failed to ioremap() flash region\n");
 			goto err_out;
+		}
 
 		err = -ENXIO;
 		width = of_get_property(dp, "bank-width", NULL);
@@ -233,18 +226,9 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 
 		info->list[i].map.name = dev_name(&dev->dev);
 		info->list[i].map.phys = res.start;
-		info->list[i].map.size = res_size;
+		info->list[i].map.size = resource_size(&res);
 		info->list[i].map.bankwidth = be32_to_cpup(width);
 
-		err = -ENOMEM;
-		info->list[i].map.virt = ioremap(info->list[i].map.phys,
-						 info->list[i].map.size);
-		if (!info->list[i].map.virt) {
-			dev_err(&dev->dev, "Failed to ioremap() flash"
-				" region\n");
-			goto err_out;
-		}
-
 		simple_map_init(&info->list[i].map);
 
 		if (probe_type) {
@@ -283,7 +267,7 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 		goto err_out;
 
 	ppdata.of_node = dp;
-	part_probe_types = of_get_probes(dp);
+	part_probe_types = of_get_probes(dev, dp);
 	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
 			NULL, 0);
 	of_free_probes(part_probe_types);
@@ -293,8 +277,6 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	return 0;
 
 err_out:
-	kfree(mtd_list);
-err_flash_remove:
 	of_flash_remove(dev);
 
 	return err;
-- 
1.7.11.1
