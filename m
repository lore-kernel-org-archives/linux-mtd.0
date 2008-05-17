Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JxQbm-0005e2-9t
	for linux-mtd@lists.infradead.org; Sat, 17 May 2008 17:54:14 +0000
Received: from aamtaout03-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout02-winn.ispmail.ntl.com with ESMTP id
	<20080517175803.KVJO58.mtaout02-winn.ispmail.ntl.com@aamtaout03-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Sat, 17 May 2008 18:58:03 +0100
Received: from [192.168.168.100] (really [86.9.88.168])
	by aamtaout03-winn.ispmail.ntl.com with ESMTP id
	<20080517180218.DEL26699.aamtaout03-winn.ispmail.ntl.com@[192.168.168.100]>
	for <linux-mtd@lists.infradead.org>; Sat, 17 May 2008 19:02:18 +0100
Subject: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where appropriate.
From: Chris Malley <mail@chrismalley.co.uk>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2008 18:54:05 +0100
Message-Id: <1211046845.17244.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Chris Malley <mail@chrismalley.co.uk>

Should be no functional changes, just a bit of janitorial work
to remove temporary pointers and make some functions a bit more readable.

Signed-off-by: ﻿Chris Malley <mail@chrismalley.co.uk>

---
Tested on 2.6.26-rc2 with mtdram but would appreciate someone testing on a
partition-capable device (this is my first MTD patch).  Also applies cleanly
to latest MTD git.

 drivers/mtd/mtd_blkdevs.c |   43 ++++++++++++++++++-------------------------
 drivers/mtd/mtdcore.c     |   14 ++++++--------
 drivers/mtd/mtdpart.c     |   24 ++++++++----------------
 3 files changed, 32 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 839eed8..895813b 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -212,7 +212,7 @@ static struct block_device_operations mtd_blktrans_ops = {
 int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 {
 	struct mtd_blktrans_ops *tr = new->tr;
-	struct list_head *this;
+	struct mtd_blktrans_dev *this;
 	int last_devnum = -1;
 	struct gendisk *gd;
 
@@ -221,25 +221,24 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		BUG();
 	}
 
-	list_for_each(this, &tr->devs) {
-		struct mtd_blktrans_dev *d = list_entry(this, struct mtd_blktrans_dev, list);
+	list_for_each_entry(this, &tr->devs, list) {
 		if (new->devnum == -1) {
 			/* Use first free number */
-			if (d->devnum != last_devnum+1) {
+			if (this->devnum != last_devnum+1) {
 				/* Found a free devnum. Plug it in here */
 				new->devnum = last_devnum+1;
-				list_add_tail(&new->list, &d->list);
+				list_add_tail(&new->list, &this->list);
 				goto added;
 			}
-		} else if (d->devnum == new->devnum) {
+		} else if (this->devnum == new->devnum) {
 			/* Required number taken */
 			return -EBUSY;
-		} else if (d->devnum > new->devnum) {
+		} else if (this->devnum > new->devnum) {
 			/* Required number was free */
-			list_add_tail(&new->list, &d->list);
+			list_add_tail(&new->list, &this->list);
 			goto added;
 		}
-		last_devnum = d->devnum;
+		last_devnum = this->devnum;
 	}
 	if (new->devnum == -1)
 		new->devnum = last_devnum+1;
@@ -309,14 +308,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 
 static void blktrans_notify_remove(struct mtd_info *mtd)
 {
-	struct list_head *this, *this2, *next;
-
-	list_for_each(this, &blktrans_majors) {
-		struct mtd_blktrans_ops *tr = list_entry(this, struct mtd_blktrans_ops, list);
-
-		list_for_each_safe(this2, next, &tr->devs) {
-			struct mtd_blktrans_dev *dev = list_entry(this2, struct mtd_blktrans_dev, list);
+	struct mtd_blktrans_ops *tr;
+	struct mtd_blktrans_dev *dev, *next;
 
+	list_for_each_entry(tr, &blktrans_majors, list) {
+		list_for_each_entry_safe(dev, next, &tr->devs, list) {
 			if (dev->mtd == mtd)
 				tr->remove_dev(dev);
 		}
@@ -325,15 +321,13 @@ static void blktrans_notify_remove(struct mtd_info *mtd)
 
 static void blktrans_notify_add(struct mtd_info *mtd)
 {
-	struct list_head *this;
+	struct mtd_blktrans_ops *this;
 
 	if (mtd->type == MTD_ABSENT)
 		return;
 
-	list_for_each(this, &blktrans_majors) {
-		struct mtd_blktrans_ops *tr = list_entry(this, struct mtd_blktrans_ops, list);
-
-		tr->add_mtd(tr, mtd);
+	list_for_each_entry(this, &blktrans_majors, list) {
+		this->add_mtd(this, mtd);
 	}
 
 }
@@ -406,7 +400,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 
 int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 {
-	struct list_head *this, *next;
+	struct mtd_blktrans_dev *this, *next;
 
 	mutex_lock(&mtd_table_mutex);
 
@@ -416,9 +410,8 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	/* Remove it from the list of active majors */
 	list_del(&tr->list);
 
-	list_for_each_safe(this, next, &tr->devs) {
-		struct mtd_blktrans_dev *dev = list_entry(this, struct mtd_blktrans_dev, list);
-		tr->remove_dev(dev);
+	list_for_each_entry_safe(this, next, &tr->devs, list) {
+		tr->remove_dev(this);
 	}
 
 	blk_cleanup_queue(tr->blkcore_priv->rq);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f7e7890..79b8d10 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -53,7 +53,7 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	for (i=0; i < MAX_MTD_DEVICES; i++)
 		if (!mtd_table[i]) {
-			struct list_head *this;
+			struct mtd_notifier *this;
 
 			mtd_table[i] = mtd;
 			mtd->index = i;
@@ -72,9 +72,8 @@ int add_mtd_device(struct mtd_info *mtd)
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
-			list_for_each(this, &mtd_notifiers) {
-				struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
-				not->add(mtd);
+			list_for_each_entry(this, &mtd_notifiers, list) {
+				this->add(mtd);
 			}
 
 			mutex_unlock(&mtd_table_mutex);
@@ -113,13 +112,12 @@ int del_mtd_device (struct mtd_info *mtd)
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
-		struct list_head *this;
+		struct mtd_notifier *this;
 
 		/* No need to get a refcount on the module containing
 		   the notifier, since we hold the mtd_table_mutex */
-		list_for_each(this, &mtd_notifiers) {
-			struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
-			not->remove(mtd);
+		list_for_each_entry(this, &mtd_notifiers, list) {
+			this->remove(mtd);
 		}
 
 		mtd_table[mtd->index] = NULL;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 07c7011..06b0a14 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -302,20 +302,14 @@ static int part_block_markbad (struct mtd_info *mtd, loff_t ofs)
 
 int del_mtd_partitions(struct mtd_info *master)
 {
-	struct list_head *node;
-	struct mtd_part *slave;
+	struct mtd_part *slave, *safe;
 
-	for (node = mtd_partitions.next;
-	     node != &mtd_partitions;
-	     node = node->next) {
-		slave = list_entry(node, struct mtd_part, list);
+	list_for_each_entry_safe(slave, safe, &mtd_partitions, list) {
 		if (slave->master == master) {
-			struct list_head *prev = node->prev;
-			__list_del(prev, node->next);
+			list_del(&slave->list);
 			if(slave->registered)
 				del_mtd_device(&slave->mtd);
 			kfree(slave);
-			node = prev;
 		}
 	}
 
@@ -513,15 +507,13 @@ static LIST_HEAD(part_parsers);
 
 static struct mtd_part_parser *get_partition_parser(const char *name)
 {
-	struct list_head *this;
-	void *ret = NULL;
-	spin_lock(&part_parser_lock);
+	struct mtd_part_parser *this, *ret = NULL;
 
-	list_for_each(this, &part_parsers) {
-		struct mtd_part_parser *p = list_entry(this, struct mtd_part_parser, list);
+	spin_lock(&part_parser_lock);
 
-		if (!strcmp(p->name, name) && try_module_get(p->owner)) {
-			ret = p;
+	list_for_each_entry(this, &part_parsers, list) {
+		if (!strcmp(this->name, name) && try_module_get(this->owner)) {
+			ret = this;
 			break;
 		}
 	}
-- 
