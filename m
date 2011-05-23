Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNp-0002Tm-7i
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:06 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:04 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 31/62] mtd/uclinux: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:12 +0100
Message-Id: <1306142623-24952-32-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/Kconfig   |    2 +-
 drivers/mtd/maps/uclinux.c |   12 ++----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 40a8fd9..cf458a5 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -479,7 +479,7 @@ config MTD_GPIO_ADDR
 
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_PARTITIONS && MTD_RAM=y && !MMU
+	depends on MTD_RAM=y && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
 
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 3500929..6793074 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -89,11 +89,7 @@ static int __init uclinux_mtd_init(void)
 	mtd->priv = mapp;
 
 	uclinux_ram_mtdinfo = mtd;
-#ifdef CONFIG_MTD_PARTITIONS
-	add_mtd_partitions(mtd, uclinux_romfs, NUM_PARTITIONS);
-#else
-	add_mtd_device(mtd);
-#endif
+	mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
 
 	return(0);
 }
@@ -103,11 +99,7 @@ static int __init uclinux_mtd_init(void)
 static void __exit uclinux_mtd_cleanup(void)
 {
 	if (uclinux_ram_mtdinfo) {
-#ifdef CONFIG_MTD_PARTITIONS
-		del_mtd_partitions(uclinux_ram_mtdinfo);
-#else
-		del_mtd_device(uclinux_ram_mtdinfo);
-#endif
+		mtd_device_unregister(uclinux_ram_mtdinfo);
 		map_destroy(uclinux_ram_mtdinfo);
 		uclinux_ram_mtdinfo = NULL;
 	}
-- 
1.7.4.4
