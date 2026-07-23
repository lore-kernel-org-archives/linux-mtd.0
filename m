Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A3C531C7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUKgJw92lOJEfB/VhXWtjjtXnZF9VrO96HU4ZS4h0dw=; b=olRIcxlJCx0Ps5
	LPNYg/Dkw5mRKky36JziSz1edPU2lpXD7hmksk/qOIJ/wmDWKuD/cv6dIENr/xA8kL3uSo3HPqwR8
	NHS0am0Cyk4Ffk8Q5cowcOdhv/FjBBpKF5QFUJQq1bIbE2r8whcFLTmZSr364sn/vnhAfbDNTAC+1
	X0cG+aonTJppnLco2bM0t0f+vU3cK6np58Wy85IEUSW3u+VMqYR3sesIbNTX8aG90srDUPzHbXogb
	nGcw9RFFDZmF0nvGOfDi0pUI/pdw+UFBMl8Ssp91kpdih5TG8tasGuhvzut4zXx0zQgZ21vvwCNp9
	8fyThtkL6oh2S0bV+KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiuw-0000000DCMZ-2N8w;
	Thu, 23 Jul 2026 02:12:10 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiuo-0000000DCJT-1Ij6
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 02:12:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JqVTkYvB8QABU18J5BcqodZ9DlEBZ5e37d6moIjZeDE=;
	b=HsKKhQwkbo1YctVJ0rA+vghUcH7L0q+hf13HfkM3bd1oRDqU4lEbbiLin2HIBGLmCLRAXvaR4
	mp8GnYdeLj/St+zyis3/DwVTDeCe5ajmDmIRXd8zLbF6cMSxtQUHULXSicNx/8hsCRCHtF1I0qE
	2OISGM6LOpPrVJH4Vc0mwcc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h5DsN3Gclz1T4GP;
	Thu, 23 Jul 2026 10:02:32 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BF112025F;
	Thu, 23 Jul 2026 10:11:54 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Jul
 2026 10:11:53 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<vapier@gentoo.org>, <artem.bityutskiy@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] UBI: support per-device wear-leveling threshold
