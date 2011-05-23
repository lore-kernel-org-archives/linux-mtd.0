Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNi-0002U4-IA
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:59 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:58 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 28/62] mtd/sa1100-flash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:09 +0100
Message-Id: <1306142623-24952-29-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
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

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/maps/Kconfig        |    2 +-
 drivers/mtd/maps/sa1100-flash.c |   21 ++++++---------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 049a549..d4a1f61 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -354,7 +354,7 @@ config MTD_CDB89712
 
 config MTD_SA1100
 	tristate "CFI Flash device mapped on StrongARM SA11x0"
-	depends on MTD_CFI && ARCH_SA1100 && MTD_PARTITIONS
+	depends on MTD_CFI && ARCH_SA1100
 	help
 	  This enables access to the flash chips on most platforms based on
 	  the SA1100 and SA1110, including the Assabet and the Compaq iPAQ.
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index da875908..a9b5e0e 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -226,12 +226,7 @@ static void sa1100_destroy(struct sa_info *info, struct flash_platform_data *pla
 	int i;
 
 	if (info->mtd) {
-		if (info->nr_parts == 0)
-			del_mtd_device(info->mtd);
-#ifdef CONFIG_MTD_PARTITIONS
-		else
-			del_mtd_partitions(info->mtd);
-#endif
+		mtd_device_unregister(info->mtd);
 		if (info->mtd != info->subdev[0].mtd)
 			mtd_concat_destroy(info->mtd);
 	}
@@ -363,28 +358,24 @@ static int __devinit sa1100_mtd_probe(struct platform_device *pdev)
 	/*
 	 * Partition selection stuff.
 	 */
-#ifdef CONFIG_MTD_PARTITIONS
 	nr_parts = parse_mtd_partitions(info->mtd, part_probes, &parts, 0);
 	if (nr_parts > 0) {
 		info->parts = parts;
 		part_type = "dynamic";
-	} else
-#endif
-	{
+	} else {
 		parts = plat->parts;
 		nr_parts = plat->nr_parts;
 		part_type = "static";
 	}
 
-	if (nr_parts == 0) {
+	if (nr_parts == 0)
 		printk(KERN_NOTICE "SA1100 flash: no partition info "
 			"available, registering whole flash\n");
-		add_mtd_device(info->mtd);
-	} else {
+	else
 		printk(KERN_NOTICE "SA1100 flash: using %s partition "
 			"definition\n", part_type);
-		add_mtd_partitions(info->mtd, parts, nr_parts);
-	}
+
+	mtd_device_register(info->mtd, parts, nr_parts);
 
 	info->nr_parts = nr_parts;
 
-- 
1.7.4.4
