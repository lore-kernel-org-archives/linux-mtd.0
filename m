Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORN7-0002TQ-8X
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:23 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:20 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/62] mtd/cris: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:53 +0100
Message-Id: <1306142623-24952-13-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Mikael Starvik <starvik@axis.com>, Jamie Iles <jamie@jamieiles.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>, dwmw2@infradead.org,
	dedekind1@gmail.com
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

Cc: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/cris/Kconfig                         |    1 -
 arch/cris/arch-v10/drivers/axisflashmap.c |   10 ++++++----
 arch/cris/arch-v32/drivers/Kconfig        |    1 -
 arch/cris/arch-v32/drivers/axisflashmap.c |    7 ++++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index a6d0306..72facbc 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -274,7 +274,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_JEDECPROBE if ETRAX_ARCH_V32
 	select MTD_CHAR
 	select MTD_BLOCK
-	select MTD_PARTITIONS
 	select MTD_COMPLEX_MAPPINGS
 	help
 	  This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v10/drivers/axisflashmap.c b/arch/cris/arch-v10/drivers/axisflashmap.c
index ed708e1..a4bbdfd 100644
--- a/arch/cris/arch-v10/drivers/axisflashmap.c
+++ b/arch/cris/arch-v10/drivers/axisflashmap.c
@@ -372,7 +372,7 @@ static int __init init_axis_flash(void)
 #ifdef CONFIG_ETRAX_AXISFLASHMAP_MTD0WHOLE
 	if (mymtd) {
 		main_partition.size = mymtd->size;
-		err = add_mtd_partitions(mymtd, &main_partition, 1);
+		err = mtd_device_register(mymtd, &main_partition, 1);
 		if (err)
 			panic("axisflashmap: Could not initialize "
 			      "partition for whole main mtd device!\n");
@@ -382,10 +382,12 @@ static int __init init_axis_flash(void)
         if (mymtd) {
 		if (use_default_ptable) {
 			printk(KERN_INFO " Using default partition table.\n");
-			err = add_mtd_partitions(mymtd, axis_default_partitions,
-						 NUM_DEFAULT_PARTITIONS);
+			err = mtd_device_register(mymtd,
+						  axis_default_partitions,
+						  NUM_DEFAULT_PARTITIONS);
 		} else {
-			err = add_mtd_partitions(mymtd, axis_partitions, pidx);
+			err = mtd_device_register(mymtd, axis_partitions,
+						  pidx);
 		}
 
 		if (err)
diff --git a/arch/cris/arch-v32/drivers/Kconfig b/arch/cris/arch-v32/drivers/Kconfig
index 1633b12..41a2732 100644
--- a/arch/cris/arch-v32/drivers/Kconfig
+++ b/arch/cris/arch-v32/drivers/Kconfig
@@ -405,7 +405,6 @@ config ETRAX_AXISFLASHMAP
 	select MTD_JEDECPROBE
 	select MTD_CHAR
 	select MTD_BLOCK
-	select MTD_PARTITIONS
 	select MTD_COMPLEX_MAPPINGS
 	help
 	  This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32/drivers/axisflashmap.c
index 7b155f8..a2bde37 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -561,7 +561,7 @@ static int __init init_axis_flash(void)
 #ifdef CONFIG_ETRAX_AXISFLASHMAP_MTD0WHOLE
 	if (main_mtd) {
 		main_partition.size = main_mtd->size;
-		err = add_mtd_partitions(main_mtd, &main_partition, 1);
+		err = mtd_device_register(main_mtd, &main_partition, 1);
 		if (err)
 			panic("axisflashmap: Could not initialize "
 			      "partition for whole main mtd device!\n");
@@ -597,7 +597,8 @@ static int __init init_axis_flash(void)
 			mtd_ram->erasesize = (main_mtd ? main_mtd->erasesize :
 				CONFIG_ETRAX_PTABLE_SECTOR);
 		} else {
-			err = add_mtd_partitions(main_mtd, &partition[part], 1);
+			err = mtd_device_register(main_mtd, &partition[part],
+						  1);
 			if (err)
 				panic("axisflashmap: Could not add mtd "
 					"partition %d\n", part);
@@ -633,7 +634,7 @@ static int __init init_axis_flash(void)
 #ifndef CONFIG_ETRAX_VCS_SIM
 	if (aux_mtd) {
 		aux_partition.size = aux_mtd->size;
-		err = add_mtd_partitions(aux_mtd, &aux_partition, 1);
+		err = mtd_device_register(aux_mtd, &aux_partition, 1);
 		if (err)
 			panic("axisflashmap: Could not initialize "
 			      "aux mtd device!\n");
-- 
1.7.4.4
