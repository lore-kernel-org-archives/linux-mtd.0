Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNe-0002Tm-39
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:55 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:53 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/62] mtd/plat-ram: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:07 +0100
Message-Id: <1306142623-24952-27-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/plat-ram.c |   24 +++++++++---------------
 1 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 76a76be..9ca1ecc 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -94,14 +94,11 @@ static int platram_remove(struct platform_device *pdev)
 		return 0;
 
 	if (info->mtd) {
-#ifdef CONFIG_MTD_PARTITIONS
+		mtd_device_unregister(info->mtd);
 		if (info->partitions) {
-			del_mtd_partitions(info->mtd);
 			if (info->free_partitions)
 				kfree(info->partitions);
 		}
-#endif
-		del_mtd_device(info->mtd);
 		map_destroy(info->mtd);
 	}
 
@@ -231,7 +228,6 @@ static int platram_probe(struct platform_device *pdev)
 	/* check to see if there are any available partitions, or wether
 	 * to add this device whole */
 
-#ifdef CONFIG_MTD_PARTITIONS
 	if (!pdata->nr_partitions) {
 		/* try to probe using the supplied probe type */
 		if (pdata->probes) {
@@ -239,24 +235,22 @@ static int platram_probe(struct platform_device *pdev)
 					   &info->partitions, 0);
 			info->free_partitions = 1;
 			if (err > 0)
-				err = add_mtd_partitions(info->mtd,
+				err = mtd_device_register(info->mtd,
 					info->partitions, err);
 		}
 	}
 	/* use the static mapping */
 	else
-		err = add_mtd_partitions(info->mtd, pdata->partitions,
-				pdata->nr_partitions);
-#endif /* CONFIG_MTD_PARTITIONS */
-
-	if (add_mtd_device(info->mtd)) {
-		dev_err(&pdev->dev, "add_mtd_device() failed\n");
-		err = -ENOMEM;
-	}
-
+		err = mtd_device_register(info->mtd, pdata->partitions,
+					  pdata->nr_partitions);
 	if (!err)
 		dev_info(&pdev->dev, "registered mtd device\n");
 
+	/* add the whole device. */
+	err = mtd_device_register(info->mtd, NULL, 0);
+	if (err)
+		dev_err(&pdev->dev, "failed to register the entire device\n");
+
 	return err;
 
  exit_free:
-- 
1.7.4.4
