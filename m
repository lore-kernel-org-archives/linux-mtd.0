Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2nn-0006rF-8s
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:36:32 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 6/6] UBI: Fastmap: Fix memory leak while attaching
Date: Sun, 30 Nov 2014 12:35:40 +0100
Message-Id: <1417347340-6872-7-git-send-email-richard@nod.at>
In-Reply-To: <1417347340-6872-1-git-send-email-richard@nod.at>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
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

Currently we leak a few ubi_ainf_pebs while attaching.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  | 61 +++++++++++++++++++++++++----------------------
 drivers/mtd/ubi/fastmap.c | 13 ----------
 2 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 9d2e16f..32cad5c 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1301,6 +1301,30 @@ out_ech:
 	return err;
 }
 
+static struct ubi_attach_info *alloc_ai(const char *slab_name)
+{
+	struct ubi_attach_info *ai;
+
+	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
+	if (!ai)
+		return ai;
+
+	INIT_LIST_HEAD(&ai->corr);
+	INIT_LIST_HEAD(&ai->free);
+	INIT_LIST_HEAD(&ai->erase);
+	INIT_LIST_HEAD(&ai->alien);
+	ai->volumes = RB_ROOT;
+	ai->aeb_slab_cache = kmem_cache_create(slab_name,
+					       sizeof(struct ubi_ainf_peb),
+					       0, 0, NULL);
+	if (!ai->aeb_slab_cache) {
+		kfree(ai);
+		ai = NULL;
+	}
+
+	return ai;
+}
+
 #ifdef CONFIG_MTD_UBI_FASTMAP
 
 /**
@@ -1313,7 +1337,7 @@ out_ech:
  * UBI_NO_FASTMAP denotes that no fastmap was found.
  * UBI_BAD_FASTMAP denotes that the found fastmap was invalid.
  */
-static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
+static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 {
 	int err, pnum, fm_anchor = -1;
 	unsigned long long max_sqnum = 0;
@@ -1334,7 +1358,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = scan_peb(ubi, ai, pnum, &vol_id, &sqnum);
+		err = scan_peb(ubi, *ai, pnum, &vol_id, &sqnum);
 		if (err < 0)
 			goto out_vidh;
 
@@ -1350,7 +1374,12 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (fm_anchor < 0)
 		return UBI_NO_FASTMAP;
 
-	return ubi_scan_fastmap(ubi, ai, fm_anchor);
+	destroy_ai(*ai);
+	*ai = alloc_ai("ubi_aeb_slab_cache");
+	if (!*ai)
+		return -ENOMEM;
+
+	return ubi_scan_fastmap(ubi, *ai, fm_anchor);
 
 out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
@@ -1362,30 +1391,6 @@ out:
 
 #endif
 
-static struct ubi_attach_info *alloc_ai(const char *slab_name)
-{
-	struct ubi_attach_info *ai;
-
-	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-	if (!ai)
-		return ai;
-
-	INIT_LIST_HEAD(&ai->corr);
-	INIT_LIST_HEAD(&ai->free);
-	INIT_LIST_HEAD(&ai->erase);
-	INIT_LIST_HEAD(&ai->alien);
-	ai->volumes = RB_ROOT;
-	ai->aeb_slab_cache = kmem_cache_create(slab_name,
-					       sizeof(struct ubi_ainf_peb),
-					       0, 0, NULL);
-	if (!ai->aeb_slab_cache) {
-		kfree(ai);
-		ai = NULL;
-	}
-
-	return ai;
-}
-
 /**
  * ubi_attach - attach an MTD device.
  * @ubi: UBI device descriptor
@@ -1413,7 +1418,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (force_scan)
 		err = scan_all(ubi, ai, 0);
 	else {
-		err = scan_fast(ubi, ai);
+		err = scan_fast(ubi, &ai);
 		if (err > 0) {
 			if (err != UBI_NO_FASTMAP) {
 				destroy_ai(ai);
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 9507702..600c4f9 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -561,21 +561,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	INIT_LIST_HEAD(&used);
 	INIT_LIST_HEAD(&free);
 	INIT_LIST_HEAD(&eba_orphans);
-	INIT_LIST_HEAD(&ai->corr);
-	INIT_LIST_HEAD(&ai->free);
-	INIT_LIST_HEAD(&ai->erase);
-	INIT_LIST_HEAD(&ai->alien);
-	ai->volumes = RB_ROOT;
 	ai->min_ec = UBI_MAX_ERASECOUNTER;
 
-	ai->aeb_slab_cache = kmem_cache_create("ubi_ainf_peb_slab",
-					       sizeof(struct ubi_ainf_peb),
-					       0, 0, NULL);
-	if (!ai->aeb_slab_cache) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
 	fmsb = (struct ubi_fm_sb *)(fm_raw);
 	ai->max_sqnum = fmsb->sqnum;
 	fm_pos += sizeof(struct ubi_fm_sb);
-- 
1.8.4.5
