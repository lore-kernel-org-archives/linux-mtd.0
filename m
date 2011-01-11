Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PccU0-0001tq-Lx
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2011 11:33:49 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so19231221fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Jan 2011 03:33:48 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/5] MTD: drop CONFIG_MTD_CONCAT ifdefs
Date: Tue, 11 Jan 2011 14:33:37 +0300
Message-Id: <1294745619-7142-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As MTD_CONCAT is becoming a part of mtd core, it's now meaningless
to to check for it in ifdefs. Drop such references from MTD code.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/ceiva.c            |    6 ------
 drivers/mtd/maps/integrator-flash.c |   10 ----------
 drivers/mtd/maps/physmap.c          |    8 --------
 drivers/mtd/maps/physmap_of.c       |    8 --------
 drivers/mtd/maps/sa1100-flash.c     |    8 --------
 5 files changed, 0 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/maps/ceiva.c b/drivers/mtd/maps/ceiva.c
index c09f4f5..e5f645b 100644
--- a/drivers/mtd/maps/ceiva.c
+++ b/drivers/mtd/maps/ceiva.c
@@ -194,16 +194,10 @@ static int __init clps_setup_mtd(struct clps_info *clps, int nr, struct mtd_info
 			 * We detected multiple devices.  Concatenate
 			 * them together.
 			 */
-#ifdef CONFIG_MTD_CONCAT
 			*rmtd = mtd_concat_create(subdev, found,
 						  "clps flash");
 			if (*rmtd == NULL)
 				ret = -ENXIO;
-#else
-			printk(KERN_ERR "clps flash: multiple devices "
-			       "found but MTD concat support disabled.\n");
-			ret = -ENXIO;
-#endif
 		}
 	}
 
diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integrator-flash.c
index 2aac41b..e22ff5a 100644
--- a/drivers/mtd/maps/integrator-flash.c
+++ b/drivers/mtd/maps/integrator-flash.c
@@ -202,7 +202,6 @@ static int armflash_probe(struct platform_device *dev)
 	if (info->nr_subdev == 1)
 		info->mtd = info->subdev[0].mtd;
 	else if (info->nr_subdev > 1) {
-#ifdef CONFIG_MTD_CONCAT
 		struct mtd_info *cdev[info->nr_subdev];
 
 		/*
@@ -215,11 +214,6 @@ static int armflash_probe(struct platform_device *dev)
 					      dev_name(&dev->dev));
 		if (info->mtd == NULL)
 			err = -ENXIO;
-#else
-		printk(KERN_ERR "armflash: multiple devices found but "
-		       "MTD concat support disabled.\n");
-		err = -ENXIO;
-#endif
 	}
 
 	if (err < 0)
@@ -244,10 +238,8 @@ static int armflash_probe(struct platform_device *dev)
  cleanup:
 	if (info->mtd) {
 		del_mtd_partitions(info->mtd);
-#ifdef CONFIG_MTD_CONCAT
 		if (info->mtd != info->subdev[0].mtd)
 			mtd_concat_destroy(info->mtd);
-#endif
 	}
 	kfree(info->parts);
  subdev_err:
@@ -272,10 +264,8 @@ static int armflash_remove(struct platform_device *dev)
 	if (info) {
 		if (info->mtd) {
 			del_mtd_partitions(info->mtd);
-#ifdef CONFIG_MTD_CONCAT
 			if (info->mtd != info->subdev[0].mtd)
 				mtd_concat_destroy(info->mtd);
-#endif
 		}
 		kfree(info->parts);
 
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 4c18b98..7522df4 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -59,10 +59,8 @@ static int physmap_flash_remove(struct platform_device *dev)
 #else
 		del_mtd_device(info->cmtd);
 #endif
-#ifdef CONFIG_MTD_CONCAT
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
-#endif
 	}
 
 	for (i = 0; i < MAX_RESOURCES; i++) {
@@ -159,15 +157,9 @@ static int physmap_flash_probe(struct platform_device *dev)
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
 		info->cmtd = mtd_concat_create(info->mtd, devices_found, dev_name(&dev->dev));
 		if (info->cmtd == NULL)
 			err = -ENXIO;
-#else
-		printk(KERN_ERR "physmap-flash: multiple devices "
-		       "found but MTD concat support disabled.\n");
-		err = -ENXIO;
-#endif
 	}
 	if (err)
 		goto err_out;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 9861814..8bc574b 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -104,12 +104,10 @@ static int of_flash_remove(struct platform_device *dev)
 		return 0;
 	dev_set_drvdata(&dev->dev, NULL);
 
-#ifdef CONFIG_MTD_CONCAT
 	if (info->cmtd != info->list[0].mtd) {
 		del_mtd_device(info->cmtd);
 		mtd_concat_destroy(info->cmtd);
 	}
-#endif
 
 	if (info->cmtd) {
 		if (OF_FLASH_PARTS(info)) {
@@ -336,16 +334,10 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
 		info->cmtd = mtd_concat_create(mtd_list, info->list_size,
 					       dev_name(&dev->dev));
 		if (info->cmtd == NULL)
 			err = -ENXIO;
-#else
-		printk(KERN_ERR "physmap_of: multiple devices "
-		       "found but MTD concat support disabled.\n");
-		err = -ENXIO;
-#endif
 	}
 	if (err)
 		goto err_out;
diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index f3af87e..da875908 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -232,10 +232,8 @@ static void sa1100_destroy(struct sa_info *info, struct flash_platform_data *pla
 		else
 			del_mtd_partitions(info->mtd);
 #endif
-#ifdef CONFIG_MTD_CONCAT
 		if (info->mtd != info->subdev[0].mtd)
 			mtd_concat_destroy(info->mtd);
-#endif
 	}
 
 	kfree(info->parts);
@@ -321,7 +319,6 @@ sa1100_setup_mtd(struct platform_device *pdev, struct flash_platform_data *plat)
 		info->mtd = info->subdev[0].mtd;
 		ret = 0;
 	} else if (info->num_subdev > 1) {
-#ifdef CONFIG_MTD_CONCAT
 		struct mtd_info *cdev[nr];
 		/*
 		 * We detected multiple devices.  Concatenate them together.
@@ -333,11 +330,6 @@ sa1100_setup_mtd(struct platform_device *pdev, struct flash_platform_data *plat)
 					      plat->name);
 		if (info->mtd == NULL)
 			ret = -ENXIO;
-#else
-		printk(KERN_ERR "SA1100 flash: multiple devices "
-		       "found but MTD concat support disabled.\n");
-		ret = -ENXIO;
-#endif
 	}
 
 	if (ret == 0)
-- 
1.7.2.3
