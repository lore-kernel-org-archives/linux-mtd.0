Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XstZi-0007ur-VG
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 13:21:09 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
Date: Mon, 24 Nov 2014 14:20:32 +0100
Message-Id: <1416835236-25185-3-git-send-email-richard@nod.at>
In-Reply-To: <1416835236-25185-1-git-send-email-richard@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the WL pool runs out of PEBs we schedule a fastmap write
to refill it as soon as possible.
Ensure that only one at a time is scheduled otherwise we might end in
a fastmap write storm because writing the fastmap can schedule another
write if bitflips are detected.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h | 4 +++-
 drivers/mtd/ubi/wl.c  | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f80ffab..04c4c05 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -427,6 +427,7 @@ struct ubi_debug_info {
  * @fm_size: fastmap size in bytes
  * @fm_sem: allows ubi_update_fastmap() to block EBA table changes
  * @fm_work: fastmap work queue
+ * @fm_work_scheduled: non-zero if fastmap work was scheduled
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -438,7 +439,7 @@ struct ubi_debug_info {
  * @pq_head: protection queue head
  * @wl_lock: protects the @used, @free, @pq, @pq_head, @lookuptbl, @move_from,
  *	     @move_to, @move_to_put @erase_pending, @wl_scheduled, @works,
- *	     @erroneous, and @erroneous_peb_count fields
+ *	     @erroneous, @erroneous_peb_count, and @fm_work_scheduled fields
  * @move_mutex: serializes eraseblock moves
  * @work_sem: used to wait for all the scheduled works to finish and prevent
  * new works from being submitted
@@ -533,6 +534,7 @@ struct ubi_device {
 	void *fm_buf;
 	size_t fm_size;
 	struct work_struct fm_work;
+	int fm_work_scheduled;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 834f6fe..7f135df 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -149,6 +149,9 @@ static void update_fastmap_work_fn(struct work_struct *wrk)
 {
 	struct ubi_device *ubi = container_of(wrk, struct ubi_device, fm_work);
 	ubi_update_fastmap(ubi);
+	spin_lock(&ubi->wl_lock);
+	ubi->fm_work_scheduled = 0;
+	spin_unlock(&ubi->wl_lock);
 }
 
 /**
@@ -660,7 +663,10 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */
-		schedule_work(&ubi->fm_work);
+		if (!ubi->fm_work_scheduled) {
+			ubi->fm_work_scheduled = 1;
+			schedule_work(&ubi->fm_work);
+		}
 		return NULL;
 	} else {
 		pnum = pool->pebs[pool->used++];
-- 
1.8.4.5
