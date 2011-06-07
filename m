Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTyWZ-0005n8-6g
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:49:00 +0000
Received: by wyb28 with SMTP id 28so5036144wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 08:48:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/44] mtd: add new API for handling MTD registration
Date: Tue,  7 Jun 2011 19:48:58 +0400
Message-Id: <1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <20110607134429.GE21174@pulham.picochip.com>
References: <20110607134429.GE21174@pulham.picochip.com>
Cc: Jamie Iles <jamie@jamieiles.com>, David Woodhouse <dwmw2@infradead.org>,
	dedekind1@gmail.com
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
 drivers/mtd/mtdcore.c   |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    5 +++++
 2 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c510aff..d538e0a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -452,6 +452,53 @@ int mtd_device_register(struct mtd_info *master,
 EXPORT_SYMBOL_GPL(mtd_device_register);
 
 /**
+ * mtd_device_parse_register - register an MTD device.
+ *
+ * @mtd: the MTD device to register
+ * @part_probe_types: the list of MTD partition probes to try
+ * @origin: start address of MTD device. =0 unless you are sure you need this.
+ * @defparts: default partition information to register. Only valid if
+ *		defnr_parts > 0
+ * @defnr_parts: the number of partitions in defparts.  If zero then the full
+ *		MTD device is registered if no partition info is found
+ *
+ * Extract partition info and register MTD device (partitions or a whole device)
+ * It calls parse_mtd_partitions(), checks the result. If there were no
+ * partitions found, it uses default info specified (via defparts/defnr_parts)
+ * and then registers either partitions, or (if no partitions were
+ * found/specified) the whow MTD.
+ */
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
+		parts = kmemdup(defparts, sizeof(*parts) * defnr_parts,
+				GFP_KERNEL);
+		if (!parts)
+			err = -ENOMEM;
+	}
+
+	if (err > 0) {
+		err = add_mtd_partitions(mtd, parts, err);
+		kfree(parts);
+	} else if (err == 0) {
+		err = add_mtd_device(mtd);
+		if (err == 1)
+			err = -ENODEV;
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtd_device_parse_register);
+
+/**
  * mtd_device_unregister - unregister an existing MTD device.
  *
  * @master: the MTD device to unregister.  This will unregister both the master
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
