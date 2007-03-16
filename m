Received: from [210.94.41.89] (helo=july7)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HS7eH-0006i2-OL
	for linux-mtd@lists.infradead.org; Fri, 16 Mar 2007 08:18:54 +0000
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] Add get_mtd_blktrans_rq() for getting request queue
Date: Fri, 16 Mar 2007 17:18:49 +0900
Message-ID: <004501c767a3$bc4001b0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 0abe5e2ab91f2fb92891c3edf8b408c0dd94d83e Mon Sep 17 00:00:00 2001
From: Kyungmin Park <kyungmin.park@samsung.com>
Date: Tue, 13 Mar 2007 10:52:11 +0900
Subject: [PATCH] [MTD] Add get_mtd_blktrans_rq() for getting request queue

This exports block request queue for block tracing in MTD.
As you know the block trace data are stored at request queue.
Now JFFS2 calls mtd functions directly. So we can't trace JFFS2 behaviors

If we use the JFFS2 on some mtd partition. Usually we don't use the
mtdblock.
Then we can map the block trace data at mtdblock requeust queue.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/mtd_blkdevs.c    |   30 ++++++++++++++++++++++++++++++
 include/linux/mtd/blktrans.h |    2 ++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index b879a66..690b4ab 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -23,6 +23,7 @@
 #include <asm/uaccess.h>
 
 static LIST_HEAD(blktrans_majors);
+static LIST_HEAD(bt_header);
 
 extern struct mutex mtd_table_mutex;
 extern struct mtd_info *mtd_table[];
@@ -309,6 +310,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	add_disk(gd);
 
+	INIT_LIST_HEAD(&new->bt_list);
+	list_add_tail(&new->bt_list, &bt_header);
+
 	return 0;
 }
 
@@ -319,6 +323,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		BUG();
 	}
 
+	list_del(&old->bt_list);
 	list_del(&old->list);
 
 	del_gendisk(old->blkcore_priv);
@@ -327,6 +332,30 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	return 0;
 }
 
+struct request_queue *get_mtd_blktrans_rq(struct mtd_info *mtd, int major)
+{
+	struct mtd_blktrans_dev *dev = NULL;
+	struct mtd_blktrans_ops *tr = NULL;
+	struct list_head *this;
+	int found = 0;
+
+	mutex_lock(&mtd_table_mutex);
+	list_for_each(this, &bt_header) {
+		dev = list_entry(this, struct mtd_blktrans_dev, bt_list);
+		tr = dev->tr;
+		if (dev->devnum == mtd->index && tr->major == major) {
+			found = 1;
+			break;
+		}
+	}
+	mutex_unlock(&mtd_table_mutex);
+
+	if (found)
+		return tr->blkcore_priv->rq;
+
+	return NULL;
+}
+
 static void blktrans_notify_remove(struct mtd_info *mtd)
 {
 	struct list_head *this, *this2, *next;
@@ -469,6 +498,7 @@ EXPORT_SYMBOL_GPL(register_mtd_blktrans);
 EXPORT_SYMBOL_GPL(deregister_mtd_blktrans);
 EXPORT_SYMBOL_GPL(add_mtd_blktrans_dev);
 EXPORT_SYMBOL_GPL(del_mtd_blktrans_dev);
+EXPORT_SYMBOL_GPL(get_mtd_blktrans_rq);
 
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 9a6e2f9..cc1b530 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -21,6 +21,7 @@ struct inode;
 struct mtd_blktrans_dev {
 	struct mtd_blktrans_ops *tr;
 	struct list_head list;
+	struct list_head bt_list;
 	struct mtd_info *mtd;
 	struct mutex lock;
 	int devnum;
@@ -68,6 +69,7 @@ extern int register_mtd_blktrans(struct mtd_blktrans_ops
*tr);
 extern int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr);
 extern int add_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
 extern int del_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
+extern struct request_queue *get_mtd_blktrans_rq(struct mtd_info *mtd, int
major);
 
 
 #endif /* __MTD_TRANS_H__ */
-- 
1.4.4.2
