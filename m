Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcXQQ-0006Tq-6J
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 12:37:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] ubi: Fix races around ubi_refill_pools()
Date: Wed, 24 Aug 2016 14:36:14 +0200
Message-Id: <1472042175-8655-2-git-send-email-richard@nod.at>
In-Reply-To: <1472042175-8655-1-git-send-email-richard@nod.at>
References: <1472042175-8655-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When writing a new Fastmap the first thing that happens
is refilling the pools in memory.
At this stage it is possible that new PEBs from the new pools
get already claimed and written with data.
If this happens before the new Fastmap data structure hits the
flash and we face power cut the freshly written PEB will not
scanned and unnoticed.

Solve the issue by locking the pools until Fastmap is written.

Cc: <stable@vger.kernel.org>
Fixes: dbb7d2a88d ("UBI: Add fastmap core")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c        |  4 ++--
 drivers/mtd/ubi/fastmap-wl.c |  6 ++++--
 drivers/mtd/ubi/fastmap.c    | 14 ++++++++++----
 drivers/mtd/ubi/wl.c         | 20 ++++++++++++++------
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index ebf5172..6c8e16d 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1088,6 +1088,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	struct ubi_volume *vol;
 	uint32_t crc;
 
+	ubi_assert(rwsem_is_locked(&ubi->fm_eba_sem));
+
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
 	lnum = be32_to_cpu(vid_hdr->lnum);
 
@@ -1230,9 +1232,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	ubi_assert(vol->eba_tbl[lnum] == from);
-	down_read(&ubi->fm_eba_sem);
 	vol->eba_tbl[lnum] = to;
-	up_read(&ubi->fm_eba_sem);
 
 out_unlock_buf:
 	mutex_unlock(&ubi->buf_mutex);
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 30d3999..4f0bd6b 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -262,6 +262,8 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
 	int pnum;
 
+	ubi_assert(rwsem_is_locked(&ubi->fm_eba_sem));
+
 	if (pool->used == pool->size) {
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
@@ -303,7 +305,7 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 
 	wrk->anchor = 1;
 	wrk->func = &wear_leveling_worker;
-	schedule_ubi_work(ubi, wrk);
+	__schedule_ubi_work(ubi, wrk);
 	return 0;
 }
 
@@ -344,7 +346,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
 	spin_unlock(&ubi->wl_lock);
 
 	vol_id = lnum ? UBI_FM_DATA_VOLUME_ID : UBI_FM_SB_VOLUME_ID;
-	return schedule_erase(ubi, e, vol_id, lnum, torture);
+	return schedule_erase(ubi, e, vol_id, lnum, torture, true);
 }
 
 /**
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 48eb55f..da33100 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1522,22 +1522,30 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	struct ubi_wl_entry *tmp_e;
 
 	down_write(&ubi->fm_protect);
+	down_write(&ubi->work_sem);
+	down_write(&ubi->fm_eba_sem);
 
 	ubi_refill_pools(ubi);
 
 	if (ubi->ro_mode || ubi->fm_disabled) {
+		up_write(&ubi->fm_eba_sem);
+		up_write(&ubi->work_sem);
 		up_write(&ubi->fm_protect);
 		return 0;
 	}
 
 	ret = ubi_ensure_anchor_pebs(ubi);
 	if (ret) {
+		up_write(&ubi->fm_eba_sem);
+		up_write(&ubi->work_sem);
 		up_write(&ubi->fm_protect);
 		return ret;
 	}
 
 	new_fm = kzalloc(sizeof(*new_fm), GFP_KERNEL);
 	if (!new_fm) {
+		up_write(&ubi->fm_eba_sem);
+		up_write(&ubi->work_sem);
 		up_write(&ubi->fm_protect);
 		return -ENOMEM;
 	}
@@ -1646,16 +1654,14 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		new_fm->e[0] = tmp_e;
 	}
 
-	down_write(&ubi->work_sem);
-	down_write(&ubi->fm_eba_sem);
 	ret = ubi_write_fastmap(ubi, new_fm);
-	up_write(&ubi->fm_eba_sem);
-	up_write(&ubi->work_sem);
 
 	if (ret)
 		goto err;
 
 out_unlock:
+	up_write(&ubi->fm_eba_sem);
+	up_write(&ubi->work_sem);
 	up_write(&ubi->fm_protect);
 	kfree(old_fm);
 	return ret;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b419c7c..d1f0d65 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -580,7 +580,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * failure.
  */
 static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			  int vol_id, int lnum, int torture)
