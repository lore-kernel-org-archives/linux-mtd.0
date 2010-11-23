Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PKrov-0006yK-Ib
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2010 12:18:02 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdchar/mtdpart: fix master device identification for
	mtd repartition
Date: Tue, 23 Nov 2010 14:17:17 +0200
Message-Id: <1290514637-15869-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: dwmw2@infradead.org, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Function mtd_has_master renamed as mtd_is_partition to follow the function logic.
The patch fixes the problem of checking the right mtd device for partition creation.
To delete partition checking is not needed here so as it is done in mtd_del_partition.
By master we consider the mtd device which does not belong to any partition.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdchar.c          |    8 ++++----
 drivers/mtd/mtdpart.c          |   10 +++++-----
 include/linux/mtd/partitions.h |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 4759d82..9fe3df5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -522,10 +522,6 @@ static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	/* Only master mtd device must be used to control partitions */
-	if (!mtd_is_master(mtd))
-		return -EINVAL;
-
 	if (copy_from_user(&a, arg, sizeof(struct blkpg_ioctl_arg)))
 		return -EFAULT;
 
@@ -535,6 +531,10 @@ static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 	switch (a.op) {
 	case BLKPG_ADD_PARTITION:
 
+		/* Only master mtd device must be used to add partitions */
+		if (mtd_is_partition(mtd))
+			return -EINVAL;
+
 		return mtd_add_partition(mtd, p.devname, p.start, p.length);
 
 	case BLKPG_DEL_PARTITION:
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 79e3689..1047ff0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -720,19 +720,19 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 }
 EXPORT_SYMBOL_GPL(parse_mtd_partitions);
 
-int mtd_is_master(struct mtd_info *mtd)
+int mtd_is_partition(struct mtd_info *mtd)
 {
 	struct mtd_part *part;
-	int nopart = 0;
+	int ispart = 0;
 
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry(part, &mtd_partitions, list)
 		if (&part->mtd == mtd) {
-			nopart = 1;
+			ispart = 1;
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
 
-	return nopart;
+	return ispart;
 }
-EXPORT_SYMBOL_GPL(mtd_is_master);
+EXPORT_SYMBOL_GPL(mtd_is_partition);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 2b54316..4a0a8ba 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -89,7 +89,7 @@ static inline int mtd_has_cmdlinepart(void) { return 1; }
 static inline int mtd_has_cmdlinepart(void) { return 0; }
 #endif
 
-int mtd_is_master(struct mtd_info *mtd);
+int mtd_is_partition(struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
-- 
1.7.0.4
