Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005KY-ID
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/13] ubi: Remove lnum and vol_id from erase work
Date: Mon, 30 May 2016 14:04:29 +0200
Message-Id: <1464609874-15488-9-git-send-email-richard@nod.at>
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

This has no value except more or less useful debug
output. And with MLC NAND a PEB can carry more than
one lnum/vol_id.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c        | 16 ++++++-------
 drivers/mtd/ubi/fastmap-wl.c |  2 +-
 drivers/mtd/ubi/ubi.h        |  5 +---
 drivers/mtd/ubi/wl.c         | 55 ++++++++++++++++++++++++--------------------
 4 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 32938aa..229be7c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -343,7 +343,7 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 	down_read(&ubi->fm_eba_sem);
 	vol->eba_tbl[lnum] = UBI_LEB_UNMAPPED;
 	up_read(&ubi->fm_eba_sem);
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 0);
+	err = ubi_wl_put_peb(ubi, pnum, 0);
 
 out_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
@@ -633,7 +633,7 @@ retry:
 
 	vol->eba_tbl[lnum] = new_pnum;
 	up_read(&ubi->fm_eba_sem);
-	ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+	ubi_wl_put_peb(ubi, vol_id, 1);
 
 	ubi_msg(ubi, "data was successfully recovered");
 	return 0;
@@ -641,7 +641,7 @@ retry:
 out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
 out_put:
-	ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
+	ubi_wl_put_peb(ubi, new_pnum, 1);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
 
@@ -651,7 +651,7 @@ write_error:
 	 * get another one.
 	 */
 	ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
-	ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
+	ubi_wl_put_peb(ubi, new_pnum, 1);
 	if (++tries > UBI_IO_RETRIES) {
 		ubi_free_vid_hdr(ubi, vid_hdr);
 		return err;
@@ -772,7 +772,7 @@ write_error:
 	 * eraseblock, so just put it and request a new one. We assume that if
 	 * this physical eraseblock went bad, the erase code will handle that.
 	 */
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+	err = ubi_wl_put_peb(ubi, pnum, 1);
 	if (err || ++tries > UBI_IO_RETRIES) {
 		ubi_ro_mode(ubi);
 		leb_write_unlock(ubi, vol_id, lnum);
@@ -894,7 +894,7 @@ write_error:
 		return err;
 	}
 
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+	err = ubi_wl_put_peb(ubi, pnum, 1);
 	if (err || ++tries > UBI_IO_RETRIES) {
 		ubi_ro_mode(ubi);
 		leb_write_unlock(ubi, vol_id, lnum);
@@ -994,7 +994,7 @@ retry:
 	up_read(&ubi->fm_eba_sem);
 
 	if (old_pnum >= 0) {
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, old_pnum, 0);
+		err = ubi_wl_put_peb(ubi, old_pnum, 0);
 		if (err)
 			goto out_leb_unlock;
 	}
@@ -1016,7 +1016,7 @@ write_error:
 		goto out_leb_unlock;
 	}
 
-	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+	err = ubi_wl_put_peb(ubi, pnum, 1);
 	if (err || ++tries > UBI_IO_RETRIES) {
 		ubi_ro_mode(ubi);
 		goto out_leb_unlock;
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index f6dc426..cafa7b0 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -342,7 +342,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
 	spin_unlock(&ubi->wl_lock);
 
 	vol_id = lnum ? UBI_FM_DATA_VOLUME_ID : UBI_FM_SB_VOLUME_ID;
-	return schedule_erase(ubi, e, vol_id, lnum, torture);
+	return schedule_erase(ubi, e, torture);
 }
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0f57786..c901cc0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -774,8 +774,6 @@ struct ubi_work {
 	struct kref ref;
 	/* The below fields are only relevant to erasure works */
 	struct ubi_wl_entry *e;
-	int vol_id;
-	int lnum;
 	int torture;
 	int anchor;
 };
@@ -857,8 +855,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi);
-int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
-		   int pnum, int torture);
+int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 35196c8..7d42739 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -481,19 +481,36 @@ repeat:
 static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 			int shutdown);
 
+static struct ubi_work *ubi_alloc_erase_work(struct ubi_device *ubi,
+					     struct ubi_wl_entry *e,
+					     int torture)
+{
+	struct ubi_work *wl_wrk;
+
+	ubi_assert(e);
+
+	wl_wrk = ubi_alloc_work(ubi);
+	if (!wl_wrk)
+		return NULL;
+
+	wl_wrk->func = &erase_worker;
+	wl_wrk->e = e;
+	wl_wrk->torture = torture;
+
+	return wl_wrk;
+}
+
 /**
  * schedule_erase - schedule an erase work.
  * @ubi: UBI device description object
  * @e: the WL entry of the physical eraseblock to erase
- * @vol_id: the volume ID that last used this PEB
- * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
  *
  * This function returns zero in case of success and a %-ENOMEM in case of
  * failure.
  */
 static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			  int vol_id, int lnum, int torture)