Date: Thu, 23 Jul 2026 10:02:33 +0800
Message-ID: <20260723020233.3079997-3-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260723020233.3079997-1-ranhongyun1@huawei.com>
References: <20260723020233.3079997-1-ranhongyun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemr200001.china.huawei.com (7.185.36.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_191205_897874_38EFCF95 
X-CRM114-Status: GOOD (  32.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The UBI wear-leveling threshold (CONFIG_MTD_UBI_WL_THRESHOLD) is
currently a compile-time constant shared by all UBI devices. When a
single kernel image must support multiple NAND flashes with different
erase lifetimes, one global threshold cannot suit all devices.

Add a per-device configurable wl_threshold parameter:

  - UAPI: add __s32 wl_threshold to struct ubi_attach_req, carved
    from the existing padding.

  - Module parameter: ubi.mtd gains a new optional token
    "wl_threshold":
      ubi.mtd=0,0,0,0,0,0,256  ubi.mtd=1,0,0,0,0,0,4096

0 means "use the kernel default", the accepted range is
2-65536.

Signed-off-by: Ran Hongyun <ranhongyun1@huawei.com>
---
 drivers/mtd/ubi/build.c      | 43 ++++++++++++++++++++++++++++++------
 drivers/mtd/ubi/cdev.c       |  2 +-
 drivers/mtd/ubi/fastmap-wl.c |  8 +++----
 drivers/mtd/ubi/ubi.h        | 21 +++++++++++++++++-
 drivers/mtd/ubi/wl.c         | 39 ++++++++------------------------
 include/uapi/mtd/ubi-user.h  | 10 ++++++++-
 6 files changed, 79 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8e5f178168cb..ed0216f70220 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -36,7 +36,7 @@
 #define MTD_PARAM_LEN_MAX 64
 
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
-#define MTD_PARAM_MAX_COUNT 6
+#define MTD_PARAM_MAX_COUNT 7
 
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
@@ -56,6 +56,7 @@
  * @max_beb_per1024: maximum expected number of bad PEBs per 1024 PEBs
  * @enable_fm: enable fastmap when value is non-zero
  * @need_resv_pool: reserve pool->max_size pebs when value is none-zero
+ * @wl_threshold: wear-leveling threshold, 0 means use CONFIG_MTD_UBI_WL_THRESHOLD
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
@@ -64,6 +65,7 @@ struct mtd_dev_param {
 	int max_beb_per1024;
 	int enable_fm;
 	int need_resv_pool;
+	int wl_threshold;
 };
 
 /* Numbers of elements set in the @mtd_dev_param array */
@@ -832,6 +834,8 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @disable_fm: whether disable fastmap
  * @need_resv_pool: whether reserve pebs to fill fm_pool
+ * @wl_threshold: wear-leveling threshold for this UBI device; 0 means use
+ *		   %CONFIG_MTD_UBI_WL_THRESHOLD; accepted range is 2-65536
  *
  * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
@@ -848,7 +852,7 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		       int vid_hdr_offset, int max_beb_per1024, bool disable_fm,
-		       bool need_resv_pool)
+		       bool need_resv_pool, int wl_threshold)
 {
 	struct ubi_device *ubi;
 	int i, err;
@@ -859,6 +863,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (!max_beb_per1024)
 		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
 
+	if (!wl_threshold)
+		wl_threshold = CONFIG_MTD_UBI_WL_THRESHOLD;
+
+	if (wl_threshold < 2 || wl_threshold > 65536) {
+		pr_err("ubi: bad wear-leveling threshold %d\n",
+		       wl_threshold);
+		return -EINVAL;
+	}
+
 	/*
 	 * Check if we already have the same MTD device attached.
 	 *
@@ -944,6 +957,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	ubi->ubi_num = ubi_num;
 	ubi->vid_hdr_offset = vid_hdr_offset;
 	ubi->autoresize_vol_id = -1;
+	ubi->wl_threshold = wl_threshold;
+	ubi->wl_free_max_diff = wl_threshold * 2;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	ubi->fm_pool.used = ubi->fm_pool.size = 0;
@@ -1044,7 +1059,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		ubi->vol_count - UBI_INT_VOL_COUNT, UBI_INT_VOL_COUNT,
 		ubi->vtbl_slots);
 	ubi_msg(ubi, "max/mean erase counter: %d/%d, WL threshold: %d, image sequence number: %u",
-		ubi->max_ec, ubi->mean_ec, CONFIG_MTD_UBI_WL_THRESHOLD,
+		ubi->max_ec, ubi->mean_ec, ubi->wl_threshold,
 		ubi->image_seq);
 	ubi_msg(ubi, "available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
 		ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
@@ -1247,7 +1262,7 @@ static void ubi_notify_add(struct mtd_info *mtd)
 
 	/* called while holding mtd_table_mutex */
 	mutex_lock_nested(&ubi_devices_mutex, SINGLE_DEPTH_NESTING);
-	err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO, 0, 0, false, false);
+	err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO, 0, 0, false, false, 0);
 	mutex_unlock(&ubi_devices_mutex);
 	if (err < 0)
 		__put_mtd_device(mtd);
@@ -1289,7 +1304,8 @@ static int __init ubi_init_attach(void)
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024,
 					 p->enable_fm == 0,
-					 p->need_resv_pool != 0);
+					 p->need_resv_pool != 0,
+					 p->wl_threshold);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
@@ -1569,12 +1585,24 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	} else
 		p->need_resv_pool = 0;
 
+	token = tokens[6];
+	if (token) {
+		int err = kstrtoint(token, 10, &p->wl_threshold);
+
+		if (err) {
+			pr_err("UBI error: bad value for wl_threshold parameter: %s\n",
+				token);
+			return -EINVAL;
+		}
+	} else
+		p->wl_threshold = 0;
+
 	mtd_devs += 1;
 	return 0;
 }
 
 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 0400);
-MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024[,ubi_num[,enable_fm[,need_resv_pool]]]]].\n"
+MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024[,ubi_num[,enable_fm[,need_resv_pool[,wl_threshold]]]]]].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
 		      "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"
 		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID header position to be used by UBI. (default value if 0)\n"
@@ -1589,7 +1617,8 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      "Example 3: mtd=/dev/mtd1,0,25 - attach MTD device /dev/mtd1 using default VID header offset and reserve 25*nand_size_in_blocks/1024 erase blocks for bad block handling.\n"
 		      "\t(e.g. if the NAND *chipset* has 4096 PEB, 100 will be reserved for this UBI device).\n"
 		      "Example 4: mtd=/dev/mtd1,0,0,5 - attach MTD device /dev/mtd1 to UBI 5 and using default values for the other fields.\n"
