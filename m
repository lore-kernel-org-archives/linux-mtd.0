Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNE-0002U4-7S
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:29 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:27 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/62] mtd/onenand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:56 +0100
Message-Id: <1306142623-24952-16-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Kyungmin Park <kyungmin.park@samsung.com>,
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

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/onenand/Kconfig        |    1 -
 drivers/mtd/onenand/generic.c      |   16 ++++------------
 drivers/mtd/onenand/onenand_base.c |    6 +-----
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 4f426195..772ad29 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -1,7 +1,6 @@
 menuconfig MTD_ONENAND
 	tristate "OneNAND Device Support"
 	depends on MTD
-	select MTD_PARTITIONS
 	help
 	  This enables support for accessing all type of OneNAND flash
 	  devices. For further information see
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index ac08750..2d70d35 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -30,9 +30,7 @@
  */
 #define DRIVER_NAME	"onenand-flash"
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL,  };
-#endif
 
 struct onenand_info {
 	struct mtd_info		mtd;
@@ -75,15 +73,13 @@ static int __devinit generic_onenand_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
-		add_mtd_partitions(&info->mtd, info->parts, err);
+		mtd_device_register(&info->mtd, info->parts, err);
 	else if (err <= 0 && pdata && pdata->parts)
-		add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
+		mtd_device_register(&info->mtd, pdata->parts, pdata->nr_parts);
 	else
-#endif
-		err = add_mtd_device(&info->mtd);
+		err = mtd_device_register(&info->mtd, NULL, 0);
 
 	platform_set_drvdata(pdev, info);
 
@@ -108,11 +104,7 @@ static int __devexit generic_onenand_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	if (info) {
-		if (info->parts)
-			del_mtd_partitions(&info->mtd);
-		else
-			del_mtd_device(&info->mtd);
-
+		mtd_device_unregister(&info->mtd);
 		onenand_release(&info->mtd);
 		release_mem_region(res->start, size);
 		iounmap(info->onenand.base);
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 56a8b20..4fd7270 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4108,12 +4108,8 @@ void onenand_release(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	/* Deregister partitions */
-	del_mtd_partitions (mtd);
-#endif
-	/* Deregister the device */
-	del_mtd_device (mtd);
+	mtd_device_unregister(mtd);
 
 	/* Free bad block table memory, if allocated */
 	if (this->bbm) {
-- 
1.7.4.4