+			  int torture)
 {
 	struct ubi_work *wl_wrk;
 
@@ -502,14 +519,12 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
 	       e->pnum, e->ec, torture);
 
-	wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	wl_wrk = ubi_alloc_erase_work(ubi, e, torture);
 	if (!wl_wrk)
 		return -ENOMEM;
 
 	wl_wrk->func = &erase_worker;
 	wl_wrk->e = e;
-	wl_wrk->vol_id = vol_id;
-	wl_wrk->lnum = lnum;
 	wl_wrk->torture = torture;
 
 	ubi_schedule_work(ubi, wl_wrk);
@@ -522,13 +537,11 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk);
  * do_sync_erase - run the erase worker synchronously.
  * @ubi: UBI device description object
  * @e: the WL entry of the physical eraseblock to erase
- * @vol_id: the volume ID that last used this PEB
- * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
  *
  */
 static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			 int vol_id, int lnum, int torture)
+			 int torture)
 {
 	struct ubi_work *wl_wrk;
 
@@ -539,8 +552,6 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 		return -ENOMEM;
 
 	wl_wrk->e = e;
-	wl_wrk->vol_id = vol_id;
-	wl_wrk->lnum = lnum;
 	wl_wrk->torture = torture;
 
 	return __erase_worker(ubi, wl_wrk);
@@ -775,7 +786,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	ubi->move_to_put = ubi->wl_scheduled = 0;
 	spin_unlock(&ubi->wl_lock);
 
-	err = do_sync_erase(ubi, e1, vol_id, lnum, 0);
+	err = do_sync_erase(ubi, e1, 0);
 	if (err) {
 		if (e2)
 			wl_entry_destroy(ubi, e2);
@@ -789,7 +800,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 */
 		dbg_wl("PEB %d (LEB %d:%d) was put meanwhile, erase",
 		       e2->pnum, vol_id, lnum);
-		err = do_sync_erase(ubi, e2, vol_id, lnum, 0);
+		err = do_sync_erase(ubi, e2, 0);
 		if (err)
 			goto out_ro;
 	}
@@ -834,7 +845,7 @@ out_not_moved:
 	if (dst_leb_clean) {
 		ensure_wear_leveling(ubi);
 	} else {
-		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
+		err = do_sync_erase(ubi, e2, torture);
 		if (err)
 			goto out_ro;
 	}
@@ -955,12 +966,9 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 {
 	struct ubi_wl_entry *e = wl_wrk->e;
 	int pnum = e->pnum;
-	int vol_id = wl_wrk->vol_id;
-	int lnum = wl_wrk->lnum;
 	int err, available_consumed = 0;
 
-	dbg_wl("erase PEB %d EC %d LEB %d:%d",
-	       pnum, e->ec, wl_wrk->vol_id, wl_wrk->lnum);
+	dbg_wl("erase PEB %d EC %d", pnum, e->ec);
 
 	err = sync_erase(ubi, e, wl_wrk->torture);
 	if (!err) {
@@ -987,7 +995,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 		int err1;
 
 		/* Re-schedule the LEB for erasure */
-		err1 = schedule_erase(ubi, e, vol_id, lnum, 0);
+		err1 = schedule_erase(ubi, e, 0);
 		if (err1) {
 			wl_entry_destroy(ubi, e);
 			err = err1;
@@ -1085,8 +1093,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 /**
  * ubi_wl_put_peb - return a PEB to the wear-leveling sub-system.
  * @ubi: UBI device description object
- * @vol_id: the volume ID that last used this PEB
- * @lnum: the last used logical eraseblock number for the PEB
  * @pnum: physical eraseblock to return
  * @torture: if this physical eraseblock has to be tortured
  *
@@ -1095,8 +1101,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * occurred to this @pnum and it has to be tested. This function returns zero
  * in case of success, and a negative error code in case of failure.
  */
-int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
-		   int pnum, int torture)
+int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture)
 {
 	int err;
 	struct ubi_wl_entry *e;
@@ -1166,7 +1171,7 @@ retry:
 	}
 	spin_unlock(&ubi->wl_lock);
 
-	err = schedule_erase(ubi, e, vol_id, lnum, torture);
+	err = schedule_erase(ubi, e, torture);
 	if (err) {
 		spin_lock(&ubi->wl_lock);
 		wl_tree_add(e, &ubi->used);
@@ -1317,7 +1322,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		e->pnum = aeb->pnum;
 		e->ec = aeb->ec;
 		ubi->lookuptbl[e->pnum] = e;
-		if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0)) {
+		if (schedule_erase(ubi, e, 0)) {
 			wl_entry_destroy(ubi, e);
 			goto out_free;
 		}
-- 
2.7.3
