Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ON2sy-0007U7-67
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 11:58:57 +0000
Received: by vws7 with SMTP id 7so1217353vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jun 2010 04:58:53 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] physmap: fix mtdconcat support if physmap/mtdconcat were
	compiled as modules
Date: Fri, 11 Jun 2010 15:58:51 +0400
Message-Id: <1276257531-7566-1-git-send-email-dbaryshkov@gmail.com>
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
index d9603f7..7750757 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -59,7 +59,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 #else
 		del_mtd_device(info->cmtd);
 #endif
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE)
 		if (info->cmtd != info->mtd[0])
 			mtd_concat_destroy(info->cmtd);
 #endif
@@ -155,7 +155,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE)
 		info->cmtd = mtd_concat_create(info->mtd, devices_found, dev_name(&dev->dev));
 		if (info->cmtd == NULL)
 			err = -ENXIO;
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 101ee6e..8cb80e1 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -103,7 +103,7 @@ static int of_flash_remove(struct of_device *dev)
 		return 0;
 	dev_set_drvdata(&dev->dev, NULL);
 
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE)
 	if (info->cmtd != info->list[0].mtd) {
 		del_mtd_device(info->cmtd);
 		mtd_concat_destroy(info->cmtd);
@@ -292,7 +292,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 		/*
 		 * We detected multiple devices. Concatenate them together.
 		 */
-#ifdef CONFIG_MTD_CONCAT
+#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE)
 		info->cmtd = mtd_concat_create(mtd_list, info->list_size,
 					       dev_name(&dev->dev));
 		if (info->cmtd == NULL)
-- 
1.7.1
