Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaIff-00089l-Sc
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 02:00:17 +0000
Received: by wwb17 with SMTP id 17so16361785wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Jan 2011 18:00:14 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] physmap: fix mtdconcat support if physmap/mtdconcat were
	compiled as modules
Date: Wed,  5 Jan 2011 05:00:13 +0300
Message-Id: <1294192813-23549-1-git-send-email-dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

physmap/physmap_of contained compile-time check for mtd concatenation.
However thos modules did not consider that mtd concatenation can be
built as modules. Fix physmap/physmap_of to also support
CONFIG_MTD_CONCAT=m

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Stefan Roese <sr@denx.de>
---
 drivers/mtd/maps/physmap.c    |    4 ++--
 drivers/mtd/maps/physmap_of.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 4c18b98..a224afc 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -59,7 +59,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 #else
 		del_mtd_device(info->cmtd);
 #endif
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_MODULE))
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 #endif
@@ -159,7 +159,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_MODULE))
 		info->cmtd = mtd_concat_create(info->mtd, devices_found, dev_name(&dev->dev));
 		if (info->cmtd == NULL)
 			err = -ENXIO;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 9861814..ffa93e5 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -104,7 +104,7 @@ static int of_flash_remove(struct platform_device *dev)
 		return 0;
 	dev_set_drvdata(&dev->dev, NULL);
 
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_OF_MODULE))
 	if (info->cmtd != info->list[0].mtd) {
 		del_mtd_device(info->cmtd);
 		mtd_concat_destroy(info->cmtd);
@@ -336,7 +336,7 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || (defined(CONFIG_MTD_CONCAT_MODULE) && defined(CONFIG_MTD_PHYSMAP_OF_MODULE))
 		info->cmtd = mtd_concat_create(mtd_list, info->list_size,
 					       dev_name(&dev->dev));
 		if (info->cmtd == NULL)
-- 
1.7.2.3