-		      "example 5: mtd=1,0,0,5 mtd=2,0,0,6,1 - attach MTD device /dev/mtd1 to UBI 5 and disable fastmap; attach MTD device /dev/mtd2 to UBI 6 and enable fastmap.(only works when fastmap is enabled and fm_autoconvert=Y).\n");
+		      "example 5: mtd=1,0,0,5 mtd=2,0,0,6,1 - attach MTD device /dev/mtd1 to UBI 5 and disable fastmap; attach MTD device /dev/mtd2 to UBI 6 and enable fastmap.(only works when fastmap is enabled and fm_autoconvert=Y).\n"
+		      "Example 6: mtd=/dev/mtd0,0,0,0,0,0,256 mtd=/dev/mtd1,0,0,0,0,0,4096 - attach MTD device /dev/mtd0 with wear-leveling threshold 256, and MTD device /dev/mtd1 with threshold 4096.\n");
 #ifdef CONFIG_MTD_UBI_FASTMAP
 module_param(fm_autoconvert, bool, 0644);
 MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatically on images without a fastmap.");
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index fd39030dbf89..54acd8394d67 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1112,7 +1112,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
 					 req.max_beb_per1024, !!req.disable_fm,
-					 !!req.need_resv_pool);
+					 !!req.need_resv_pool, req.wl_threshold);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index a0f750411f9d..e24bb6b18e90 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -238,7 +238,7 @@ void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 			if (left_free <= 0)
 				break;
 
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF,
+			e = find_wl_entry(ubi, &ubi->free, ubi->wl_free_max_diff,
 					  !can_fill_pools(ubi, left_free));
 			self_check_in_wl_tree(ubi, e, &ubi->free);
 			rb_erase(&e->u.rb, &ubi->free);
@@ -392,18 +392,18 @@ static bool need_wear_leveling(struct ubi_device *ubi)
 	if (!e) {
 		if (!ubi->free.rb_node)
 			return false;
-		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
+		e = find_wl_entry(ubi, &ubi->free, ubi->wl_free_max_diff, 0);
 		ec = e->ec;
 	} else {
 		ec = e->ec;
 		if (ubi->free.rb_node) {
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
+			e = find_wl_entry(ubi, &ubi->free, ubi->wl_free_max_diff, 0);
 			ec = max(ec, e->ec);
 		}
 	}
 	e = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
 
-	return ec - e->ec >= UBI_WL_THRESHOLD;
+	return ec - e->ec >= ubi->wl_threshold;
 }
 
 /* get_peb_for_wl - returns a PEB to be used internally by the WL sub-system.
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index af466cd83ae0..62026931d05e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -516,6 +516,22 @@ struct ubi_debug_info {
  * @bgt_thread: background thread description object
  * @thread_enabled: if the background thread is enabled
  * @bgt_name: background thread name
+ * @wl_threshold: Maximum difference between two erase counters. If this
+ *		   threshold is exceeded, the WL sub-system starts moving
+ *		   data from used physical eraseblocks with low erase
+ *		   counter to free physical eraseblocks with high erase counter.
+ * @wl_free_max_diff: When a physical eraseblock is moved, the WL sub-system
+ *		       has to pick the target physical eraseblock to move to.
+ *		       The simplest way would be just to pick the one with the
+ *		       highest erase counter. But in certain workloads this
+ *		       could lead to an unlimited wear of one or few physical
+ *		       eraseblock. Indeed, imagine a situation when the picked
+ *		       physical eraseblock is constantly erased after the
+ *		       data is written to it. So, we have a constant which
+ *		       limits the highest erase counter of the free physical
+ *		       eraseblock to pick. Namely, the WL sub-system does not
+ *		       pick eraseblocks with erase counter greater than the
+ *		       lowest erase counter plus @wl_free_max_diff.
  *
  * @flash_size: underlying MTD device size (in bytes)
  * @peb_count: count of physical eraseblocks on the MTD device
@@ -623,6 +639,8 @@ struct ubi_device {
 	struct task_struct *bgt_thread;
 	int thread_enabled;
 	char bgt_name[sizeof(UBI_BGT_NAME_PATTERN)+2];
+	int wl_threshold;
+	int wl_free_max_diff;
 
 	/* I/O sub-system's stuff */
 	long long flash_size;
@@ -938,7 +956,8 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 /* build.c */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		       int vid_hdr_offset, int max_beb_per1024,
-		       bool disable_fm, bool need_resv_pool);
+		       bool disable_fm, bool need_resv_pool,
+		       int wl_threshold);
 int ubi_detach_mtd_dev(int ubi_num, int anyway);
 struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index e3705db8e570..4e18044a20c0 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -95,27 +95,6 @@
 /* Number of physical eraseblocks reserved for wear-leveling purposes */
 #define WL_RESERVED_PEBS 1
 
