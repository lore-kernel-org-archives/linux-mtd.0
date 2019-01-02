Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gehdt-00007C-VY
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2019 14:37:11 +0000
From: Boris Brezillon <bbrezillon@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Date: Wed,  2 Jan 2019 15:36:54 +0100
Message-Id: <20190102143654.24362-2-bbrezillon@kernel.org>
In-Reply-To: <20190102143654.24362-1-bbrezillon@kernel.org>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add_mtd_device() can fail. We should always check its return value
and gracefully handle the failure case. Fix the call sites where this
not done (in mtdpart.c) and add a __must_check attribute to the
prototype to avoid this kind of mistakes.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
No Fixes or Cc-stable tag here, as this seems to have worked just fine
without checking add_mtd_device() ret code until we started to expose
MTD devices as NVMEM providers (queued for 4.21).
---
 drivers/mtd/mtdcore.h |  2 +-
 drivers/mtd/mtdpart.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 9887bda317cd..b31c868019ad 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -7,7 +7,7 @@
 extern struct mutex mtd_table_mutex;
 
 struct mtd_info *__mtd_next_device(int i);
-int add_mtd_device(struct mtd_info *mtd);
+int __must_check add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b6af41b04622..60104e1079c5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -618,10 +618,22 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	list_add(&new->list, &mtd_partitions);
 	mutex_unlock(&mtd_partitions_mutex);
 
-	add_mtd_device(&new->mtd);
+	ret = add_mtd_device(&new->mtd);
+	if (ret)
+		goto err_remove_part;
 
 	mtd_add_partition_attrs(new);
 
+	return 0;
+
+err_remove_part:
+	mutex_lock(&mtd_partitions_mutex);
+	list_del(&new->list);
+	mutex_unlock(&mtd_partitions_mutex);
+
+	free_partition(new);
+	pr_info("%s:%i\n", __func__, __LINE__);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
@@ -712,22 +724,31 @@ int add_mtd_partitions(struct mtd_info *master,
 {
 	struct mtd_part *slave;
 	uint64_t cur_offset = 0;
-	int i;
+	int i, ret;
 
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
 		slave = allocate_partition(master, parts + i, i, cur_offset);
 		if (IS_ERR(slave)) {
-			del_mtd_partitions(master);
-			return PTR_ERR(slave);
+			ret = PTR_ERR(slave);
+			goto err_del_partitions;
 		}
 
 		mutex_lock(&mtd_partitions_mutex);
 		list_add(&slave->list, &mtd_partitions);
 		mutex_unlock(&mtd_partitions_mutex);
 
-		add_mtd_device(&slave->mtd);
+		ret = add_mtd_device(&slave->mtd);
+		if (ret) {
+			mutex_lock(&mtd_partitions_mutex);
+			list_del(&slave->list);
+			mutex_unlock(&mtd_partitions_mutex);
+
+			free_partition(slave);
+			goto err_del_partitions;
+		}
+
 		mtd_add_partition_attrs(slave);
 		/* Look for subpartitions */
 		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
@@ -736,6 +757,11 @@ int add_mtd_partitions(struct mtd_info *master,
 	}
 
 	return 0;
+
+err_del_partitions:
+	del_mtd_partitions(master);
+
+	return ret;
 }
 
 static DEFINE_SPINLOCK(part_parser_lock);
-- 
2.17.1
