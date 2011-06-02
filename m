Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9Fj-00074g-Cu
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:52:04 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758040wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:52:03 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 054/104] mtd: add new API for handling MTD registration
Date: Thu,  2 Jun 2011 18:51:32 +0400
Message-Id: <1307026293-8535-20-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lots (nearly all) mtd drivers contain nearly the similar code that
calls parse_mtd_partitions, provides some platform-default values, if
parsing fails, and registers  mtd device.

This is an aim to provide single implementation of this scenario:
mtd_device_parse_register() which will handle all this parsing and
defaults.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdcore.c   |   40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    5 +++++
 2 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index bfd5a65..fdbfb0c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -456,6 +456,46 @@ int mtd_device_register(struct mtd_info *master,
 }
 EXPORT_SYMBOL_GPL(mtd_device_register);
 
+int mtd_device_parse_register(struct mtd_info *mtd,
+			      const char **part_probe_types,
+			      unsigned long origin,
+			      const struct mtd_partition *defparts,
+			      int defnr_parts)
+{
+	int err;
+	struct mtd_partition *parts;
+
+	err = parse_mtd_partitions(mtd, part_probe_types, &parts, origin);
+	if (err <= 0 && defnr_parts) {
+		unsigned long size = sizeof(*parts) * defnr_parts;
+		err = defnr_parts;
+		parts = kzalloc(size, GFP_KERNEL);
+		memcpy(parts, defparts, size);
+	}
+
+#ifdef CONFIG_OF
+	if (mtd->node)
+		of_node_get(mtd->node);
+#endif
+
+	if (err > 0) {
+		err = add_mtd_partitions(mtd, parts, err);
+		kfree(parts);
+	} else {
+		err = add_mtd_device(mtd);
+		if (err == 1)
+			err = -ENODEV;
+	}
+
+#ifdef CONFIG_OF
+	if (err < 0 && mtd->node)
+		of_node_put(mtd->node);
+#endif
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtd_device_parse_register);
+
 /**
  * mtd_device_unregister - unregister an existing MTD device.
  *
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 14305d0..d8f5efe 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -330,6 +330,11 @@ struct mtd_partition;
 extern int mtd_device_register(struct mtd_info *master,
 			       const struct mtd_partition *parts,
 			       int nr_parts);
+extern int mtd_device_parse_register(struct mtd_info *mtd,
+			      const char **part_probe_types,
+			      unsigned long origin,
+			      const struct mtd_partition *defparts,
+			      int defnr_parts);
 extern int mtd_device_unregister(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
-- 
1.7.4.4
