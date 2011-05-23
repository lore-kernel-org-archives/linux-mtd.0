Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNk-0002TQ-PH
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:02 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:00 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 29/62] mtd/scx200_docflash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:10 +0100
Message-Id: <1306142623-24952-30-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/Kconfig           |    2 +-
 drivers/mtd/maps/scx200_docflash.c |   16 +++-------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index d4a1f61..40a8fd9 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -184,7 +184,7 @@ config MTD_VMAX
 
 config MTD_SCx200_DOCFLASH
 	tristate "Flash device mapped with DOCCS on NatSemi SCx200"
-	depends on SCx200 && MTD_CFI && MTD_PARTITIONS
+	depends on SCx200 && MTD_CFI
 	help
 	  Enable support for a flash chip mapped using the DOCCS signal on a
 	  National Semiconductor SCx200 processor.
diff --git a/drivers/mtd/maps/scx200_docflash.c b/drivers/mtd/maps/scx200_docflash.c
index 027e628..f1c1f73 100644
--- a/drivers/mtd/maps/scx200_docflash.c
+++ b/drivers/mtd/maps/scx200_docflash.c
@@ -44,7 +44,6 @@ static struct resource docmem = {
 
 static struct mtd_info *mymtd;
 
-#ifdef CONFIG_MTD_PARTITIONS
 static struct mtd_partition partition_info[] = {
 	{
 		.name   = "DOCCS Boot kernel",
@@ -68,8 +67,6 @@ static struct mtd_partition partition_info[] = {
 	},
 };
 #define NUM_PARTITIONS ARRAY_SIZE(partition_info)
-#endif
-
 
 static struct map_info scx200_docflash_map = {
 	.name      = "NatSemi SCx200 DOCCS Flash",
@@ -198,24 +195,17 @@ static int __init init_scx200_docflash(void)
 
 	mymtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	partition_info[3].offset = mymtd->size-partition_info[3].size;
 	partition_info[2].size = partition_info[3].offset-partition_info[2].offset;
-	add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
-#else
-	add_mtd_device(mymtd);
-#endif
+	mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
+
 	return 0;
 }
 
 static void __exit cleanup_scx200_docflash(void)
 {
 	if (mymtd) {
-#ifdef CONFIG_MTD_PARTITIONS
-		del_mtd_partitions(mymtd);
-#else
-		del_mtd_device(mymtd);
-#endif
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 	if (scx200_docflash_map.virt) {
-- 
1.7.4.4
