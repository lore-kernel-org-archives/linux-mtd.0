Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0PJQ-0000Ip-S9
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 23:39:53 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd/bfin-async-flash: use parse_mtd()
Date: Wed, 12 Nov 2008 18:39:49 -0500
Message-Id: <1226533189-8492-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Call parse_mtd() to handle partition/device registration rather than doing
it all ourself.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/bfin-async-flash.c |   28 +++-------------------------
 1 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 6fec86a..01c9e7a 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -120,13 +120,8 @@ static void bfin_copy_to(struct map_info *map, unsigned long to, const void *fro
 	switch_back(state);
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
-
 static int __devinit bfin_flash_probe(struct platform_device *pdev)
 {
-	int ret;
 	struct physmap_flash_data *pdata = pdev->dev.platform_data;
 	struct resource *memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct resource *flash_ambctl = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -150,6 +145,8 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 	state->flash_ambctl0  = flash_ambctl->start;
 	state->flash_ambctl1  = flash_ambctl->end;
 
+	platform_set_drvdata(pdev, state);
+
 	if (gpio_request(state->enet_flash_pin, DRIVER_NAME)) {
 		pr_devinit(KERN_ERR DRIVER_NAME ": Failed to request gpio %d\n", state->enet_flash_pin);
 		return -EBUSY;
@@ -161,26 +158,7 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 	if (!state->mtd)
 		return -ENXIO;
 
-#ifdef CONFIG_MTD_PARTITIONS
-	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
-	if (ret > 0) {
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, ret);
-
-	} else if (pdata->nr_parts) {
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, pdata->nr_parts);
-
-	} else
-#endif
-	{
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": no partition info available, registering whole flash at once\n");
-		add_mtd_device(state->mtd);
-	}
-
-	platform_set_drvdata(pdev, state);
-
-	return 0;
+	return parse_mtd(state->mtd, NULL, pdata->parts, pdata->nr_parts);
 }
 
 static int __devexit bfin_flash_remove(struct platform_device *pdev)
-- 
1.6.0.3
