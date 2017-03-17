Received: from [45.249.212.187] (helo=dggrg01-dlp.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cogks-0003ue-BR
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 01:32:37 +0000
From: Gu Zheng <guzheng1@huawei.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <yi.zhang@huawei.com>, <guzheng1@huawei.com>, <zhaohongjiang@huawei.com>,
 <miaoxie@huawei.com>, <zhangxingcai@huawei.com>,
 <giuseppe.cantavenera.ext@nokia.com>, <alexander.sverdlin@nokia.com>,
 <gregkh@linuxfoundation.org>
Subject: [PATCH] mtd:avoid blktrans_open/release race and avoid insmod ftl.ko
 deadlock
Date: Fri, 17 Mar 2017 09:33:07 +0800
Message-ID: <1489714387-21089-1-git-send-email-guzheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

this modification can fix the is issue in commit
857814ee65dbc942b18b2dc713124ffff043035e "mtd: fix: avoid race condition
when accessing mtd->usecount ",also can solve the issue about it happen
dealock when ismod ftl.ko. the original process is as follows:
init_ftl
register_mtd_blktrans
mutex_lock(&mtd_table_mutex) //mtd_table_mutex locked
ftl_add_mtd
add_mtd_blktrans_dev
device_add_disk
register_disk
blkdev_get
__blkdev_get
blktrans_open
mutex_lock(&mtd_table_mutex) //dead lock

this patch can prevent some mtd_table_mutex lock race undiscovered.

Signed-off-by: Gu Zheng <guzheng1@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 31 ++++++++------------
 drivers/mtd/mtdcore.c     | 74 +++++++++++++++++++++++++++++++++++------------
 drivers/mtd/mtdcore.h     |  4 ++-
 3 files changed, 71 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 6b8d5cd..c194208 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -191,7 +191,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 	mutex_lock(&dev->lock);
 
 	if (dev->open)
@@ -217,7 +217,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 unlock:
 	dev->open++;
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	blktrans_dev_put(dev);
 	return ret;
 
@@ -228,7 +228,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	module_put(dev->tr->owner);
 	kref_put(&dev->ref, blktrans_dev_release);
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -240,7 +240,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -256,7 +256,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	}
 unlock:
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	blktrans_dev_put(dev);
 }
 
@@ -323,10 +323,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	struct gendisk *gd;
 	int ret;
 
-	if (mutex_trylock(&mtd_table_mutex)) {
-		mutex_unlock(&mtd_table_mutex);
-		BUG();
-	}
+	mtd_table_assert_mutex_locked();
 
 	mutex_lock(&blktrans_ref_mutex);
 	list_for_each_entry(d, &tr->devs, list) {
@@ -455,11 +452,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
 	unsigned long flags;
 
-	if (mutex_trylock(&mtd_table_mutex)) {
-		mutex_unlock(&mtd_table_mutex);
-		BUG();
-	}
-
+	mtd_table_assert_mutex_locked();
 	if (old->disk_attributes)
 		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
 						old->disk_attributes);
@@ -531,13 +524,13 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 		register_mtd_user(&blktrans_notifier);
 
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		mutex_unlock(&mtd_table_mutex);
+		mtd_table_mutex_unlock();
 		return ret;
 	}
 
@@ -553,7 +546,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 		if (mtd->type != MTD_ABSENT)
 			tr->add_mtd(tr, mtd);
 
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return 0;
 }
 
