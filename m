Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSd-0001Ql-IZ
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:48 +0000
Received: by wyb28 with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:45 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/44] mtd: add new API for handling MTD registration
Date: Tue,  7 Jun 2011 17:36:00 +0400
Message-Id: <1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
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
 drivers/mtd/mtdcore.c   |   30 ++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    5 +++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c510aff..ac871ad 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -451,6 +451,36 @@ int mtd_device_register(struct mtd_info *master,
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
+	if (err > 0) {
+		err = add_mtd_partitions(mtd, parts, err);
+		kfree(parts);
+	} else {
+		err = add_mtd_device(mtd);
+		if (err == 1)
+			err = -ENODEV;
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtd_device_parse_register);
+
 /**
  * mtd_device_unregister - unregister an existing MTD device.
  *
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2541fb8..d28a241 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -327,6 +327,11 @@ struct mtd_partition;
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
