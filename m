Received: from mtaout01-winn.ispmail.ntl.com ([81.103.221.47])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JxohB-0002dw-3G
	for linux-mtd@lists.infradead.org; Sun, 18 May 2008 19:37:25 +0000
Subject: Re: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where
	appropriate (2nd attempt)
From: Chris Malley <mail@chrismalley.co.uk>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20080517194914.GA21674@logfs.org>
References: <1211046845.17244.19.camel@localhost>
	<20080517194914.GA21674@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2008 20:37:13 +0100
Message-Id: <1211139433.19435.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: ﻿Chris Malley <mail@chrismalley.co.uk>

[MTD] CORE: Use list_for_each_entry[_safe] where appropriate.

Janitorial work to remove temporary pointers and make some functions a bit
more readable.

Signed-off-by: Chris Malley <mail@chrismalley.co.uk>
---
Compile tested against mtd git.  I compared the object output as Jörn suggested
and there are a number of differences on my machine, perhaps due to the different
way the library functions are implemented and moving the relevant struct vars
outside the loop.  I don't think these should make any material
difference but it's worth giving them a good testing before sending to Linus.

 drivers/mtd/mtd_blkdevs.c |   27 ++++++++++-----------------
 drivers/mtd/mtdcore.c     |   10 ++++------
 drivers/mtd/mtdpart.c     |   20 ++++++--------------
 3 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 839eed8..39fefb1 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -212,7 +212,7 @@ static struct block_device_operations mtd_blktrans_ops = {
 int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 {
 	struct mtd_blktrans_ops *tr = new->tr;
-	struct list_head *this;
+	struct mtd_blktrans_dev *d;
 	int last_devnum = -1;
 	struct gendisk *gd;
 
@@ -221,8 +221,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		BUG();
 	}
 
-	list_for_each(this, &tr->devs) {
-		struct mtd_blktrans_dev *d = list_entry(this, struct mtd_blktrans_dev, list);
+	list_for_each_entry(d, &tr->devs, list) {
 		if (new->devnum == -1) {
 			/* Use first free number */
 			if (d->devnum != last_devnum+1) {
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
@@ -325,14 +321,12 @@ static void blktrans_notify_remove(struct mtd_info *mtd)
 
 static void blktrans_notify_add(struct mtd_info *mtd)
 {
-	struct list_head *this;
+	struct mtd_blktrans_ops *tr;
 
 	if (mtd->type == MTD_ABSENT)
 		return;
 
-	list_for_each(this, &blktrans_majors) {
-		struct mtd_blktrans_ops *tr = list_entry(this, struct mtd_blktrans_ops, list);
-
+	list_for_each_entry(tr, &blktrans_majors, list) {
 		tr->add_mtd(tr, mtd);
 	}
 
@@ -406,7 +400,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 
 int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 {
-	struct list_head *this, *next;
+	struct mtd_blktrans_dev *dev, *next;
 
 	mutex_lock(&mtd_table_mutex);
 
@@ -416,8 +410,7 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	/* Remove it from the list of active majors */
 	list_del(&tr->list);
 
-	list_for_each_safe(this, next, &tr->devs) {
-		struct mtd_blktrans_dev *dev = list_entry(this, struct mtd_blktrans_dev, list);
+	list_for_each_entry_safe(dev, next, &tr->devs, list) {
 		tr->remove_dev(dev);
 	}
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f7e7890..8c61035 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -53,7 +53,7 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	for (i=0; i < MAX_MTD_DEVICES; i++)
 		if (!mtd_table[i]) {
-			struct list_head *this;
+			struct mtd_notifier *not;
 
 			mtd_table[i] = mtd;
 			mtd->index = i;
@@ -72,8 +72,7 @@ int add_mtd_device(struct mtd_info *mtd)
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
-			list_for_each(this, &mtd_notifiers) {
-				struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
+			list_for_each_entry(not, &mtd_notifiers, list) {
 				not->add(mtd);
 			}
 
@@ -113,12 +112,11 @@ int del_mtd_device (struct mtd_info *mtd)
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
-		struct list_head *this;
+		struct mtd_notifier *not;
 
 		/* No need to get a refcount on the module containing
 		   the notifier, since we hold the mtd_table_mutex */
-		list_for_each(this, &mtd_notifiers) {
-			struct mtd_notifier *not = list_entry(this, struct mtd_notifier, list);
+		list_for_each_entry(not, &mtd_notifiers, list) {
 			not->remove(mtd);
 		}
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 07c7011..b7847f2 100644
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
 
@@ -513,13 +507,11 @@ static LIST_HEAD(part_parsers);
 
 static struct mtd_part_parser *get_partition_parser(const char *name)
 {
-	struct list_head *this;
-	void *ret = NULL;
-	spin_lock(&part_parser_lock);
+	struct mtd_part_parser *p, *ret = NULL;
 
-	list_for_each(this, &part_parsers) {
-		struct mtd_part_parser *p = list_entry(this, struct mtd_part_parser, list);
+	spin_lock(&part_parser_lock);
 
+	list_for_each_entry(p, &part_parsers, list) {
 		if (!strcmp(p->name, name) && try_module_get(p->owner)) {
 			ret = p;
 			break;
-- 
