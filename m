Received: from mtagate1.de.ibm.com ([195.212.29.150])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HN54X-0006ng-N3
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 10:33:17 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.8/8.13.8) with ESMTP id l22AWmZH054868
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 10:32:48 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l22AWmsB2273422
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 11:32:48 +0100
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l22AWlf6027845
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 11:32:48 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem <dedekind@infradead.org>
Subject: [RFC] [PATCH take 2] UBI: dispose of background.c
Date: Fri, 2 Mar 2007 11:32:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703021132.43263.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

this patch moves the background unit code to the wear-leveling unit. The
kthread api is now used for handling the background thread.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/Kconfig.debug |    8 -
 drivers/mtd/ubi/Makefile      |    2 
 drivers/mtd/ubi/build.c       |   19 --
 drivers/mtd/ubi/debug.c       |   23 ---
 drivers/mtd/ubi/debug.h       |    6 
 drivers/mtd/ubi/eba.c         |    1 
 drivers/mtd/ubi/sysfs.c       |   30 ----
 drivers/mtd/ubi/ubi.h         |  139 +++++++------------
 drivers/mtd/ubi/wl.c          |  294 +++++++++++++++++++++++++++++++++++++++---
 9 files changed, 341 insertions(+), 181 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/build.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/build.c
@@ -41,8 +41,6 @@ int ubi_uif_init(struct ubi_info *ubi);
 void ubi_uif_close(struct ubi_info *ubi);
 int ubi_wl_init_scan(struct ubi_info *ubi, struct ubi_scan_info *si);
 void ubi_wl_close(struct ubi_info *ubi);
-int ubi_bgt_init(struct ubi_info *ubi);
-void ubi_bgt_close(struct ubi_info *ubi);
 int ubi_io_init(struct ubi_info *ubi, int mtd_num, int vid_hdr_offset,
 		int data_offset);
 void ubi_io_close(const struct ubi_info *ubi);
