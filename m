Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVv9-00029n-Ky
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:16 +0000
Received: by wyb28 with SMTP id 28so1473623wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:13 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 2/7] mtd: introduce mtd_device_(un)register()
Date: Thu, 12 May 2011 14:26:53 +0100
Message-Id: <1305206818-31752-3-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
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
---
 drivers/mtd/mtdcore.c          |   26 ++++++++++++++++++++++++++
 include/linux/mtd/mtd.h        |    6 ++++++
 include/linux/mtd/partitions.h |    2 +-
 3 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..8e9cf21 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,6 +37,7 @@
 #include <linux/gfp.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 
 #include "mtdcore.h"
 /*
@@ -426,6 +427,31 @@ out_error:
 	return ret;
 }
 
+int mtd_device_register(struct mtd_info *master,
+			const struct mtd_partition *parts,
+			int nr_parts)
+{
+	if ((parts && nr_parts <= 0) ||
+	    (!parts && nr_parts >= 0))
+		return -EINVAL;
+
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
+	return del_mtd_device(master);
+}
+EXPORT_SYMBOL_GPL(mtd_device_unregister);
+
 /**
  *	register_mtd_user - register a 'user' of MTD devices.
  *	@new: pointer to notifier info structure
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7a74942..8c524a7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -325,6 +325,12 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 extern int add_mtd_device(struct mtd_info *mtd);
 extern int del_mtd_device (struct mtd_info *mtd);
 
+struct mtd_partition;
+extern int mtd_device_register(struct mtd_info *master,
+			       const struct mtd_partition *parts,
+			       int nr_parts);
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
