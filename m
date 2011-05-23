Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMy-0002Ul-Ac
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:13 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so1297816wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:12 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/62] mtd/ixp: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:49 +0100
Message-Id: <1306142623-24952-9-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Imre Kaloz <kaloz@openwrt.org>,
	dwmw2@infradead.org, Krzysztof Halasa <khc@pm.waw.pl>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/arm/mach-ixp4xx/ixdp425-setup.c |    4 ----
 drivers/mtd/maps/ixp2000.c           |    4 ++--
 drivers/mtd/maps/ixp4xx.c            |   16 ++++++----------
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/ixdp425-setup.c b/arch/arm/mach-ixp4xx/ixdp425-setup.c
index 1407833..dca4f7f 100644
--- a/arch/arm/mach-ixp4xx/ixdp425-setup.c
+++ b/arch/arm/mach-ixp4xx/ixdp425-setup.c
@@ -60,7 +60,6 @@ static struct platform_device ixdp425_flash = {
 #if defined(CONFIG_MTD_NAND_PLATFORM) || \
     defined(CONFIG_MTD_NAND_PLATFORM_MODULE)
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
 
 static struct mtd_partition ixdp425_partitions[] = {
@@ -74,7 +73,6 @@ static struct mtd_partition ixdp425_partitions[] = {
 		.size	= MTDPART_SIZ_FULL
 	},
 };
-#endif
 
 static void
 ixdp425_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
@@ -103,11 +101,9 @@ static struct platform_nand_data ixdp425_flash_nand_data = {
 		.nr_chips		= 1,
 		.chip_delay		= 30,
 		.options		= NAND_NO_AUTOINCR,
-#ifdef CONFIG_MTD_PARTITIONS
 		.part_probe_types 	= part_probes,
 		.partitions	 	= ixdp425_partitions,
 		.nr_partitions	 	= ARRAY_SIZE(ixdp425_partitions),
-#endif
 	},
 	.ctrl = {
 		.cmd_ctrl 		= ixdp425_flash_nand_cmd_ctrl
diff --git a/drivers/mtd/maps/ixp2000.c b/drivers/mtd/maps/ixp2000.c
index 9639d83..c00b917 100644
--- a/drivers/mtd/maps/ixp2000.c
+++ b/drivers/mtd/maps/ixp2000.c
@@ -119,7 +119,7 @@ static int ixp2000_flash_remove(struct platform_device *dev)
 		return 0;
 
 	if (info->mtd) {
-		del_mtd_partitions(info->mtd);
+		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
 	if (info->map.map_priv_1)
@@ -230,7 +230,7 @@ static int ixp2000_flash_probe(struct platform_device *dev)
 
 	err = parse_mtd_partitions(info->mtd, probes, &info->partitions, 0);
 	if (err > 0) {
-		err = add_mtd_partitions(info->mtd, info->partitions, err);
+		err = mtd_device_register(info->mtd, info->partitions, err);
 		if(err)
 			dev_err(&dev->dev, "Could not parse partitions\n");
 	}
diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
index 1f9fde0..155b219 100644
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -162,7 +162,7 @@ static int ixp4xx_flash_remove(struct platform_device *dev)
 		return 0;
 
 	if (info->mtd) {
-		del_mtd_partitions(info->mtd);
+		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
 	if (info->map.virt)
@@ -252,10 +252,8 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 	/* Use the fast version */
 	info->map.write = ixp4xx_write16;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	nr_parts = parse_mtd_partitions(info->mtd, probes, &info->partitions,
 					dev->resource->start);
-#endif
 	if (nr_parts > 0) {
 		part_type = "dynamic";
 	} else {
@@ -263,18 +261,16 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
 		nr_parts = plat->nr_parts;
 		part_type = "static";
 	}
-	if (nr_parts == 0) {
+	if (nr_parts == 0)
 		printk(KERN_NOTICE "IXP4xx flash: no partition info "
 			"available, registering whole flash\n");
-		err = add_mtd_device(info->mtd);
-	} else {
+	else
 		printk(KERN_NOTICE "IXP4xx flash: using %s partition "
 			"definition\n", part_type);
-		err = add_mtd_partitions(info->mtd, info->partitions, nr_parts);
 
-		if(err)
-			printk(KERN_ERR "Could not parse partitions\n");
-	}
+	err = mtd_device_register(info->mtd, info->partitions, nr_parts);
+	if (err)
+		printk(KERN_ERR "Could not parse partitions\n");
 
 	if (err)
 		goto Error;
-- 
1.7.4.4
