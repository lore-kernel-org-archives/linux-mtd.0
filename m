Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0PIV-0006uA-Mp
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 23:38:56 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: unify mtd partition/device registration
Date: Wed, 12 Nov 2008 18:38:53 -0500
Message-Id: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rather than having every map/mtd driver doing the same sequence of
registering partitions and/or devices, implement common parse_mtd().

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/mtdcore.c   |   37 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    3 +++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index a9d2469..654ec1b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -292,6 +292,43 @@ void put_mtd_device(struct mtd_info *mtd)
 	module_put(mtd->owner);
 }
 
+#include <linux/mtd/partitions.h>
+
+/**
+ *	parse_mtd - add partitions / devices
+ *
+ *	If partitioning support is enabled, attempt to call parse_mtd_partitions()
+ *	and add_mtd_partitions() with all available parsers.  Otherwise just add
+ *	the MTD device.
+ */
+
+int parse_mtd(struct mtd_info *mtd, const char **probe_types,
+              struct mtd_partition *parts, int nr_parts)
+{
+#ifdef CONFIG_MTD_PARTITIONS
+	const char *default_part_probe_types[] = {
+		"cmdlinepart",
+		"RedBoot",
+		NULL
+	};
+	int ret;
+
+	if (!probe_types)
+		probe_types = default_part_probe_types;
+
+	ret = parse_mtd_partitions(mtd, probe_types, &parts, 0);
+	if (ret > 0) {
+		ret = add_mtd_partitions(mtd, parts, ret);
+		kfree(parts);
+		return ret;
+	} else if (nr_parts)
+		return add_mtd_partitions(mtd, parts, nr_parts);
+#endif
+
+	return add_mtd_device(mtd);
+}
+EXPORT_SYMBOL(parse_mtd);
+
 /* default_mtd_writev - default mtd writev method for MTD devices that
  *			don't implement their own
  */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index eae26bb..dec3456 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -232,6 +232,9 @@ extern struct mtd_info *get_mtd_device_nm(const char *name);
 
 extern void put_mtd_device(struct mtd_info *mtd);
 
+struct mtd_partition;
+int parse_mtd(struct mtd_info *mtd, const char **probe_types,
+              struct mtd_partition *parts, int nr_parts);
 
 struct mtd_notifier {
 	void (*add)(struct mtd_info *mtd);
-- 
1.6.0.3
