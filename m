Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCBPH-0003Q3-AJ
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 11:14:35 +0000
Received: by mail-ew0-f13.google.com with SMTP id 6so3075767ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2008 03:14:35 -0800 (PST)
Subject: [PATCH] [UBI] 4/5 - allow register null mtd in mtd_blktrans, take two
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 15 Dec 2008 14:14:24 +0300
Message-Id: <1229339664.7900.24.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow pass NULL as mtd in mtd_blktrans. Also, allow dynamic major number
for mtd blktrans block devices.

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>

---
 drivers/mtd/mtd_blkdevs.c |   54 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 17 deletions(-)

Index: ubifs-2.6/drivers/mtd/mtd_blkdevs.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/mtd_blkdevs.c
+++ ubifs-2.6/drivers/mtd/mtd_blkdevs.c
@@ -132,6 +132,24 @@ static void mtd_blktrans_request(struct
 	wake_up_process(tr->blkcore_priv->thread);
 }
 
+static int mtd_blktrans_get(struct mtd_info *mtd)
+{
+	if (mtd) {
+		if (!try_module_get(mtd->owner))
+			return -ENODEV;
+		mtd->usecount++;
+	}
+	return 0;
+}
+
+static int mtd_blktrans_put(struct mtd_info *mtd)
+{
+	if (mtd) {
+		mtd->usecount--;
+		module_put(mtd->owner);
+	}
+	return 0;
+}
 
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
 {
@@ -139,25 +157,29 @@ static int blktrans_open(struct block_de
 	struct mtd_blktrans_ops *tr = dev->tr;
 	int ret = -ENODEV;
 
-	if (!try_module_get(dev->mtd->owner))
-		goto out;
-
-	if (!try_module_get(tr->owner))
-		goto out_tr;
-
 	/* FIXME: Locking. A hot pluggable device can go away
 	   (del_mtd_device can be called for it) without its module
 	   being unloaded. */
-	dev->mtd->usecount++;
+	if (dev->mtd)
+		if (!mtd_blktrans_get(dev->mtd))
+			goto out;
+
+	if (!try_module_get(tr->owner))
+		goto out_tr;
 
 	ret = 0;
-	if (tr->open && (ret = tr->open(dev))) {
-		dev->mtd->usecount--;
-		module_put(dev->mtd->owner);
-	out_tr:
-		module_put(tr->owner);
+	if (tr->open) {
+		ret = tr->open(dev);
+		if (ret)
+			goto out_all;
 	}
- out:
+	return ret;
+
+out_all:
+	module_put(tr->owner);
+out_tr:
+	mtd_blktrans_put(dev->mtd);
+out:
 	return ret;
 }
 
@@ -171,8 +193,7 @@ static int blktrans_release(struct gendi
 		ret = tr->release(dev);
 
 	if (!ret) {
-		dev->mtd->usecount--;
-		module_put(dev->mtd->owner);
+		mtd_blktrans_put(dev->mtd);
 		module_put(tr->owner);
 	}
 
@@ -354,13 +375,15 @@ int register_mtd_blktrans(struct mtd_blk
 	mutex_lock(&mtd_table_mutex);
 
 	ret = register_blkdev(tr->major, tr->name);
-	if (ret) {
+	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
 		kfree(tr->blkcore_priv);
 		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
+	if (!tr->major)
+		tr->major = ret;
 	spin_lock_init(&tr->blkcore_priv->queue_lock);
 
 	tr->blkcore_priv->rq = blk_init_queue(mtd_blktrans_request, &tr->blkcore_priv->queue_lock);
