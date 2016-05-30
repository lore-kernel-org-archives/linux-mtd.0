Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7LwV-00048u-KP
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/13] ubi: Kill ubi->alc_mutex
Date: Mon, 30 May 2016 14:04:25 +0200
Message-Id: <1464609874-15488-5-git-send-email-richard@nod.at>
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

With our new work model work can never run in parallel.
So, the serialization mutex is in vain

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 6 ------
 drivers/mtd/ubi/ubi.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 5780dd1..32938aa 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -920,9 +920,6 @@ write_error:
  * data, which has to be aligned. This function guarantees that in case of an
  * unclean reboot the old contents is preserved. Returns zero in case of
  * success and a negative error code in case of failure.
- *
- * UBI reserves one LEB for the "atomic LEB change" operation, so only one
- * LEB change may be done at a time. This is ensured by @ubi->alc_mutex.
  */
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len)
@@ -949,7 +946,6 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 	if (!vid_hdr)
 		return -ENOMEM;
 
-	mutex_lock(&ubi->alc_mutex);
 	err = leb_write_lock(ubi, vol_id, lnum);
 	if (err)
 		goto out_mutex;
@@ -1006,7 +1002,6 @@ retry:
 out_leb_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
 out_mutex:
-	mutex_unlock(&ubi->alc_mutex);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
 
@@ -1389,7 +1384,6 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	dbg_eba("initialize EBA sub-system");
 
 	spin_lock_init(&ubi->ltree_lock);
-	mutex_init(&ubi->alc_mutex);
 	ubi->ltree = RB_ROOT;
 
 	ubi->global_sqnum = ai->max_sqnum + 1;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 4486869..efdff07 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -454,7 +454,6 @@ struct ubi_debug_info {
  * @global_sqnum: global sequence number
  * @ltree_lock: protects the lock tree and @global_sqnum
  * @ltree: the lock tree
- * @alc_mutex: serializes "atomic LEB change" operations
  *
  * @fm_disabled: non-zero if fastmap is disabled (default)
  * @fm: in-memory data structure of the currently used fastmap
@@ -565,7 +564,6 @@ struct ubi_device {
 	unsigned long long global_sqnum;
 	spinlock_t ltree_lock;
 	struct rb_root ltree;
-	struct mutex alc_mutex;
 
 	/* Fastmap stuff */
 	int fm_disabled;
-- 
2.7.3
