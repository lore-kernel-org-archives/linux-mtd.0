Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcC69-0003RZ-KC
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 12:13:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] UBI: Implement bitrot checking
Date: Sun, 29 Mar 2015 14:13:17 +0200
Message-Id: <1427631197-23610-5-git-send-email-richard@nod.at>
In-Reply-To: <1427631197-23610-1-git-send-email-richard@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch implements bitrot checking for UBI.
ubi_wl_trigger_bitrot_check() triggers a re-read of every
PEB. If a bitflip is detected PEBs in use will get scrubbed
and free ones erased.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c |  39 +++++++++++++
 drivers/mtd/ubi/ubi.h   |   4 ++
 drivers/mtd/ubi/wl.c    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 9690cf9..f58330b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -118,6 +118,9 @@ static struct class_attribute ubi_version =
 
 static ssize_t dev_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf);
+static ssize_t trigger_bitrot_check(struct device *dev,
+				    struct device_attribute *mattr,
+				    const char *data, size_t count);
 
 /* UBI device attributes (correspond to files in '/<sysfs>/class/ubi/ubiX') */
 static struct device_attribute dev_eraseblock_size =
@@ -142,6 +145,8 @@ static struct device_attribute dev_bgt_enabled =
 	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_trigger_bitrot_check =
+	__ATTR(trigger_bitrot_check, S_IWUSR, NULL, trigger_bitrot_check);
 
 /**
  * ubi_volume_notify - send a volume change notification.
@@ -334,6 +339,36 @@ int ubi_major2num(int major)
 	return ubi_num;
 }
 
+/* "Store" method for file '/<sysfs>/class/ubi/ubiX/trigger_bitrot_check' */
+static ssize_t trigger_bitrot_check(struct device *dev,
+				    struct device_attribute *mattr,
+				    const char *data, size_t count)
+{
+	struct ubi_device *ubi;
+	int ret;
+
+	ubi = container_of(dev, struct ubi_device, dev);
+	ubi = ubi_get_device(ubi->ubi_num);
+	if (!ubi) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (atomic_inc_return(&ubi->bit_rot_work) != 1) {
+		ret = -EBUSY;
+		goto out_dec;
+	}
+
+	ubi_wl_trigger_bitrot_check(ubi);
+	ret = count;
+
+out_dec:
+	atomic_dec(&ubi->bit_rot_work);
+out:
+	ubi_put_device(ubi);
+	return ret;
+}
+
 /* "Show" method for files in '/<sysfs>/class/ubi/ubiX/' */
 static ssize_t dev_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
@@ -445,6 +480,9 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
 	if (err)
 		return err;
 	err = device_create_file(&ubi->dev, &dev_mtd_num);
+	if (err)
+		return err;
+	err = device_create_file(&ubi->dev, &dev_trigger_bitrot_check);
 	return err;
 }
 
@@ -465,6 +503,7 @@ static void ubi_sysfs_close(struct ubi_device *ubi)
 	device_remove_file(&ubi->dev, &dev_total_eraseblocks);
 	device_remove_file(&ubi->dev, &dev_avail_eraseblocks);
 	device_remove_file(&ubi->dev, &dev_eraseblock_size);
+	device_remove_file(&ubi->dev, &dev_trigger_bitrot_check);
 	device_unregister(&ubi->dev);
 }
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index cb3dcd0..da88cd8 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -39,6 +39,7 @@
 #include <linux/notifier.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/atomic.h>
 #include <asm/pgtable.h>
 
 #include "ubi-media.h"
