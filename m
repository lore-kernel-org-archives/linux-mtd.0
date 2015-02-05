Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJRTY-000847-DX
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 18:48:29 +0000
Received: by mail-ig0-f171.google.com with SMTP id h15so30526212igd.4
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 10:48:06 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: linux-mtd@lists.infradead.org,
	richard.weinberger@gmail.com
Subject: [PATCH] mtdpart: More flexible dynamic partitioning
Date: Thu,  5 Feb 2015 10:48:01 -0800
Message-Id: <1423162081-1734-1-git-send-email-dehrenberg@chromium.org>
Cc: namnguyen@chromium.org, grundler@chromium.org, gwendal@chromium.org,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD allows dynamic partitioning by the BLKPG ioctl.
This patch makes dynamic partitioning more flexible by:
- Allowing addition of a partition to be added on top of another
  partition. The two partitions compose naturally: the offsets are added
  and lengths are checked to be in bounds. This is useful when
  repartitioning an existing partitioned device since the underlying
  device doesn't exist to add partitions to.
- Removing overlap checks for dynamic partitions. I don't see any
  particular reason why overlapping dynamic partitions should be
  prohibited while static partitions are allowed to overlap freely, and
  this is useful for users who want one additional partition to span
  over the whole device.
- Allowing partitions to be deleted by referencing any partition with
  the same master. For example, if you have /dev/mtd0 and /dev/mtd1 both
  partitions on the same underlying device, then you can call
  BLKPG_DEL_PARTITION with an fd of /dev/mtd0 and pno of /dev/mtd1, and
  /dev/mtd1 will be deleted (as opposed to returning EINVAL to signal a
  missing partition, which it did previously).

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/mtdchar.c |  4 ----
 drivers/mtd/mtdpart.c | 32 ++++++++++++++++----------------
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5356395..30215c7 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -545,10 +545,6 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 	switch (a.op) {
 	case BLKPG_ADD_PARTITION:
 
-		/* Only master mtd device must be used to add partitions */
-		if (mtd_is_partition(mtd))
-			return -EINVAL;
-
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a3e3a7d..7874bbd 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -551,7 +551,7 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 		      long long offset, long long length)
 {
 	struct mtd_partition part;
-	struct mtd_part *p, *new;
+	struct mtd_part *new;
 	uint64_t start, end;
 	int ret = 0;
 
@@ -566,6 +566,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	if (length <= 0)
 		return -EINVAL;
 
+	if (mtd_is_partition(master)) {
+		struct mtd_part *master_partition = PART(master);
+		offset += master_partition->offset;
+		master = master_partition->master;
+	}
+
 	part.name = name;
 	part.size = length;
 	part.offset = offset;
@@ -580,27 +586,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	end = offset + length;
 
 	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry(p, &mtd_partitions, list)
-		if (p->master == master) {
-			if ((start >= p->offset) &&
-			    (start < (p->offset + p->mtd.size)))
-				goto err_inv;
-
-			if ((end >= p->offset) &&
-			    (end < (p->offset + p->mtd.size)))
-				goto err_inv;
-		}
-
 	list_add(&new->list, &mtd_partitions);
 	mutex_unlock(&mtd_partitions_mutex);
 
 	add_mtd_device(&new->mtd);
 
 	return ret;
-err_inv:
-	mutex_unlock(&mtd_partitions_mutex);
-	free_partition(new);
-	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
@@ -609,6 +600,15 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 	struct mtd_part *slave, *next;
 	int ret = -EINVAL;
 
+	/* If del_partition was called as a partition, just treat
+	 * this as if it were called on its master. This is a harmless
+	 * generalization and lets partitions be deleted in a system
+	 * where they are sometimes already present on boot */
+	if (mtd_is_partition(master)) {
+		struct mtd_part *master_partition = PART(master);
+		master = master_partition->master;
+	}
+
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->master == master) &&
-- 
2.2.0.rc0.207.ga3a616c