@@ -561,7 +554,7 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 {
 	struct mtd_blktrans_dev *dev, *next;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	/* Remove it from the list of active majors */
 	list_del(&tr->list);
@@ -570,7 +563,7 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 		tr->remove_dev(dev);
 
 	unregister_blkdev(tr->major, tr->name);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 
 	BUG_ON(!list_empty(&tr->devs));
 	return 0;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66a9ded..f3d5470 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -84,6 +84,8 @@ static DEFINE_IDR(mtd_idr);
    should not use them for _anything_ else */
 DEFINE_MUTEX(mtd_table_mutex);
 EXPORT_SYMBOL_GPL(mtd_table_mutex);
+int mtd_table_mutex_depth;
+struct task_struct *mtd_table_mutex_owner;
 
 struct mtd_info *__mtd_next_device(int i)
 {
@@ -96,6 +98,42 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
+void mtd_table_mutex_lock(void)
+{
+	if (mtd_table_mutex_owner != current) {
+		mutex_lock(&mtd_table_mutex);
+		mtd_table_mutex_owner =  current;
+	}
+	mtd_table_mutex_depth++;
+
+}
+EXPORT_SYMBOL_GPL(mtd_table_mutex_lock);
+
+
+void mtd_table_mutex_unlock(void)
+{
+	if (mtd_table_mutex_owner != current) {
+		pr_err("MTD:lock_owner is %s, but current is %s\n",
+				mtd_table_mutex_owner->comm, current->comm);
+		BUG();
+	}
+	if (--mtd_table_mutex_depth == 0) {
+		mtd_table_mutex_owner =  NULL;
+		mutex_unlock(&mtd_table_mutex);
+	}
+
+}
+EXPORT_SYMBOL_GPL(mtd_table_mutex_unlock);
+
+void mtd_table_assert_mutex_locked(void)
+{
+	if (mtd_table_mutex_owner != current) {
+		pr_err("MTD:lock_owner is %s, but current is %s\n",
+				mtd_table_mutex_owner->comm, current->comm);
+		BUG();
+	}
+}
+EXPORT_SYMBOL_GPL(mtd_table_assert_mutex_locked);
 /* REVISIT once MTD uses the driver model better, whoever allocates
  * the mtd_info will probably want to use the release() hook...
  */
@@ -502,7 +540,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->backing_dev_info = mtd_bdi;
 
 	BUG_ON(mtd->writesize == 0);
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
 	if (i < 0) {
@@ -563,7 +601,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->add(mtd);
 
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	/* We _know_ we aren't being removed, because
 	   our caller is still holding us here. So none
 	   of this try_ nonsense, and no bitching about it
@@ -575,7 +613,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	of_node_put(mtd_get_of_node(mtd));
 	idr_remove(&mtd_idr, i);
 fail_locked:
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return error;
 }
 
@@ -594,7 +632,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	int ret;
 	struct mtd_notifier *not;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
@@ -621,7 +659,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	}
 
 out_error:
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return ret;
 }
 
@@ -782,7 +820,7 @@ void register_mtd_user (struct mtd_notifier *new)
 {
 	struct mtd_info *mtd;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	list_add(&new->list, &mtd_notifiers);
 
@@ -791,7 +829,7 @@ void register_mtd_user (struct mtd_notifier *new)
 	mtd_for_each_device(mtd)
 		new->add(mtd);
 
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 }
 EXPORT_SYMBOL_GPL(register_mtd_user);
 
@@ -808,7 +846,7 @@ int unregister_mtd_user (struct mtd_notifier *old)
 {
 	struct mtd_info *mtd;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	module_put(THIS_MODULE);
 
@@ -816,7 +854,7 @@ int unregister_mtd_user (struct mtd_notifier *old)
 		old->remove(mtd);
 
 	list_del(&old->list);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return 0;
 }
 EXPORT_SYMBOL_GPL(unregister_mtd_user);
@@ -837,7 +875,7 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 	struct mtd_info *ret = NULL, *other;
 	int err = -ENODEV;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	if (num == -1) {
 		mtd_for_each_device(other) {
@@ -861,7 +899,7 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 	if (err)
 		ret = ERR_PTR(err);
 out:
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(get_mtd_device);
@@ -900,7 +938,7 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 	int err = -ENODEV;
 	struct mtd_info *mtd = NULL, *other;
 
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 
 	mtd_for_each_device(other) {
 		if (!strcmp(name, other->name)) {
@@ -916,20 +954,20 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 	if (err)
 		goto out_unlock;
 
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return mtd;
 
 out_unlock:
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 
 void put_mtd_device(struct mtd_info *mtd)
 {
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 	__put_mtd_device(mtd);
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 
 }
 EXPORT_SYMBOL_GPL(put_mtd_device);
@@ -1744,13 +1782,13 @@ static int mtd_proc_show(struct seq_file *m, void *v)
 	struct mtd_info *mtd;
 
 	seq_puts(m, "dev:    size   erasesize  name\n");
-	mutex_lock(&mtd_table_mutex);
+	mtd_table_mutex_lock();
 	mtd_for_each_device(mtd) {
 		seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
 			   mtd->index, (unsigned long long)mtd->size,
 			   mtd->erasesize, mtd->name);
 	}
-	mutex_unlock(&mtd_table_mutex);
+	mtd_table_mutex_unlock();
 	return 0;
 }
 
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 55fdb8e..cb1d8fa 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -3,7 +3,6 @@
  * You should not use them for _anything_ else.
  */
 
-extern struct mutex mtd_table_mutex;
 
 struct mtd_info *__mtd_next_device(int i);
 int add_mtd_device(struct mtd_info *mtd);
@@ -21,6 +20,9 @@ void mtd_part_parser_cleanup(struct mtd_partitions *parts);
 
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
+extern void mtd_table_mutex_lock(void);
+extern void mtd_table_mutex_unlock(void);
+extern void mtd_table_assert_mutex_locked(void);
 
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
-- 
2.5.0
