Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNZ78-0003au-35
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 06:27:45 +0000
Received: by mail-lf0-x242.google.com with SMTP id l200so7166659lfg.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:27:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V7 1/6] mtd: partitions: add helper for deleting partition
Date: Wed, 21 Jun 2017 08:26:42 +0200
Message-Id: <20170621062647.6072-2-zajec5@gmail.com>
In-Reply-To: <20170621062647.6072-1-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

There are two similar functions handling deletion. One handles single
partition and another the whole MTD flash device. They share (duplicate)
some code so it makes sense to add a small helper for that part.

Function del_mtd_partitions has been moved a bit to keep all deleting
stuff together.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V6: Introduction of this patch. It's needed by "mtd: partitions: add
    support for subpartitions"
V7: Don't move sysfs_remove_files here (see the next patch instead).
---
 drivers/mtd/mtdpart.c | 75 +++++++++++++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 7ececd3d7799..bcec72148d0b 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -363,32 +363,6 @@ static inline void free_partition(struct mtd_part *p)
 	kfree(p);
 }
 
-/*
- * This function unregisters and destroy all slave MTD objects which are
- * attached to the given master MTD object.
- */
-
-int del_mtd_partitions(struct mtd_info *master)
-{
-	struct mtd_part *slave, *next;
-	int ret, err = 0;
-
-	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if (slave->master == master) {
-			ret = del_mtd_device(&slave->mtd);
-			if (ret < 0) {
-				err = ret;
-				continue;
-			}
-			list_del(&slave->list);
-			free_partition(slave);
-		}
-	mutex_unlock(&mtd_partitions_mutex);
-
-	return err;
-}
-
 static struct mtd_part *allocate_partition(struct mtd_info *master,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
@@ -675,6 +649,48 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
+/**
+ * __mtd_del_partition - delete MTD partition
+ *
+ * @priv: internal MTD struct for partition to be deleted
+ *
+ * This function must be called with the partitions mutex locked.
+ */
+static int __mtd_del_partition(struct mtd_part *priv)
+{
+	int err;
+
+	err = del_mtd_device(&priv->mtd);
+	if (err)
+		return err;
+
+	list_del(&priv->list);
+	free_partition(priv);
+
+	return 0;
+}
+
+/*
+ * This function unregisters and destroy all slave MTD objects which are
+ * attached to the given master MTD object.
+ */
+int del_mtd_partitions(struct mtd_info *master)
+{
+	struct mtd_part *slave, *next;
+	int ret, err = 0;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
+		if (slave->master == master) {
+			ret = __mtd_del_partition(slave);
+			if (ret < 0)
+				err = ret;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return err;
+}
+
 int mtd_del_partition(struct mtd_info *master, int partno)
 {
 	struct mtd_part *slave, *next;
@@ -686,12 +702,7 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 		    (slave->mtd.index == partno)) {
 			sysfs_remove_files(&slave->mtd.dev.kobj,
 					   mtd_partition_attrs);
-			ret = del_mtd_device(&slave->mtd);
-			if (ret < 0)
-				break;
-
-			list_del(&slave->list);
-			free_partition(slave);
+			ret = __mtd_del_partition(slave);
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
-- 
2.11.0
