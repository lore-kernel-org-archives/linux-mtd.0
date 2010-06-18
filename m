Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYVG-0000ar-Sq
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:08:52 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5IA8UAV025468
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 13:08:48 +0300
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: add the possibility to modify partitions in runtime
Date: Fri, 18 Jun 2010 13:08:29 +0300
Message-Id: <1276855711-18570-3-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This includes adding locks, appropriate memory handling and function
to get the master device for given partition.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdpart.c          |   45 ++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/partitions.h |    2 +
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b8043a9..595d270 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -21,6 +21,7 @@
 
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
+static DEFINE_MUTEX(mtd_partitions_mutex);
 
 /* Our partition node structure */
 struct mtd_part {
@@ -309,21 +310,30 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 /*
  * This function unregisters and destroy all slave MTD objects which are
- * attached to the given master MTD object.
+ * attached to the given master MTD object and which are possible to be
+ * deleted (usercount==0).
  */
 
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
+			kfree(slave->mtd.name);
 			kfree(slave);
 		}
+	mutex_unlock(&mtd_partitions_mutex);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL(del_mtd_partitions);
 
@@ -332,16 +342,19 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		uint64_t cur_offset)
 {
 	struct mtd_part *slave;
+	char *name;
 
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
-	if (!slave) {
+	name = kstrdup(part->name, GFP_KERNEL);
+	if (!name || !slave) {
 		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
 			master->name);
 		del_mtd_partitions(master);
+		kfree(name);
+		kfree(slave);
 		return NULL;
 	}
-	list_add(&slave->list, &mtd_partitions);
 
 	/* set up the MTD object for this partition */
 	slave->mtd.type = master->type;
@@ -352,7 +365,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
 
-	slave->mtd.name = part->name;
+	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
 	slave->mtd.backing_dev_info = master->backing_dev_info;
 
@@ -497,6 +510,9 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 
 out_register:
+	mutex_lock(&mtd_partitions_mutex);
+	list_add(&slave->list, &mtd_partitions);
+	mutex_unlock(&mtd_partitions_mutex);
 	/* register our partition */
 	add_mtd_device(&slave->mtd);
 
@@ -597,3 +613,20 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(parse_mtd_partitions);
+
+struct mtd_info *part_get_mtd_master(struct mtd_info *mtd)
+{
+	struct mtd_part *part;
+	struct mtd_info *master = NULL;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry(part, &mtd_partitions, list)
+		if (&part->mtd == mtd) {
+			master = part->master;
+			break;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return master;
+}
+EXPORT_SYMBOL(part_get_mtd_master);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 274b619..942c425 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -89,4 +89,6 @@ static inline int mtd_has_cmdlinepart(void) { return 1; }
 static inline int mtd_has_cmdlinepart(void) { return 0; }
 #endif
 
+struct mtd_info *part_get_mtd_master(struct mtd_info *mtd);
+
 #endif
-- 
1.6.2.4