+			  int vol_id, int lnum, int torture, bool nested)
 {
 	struct ubi_work *wl_wrk;
 
@@ -599,7 +599,10 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	wl_wrk->lnum = lnum;
 	wl_wrk->torture = torture;
 
-	schedule_ubi_work(ubi, wl_wrk);
+	if (nested)
+		__schedule_ubi_work(ubi, wl_wrk);
+	else
+		schedule_ubi_work(ubi, wl_wrk);
 	return 0;
 }
 
@@ -660,6 +663,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	if (!vid_hdr)
 		return -ENOMEM;
 
+	down_read(&ubi->fm_eba_sem);
 	mutex_lock(&ubi->move_mutex);
 	spin_lock(&ubi->wl_lock);
 	ubi_assert(!ubi->move_from && !ubi->move_to);
@@ -890,6 +894,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 	dbg_wl("done");
 	mutex_unlock(&ubi->move_mutex);
+	up_read(&ubi->fm_eba_sem);
 	return 0;
 
 	/*
@@ -940,6 +945,7 @@ out_not_moved:
 	}
 
 	mutex_unlock(&ubi->move_mutex);
+	up_read(&ubi->fm_eba_sem);
 	return 0;
 
 out_error:
@@ -961,6 +967,7 @@ out_error:
 out_ro:
 	ubi_ro_mode(ubi);
 	mutex_unlock(&ubi->move_mutex);
+	up_read(&ubi->fm_eba_sem);
 	ubi_assert(err != 0);
 	return err < 0 ? err : -EIO;
 
@@ -968,6 +975,7 @@ out_cancel:
 	ubi->wl_scheduled = 0;
 	spin_unlock(&ubi->wl_lock);
 	mutex_unlock(&ubi->move_mutex);
+	up_read(&ubi->fm_eba_sem);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return 0;
 }
@@ -1090,7 +1098,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 		int err1;
 
 		/* Re-schedule the LEB for erasure */
-		err1 = schedule_erase(ubi, e, vol_id, lnum, 0);
+		err1 = schedule_erase(ubi, e, vol_id, lnum, 0, false);
 		if (err1) {
 			wl_entry_destroy(ubi, e);
 			err = err1;
@@ -1271,7 +1279,7 @@ retry:
 	}
 	spin_unlock(&ubi->wl_lock);
 
-	err = schedule_erase(ubi, e, vol_id, lnum, torture);
+	err = schedule_erase(ubi, e, vol_id, lnum, torture, false);
 	if (err) {
 		spin_lock(&ubi->wl_lock);
 		wl_tree_add(e, &ubi->used);
@@ -1562,7 +1570,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		e->pnum = aeb->pnum;
 		e->ec = aeb->ec;
 		ubi->lookuptbl[e->pnum] = e;
-		if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0)) {
+		if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0, false)) {
 			wl_entry_destroy(ubi, e);
 			goto out_free;
 		}
@@ -1641,7 +1649,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			e->ec = aeb->ec;
 			ubi_assert(!ubi->lookuptbl[e->pnum]);
 			ubi->lookuptbl[e->pnum] = e;
-			if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0)) {
+			if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0, false)) {
 				wl_entry_destroy(ubi, e);
 				goto out_free;
 			}
-- 
2.7.3
