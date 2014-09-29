Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYjJo-0002bR-IP
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 22:21:22 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
Date: Tue, 30 Sep 2014 00:20:48 +0200
Message-Id: <1412029248-22454-5-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-1-git-send-email-richard@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
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
to refill it was soon as possible.
Ensure that only one at a time is scheduled otherwise we might end in
a fastmap write storm was writing the fastmap can schedule another
write if bitflips were detected.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h | 2 ++
 drivers/mtd/ubi/wl.c  | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 7bf4163..529dfb0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -426,6 +426,7 @@ struct ubi_debug_info {
  * @fm_size: fastmap size in bytes
  * @fm_sem: allows ubi_update_fastmap() to block EBA table changes
  * @fm_work: fastmap work queue
+ * @fm_work_scheduled: non-zero if fastmap work was scheduled
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -531,6 +532,7 @@ struct ubi_device {
 	void *fm_buf;
 	size_t fm_size;
 	struct work_struct fm_work;
+	int fm_work_scheduled;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index dc01b1f..4c02a6e 100644
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
@@ -657,7 +660,10 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
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
2.1.0