-/*
- * Maximum difference between two erase counters. If this threshold is
- * exceeded, the WL sub-system starts moving data from used physical
- * eraseblocks with low erase counter to free physical eraseblocks with high
- * erase counter.
- */
-#define UBI_WL_THRESHOLD CONFIG_MTD_UBI_WL_THRESHOLD
-
-/*
- * When a physical eraseblock is moved, the WL sub-system has to pick the target
- * physical eraseblock to move to. The simplest way would be just to pick the
- * one with the highest erase counter. But in certain workloads this could lead
- * to an unlimited wear of one or few physical eraseblock. Indeed, imagine a
- * situation when the picked physical eraseblock is constantly erased after the
- * data is written to it. So, we have a constant which limits the highest erase
- * counter of the free physical eraseblock to pick. Namely, the WL sub-system
- * does not pick eraseblocks with erase counter greater than the lowest erase
- * counter plus %WL_FREE_MAX_DIFF.
- */
-#define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)
-
 /*
  * Maximum number of consecutive background thread failures which is enough to
  * switch to read-only mode.
@@ -358,7 +337,7 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
  *
  * This function looks for a wear leveling entry with medium erase counter,
  * but not greater or equivalent than the lowest erase counter plus
- * %WL_FREE_MAX_DIFF/2.
+ * @ubi->wl_free_max_diff/2.
  */
 static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 					       struct rb_root *root)
@@ -368,7 +347,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 	first = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
 	last = rb_entry(rb_last(root), struct ubi_wl_entry, u.rb);
 
-	if (last->ec - first->ec < WL_FREE_MAX_DIFF) {
+	if (last->ec - first->ec < ubi->wl_free_max_diff) {
 		e = rb_entry(root->rb_node, struct ubi_wl_entry, u.rb);
 
 		/*
@@ -379,7 +358,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 		 */
 		e = may_reserve_for_fm(ubi, e, root);
 	} else
-		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2, 0);
+		e = find_wl_entry(ubi, root, ubi->wl_free_max_diff/2, 0);
 
 	return e;
 }
@@ -706,7 +685,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	e1 = find_anchor_wl_entry(&ubi->used);
 	if (e1 && ubi->fm_anchor &&
-	    (ubi->fm_anchor->ec - e1->ec >= UBI_WL_THRESHOLD)) {
+	    (ubi->fm_anchor->ec - e1->ec >= ubi->wl_threshold)) {
 		ubi->fm_do_produce_anchor = 1;
 		/*
 		 * fm_anchor is no longer considered a good anchor.
@@ -743,7 +722,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		if (!e2)
 			goto out_cancel;
 
-		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
+		if (!(e2->ec - e1->ec >= ubi->wl_threshold)) {
 			dbg_wl("no WL needed: min used EC %d, max free EC %d",
 			       e1->ec, e2->ec);
 
@@ -1056,12 +1035,12 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 		 * We schedule wear-leveling only if the difference between the
 		 * lowest erase counter of used physical eraseblocks and a high
 		 * erase counter of free physical eraseblocks is greater than
-		 * %UBI_WL_THRESHOLD.
+		 * @ubi->wl_threshold.
 		 */
 		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
-		e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
+		e2 = find_wl_entry(ubi, &ubi->free, ubi->wl_free_max_diff, 0);
 
-		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
+		if (!(e2->ec - e1->ec >= ubi->wl_threshold))
 			goto out_unlock;
 #endif
 		dbg_wl("schedule wear-leveling");
@@ -2090,7 +2069,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 {
 	struct ubi_wl_entry *e;
 
-	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
+	e = find_wl_entry(ubi, &ubi->free, ubi->wl_free_max_diff, 0);
 	self_check_in_wl_tree(ubi, e, &ubi->free);
 	ubi->free_count--;
 	ubi_assert(ubi->free_count >= 0);
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index aa872a41ffb9..3538e11b5175 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -289,6 +289,13 @@ enum {
  * If @disable_fm is not zero, ubi doesn't create new fastmap even the module
  * param 'fm_autoconvert' is set, and existed old fastmap will be destroyed
  * after doing full scanning.
+ *
+ * The @wl_threshold defines the maximum difference between the highest and the
+ * lowest erase counter value of eraseblocks of this UBI device. When this
+ * threshold is exceeded, UBI starts performing wear leveling by means of
+ * moving data from eraseblock with low erase counter to eraseblocks with high
+ * erase counter. If @wl_threshold is zero, the default kernel value of
+ * %CONFIG_MTD_UBI_WL_THRESHOLD is used. The accepted range is 2-65536.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
@@ -297,7 +304,8 @@ struct ubi_attach_req {
 	__s16 max_beb_per1024;
 	__s8 disable_fm;
 	__s8 need_resv_pool;
-	__s8 padding[8];
+	__s32 wl_threshold;
+	__s8 padding[4];
 };
 
 /*
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
