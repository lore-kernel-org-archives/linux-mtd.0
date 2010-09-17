From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: prepare partition add and del functions for ioctl
	requests
Date: Fri, 17 Sep 2010 13:31:41 +0300
Message-Id: <1284719502-24183-2-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: dwmw2@infradead.org, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_is_master, mtd_add_partition and mtd_del_partition functions
are added to give the possibility of partition manipulation
by ioctl request.

The old partition add function is modified to fit the dynamic
allocation.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdpart.c          |  154 +++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/partitions.h |    5 ++
 2 files changed, 141 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index dc65585..726c287 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -29,9 +29,11 @@
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/err.h>
 
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
+static DEFINE_MUTEX(mtd_partitions_mutex);
 
 /* Our partition node structure */
 struct mtd_part {
@@ -326,6 +328,12 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return res;
 }
 
+static inline void free_partition(struct mtd_part *p)
+{
+	kfree(p->mtd.name);
+	kfree(p);
+}
+
 /*
  * This function unregisters and destroy all slave MTD objects which are
  * attached to the given master MTD object.
@@ -334,33 +342,42 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 int del_mtd_partitions(struct mtd_info *master)
 {
 	struct mtd_part *slave, *next;
+	int ret, err = 0;
 
+	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if (slave->master == master) {
+			ret = del_mtd_device(&slave->mtd);
+			if (ret < 0) {
+				err = ret;
+				continue;
+			}
 			list_del(&slave->list);
-			del_mtd_device(&slave->mtd);
-			kfree(slave);
+			free_partition(slave);
 		}
+	mutex_unlock(&mtd_partitions_mutex);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL(del_mtd_partitions);
 
-static struct mtd_part *add_one_partition(struct mtd_info *master,
-		const struct mtd_partition *part, int partno,
-		uint64_t cur_offset)
+static struct mtd_part *allocate_partition(struct mtd_info *master,
+			const struct mtd_partition *part, int partno,
+			uint64_t cur_offset)
 {
 	struct mtd_part *slave;
+	char *name;
 
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
-	if (!slave) {
+	name = kstrdup(part->name, GFP_KERNEL);
+	if (!name || !slave) {
 		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
-			master->name);
-		del_mtd_partitions(master);
-		return NULL;
+		       master->name);
+		kfree(name);
+		kfree(slave);
+		return ERR_PTR(-ENOMEM);
 	}
-	list_add(&slave->list, &mtd_partitions);
 
 	/* set up the MTD object for this partition */
 	slave->mtd.type = master->type;
@@ -371,7 +388,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
 
-	slave->mtd.name = part->name;
+	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
 	slave->mtd.backing_dev_info = master->backing_dev_info;
 
@@ -518,12 +535,89 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 
 out_register:
-	/* register our partition */
-	add_mtd_device(&slave->mtd);
-
 	return slave;
 }
 
+int mtd_add_partition(struct mtd_info *master, char *name,
+		      long long offset, long long length)
+{
+	struct mtd_partition part;
+	struct mtd_part *p, *new;
+	uint64_t start, end;
+	int ret = 0;
+
+	/* the direct offset is expected */
+	if (offset == MTDPART_OFS_APPEND ||
+	    offset == MTDPART_OFS_NXTBLK)
+		return -EINVAL;
+
+	if (length == MTDPART_SIZ_FULL)
+		length = master->size - offset;
+
+	if (length <= 0)
+		return -EINVAL;
+
+	part.name = name;
+	part.size = length;
+	part.offset = offset;
+	part.mask_flags = 0;
+	part.ecclayout = NULL;
+
+	new = allocate_partition(master, &part, -1, offset);
+	if (IS_ERR(new))
+		return PTR_ERR(new);
+
+	start = offset;
+	end = offset + length;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry(p, &mtd_partitions, list)
+		if (p->master == master) {
+			if ((start >= p->offset) &&
+			    (start < (p->offset + p->mtd.size)))
+				goto err_inv;
+
+			if ((end >= p->offset) &&
+			    (end < (p->offset + p->mtd.size)))
+				goto err_inv;
+		}
+
+	list_add(&new->list, &mtd_partitions);
+	mutex_unlock(&mtd_partitions_mutex);
+
+	add_mtd_device(&new->mtd);
+
+	return ret;
+err_inv:
+	mutex_unlock(&mtd_partitions_mutex);
+	free_partition(new);
+	return -EINVAL;
+}
+EXPORT_SYMBOL(mtd_add_partition);
+
+int mtd_del_partition(struct mtd_info *master, int partno)
+{
+	struct mtd_part *slave, *next;
+	int ret = -EINVAL;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
+		if ((slave->master == master) &&
+		    (slave->mtd.index == partno)) {
+			ret = del_mtd_device(&slave->mtd);
+			if (ret < 0)
+				break;
+
+			list_del(&slave->list);
+			free_partition(slave);
+			break;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(mtd_del_partition);
+
 /*
  * This function, given a master MTD object and a partition table, creates
  * and registers slave MTD objects which are bound to the master according to
@@ -544,9 +638,16 @@ int add_mtd_partitions(struct mtd_info *master,
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
-		slave = add_one_partition(master, parts + i, i, cur_offset);
-		if (!slave)
-			return -ENOMEM;
+		slave = allocate_partition(master, parts + i, i, cur_offset);
+		if (IS_ERR(slave))
+			return PTR_ERR(slave);
+
+		mutex_lock(&mtd_partitions_mutex);
+		list_add(&slave->list, &mtd_partitions);
+		mutex_unlock(&mtd_partitions_mutex);
+
+		add_mtd_device(&slave->mtd);
+
 		cur_offset = slave->offset + slave->mtd.size;
 	}
 
@@ -618,3 +719,20 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(parse_mtd_partitions);
+
+int mtd_is_master(struct mtd_info *mtd)
+{
+	struct mtd_part *part;
+	int nopart = 0;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry(part, &mtd_partitions, list)
+		if (&part->mtd == mtd) {
+			nopart = 1;
+			break;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return nopart;
+}
+EXPORT_SYMBOL(mtd_is_master);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 274b619..ffab9a6 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -89,4 +89,9 @@ static inline int mtd_has_cmdlinepart(void) { return 1; }
 static inline int mtd_has_cmdlinepart(void) { return 0; }
 #endif
 
+int mtd_is_master(struct mtd_info *mtd);
+int mtd_add_partition(struct mtd_info *master, char *name,
+		      long long offset, long long length);
+int mtd_del_partition(struct mtd_info *master, int partno);
+
 #endif
-- 
1.6.2.4
