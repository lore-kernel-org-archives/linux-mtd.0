Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMl-0002Tm-K3
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:01 +0000
Received: by wwb39 with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:23:57 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/62] mtd: introduce mtd_device_(un)register()
Date: Mon, 23 May 2011 10:22:43 +0100
Message-Id: <1306142623-24952-3-git-send-email-jamie@jamieiles.com>
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

To prepare for the removal of add_mtd_device and add_mtd_partitions(),
introduce mtd_device_register().  This will create partitions if they
are supplied or register the whole device if there are no partitions.

Once all drivers are converted to use mtd_device_register(),
add_mtd_device() and add_mtd_partitions() will be made internal only.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/mtdcore.c          |   25 +++++++++++++++++++++++++
 include/linux/mtd/mtd.h        |   28 ++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |    2 +-
 3 files changed, 54 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..6af7ad9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,6 +37,7 @@
 #include <linux/gfp.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
 /*
@@ -426,6 +427,30 @@ out_error:
 	return ret;
 }
 
+int mtd_device_register(struct mtd_info *master,
+			const struct mtd_partition *parts,
+			int nr_parts)
+{
+	return parts ? add_mtd_partitions(master, parts, nr_parts) :
+		add_mtd_device(master);
+}
+EXPORT_SYMBOL_GPL(mtd_device_register);
+
+int mtd_device_unregister(struct mtd_info *master)
+{
+	int err;
+
+	err = del_mtd_partitions(master);
+	if (err)
+		return err;
+
+	if (!device_is_registered(&master->dev))
+		return 0;
+
+	return del_mtd_device(master);
+}
+EXPORT_SYMBOL_GPL(mtd_device_unregister);
+
 /**
  *	register_mtd_user - register a 'user' of MTD devices.
  *	@new: pointer to notifier info structure
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..fcb6e62 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -325,6 +325,34 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 extern int add_mtd_device(struct mtd_info *mtd);
 extern int del_mtd_device (struct mtd_info *mtd);
 
+struct mtd_partition;
+
+/**
+ * mtd_device_register() - register an MTD device
+ *
+ * Register an MTD device with the system and optionally, a number of
+ * partitions.  If nr_parts is 0 then the whole device is registered,
+ * otherwise only the partitions are registered.  To register both the full
+ * device *and* the partitions, call mtd_device_register() twice, once with
+ * nr_parts == 0 and once equal to the number of partitions.
+ *
+ * @master	The MTD device to register.
+ * @parts	The partitions to register - only valid if nr_parts > 0.
+ * @nr_parts	The number of partitions in parts.  If zero then the full
+ *		MTD device is registered.
+ */
+extern int mtd_device_register(struct mtd_info *master,
+			       const struct mtd_partition *parts,
+			       int nr_parts);
+
+/**
+ * mtd_device_unregister() - unregister an existing MTD device.
+ *
+ * @master	The MTD device to unregister.  This will unregister both the
+ *		master and any partitions if registered.
+ */
+extern int mtd_device_unregister(struct mtd_info *master);
+
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 4a0a8ba..998a6cf 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -16,7 +16,7 @@
  * Partition definition structure:
  *
  * An array of struct partition is passed along with a MTD object to
- * add_mtd_partitions() to create them.
+ * mtd_device_register() to create them.
  *
  * For each partition, these fields are available:
  * name: string that will be used to label the partition's MTD device.
-- 
1.7.4.4
