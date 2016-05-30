Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7LwV-00048r-KQ
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 01/13] ubi: Undo "UBI: modify ubi_wl_flush function to clear
 work queue for a lnum"
Date: Mon, 30 May 2016 14:04:22 +0200
Message-Id: <1464609874-15488-2-git-send-email-richard@nod.at>
In-Reply-To: <1464609874-15488-1-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch undoes 62f384552b6756cf1ea71f8762d1e97dc77dbd90
("UBI: modify ubi_wl_flush function to clear work queue for a lnum"),
it was part of a larger series which tried to add encryption and secure undelete
to UBIFS. But except from this preparation patch, the series went never upstream.

While this commit offers very little functionality it makes maintenance hard as it
complicates the UBI worker logic. Let's rip it in favor to maintenance.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c  |  2 +-
 drivers/mtd/ubi/kapi.c  | 29 +------------------------
 drivers/mtd/ubi/ubi.h   |  2 +-
 drivers/mtd/ubi/upd.c   |  4 ++--
 drivers/mtd/ubi/vmt.c   |  2 +-
 drivers/mtd/ubi/wl.c    | 58 ++++++++++++++++---------------------------------
 include/linux/mtd/ubi.h |  1 -
 7 files changed, 25 insertions(+), 73 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index ee2b74d..7e49de9 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -495,7 +495,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		if (err)
 			break;
 
-		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
+		err = ubi_wl_flush(ubi);
 		break;
 	}
 
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 348dbbc..11ca859 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -624,7 +624,7 @@ int ubi_leb_erase(struct ubi_volume_desc *desc, int lnum)
 	if (err)
 		return err;
 
-	return ubi_wl_flush(ubi, vol->vol_id, lnum);
+	return ubi_wl_flush(ubi);
 }
 EXPORT_SYMBOL_GPL(ubi_leb_erase);
 
@@ -777,33 +777,6 @@ int ubi_sync(int ubi_num)
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
 
-/**
- * ubi_flush - flush UBI work queue.
- * @ubi_num: UBI device to flush work queue
- * @vol_id: volume id to flush for
- * @lnum: logical eraseblock number to flush for
- *
- * This function executes all pending works for a particular volume id / logical
- * eraseblock number pair. If either value is set to %UBI_ALL, then it acts as
- * a wildcard for all of the corresponding volume numbers or logical
- * eraseblock numbers. It returns zero in case of success and a negative error
- * code in case of failure.
- */
-int ubi_flush(int ubi_num, int vol_id, int lnum)
-{
-	struct ubi_device *ubi;
-	int err = 0;
-
-	ubi = ubi_get_device(ubi_num);
-	if (!ubi)
-		return -ENODEV;
-
-	err = ubi_wl_flush(ubi, vol_id, lnum);
-	ubi_put_device(ubi);
-	return err;
-}
-EXPORT_SYMBOL_GPL(ubi_flush);
-
 BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 61d4e99..c472aad 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -854,7 +854,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
-int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum);
+int ubi_wl_flush(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 0134ba3..6799cc4 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -149,7 +149,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 	}
 
 	if (bytes == 0) {
-		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
+		err = ubi_wl_flush(ubi);
 		if (err)
 			return err;
 
@@ -361,7 +361,7 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	ubi_assert(vol->upd_received <= vol->upd_bytes);
 	if (vol->upd_received == vol->upd_bytes) {
-		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
+		err = ubi_wl_flush(ubi);
 		if (err)
 			return err;
 		/* The update is finished, clear the update marker */
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 10059df..714e0b3 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -237,7 +237,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	 * Finish all pending erases because there may be some LEBs belonging
 	 * to the same volume ID.
 	 */
-	err = ubi_wl_flush(ubi, vol_id, UBI_ALL);
+	err = ubi_wl_flush(ubi);
 	if (err)
 		goto out_acc;
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 959c7b12..a54c3f4 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1331,54 +1331,23 @@ retry:
 /**
  * ubi_wl_flush - flush all pending works.
  * @ubi: UBI device description object
- * @vol_id: the volume id to flush for
- * @lnum: the logical eraseblock number to flush for
  *
- * This function executes all pending works for a particular volume id /
- * logical eraseblock number pair. If either value is set to %UBI_ALL, then it
- * acts as a wildcard for all of the corresponding volume numbers or logical
- * eraseblock numbers. It returns zero in case of success and a negative error
- * code in case of failure.
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
  */
-int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
+int ubi_wl_flush(struct ubi_device *ubi)
 {
 	int err = 0;
-	int found = 1;
 
 	/*
 	 * Erase while the pending works queue is not empty, but not more than
 	 * the number of currently pending works.
 	 */
-	dbg_wl("flush pending work for LEB %d:%d (%d pending works)",
-	       vol_id, lnum, ubi->works_count);
-
-	while (found) {
-		struct ubi_work *wrk, *tmp;
-		found = 0;
-
-		down_read(&ubi->work_sem);
-		spin_lock(&ubi->wl_lock);
-		list_for_each_entry_safe(wrk, tmp, &ubi->works, list) {
-			if ((vol_id == UBI_ALL || wrk->vol_id == vol_id) &&
-			    (lnum == UBI_ALL || wrk->lnum == lnum)) {
-				list_del(&wrk->list);
-				ubi->works_count -= 1;
-				ubi_assert(ubi->works_count >= 0);
-				spin_unlock(&ubi->wl_lock);
-
-				err = wrk->func(ubi, wrk, 0);
-				if (err) {
-					up_read(&ubi->work_sem);
-					return err;
-				}
-
-				spin_lock(&ubi->wl_lock);
-				found = 1;
-				break;
-			}
-		}
-		spin_unlock(&ubi->wl_lock);
-		up_read(&ubi->work_sem);
+	dbg_wl("flush (%d pending works)", ubi->works_count);
+	while (ubi->works_count) {
+		err = do_work(ubi);
+		if (err)
+			return err;
 	}
 
 	/*
@@ -1388,6 +1357,17 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 	down_write(&ubi->work_sem);
 	up_write(&ubi->work_sem);
 
+	/*
+	 * And in case last was the WL worker and it canceled the LEB
+	 * movement, flush again.
+	 */
+	while (ubi->works_count) {
+		dbg_wl("flush more (%d pending works)", ubi->works_count);
+		err = do_work(ubi);
+		if (err)
+			return err;
+	}
+
 	return err;
 }
 
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 1e271cb..2fe0f20 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -260,7 +260,6 @@ int ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum);
 int ubi_leb_map(struct ubi_volume_desc *desc, int lnum);
 int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
 int ubi_sync(int ubi_num);
-int ubi_flush(int ubi_num, int vol_id, int lnum);
 
 /*
  * This function is the same as the 'ubi_leb_read()' function, but it does not
-- 
2.7.3
