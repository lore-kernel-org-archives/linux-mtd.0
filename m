Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROx-0002Tm-6y
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:17 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:14 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 61/62] mtd: remove add_mtd_partitions,
	add_mtd_device and friends
Date: Mon, 23 May 2011 10:23:42 +0100
Message-Id: <1306142623-24952-62-git-send-email-jamie@jamieiles.com>
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

These symbols are replaced with mtd_device_register() (and removal with
mtd_device_unregister()) for public registration.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/mtdcore.c          |    4 +---
 drivers/mtd/mtdcore.h          |    6 ++++++
 drivers/mtd/mtdpart.c          |    4 ++--
 include/linux/mtd/mtd.h        |    3 ---
 include/linux/mtd/partitions.h |    9 ---------
 5 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6af7ad9..ba4bdc7 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -392,7 +392,7 @@ fail_locked:
  *	if the requested device does not appear to be present in the list.
  */
 
-int del_mtd_device (struct mtd_info *mtd)
+int del_mtd_device(struct mtd_info *mtd)
 {
 	int ret;
 	struct mtd_notifier *not;
@@ -663,8 +663,6 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	return ret;
 }
 
-EXPORT_SYMBOL_GPL(add_mtd_device);
-EXPORT_SYMBOL_GPL(del_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 EXPORT_SYMBOL_GPL(__get_mtd_device);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 6a64fde..0ed6126 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -10,6 +10,12 @@
 extern struct mutex mtd_table_mutex;
 extern struct mtd_info *__mtd_next_device(int i);
 
+extern int add_mtd_device(struct mtd_info *mtd);
+extern int del_mtd_device(struct mtd_info *mtd);
+extern int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
+			      int);
+extern int del_mtd_partitions(struct mtd_info *);
+
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
 	     (mtd) != NULL;				\
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0a47601..3d2bcf4 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -31,6 +31,8 @@
 #include <linux/mtd/partitions.h>
 #include <linux/err.h>
 
+#include "mtdcore.h"
+
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
 static DEFINE_MUTEX(mtd_partitions_mutex);
@@ -376,7 +378,6 @@ int del_mtd_partitions(struct mtd_info *master)
 
 	return err;
 }
-EXPORT_SYMBOL(del_mtd_partitions);
 
 static struct mtd_part *allocate_partition(struct mtd_info *master,
 			const struct mtd_partition *part, int partno,
@@ -671,7 +672,6 @@ int add_mtd_partitions(struct mtd_info *master,
 
 	return 0;
 }
-EXPORT_SYMBOL(add_mtd_partitions);
 
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index fcb6e62..96ad56a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -322,9 +322,6 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 
 	/* Kernel-side ioctl definitions */
 
-extern int add_mtd_device(struct mtd_info *mtd);
-extern int del_mtd_device (struct mtd_info *mtd);
-
 struct mtd_partition;
 
 /**
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index afe32db..3a6f037 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -49,9 +49,6 @@ struct mtd_partition {
 
 struct mtd_info;
 
-int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
-int del_mtd_partitions(struct mtd_info *);
-
 /*
  * Functions dealing with the various ways of partitioning the space
  */
@@ -86,12 +83,6 @@ static inline int of_mtd_parse_partitions(struct device *dev,
 }
 #endif
 
-#ifdef CONFIG_MTD_PARTITIONS
-static inline int mtd_has_partitions(void) { return 1; }
-#else
-static inline int mtd_has_partitions(void) { return 0; }
-#endif
-
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 static inline int mtd_has_cmdlinepart(void) { return 1; }
 #else
-- 
1.7.4.4
