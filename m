Received: from dakia2.marvell.com ([65.219.4.35])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P0FAE-0005Ho-Qu
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 14:58:47 +0000
From: Lei Wen <leiwen@marvell.com>
To: roman.tereshonkov@nokia.com, dwmw2@infradead.org,
	dedekind1@gmail.com, linux-mtd@lists.infradead.org, adrian.wenl@gmail.com
Subject: [PATCH] mtd: add get offset and size function for partition query
Date: Mon, 27 Sep 2010 23:04:44 +0800
Message-Id: <1285599884-18312-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we add add_mtd_partitions and mtd_del_partition kenrel api to
facilitate the mtd repartition job. It would be nice to add another two api
to know the offset and size of each partition.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 drivers/mtd/mtdpart.c          |   36 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |    2 ++
 2 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 726c287..4548168 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -655,6 +655,42 @@ int add_mtd_partitions(struct mtd_info *master,
 }
 EXPORT_SYMBOL(add_mtd_partitions);
 
+uint64_t get_mtd_offset(struct mtd_info *master, int partno)
+{
+	struct mtd_part *slave, *next;
+	uint64_t ret = ULLONG_MAX;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
+		if ((slave->master == master) &&
+		    (slave->mtd.index == partno)) {
+			ret = slave->offset;
+			break;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(get_mtd_offset);
+
+uint64_t get_mtd_size(struct mtd_info *master, int partno)
+{
+	struct mtd_part *slave, *next;
+	uint64_t ret = ULLONG_MAX;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
+		if ((slave->master == master) &&
+		    (slave->mtd.index == partno)) {
+			ret = slave->mtd.size;
+			break;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(get_mtd_size);
+
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index ffab9a6..03333ec 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -93,5 +93,7 @@ int mtd_is_master(struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
 int mtd_del_partition(struct mtd_info *master, int partno);
+uint64_t get_mtd_offset(struct mtd_info *master, int partno);
+uint64_t get_mtd_size(struct mtd_info *master, int partno);
 
 #endif
-- 
1.7.0.4