@@ -464,6 +465,7 @@ struct ubi_debug_info {
  * @bgt_thread: background thread description object
  * @thread_enabled: if the background thread is enabled
  * @bgt_name: background thread name
+ * @bit_rot_work: non-zero if a bit rot check is running
  *
  * @flash_size: underlying MTD device size (in bytes)
  * @peb_count: count of physical eraseblocks on the MTD device
@@ -567,6 +569,7 @@ struct ubi_device {
 	struct task_struct *bgt_thread;
 	int thread_enabled;
 	char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
+	atomic_t bit_rot_work;
 
 	/* I/O sub-system's stuff */
 	long long flash_size;
@@ -834,6 +837,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
+void ubi_wl_trigger_bitrot_check(struct ubi_device *ubi);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 9b11db9..784bb52 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1447,6 +1447,150 @@ static void tree_destroy(struct ubi_device *ubi, struct rb_root *root)
 }
 
 /**
+ * bitrot_check_worker - physical eraseblock bitrot check worker function.
+ * @ubi: UBI device description object
+ * @wl_wrk: the work object
+ * @shutdown: non-zero if the worker has to free memory and exit
+ *
+ * This function reads a physical eraseblock and schedules scrubbing if
+ * bit flips are detected.
+ */
+static int bitrot_check_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
+			       int shutdown)
+{
+	struct ubi_wl_entry *e = wl_wrk->e;
+	int err;
+
+	kfree(wl_wrk);
+	if (shutdown) {
+		dbg_wl("cancel bitrot check of PEB %d", e->pnum);
+		wl_entry_destroy(ubi, e);
+		return 0;
+	}
+
+	mutex_lock(&ubi->buf_mutex);
+	err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
+	mutex_unlock(&ubi->buf_mutex);
+	if (err == UBI_IO_BITFLIPS) {
+		dbg_wl("found bitflips in PEB %d", e->pnum);
+		spin_lock(&ubi->wl_lock);
+
+		if (in_pq(ubi, e)) {
+			prot_queue_del(ubi, e->pnum);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err = ensure_wear_leveling(ubi, 1);
+		}
+		else if (in_wl_tree(e, &ubi->used)) {
+			rb_erase(&e->u.rb, &ubi->used);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err = ensure_wear_leveling(ubi, 1);
+		}
+		else if (in_wl_tree(e, &ubi->free)) {
+			rb_erase(&e->u.rb, &ubi->free);
+			spin_unlock(&ubi->wl_lock);
+
+			wl_wrk = prepare_erase_work(e, -1, -1, 1);
+			if (IS_ERR(wl_wrk)) {
+				err = PTR_ERR(wl_wrk);
+				goto out;
+			}
+
+			__schedule_ubi_work(ubi, wl_wrk);
+			err = 0;
+		}
+		/*
+		 * e is target of a move operation, all we can do is kicking
+		 * wear leveling such that we can catch it later or wear
+		 * leveling itself scrubbs the PEB.
+		 */
+		else if (ubi->move_to == e || ubi->move_from == e) {
+			spin_unlock(&ubi->wl_lock);
+
+			err = ensure_wear_leveling(ubi, 1);
+		}
+		/*
+		 * e is member of a fastmap pool. We are not allowed to
+		 * remove it from that pool as the on-flash fastmap data
+		 * structure refers to it. Let's schedule a new fastmap write
+		 * such that the said PEB can get released.
+		 */
+		else {
+			ubi_schedule_fm_work(ubi);
+			spin_unlock(&ubi->wl_lock);
+
+			err = 0;
+		}
+	}
+	else {
+		/*
+		 * Ignore read errors as we return only work related errors.
+		 * Read errors will be logged by ubi_io_read().
+		 */
+		err = 0;
+	}
+
+out:
+	atomic_dec(&ubi->bit_rot_work);
+	ubi_assert(atomic_read(&ubi->bit_rot_work) >= 0);
+	return err;
+}
+
+/**
+ * schedule_bitrot_check - schedule a bitrot check work.
+ * @ubi: UBI device description object
+ * @e: the WL entry of the physical eraseblock to check
+ *
+ * This function returns zero in case of success and a %-ENOMEM in case of
+ * failure.
+ */
+static int schedule_bitrot_check(struct ubi_device *ubi,
+				 struct ubi_wl_entry *e)
+{
+	struct ubi_work *wl_wrk;
+
+	ubi_assert(e);
+
+	dbg_wl("schedule bitrot check of PEB %d", e->pnum);
+
+	wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	if (!wl_wrk)
+		return -ENOMEM;
+
+	wl_wrk->func = &bitrot_check_worker;
+	wl_wrk->e = e;
+
+	schedule_ubi_work(ubi, wl_wrk);
+	return 0;
+}
+
+/**
+ * ubi_wl_trigger_bitrot_check - triggers a re-read of all physical erase
+ * blocks.
+ * @ubi: UBI device description object
+ */
+void ubi_wl_trigger_bitrot_check(struct ubi_device *ubi)
+{
+	int i;
+	struct ubi_wl_entry *e;
+
+	ubi_msg(ubi, "Running a full read check");
+
+	for (i = 0; i < ubi->peb_count; i++) {
+		spin_lock(&ubi->wl_lock);
+		e = ubi->lookuptbl[i];
+		spin_unlock(&ubi->wl_lock);
+		if (e) {
+			atomic_inc(&ubi->bit_rot_work);
+			schedule_bitrot_check(ubi, e);
+		}
+	}
+}
+
+/**
  * ubi_thread - UBI background thread.
  * @u: the UBI device description object pointer
  */
@@ -1646,6 +1790,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi->avail_pebs -= reserved_pebs;
 	ubi->rsvd_pebs += reserved_pebs;
 
+	atomic_set(&ubi->bit_rot_work, 0);
+
 	/* Schedule wear-leveling if needed */
 	err = ensure_wear_leveling(ubi, 0);
 	if (err)
-- 
1.8.4.5