@@ -136,12 +134,10 @@ static void detach_mtd_dev(struct ubi_in
 
 	dbg_bld("detaching mtd%d from ubi%d", mtd_num, ubi_num);
 
-	ubi_bgt_kill_thread(ubi);
 	ubi_uif_close(ubi);
 	ubi_eba_close(ubi);
 	ubi_wl_close(ubi);
 	ubi_vmt_close(ubi);
-	ubi_bgt_close(ubi);
 	ubi_io_close(ubi);
 	kfree(ubis[ubi_num]);
 	ubis[ubi_num] = NULL;
@@ -228,17 +224,10 @@ static int attach_mtd_dev(const char *mt
 		goto out_free;
 	}
 
-	err = ubi_bgt_init(ubi);
-	if (err) {
-		dbg_err("failed to initialize background thread unit, error %d",
-			err);
-		goto out_io;
-	}
-
 	err = attach_by_scanning(ubi);
 	if (err) {
 		dbg_err("failed to attach MTD device, error %d", err);
-		goto out_bgt;
+		goto out_io;
 	}
 
 	err = ubi_beb_init(ubi);
@@ -279,18 +268,12 @@ static int attach_mtd_dev(const char *mt
 	ubi_msg("number of PEBs reserved for bad PEB handling: %d",
 		ubi->beb.reserved_pebs);
 
-	if (!DBG_DISABLE_BGT && !ubi->io.ro_mode)
-		ubi_bgt_enable(ubi);
-
 	return 0;
 
 out_detach:
 	ubi_eba_close(ubi);
 	ubi_wl_close(ubi);
 	ubi_vmt_close(ubi);
-out_bgt:
-	ubi_bgt_kill_thread(ubi);
-	ubi_bgt_close(ubi);
 out_io:
 	ubi_io_close(ubi);
 out_free:
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/ubi.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/ubi.h
@@ -369,75 +369,6 @@ int ubi_gluebi_vol_close(struct ubi_uif_
 #define ubi_gluebi_vol_close(vol)     ({int __ret; __ret = 0;})
 #endif
 
-
-/*
- * Background thread unit's stuff.
- *
- * ============================================================================
- */
-
-struct ubi_bgt_work;
-
-/**
- * ubi_bgt_worker_t - background worker function prototype.
- *
- * @ubi: the UBI device description object
- * @wrk: the work object pointer
- * @cancel: non-zero if the work has to be canceled
- *
- * If the @cancel argument is not zero, the worker has to free the resources
- * negative error code in case of failure.
- */
-typedef int ubi_bgt_worker_t(struct ubi_info *ubi, struct ubi_bgt_work *wrk,
-			     int cancel);
-
-/**
- * struct ubi_bgt_work - a background work.
- *
- * @list: a link in the list of pending works
- * @func: the worker function
- * @priv: private data of the worker function
- */
-struct ubi_bgt_work {
-	struct list_head list;
-	ubi_bgt_worker_t *func;
-	void *priv;
-};
-
-/**
- * struct ubi_bgt_info - UBI background thread unit description data structure.
- *
- * @pending_works: the list of pending works
- * @active_work: the work which is currently running
- * @pending_works_count: count of pending works
- * @lock: protects the @pending_works, @active_work, @enabled, and @task fields
- * @enabled: if the background thread is enabled
- * @task: a pointer to the &struct task_struct of the background thread
- * @bgt_name: the background thread name
- * @thread_start: used to synchronize with starting of the background thread
- * @thread_stop: used to synchronize with killing of the background thread
- * @wrk_mutex: serializes execution if background works
- */
-struct ubi_bgt_info {
-	struct list_head pending_works;   /* private */
-	struct ubi_bgt_work *active_work; /* private */
-	int pending_works_count;          /* public  */
-	spinlock_t lock;                  /* private */
-	int enabled;                      /* public  */
-	struct task_struct *task;         /* private */
-	char *bgt_name;                   /* public  */
-	struct completion thread_start;   /* private */
-	struct completion thread_stop;    /* private */
-	struct mutex wrk_mutex;           /* private */
-};
-
-int ubi_bgt_schedule(struct ubi_info *ubi, struct ubi_bgt_work *wrk);
-int ubi_bgt_reschedule(struct ubi_info *ubi, struct ubi_bgt_work *wrk);
-int ubi_bgt_do_work(struct ubi_info *ubi);
-int ubi_bgt_enable(struct ubi_info *ubi);
-void ubi_bgt_disable(struct ubi_info *ubi);
-void ubi_bgt_kill_thread(struct ubi_info *ubi);
-
 /*
  * Wear-leveling unit's stuff.
  *
@@ -504,6 +435,34 @@ struct ubi_wl_prot_entry {
 	struct ubi_wl_entry *e;
 };
 
+struct ubi_wl_work;
+
+/**
+ * ubi_wl_worker_t - background worker function prototype.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work object pointer
+ * @cancel: non-zero if the work has to be canceled
+ *
+ * If the @cancel argument is not zero, the worker has to free the resources
+ * negative error code in case of failure.
+ */
+typedef int ubi_wl_worker_t(struct ubi_info *ubi, struct ubi_wl_work *wrk,
+			     int cancel);
+
+/**
+ * struct ubi_wl_work - a background work.
+ *
+ * @list: a link in the list of pending works
+ * @func: the worker function
+ * @priv: private data of the worker function
+ */
+struct ubi_wl_work {
+	struct list_head list;
+	ubi_wl_worker_t *func;
+	void *priv;
+};
+
 /**
  * struct ubi_wl_erase_work - physical eraseblock erasure work description data
  * structure.
@@ -518,7 +477,7 @@ struct ubi_wl_prot_entry {
  * bad.
  */
 struct ubi_wl_erase_work {
-	struct ubi_bgt_work wrk;
+	struct ubi_wl_work wrk;
 	struct ubi_wl_entry *e;
 	int torture;
 };
@@ -541,6 +500,13 @@ struct ubi_wl_erase_work {
  * @abs_ec: the absolute erase counter
  * @move: if a physical eraseblock is being moved, it is referred to here
  * @max_ec: current highest erase counter value
+ * @pending_works: the list of pending works
+ * @active_work: the work which is currently running
+ * @pending_works_count: count of pending works
+ * @bgt_lock: protects @pending_works, @active_work, @enabled and @task
+ * @task: a pointer to the &struct task_struct of the background thread
+ * @bgt_name: the background thread name
+ * @wrk_mutex: serializes execution if background works
  *
  * Each physical eraseblock has 2 main states: free and used. The former state
  * corresponds to the @free RB-tree. The latter state is split up on several
@@ -554,20 +520,27 @@ struct ubi_wl_erase_work {
  * eraseblocks may be kept in one of those trees.
  */
 struct ubi_wl_info {
-	struct rb_root used;             /* private */
-	struct rb_root free;             /* private */
-	struct rb_root scrub;            /* private */
+	struct rb_root used;              /* private */
+	struct rb_root free;              /* private */
+	struct rb_root scrub;             /* private */
 	struct {
-		struct rb_root pnum;     /* private */
-		struct rb_root aec;      /* private */
+		struct rb_root pnum;      /* private */
+		struct rb_root aec;       /* private */
 	} prot;
-	spinlock_t lock;                 /* private */
-	int wl_scheduled;                /* private */
-	struct ubi_wl_entry **lookuptbl; /* private */
-	int erase_pending;               /* private */
-	unsigned long long abs_ec;       /* public  */
-	struct ubi_wl_entry *move;       /* private */
-	int max_ec;                      /* public  */
+	spinlock_t lock;                  /* private */
+	int wl_scheduled;                 /* private */
+	struct ubi_wl_entry **lookuptbl;  /* private */
+	int erase_pending;                /* private */
+	unsigned long long abs_ec;        /* public  */
+	struct ubi_wl_entry *move;        /* private */
+	int max_ec;                       /* public  */
+	struct list_head pending_works;   /* private */
+	struct ubi_wl_work *active_work;  /* private */
+	int pending_works_count;          /* public  */
+	spinlock_t bgt_lock;              /* private */
+	struct task_struct *task;         /* private */
+	char *bgt_name;                   /* public  */
+	struct mutex wrk_mutex;           /* private */
 };
 
 int ubi_wl_get_peb(struct ubi_info *ubi, enum ubi_data_type dtype);
@@ -642,7 +615,6 @@ int ubi_check_volume(struct ubi_info *ub
  *
  * @ubi_num: number of the UBI device
  * @io: input/output unit information
- * @bgt: background thread unit information
  * @wl: wear-leveling unit information
  * @beb: bad eraseblock handling unit information
  * @vmt: volume management unit information
@@ -655,7 +627,6 @@ int ubi_check_volume(struct ubi_info *ub
 struct ubi_info {
 	int ubi_num;
 	struct ubi_io_info   io;
-	struct ubi_bgt_info  bgt;
 	struct ubi_wl_info   wl;
 	struct ubi_beb_info  beb;
 	struct ubi_vmt_info  vmt;
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/sysfs.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/sysfs.c
@@ -75,8 +75,6 @@ static ssize_t dev_bad_peb_count_show(st
 static ssize_t dev_max_vol_count_show(struct class_device *dev, char *buf);
 static ssize_t dev_min_io_size_show(struct class_device *dev, char *buf);
 static ssize_t dev_bgt_enabled_show(struct class_device *dev, char *buf);
-static ssize_t dev_bgt_enabled_store(struct class_device *dev, const char *buf,
-				     size_t count);
 
 /*
  * Class device attributes corresponding to files in '/<sysfs>/class/ubi/ubiX'.
@@ -100,8 +98,7 @@ static struct class_device_attribute dev
 static struct class_device_attribute dev_min_io_size =
 	__ATTR(min_io_size, S_IRUGO, dev_min_io_size_show, NULL);
 static struct class_device_attribute dev_bgt_enabled =
-	__ATTR(bgt_enabled, S_IRUGO | S_IWUSR,
-	       dev_bgt_enabled_show, dev_bgt_enabled_store);
+	__ATTR(bgt_enabled, S_IRUGO, dev_bgt_enabled_show, NULL);
 
 /**
  * ubi_sysfs_init - initialize sysfs for an UBI device.
@@ -395,29 +392,14 @@ static ssize_t dev_min_io_size_show(stru
 static ssize_t dev_bgt_enabled_show(struct class_device *dev, char *buf)
 {
 	const struct ubi_info *ubi = dev2ubi(dev);
+	int enabled;
 
-	return sprintf(buf, "%d\n", ubi->bgt.enabled);
-}
-
-static ssize_t dev_bgt_enabled_store(struct class_device *dev, const char *buf,
-				     size_t count)
-{
-	struct ubi_info *ubi = dev2ubi(dev);
-
-	if (count > 2)
-		return -EINVAL;
-
-	if (count == 2 && buf[1] != '\n')
-		return -EINVAL;
-
-	if (buf[0] == '1')
-		ubi_bgt_enable(ubi);
-	else if (buf[0] == '0')
-		ubi_bgt_disable(ubi);
+	if (DBG_DISABLE_BGT || ubi->io.ro_mode)
+		enabled = 0;
 	else
-		return -EINVAL;
+		enabled = 1;
 
-	return count;
+	return sprintf(buf, "%d\n", enabled);
 }
 
 /**
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/Makefile
+++ dedekind-ubi-2.6/drivers/mtd/ubi/Makefile
@@ -1,7 +1,7 @@
 obj-$(CONFIG_MTD_UBI) += ubi.o
 
 ubi-y += badeb.o upd.o sysfs.o cdev.o uif.o vtbl.o volmgmt.o eba.o io.o wl.o
-ubi-y += scan.o background.o build.o account.o misc.o
+ubi-y += scan.o build.o account.o misc.o
 
 ubi-$(CONFIG_MTD_UBI_DEBUG) += debug.o
 ubi-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/debug.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/debug.h
@@ -63,9 +63,6 @@
 /* Wear-leveling unit */
 #define dbg_wl(fmt, ...) \
 	ubi_dbg_print(UBI_DBG_WL, __FUNCTION__, fmt, ##__VA_ARGS__)
-/* Background thread unit */
-#define dbg_bgt(fmt, ...) \
-	ubi_dbg_print(UBI_DBG_BGT, __FUNCTION__, fmt, ##__VA_ARGS__)
 /* Input/output unit */
 #define dbg_io(fmt, ...) \
 	ubi_dbg_print(UBI_DBG_IO, __FUNCTION__, fmt, ##__VA_ARGS__)
@@ -86,7 +83,6 @@
  * @UBI_DBG_ACC: a debugging message from the accounting unit
  * @UBI_DBG_EBA: a debugging message from the eraseblock association unit
  * @UBI_DBG_WL: a debugging message from the wear-leveling unit
- * @UBI_DBG_BGT: a debugging message from the background thread unit
  * @UBI_DBG_IO: a debugging message from the input/output unit
  * @UBI_DBG_BLD: a UBI build debugging message from the build unit
  * @UBI_DBG_SCAN: a debugging message from the scanning unit
@@ -99,7 +95,6 @@ enum {
 	UBI_DBG_ACC,
 	UBI_DBG_EBA,
 	UBI_DBG_WL,
-	UBI_DBG_BGT,
 	UBI_DBG_IO,
 	UBI_DBG_BLD,
 	UBI_DBG_SCAN
@@ -137,7 +132,6 @@ void __exit ubi_dbg_close(void);
 #define dbg_acc(fmt, ...)    ({})
 #define dbg_eba(fmt, ...)    ({})
 #define dbg_wl(fmt, ...)     ({})
-#define dbg_bgt(fmt, ...)    ({})
 #define dbg_io(fmt, ...)     ({})
 #define dbg_bld(fmt, ...)    ({})
 #define dbg_scan(fmt, ...)   ({})
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/wl.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/wl.c
@@ -35,10 +35,10 @@
  *
  * When physical eraseblocks are returned to the WL unit by means of the
  * 'ubi_wl_put_peb()' function, they are scheduled for erasure. The erasure is
- * not done synchronously. Instead, it is done in background in context of the
- * per-UBI device background thread (see the background thread unit). Actually,
- * the WL unit strongly depends on the background thread and cannot operate
- * without it.
+ * not done synchronously. Instead, it is done in background in context of a
+ * per-UBI device background thread, which is also managed by the WL unit.
+ * Actually, the WL unit strongly depends on the background thread and cannot
+ * operate without it.
  *
  * The wear-leveling is ensured by means of moving the contents of used
  * physical eraseblocks with low erase counter to free physical eraseblocks
@@ -75,6 +75,8 @@
 
 #include <linux/slab.h>
 #include <linux/crc32.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
 #include "ubi.h"
 
 /* Number of physical eraseblocks reserved for wear-leveling purposes */
@@ -108,6 +110,18 @@
  */
 #define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
 
+/* Background thread name pattern */
+#define WL_NAME_PATTERN "ubi_bgt%dd"
+
+/* Highest number of pending works for the background thread */
+#define WL_MAX_PENDING_WORKS 0x7FFFFFFF
+
+/*
+ * Maximum number of consecutive background thread failures which is enough to
+ * disable the background thread.
+ */
+#define WL_MAX_FAILURES 32
+
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID_WL
 static int paranoid_check_ec(const struct ubi_info *ubi, int pnum, int ec);
 static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
@@ -365,8 +379,7 @@ int ubi_wl_scrub_peb(struct ubi_info *ub
 	return ensure_wear_leveling(ubi);
 }
 
-static int erase_worker(struct ubi_info *ubi, struct ubi_bgt_work *wrk,
-			int cancel);
+static int bgt_do_work(struct ubi_info *ubi);
 
 /**
  * ubi_wl_flush - flush all pending works.
@@ -380,7 +393,7 @@ int ubi_wl_flush(struct ubi_info *ubi)
 {
 	int err, pending_count;
 
-	pending_count = ubi->bgt.pending_works_count;
+	pending_count = ubi->wl.pending_works_count;
 
 	dbg_wl("flush (%d pending works)", pending_count);
 
@@ -389,7 +402,7 @@ int ubi_wl_flush(struct ubi_info *ubi)
 	 * the number of currently pending works.
 	 */
 	while (pending_count-- > 0) {
-		err = ubi_bgt_do_work(ubi);
+		err = bgt_do_work(ubi);
 		if (unlikely(err))
 			return err;
 	}
@@ -397,6 +410,7 @@ int ubi_wl_flush(struct ubi_info *ubi)
 	return 0;
 }
 
+static int ubi_thread(void *u);
 static void tree_destroy(struct rb_root *root);
 
 /**
@@ -417,11 +431,32 @@ int ubi_wl_init_scan(struct ubi_info *ub
 	struct ubi_scan_leb *seb, *tmp;
 	struct ubi_wl_entry *e;
 
+
 	ubi->wl.used = ubi->wl.free = ubi->wl.scrub = RB_ROOT;
 	ubi->wl.prot.pnum = ubi->wl.prot.aec = RB_ROOT;
 	spin_lock_init(&ubi->wl.lock);
 	ubi->wl.max_ec = si->max_ec;
 
+	INIT_LIST_HEAD(&ubi->wl.pending_works);
+	spin_lock_init(&ubi->wl.bgt_lock);
+	mutex_init(&ubi->wl.wrk_mutex);
+
+	ubi->wl.bgt_name = kmalloc(sizeof(WL_NAME_PATTERN) + 20, GFP_KERNEL);
+	if (!ubi->wl.bgt_name)
+		return -ENOMEM;
+	sprintf(ubi->wl.bgt_name, WL_NAME_PATTERN, ubi->ubi_num);
+
+	ubi->wl.task = kthread_create(ubi_thread, ubi, ubi->wl.bgt_name);
+	if (IS_ERR(ubi->wl.task)) {
+		err = PTR_ERR(ubi->wl.task);
+		ubi_err("cannot spawn \"%s\", error %d", ubi->wl.bgt_name,
+			err);
+		goto out_free;
+	}
+
+	if (!DBG_DISABLE_BGT)
+		wake_up_process(ubi->wl.task);
+
 	if (ubis_num == 0) {
 		wl_entries_slab = kmem_cache_create("ubi_wl_entry_slab",
 						    sizeof(struct ubi_wl_entry),
@@ -527,6 +562,7 @@ int ubi_wl_init_scan(struct ubi_info *ub
 	return 0;
 
 out_free:
+	kfree(ubi->wl.bgt_name);
 	tree_destroy(&ubi->wl.used);
 	tree_destroy(&ubi->wl.free);
 	tree_destroy(&ubi->wl.scrub);
@@ -545,8 +581,16 @@ static void protection_trees_destroy(str
  */
 void ubi_wl_close(struct ubi_info *ubi)
 {
+	dbg_wl("disable \"%s\"", ubi->wl.bgt_name);
+	if (ubi->wl.task)
+		kthread_stop(ubi->wl.task);
+
 	dbg_wl("close the UBI wear-leveling unit");
 
+	ubi_assert(ubi->wl.pending_works_count == 0);
+	ubi_assert(list_empty(&ubi->wl.pending_works));
+
+	kfree(ubi->wl.bgt_name);
 	protection_trees_destroy(ubi);
 	tree_destroy(&ubi->wl.used);
 	tree_destroy(&ubi->wl.free);
@@ -801,7 +845,220 @@ static void prot_tree_del(struct ubi_inf
 	kfree(pe);
 }
 
-static int wear_leveling_worker(struct ubi_info *ubi, struct ubi_bgt_work *wrk,
+/**
+ * bgt_do_work - do one pending work.
+ *
+ * @ubi: the UBI device description object
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static int bgt_do_work(struct ubi_info *ubi)
+{
+	int err;
+	struct ubi_wl_work *wrk;
+
+	mutex_lock(&ubi->wl.wrk_mutex);
+
+	spin_lock(&ubi->wl.bgt_lock);
+
+	if (unlikely(ubi->wl.pending_works_count == 0)) {
+		err = 0;
+		goto out;
+	}
+
+	ubi->wl.active_work = wrk = list_entry(ubi->wl.pending_works.next,
+						struct ubi_wl_work, list);
+	list_del(&wrk->list);
+	ubi->wl.pending_works_count -= 1;
+	ubi_assert(ubi->wl.pending_works_count >= 0);
+	spin_unlock(&ubi->wl.bgt_lock);
+
+	/*
+	 * Call the worker function. Do not touch the work structure
+	 * after this call as it will have been freed or reused by that
+	 * time by the worker function.
+	 */
+	dbg_wl("%s: do work %p (func %p, priv %p)",
+		ubi->wl.bgt_name, wrk, wrk->func, wrk->priv);
+
+	err = wrk->func(ubi, wrk, 0);
+	if (unlikely(err))
+		ubi_err("a work failed with error code %d", err);
+
+	spin_lock(&ubi->wl.bgt_lock);
+	ubi->wl.active_work = NULL;
+out:
+	spin_unlock(&ubi->wl.bgt_lock);
+	mutex_unlock(&ubi->wl.wrk_mutex);
+	return err;
+}
+
+/**
+ * ubi_thread - UBI background thread.
+ *
+ * @u: the UBI device description object pointer
+ */
+static int ubi_thread(void *u)
+{
+	int failures = 0;
+	struct ubi_info *ubi = u;
+
+	ubi_msg("background thread \"%s\" started, PID %d",
+		ubi->wl.bgt_name, current->pid);
+
+	for (;;) {
+		if (unlikely(ubi->io.ro_mode) ||
+			     list_empty(&ubi->wl.pending_works)) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule();
+		}
+
+		if (kthread_should_stop())
+			goto out;
+
+		if (try_to_freeze())
+			continue;
+
+		spin_lock(&ubi->wl.bgt_lock);
+		while (ubi->wl.pending_works_count > 0 &&
+		       likely(!ubi->io.ro_mode)) {
+			int err;
+
+			ubi_assert(!list_empty(&ubi->wl.pending_works));
+			spin_unlock(&ubi->wl.bgt_lock);
+
+			cond_resched();
+
+			err = bgt_do_work(ubi);
+			if (unlikely(err)) {
+				ubi_err("%s: work failed with error code %d",
+					ubi->wl.bgt_name, err);
+				if (failures++ > WL_MAX_FAILURES) {
+					/*
+					 * Too many failures, disable the
+					 * thread and switch to read-only mode.
+					 */
+					ubi_msg("%d consecutive failures, "
+						"disable the background thread",
+						WL_MAX_FAILURES);
+					ubi_eba_ro_mode(ubi);
+					break;
+				} else
+					failures = 0;
+			}
+
+			spin_lock(&ubi->wl.bgt_lock);
+		}
+		spin_unlock(&ubi->wl.bgt_lock);
+
+		cond_resched();
+	}
+
+out:
+	dbg_wl("killing background thread \"%s\"", ubi->wl.bgt_name);
+
+	/* Cancel all pending works before exiting */
+	spin_lock(&ubi->wl.bgt_lock);
+	ubi->wl.task = NULL;
+
+	while (!list_empty(&ubi->wl.pending_works)) {
+		struct ubi_wl_work *wrk;
+
+		wrk = list_entry(ubi->wl.pending_works.next,
+				 struct ubi_wl_work, list);
+		list_del(&wrk->list);
+		ubi->wl.pending_works_count -= 1;
+		spin_unlock(&ubi->wl.bgt_lock);
+		wrk->func(ubi, wrk, 1);
+		spin_lock(&ubi->wl.bgt_lock);
+	}
+	spin_unlock(&ubi->wl.bgt_lock);
+
+	return 0;
+}
+
+/**
+ * bgt_schedule - schedule a work.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work to schedule
+ *
+ * This function enqueues a work defined by @wrk to the tail of the pending
+ * works list. Returns zero in case of success and %-ENODEV if the background
+ * thread was killed.
+ */
+static int bgt_schedule(struct ubi_info *ubi, struct ubi_wl_work *wrk)
+{
+	int err = 0;
+
+retry:
+	spin_lock(&ubi->wl.bgt_lock);
+	dbg_wl("%s: schedule work %p (func %p, priv %p)",
+		ubi->wl.bgt_name, wrk, wrk->func, wrk->priv);
+
+	if (unlikely(!ubi->wl.task)) {
+		ubi_err("task \"%s\" was killed", ubi->wl.bgt_name);
+		spin_unlock(&ubi->wl.bgt_lock);
+		return -ENODEV;
+	}
+
+	if (unlikely(ubi->wl.pending_works_count == WL_MAX_PENDING_WORKS)) {
+		/* Too many pending works */
+		spin_unlock(&ubi->wl.bgt_lock);
+		dbg_wl("pending queue is too long, do a work now");
+		err = bgt_do_work(ubi);
+		if (unlikely(err))
+			goto out;
+
+		cond_resched();
+		goto retry;
+	}
+
+	list_add_tail(&wrk->list, &ubi->wl.pending_works);
+	ubi->wl.pending_works_count += 1;
+
+	if (!ubi->wl.active_work && !DBG_DISABLE_BGT)
+		wake_up_process(ubi->wl.task);
+
+out:
+	spin_unlock(&ubi->wl.bgt_lock);
+	return err;
+}
+
+/**
+ * bgt_reschedule - re-schedule a work.
+ *
+ * @ubi: the UBI device description object
+ * @wrk: the work to re-schedule.
+ *
+ * This function enqueues a work defined by @wrk to the tail of the pending
+ * works list. Returns zero in case of success and %-ENODEV if the background
+ * thread was killed.
+ */
+static int bgt_reschedule(struct ubi_info *ubi, struct ubi_wl_work *wrk)
+{
+	spin_lock(&ubi->wl.bgt_lock);
+	dbg_wl("%s: re-schedule work %p (func %p, priv %p)",
+		ubi->wl.bgt_name, wrk, wrk->func, wrk->priv);
+
+	if (unlikely(!ubi->wl.task)) {
+		ubi_err("task \"%s\" was killed", ubi->wl.bgt_name);
+		spin_unlock(&ubi->wl.bgt_lock);
+		return -ENODEV;
+	}
+
+	list_add_tail(&wrk->list, &ubi->wl.pending_works);
+	ubi->wl.pending_works_count += 1;
+
+	if (!ubi->wl.active_work && !DBG_DISABLE_BGT) {
+		wake_up_process(ubi->wl.task);
+	}
+	spin_unlock(&ubi->wl.bgt_lock);
+	return 0;
+}
+
+static int wear_leveling_worker(struct ubi_info *ubi, struct ubi_wl_work *wrk,
 				int cancel);
 
 /**
@@ -818,7 +1075,7 @@ static int ensure_wear_leveling(struct u
 	int err = 0;
 	struct ubi_wl_entry *e1;
 	struct ubi_wl_entry *e2;
-	struct ubi_bgt_work *wrk;
+	struct ubi_wl_work *wrk;
 
 	spin_lock(&ubi->wl.lock);
 	if (ubi->wl.wl_scheduled)
@@ -852,14 +1109,14 @@ static int ensure_wear_leveling(struct u
 	ubi->wl.wl_scheduled = 1;
 	spin_unlock(&ubi->wl.lock);
 
-	wrk = kmalloc(sizeof(struct ubi_bgt_work), GFP_KERNEL);
+	wrk = kmalloc(sizeof(struct ubi_wl_work), GFP_KERNEL);
 	if (unlikely(!wrk)) {
 		err = -ENOMEM;
 		goto out_cancel;
 	}
 
 	wrk->func = &wear_leveling_worker;
-	err = ubi_bgt_schedule(ubi, wrk);
+	err = bgt_schedule(ubi, wrk);
 	if (unlikely(err)) {
 		/*
 		 * The background was thread is killed, don't clear the
@@ -882,6 +1139,9 @@ out_cancel:
 	return err;
 }
 
+static int erase_worker(struct ubi_info *ubi, struct ubi_wl_work *wrk,
+			int cancel);
+
 /**
  * schedule_erase - schedule an erase work.
  *
@@ -913,7 +1173,7 @@ static int schedule_erase(struct ubi_inf
 	wl_wrk->e = e;
 	wl_wrk->torture = torture;
 
-	err = ubi_bgt_schedule(ubi, &wl_wrk->wrk);
+	err = bgt_schedule(ubi, &wl_wrk->wrk);
 	if (unlikely(err)) {
 		/*
 		 * The background thread was killed, but we really need it. We
@@ -939,7 +1199,7 @@ static int sync_erase(struct ubi_info *u
  * case of failure. This function also takes care about marking the physical
  * eraseblock bad if it cannot be erased.
  */
-static int erase_worker(struct ubi_info *ubi, struct ubi_bgt_work *wrk,
+static int erase_worker(struct ubi_info *ubi, struct ubi_wl_work *wrk,
 			int cancel)
 {
 	int err;
@@ -987,7 +1247,7 @@ static int erase_worker(struct ubi_info 
 
 	if (err == -EINTR || err == -EAGAIN || err == -ENOMEM ||
 	    err == -EBUSY) {
-		ubi_bgt_reschedule(ubi, wrk); /* Must not return error */
+		bgt_reschedule(ubi, wrk); /* Must not return error */
 		return err;
 	}
 
@@ -1033,7 +1293,7 @@ static int erase_worker(struct ubi_info 
  * one. Returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int wear_leveling_worker(struct ubi_info *ubi, struct ubi_bgt_work *wrk,
+static int wear_leveling_worker(struct ubi_info *ubi, struct ubi_wl_work *wrk,
 				int cancel)
 {
 	int err, vol_id, lnum, scrub = 0, data_size, aldata_size;
@@ -1545,7 +1805,7 @@ static int produce_free(struct ubi_info 
 		spin_unlock(&ubi->wl.lock);
 
 		dbg_wl("do one work synchronously");
-		err = ubi_bgt_do_work(ubi);
+		err = bgt_do_work(ubi);
 		if (unlikely(err))
 			return err;
 
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/debug.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/debug.c
@@ -36,7 +36,6 @@
 #define UBI_DBG_ACC_PREF     "[UBI DBG acc]"
 #define UBI_DBG_EBA_PREF     "[UBI DBG eba]"
 #define UBI_DBG_WL_PREF      "[UBI DBG wl]"
-#define UBI_DBG_BGT_PREF     "[UBI DBG bgt]"
 #define UBI_DBG_IO_PREF      "[UBI DBG io]"
 #define UBI_DBG_BLD_PREF     "[UBI DBG bld]"
 #define UBI_DBG_SCAN_PREF    "[UBI DBG scan]"
@@ -76,11 +75,6 @@ static int wl_prints = 1;
 #else
 static int wl_prints;
 #endif
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_BGT
-static int bgt_prints = 1;
-#else
-static int bgt_prints;
-#endif
 #ifdef CONFIG_MTD_UBI_DEBUG_MSG_IO
 static int io_prints = 1;
 #else
@@ -136,8 +130,6 @@ static struct dentry *debugfs_acc_prints
 static struct dentry *debugfs_eba_prints;
 /* <debugfs>/ubi/wl_prints */
 static struct dentry *debugfs_wl_prints;
-/* <debugfs>/ubi/bgt_prints */
-static struct dentry *debugfs_bgt_prints;
 /* <debugfs>/ubi/io_prints */
 static struct dentry *debugfs_io_prints;
 /* <debugfs>/ubi/bld_prints */
@@ -199,15 +191,10 @@ int __init ubi_dbg_init(void)
 	if (!debugfs_wl_prints || IS_ERR(debugfs_wl_prints))
 		goto out_eba;
 
-	debugfs_bgt_prints = debugfs_create_bool("bgt_prints",
-		S_IFREG | S_IRUGO | S_IWUGO, debugfs_root, &bgt_prints);
-	if (!debugfs_bgt_prints || IS_ERR(debugfs_bgt_prints))
-		goto out_wl;
-
 	debugfs_io_prints = debugfs_create_bool("io_prints",
 		S_IFREG | S_IRUGO | S_IWUGO, debugfs_root, &io_prints);
 	if (!debugfs_io_prints || IS_ERR(debugfs_io_prints))
-		goto out_bgt;
+		goto out_wl;
 
 	debugfs_bld_prints = debugfs_create_bool("bld_prints",
 		S_IFREG | S_IRUGO | S_IWUGO, debugfs_root, &bld_prints);
@@ -225,8 +212,6 @@ out_bld:
 	debugfs_remove(debugfs_bld_prints);
 out_io:
 	debugfs_remove(debugfs_io_prints);
-out_bgt:
-	debugfs_remove(debugfs_bgt_prints);
 out_wl:
 	debugfs_remove(debugfs_wl_prints);
 out_eba:
@@ -255,7 +240,6 @@ void __exit ubi_dbg_close(void)
 	debugfs_remove(debugfs_scan_prints);
 	debugfs_remove(debugfs_bld_prints);
 	debugfs_remove(debugfs_io_prints);
-	debugfs_remove(debugfs_bgt_prints);
 	debugfs_remove(debugfs_wl_prints);
 	debugfs_remove(debugfs_eba_prints);
 	debugfs_remove(debugfs_acc_prints);
@@ -333,11 +317,6 @@ static void ubi_dbg_vprint_nolock(int ty
 			return;
 		prefix = UBI_DBG_WL_PREF;
 		break;
-	case UBI_DBG_BGT:
-		if (!bgt_prints)
-			return;
-		prefix = UBI_DBG_BGT_PREF;
-		break;
 	case UBI_DBG_IO:
 		if (!io_prints)
 			return;
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/eba.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/eba.c
@@ -941,7 +941,6 @@ int ubi_eba_leb_is_mapped(const struct u
  */
 void ubi_eba_ro_mode(struct ubi_info *ubi)
 {
-	ubi_bgt_disable(ubi);
 	ubi->io.ro_mode = 1;
 	ubi_warn("switched to read-only mode");
 }
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/Kconfig.debug
+++ dedekind-ubi-2.6/drivers/mtd/ubi/Kconfig.debug
@@ -123,14 +123,6 @@ config MTD_UBI_DEBUG_MSG_WL
 	  This option enables debugging messages from the UBI wear-leveling
 	  unit.
 
-config MTD_UBI_DEBUG_MSG_BGT
-	bool "Background thread unit messages"
-	default n
-	depends on MTD_UBI_DEBUG
-	help
-	  This option enables debugging messages from the UBI background thread
-	  unit.
-
 config MTD_UBI_DEBUG_MSG_IO
 	bool "Input/output unit messages"
 	default n
