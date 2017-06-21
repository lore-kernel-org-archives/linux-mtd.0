Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNZ7C-0003ca-1V
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 06:27:50 +0000
Received: by mail-lf0-x241.google.com with SMTP id u62so18684166lfg.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:27:26 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V7 4/6] mtd: partitions: add support for subpartitions
Date: Wed, 21 Jun 2017 08:26:45 +0200
Message-Id: <20170621062647.6072-5-zajec5@gmail.com>
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

Some flash device partitions can be containers with extra subpartitions
(volumes). All callbacks are already capable of this additional level of
indirection.

This patch makes sure we always display subpartitions using a tree
structure and takes care of deleting subpartitions when parent gets
removed.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V5: Introduction of this patch to handle offset in allocate_partition
    and avoid casting const to non-const in mtd_parse_part.
V6: Rework patch to support tree structure.
---
 drivers/mtd/mtdpart.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 208822040735..c0d464d192ee 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -413,7 +413,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 	 * parent conditional on that option. Note, this is a way to
 	 * distinguish between the master and the partition in sysfs.
 	 */
-	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
+	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
 				&parent->dev :
 				parent->dev.parent;
 	slave->mtd.dev.of_node = part->of_node;
@@ -664,8 +664,17 @@ EXPORT_SYMBOL_GPL(mtd_add_partition);
  */
 static int __mtd_del_partition(struct mtd_part *priv)
 {
+	struct mtd_part *child, *next;
 	int err;
 
+	list_for_each_entry_safe(child, next, &mtd_partitions, list) {
+		if (child->parent == &priv->mtd) {
+			err = __mtd_del_partition(child);
+			if (err)
+				return err;
+		}
+	}
+
 	sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
 
 	err = del_mtd_device(&priv->mtd);
@@ -680,16 +689,16 @@ static int __mtd_del_partition(struct mtd_part *priv)
 
 /*
  * This function unregisters and destroy all slave MTD objects which are
- * attached to the given master MTD object.
+ * attached to the given MTD object.
  */
-int del_mtd_partitions(struct mtd_info *master)
+int del_mtd_partitions(struct mtd_info *mtd)
 {
 	struct mtd_part *slave, *next;
 	int ret, err = 0;
 
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if (slave->parent == master) {
+		if (slave->parent == mtd) {
 			ret = __mtd_del_partition(slave);
 			if (ret < 0)
 				err = ret;
@@ -699,14 +708,14 @@ int del_mtd_partitions(struct mtd_info *master)
 	return err;
 }
 
-int mtd_del_partition(struct mtd_info *master, int partno)
+int mtd_del_partition(struct mtd_info *mtd, int partno)
 {
 	struct mtd_part *slave, *next;
 	int ret = -EINVAL;
 
 	mutex_lock(&mtd_partitions_mutex);
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if ((slave->parent == master) &&
+		if ((slave->parent == mtd) &&
 		    (slave->mtd.index == partno)) {
 			ret = __mtd_del_partition(slave);
 			break;
@@ -939,6 +948,6 @@ uint64_t mtd_get_device_size(const struct mtd_info *mtd)
 	if (!mtd_is_partition(mtd))
 		return mtd->size;
 
-	return mtd_to_part(mtd)->parent->size;
+	return mtd_get_device_size(mtd_to_part(mtd)->parent);
 }
 EXPORT_SYMBOL_GPL(mtd_get_device_size);
-- 
2.11.0
