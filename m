Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0YEu-0006tZ-JT
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 17:48:05 +0000
Received: by mail-pa0-x236.google.com with SMTP id xk12so20159459pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 May 2016 10:47:43 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, moritz.fischer.private@gmail.com,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH] mtd: Adding of_mtd_info_get to get mtd_info from devicetree
Date: Wed, 11 May 2016 10:47:39 -0700
Message-Id: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows for getting a struct mtd_info from a node pointer,
allowing mtd devices to e.g. store serial numbers or MAC addresses.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 drivers/mtd/mtdcore.c   | 21 +++++++++++++++++++++
 include/linux/mtd/mtd.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3096251..3d0ae65 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -363,6 +363,27 @@ unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(mtd_mmap_capabilities);
 #endif
 
+static int mtd_of_node_match(struct device *dev, const void *data)
+{
+	return dev->of_node == data;
+}
+
+struct mtd_info *of_mtd_info_get(struct device_node *node)
+{
+	struct mtd_info *mtd;
+	struct device *d;
+	int ret = -ENODEV;
+
+	d = class_find_device(&mtd_class, NULL, node, mtd_of_node_match);
+	if (!d)
+		return ERR_PTR(-ENODEV);
+
+	mtd = container_of(d, struct mtd_info, dev);
+
+	return mtd;
+}
+EXPORT_SYMBOL_GPL(of_mtd_info_get);
+
 static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
 			       void *cmd)
 {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7712721..cce6cc7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -264,6 +264,8 @@ static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
 	return mtd->dev.of_node;
 }
 
+struct mtd_info *of_mtd_info_get(struct device_node *node);
+
 static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 {
 	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
-- 
2.5.5
