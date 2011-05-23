Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNN-0002U4-B2
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:38 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:37 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/62] mtd/dc21285: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:00 +0100
Message-Id: <1306142623-24952-20-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/dc21285.c |   20 +++-----------------
 1 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/dc21285.c b/drivers/mtd/maps/dc21285.c
index b3cb3a1..7a9e198 100644
--- a/drivers/mtd/maps/dc21285.c
+++ b/drivers/mtd/maps/dc21285.c
@@ -145,17 +145,13 @@ static struct map_info dc21285_map = {
 
 
 /* Partition stuff */
-#ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition *dc21285_parts;
 static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
-#endif
 
 static int __init init_dc21285(void)
 {
 
-#ifdef CONFIG_MTD_PARTITIONS
 	int nrparts;
-#endif
 
 	/* Determine bankwidth */
 	switch (*CSR_SA110_CNTL & (3<<14)) {
@@ -204,13 +200,8 @@ static int __init init_dc21285(void)
 
 	dc21285_mtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	nrparts = parse_mtd_partitions(dc21285_mtd, probes, &dc21285_parts, 0);
-	if (nrparts > 0)
-		add_mtd_partitions(dc21285_mtd, dc21285_parts, nrparts);
-	else
-#endif
-		add_mtd_device(dc21285_mtd);
+	mtd_device_register(dc21285_mtd, dc21285_parts, nrparts);
 
 	if(machine_is_ebsa285()) {
 		/*
@@ -232,14 +223,9 @@ static int __init init_dc21285(void)
 
 static void __exit cleanup_dc21285(void)
 {
-#ifdef CONFIG_MTD_PARTITIONS
-	if (dc21285_parts) {
-		del_mtd_partitions(dc21285_mtd);
+	mtd_device_unregister(dc21285_mtd);
+	if (dc21285_parts)
 		kfree(dc21285_parts);
-	} else
-#endif
-		del_mtd_device(dc21285_mtd);
-
 	map_destroy(dc21285_mtd);
 	iounmap(dc21285_map.virt);
 }
-- 
1.7.4.4
