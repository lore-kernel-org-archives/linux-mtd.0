From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] UBI: Do not use outdated fastmaps to attach
Date: Tue,  5 Dec 2017 11:05:25 +0100
Message-Id: <20171205100525.6253-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a fastmap gets updated, then it can happen that no free
PEB for a new fastmap anchor is available. In this case we reuse
the current fastmap anchor PEB. We are only allowed to do that
though when we made sure that no outdated fastmap PEBs are in
the erase worker queue. Otherwise an outdated fastmap anchor may
be used to attach the device when an unclean reboot happens right
after we have erased the current fastmap anchor.

This patch synchronously erases all pending erase work which belongs
to outdated fastmap anchors. This way we make sure that when the
current fastmap anchor PEB gets erased, no older fastmap anchors
are on the device.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/ubi/fastmap-wl.c |  2 +-
 drivers/mtd/ubi/fastmap.c    | 14 ++++++++++++++
 drivers/mtd/ubi/ubi.h        |  1 +
 drivers/mtd/ubi/wl.c         | 39 ++++++++++++++++++++++++++++++++++++++-
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 4f0bd6b4422a..68966f6e09ba 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -295,7 +295,7 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 	ubi->wl_scheduled = 1;
 	spin_unlock(&ubi->wl_lock);
 
-	wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	wrk = kzalloc(sizeof(struct ubi_work), GFP_NOFS);
 	if (!wrk) {
 		spin_lock(&ubi->wl_lock);
 		ubi->wl_scheduled = 0;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 5a832bc79b1b..a1e16ebcfa13 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1611,6 +1611,20 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	tmp_e = ubi_wl_get_fm_peb(ubi, 1);
 	spin_unlock(&ubi->wl_lock);
 
+	if (!tmp_e) {
+		/*
+		 * No anchor PEB found. Before we reuse the old one make sure
+		 * that we do not have any outdated fastmaps lying around which
+		 * might be used to attach the device when an unclean reboot
+		 * happens after we've erased the old fastmap.
+		 */
+		ubi_wl_flush_anchor_work(ubi);
+
+		spin_lock(&ubi->wl_lock);
+		tmp_e = ubi_wl_get_fm_peb(ubi, 1);
+		spin_unlock(&ubi->wl_lock);
+	}
+
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 5fe62653995e..4b1b7de00290 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -908,6 +908,7 @@ int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
 int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum);
+void ubi_wl_flush_anchor_work(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b5b8cd6f481c..1b7949a01e58 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1031,7 +1031,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 	ubi->wl_scheduled = 1;
 	spin_unlock(&ubi->wl_lock);
 
-	wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	wrk = kzalloc(sizeof(struct ubi_work), GFP_NOFS);
 	if (!wrk) {
 		err = -ENOMEM;
 		goto out_cancel;
@@ -1420,6 +1420,43 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 }
 
 /**
+ * ubi_wl_flush_anchor_work - flush all works belonging to outfdated fastmaps.
+ * @ubi: UBI device description object
+ *
+ * This function synchronously erases all eraseblocks belonging to outdated
+ * fastmaps. This becomes necessary when we want to write a new fastmap anchor,
+ * but do not find a free eraseblock for it.
+ */
+void ubi_wl_flush_anchor_work(struct ubi_device *ubi)
+{
+	struct ubi_work *wrk, *tmp;
+	int err;
+
+	spin_lock(&ubi->wl_lock);
+
+	list_for_each_entry_safe(wrk, tmp, &ubi->works, list) {
+		if (!ubi_is_fm_vol(wrk->vol_id))
+			continue;
+
+		if (!wrk->e)
+			continue;
+
+		if (ubi_find_fm_block(ubi, wrk->e->pnum))
+			continue;
+
+		list_del(&wrk->list);
+		ubi->works_count -= 1;
+		ubi_assert(ubi->works_count >= 0);
+
+		spin_unlock(&ubi->wl_lock);
+
+		wrk->func(ubi, wrk, 0);
+	}
+
+	spin_unlock(&ubi->wl_lock);
+}
+
+/**
  * tree_destroy - destroy an RB-tree.
  * @ubi: UBI device description object
  * @root: the root of the tree to destroy
-- 
2.11.0
