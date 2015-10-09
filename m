Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkONT-000356-Gt
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 03:29:52 +0000
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: rename free variable
Date: Fri,  9 Oct 2015 05:29:21 +0200
Message-Id: <1444361361-12219-1-git-send-email-hs@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

rename free variable into not "free", as "free" prevents
ubi sources compiling under U-Boot. So rename "free"
into "pfree" where it is a pointer, and into "freel",
where it is a free list.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 drivers/mtd/ubi/fastmap.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4aa2fd8..80ac265 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -451,7 +451,7 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
  */
 static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     int *pebs, int pool_size, unsigned long long *max_sqnum,
-		     struct list_head *free)
+		     struct list_head *pfree)
 {
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
@@ -514,9 +514,9 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			unmap_peb(ai, pnum);
 			dbg_bld("Adding PEB to free: %i", pnum);
 			if (err == UBI_IO_FF_BITFLIPS)
-				add_aeb(ai, free, pnum, ec, 1);
+				add_aeb(ai, pfree, pnum, ec, 1);
 			else
-				add_aeb(ai, free, pnum, ec, 0);
+				add_aeb(ai, pfree, pnum, ec, 0);
 			continue;
 		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
 			dbg_bld("Found non empty PEB:%i in pool", pnum);
@@ -598,7 +598,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			      struct ubi_attach_info *ai,
 			      struct ubi_fastmap_layout *fm)
 {
-	struct list_head used, free;
+	struct list_head used, freel;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
 	struct ubi_fm_sb *fmsb;
@@ -613,7 +613,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	void *fm_raw = ubi->fm_buf;
 
 	INIT_LIST_HEAD(&used);
-	INIT_LIST_HEAD(&free);
+	INIT_LIST_HEAD(&freel);
 	ai->min_ec = UBI_MAX_ERASECOUNTER;
 
 	fmsb = (struct ubi_fm_sb *)(fm_raw);
@@ -803,24 +803,25 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		}
 	}
 
-	ret = scan_pool(ubi, ai, fmpl->pebs, pool_size, &max_sqnum, &free);
+	ret = scan_pool(ubi, ai, fmpl->pebs, pool_size, &max_sqnum, &freel);
 	if (ret)
 		goto fail;
 
-	ret = scan_pool(ubi, ai, fmpl_wl->pebs, wl_pool_size, &max_sqnum, &free);
+	ret = scan_pool(ubi, ai, fmpl_wl->pebs, wl_pool_size, &max_sqnum,
+			&freel);
 	if (ret)
 		goto fail;
 
 	if (max_sqnum > ai->max_sqnum)
 		ai->max_sqnum = max_sqnum;
 
-	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &freel, u.list)
 		list_move_tail(&tmp_aeb->u.list, &ai->free);
 
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list)
 		list_move_tail(&tmp_aeb->u.list, &ai->erase);
 
-	ubi_assert(list_empty(&free));
+	ubi_assert(list_empty(&freel));
 
 	/*
 	 * If fastmap is leaking PEBs (must not happen), raise a
@@ -841,7 +842,7 @@ fail:
 		list_del(&tmp_aeb->u.list);
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
-	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &freel, u.list) {
 		list_del(&tmp_aeb->u.list);
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
-- 
2.1.0
