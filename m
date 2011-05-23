Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORN4-0002TB-Vx
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:20 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:18 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/62] mtd/bfin: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:52 +0100
Message-Id: <1306142623-24952-12-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Jamie Iles <jamie@jamieiles.com>,
	dwmw2@infradead.org, dedekind1@gmail.com
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

Cc: Mike Frysinger <vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/blackfin/mach-bf537/boards/stamp.c   |    4 ----
 arch/blackfin/mach-bf561/boards/acvilon.c |    4 ----
 drivers/mtd/maps/Kconfig                  |    1 -
 drivers/mtd/maps/bfin-async-flash.c       |   21 +++++----------------
 4 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/arch/blackfin/mach-bf537/boards/stamp.c b/arch/blackfin/mach-bf537/boards/stamp.c
index 3fa3354..94ecf10 100644
--- a/arch/blackfin/mach-bf537/boards/stamp.c
+++ b/arch/blackfin/mach-bf537/boards/stamp.c
@@ -381,7 +381,6 @@ static struct platform_device net2272_bfin_device = {
 #endif
 
 #if defined(CONFIG_MTD_NAND_PLATFORM) || defined(CONFIG_MTD_NAND_PLATFORM_MODULE)
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
 static struct mtd_partition bfin_plat_nand_partitions[] = {
@@ -395,7 +394,6 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
 		.offset = MTDPART_OFS_APPEND,
 	},
 };
-#endif
 
 #define BFIN_NAND_PLAT_CLE 2
 #define BFIN_NAND_PLAT_ALE 1
@@ -422,11 +420,9 @@ static struct platform_nand_data bfin_plat_nand_data = {
 	.chip = {
 		.nr_chips = 1,
 		.chip_delay = 30,
-#ifdef CONFIG_MTD_PARTITIONS
 		.part_probe_types = part_probes,
 		.partitions = bfin_plat_nand_partitions,
 		.nr_partitions = ARRAY_SIZE(bfin_plat_nand_partitions),
-#endif
 	},
 	.ctrl = {
 		.cmd_ctrl  = bfin_plat_nand_cmd_ctrl,
diff --git a/arch/blackfin/mach-bf561/boards/acvilon.c b/arch/blackfin/mach-bf561/boards/acvilon.c
index 3926cd9..9231a94 100644
--- a/arch/blackfin/mach-bf561/boards/acvilon.c
+++ b/arch/blackfin/mach-bf561/boards/acvilon.c
@@ -243,7 +243,6 @@ static struct platform_device bfin_uart0_device = {
 
 #if defined(CONFIG_MTD_NAND_PLATFORM) || defined(CONFIG_MTD_NAND_PLATFORM_MODULE)
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
 
 static struct mtd_partition bfin_plat_nand_partitions[] = {
@@ -257,7 +256,6 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
 	     .offset = MTDPART_OFS_APPEND,
 	     },
 };
-#endif
 
 #define BFIN_NAND_PLAT_CLE 2
 #define BFIN_NAND_PLAT_ALE 3
@@ -286,11 +284,9 @@ static struct platform_nand_data bfin_plat_nand_data = {
 	.chip = {
 		 .nr_chips = 1,
 		 .chip_delay = 30,
-#ifdef CONFIG_MTD_PARTITIONS
 		 .part_probe_types = part_probes,
 		 .partitions = bfin_plat_nand_partitions,
 		 .nr_partitions = ARRAY_SIZE(bfin_plat_nand_partitions),
-#endif
 		 },
 	.ctrl = {
 		 .cmd_ctrl = bfin_plat_nand_cmd_ctrl,
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index d028cd4..fd6e8cd 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -460,7 +460,6 @@ config MTD_PCMCIA_ANONYMOUS
 config MTD_BFIN_ASYNC
 	tristate "Blackfin BF533-STAMP Flash Chip Support"
 	depends on BFIN533_STAMP && MTD_CFI && MTD_COMPLEX_MAPPINGS
-	select MTD_PARTITIONS
 	default y
 	help
 	  Map driver which allows for simultaneous utilization of
diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 85dd181..d4297a9 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -41,9 +41,7 @@ struct async_state {
 	uint32_t flash_ambctl0, flash_ambctl1;
 	uint32_t save_ambctl0, save_ambctl1;
 	unsigned long irq_flags;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
-#endif
 };
 
 static void switch_to_flash(struct async_state *state)
@@ -124,9 +122,7 @@ static void bfin_flash_copy_to(struct map_info *map, unsigned long to, const voi
 	switch_back(state);
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 static int __devinit bfin_flash_probe(struct platform_device *pdev)
 {
@@ -169,22 +165,17 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
 	if (ret > 0) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, ret);
+		mtd_device_register(state->mtd, pdata->parts, ret);
 		state->parts = pdata->parts;
-
 	} else if (pdata->nr_parts) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
-		add_mtd_partitions(state->mtd, pdata->parts, pdata->nr_parts);
-
-	} else
-#endif
-	{
+		mtd_device_register(state->mtd, pdata->parts, pdata->nr_parts);
+	} else {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": no partition info available, registering whole flash at once\n");
-		add_mtd_device(state->mtd);
+		mtd_device_register(state->mtd, NULL, 0);
 	}
 
 	platform_set_drvdata(pdev, state);
@@ -196,10 +187,8 @@ static int __devexit bfin_flash_remove(struct platform_device *pdev)
 {
 	struct async_state *state = platform_get_drvdata(pdev);
 	gpio_free(state->enet_flash_pin);
-#ifdef CONFIG_MTD_PARTITIONS
-	del_mtd_partitions(state->mtd);
+	mtd_device_unregister(state->mtd);
 	kfree(state->parts);
-#endif
 	map_destroy(state->mtd);
 	kfree(state);
 	return 0;
-- 
1.7.4.4
