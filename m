Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3U9-0005a9-Pv
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:20:19 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 4/6] UBI: Fastmap: Introduce ubi_fastmap_init()
Date: Sun, 30 Nov 2014 13:19:46 +0100
Message-Id: <1417349988-9238-5-git-send-email-richard@nod.at>
In-Reply-To: <1417349988-9238-1-git-send-email-richard@nod.at>
References: <1417349988-9238-1-git-send-email-richard@nod.at>
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

...and kill another #ifdef in wl.c. :-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 8 +-------
 drivers/mtd/ubi/wl.h | 7 +++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 2892039..d84546b 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1510,9 +1510,6 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	init_rwsem(&ubi->work_sem);
 	ubi->max_ec = ai->max_ec;
 	INIT_LIST_HEAD(&ubi->works);
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
-#endif
 
 	sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
 
@@ -1606,10 +1603,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_assert(ubi->good_peb_count == found_pebs);
 
 	reserved_pebs = WL_RESERVED_PEBS;
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	/* Reserve enough LEBs to store two fastmaps. */
-	reserved_pebs += (ubi->fm_size / ubi->leb_size) * 2;
-#endif
+	ubi_fastmap_init(ubi, &reserved_pebs);
 
 	if (ubi->avail_pebs < reserved_pebs) {
 		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index db86814..4046ccf 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -7,6 +7,12 @@ static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
 static void ubi_fastmap_close(struct ubi_device *ubi);
+static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
+{
+	/* Reserve enough LEBs to store two fastmaps. */
+	*count += (ubi->fm_size / ubi->leb_size) * 2;
+	INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
+}
 #else /* !CONFIG_MTD_UBI_FASTMAP */
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
 static inline int is_fm_block(struct ubi_device *ubi, int pnum)
@@ -14,5 +20,6 @@ static inline int is_fm_block(struct ubi_device *ubi, int pnum)
 	return 0;
 }
 static inline void ubi_fastmap_close(struct ubi_device *ubi) { }
+static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count) { }
 #endif /* CONFIG_MTD_UBI_FASTMAP */
 #endif /* UBI_WL_H */
-- 
1.8.4.5
