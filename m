Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel29-00079s-R9
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/21] UBI: Fastmap: Introduce WL pool Signed-off-by: Richard
 Weinberger <richard@nod.at>
Date: Wed, 13 Jun 2012 12:42:10 +0200
Message-Id: <1339584138-69914-14-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c     |    4 ++
 drivers/mtd/ubi/fastmap.c   |   51 ++++++++++++++++----------
 drivers/mtd/ubi/ubi-media.h |    2 +
 drivers/mtd/ubi/ubi.h       |    1 +
 drivers/mtd/ubi/wl.c        |   82 ++++++++++++++++++++++++++++++++++++++----
 5 files changed, 112 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 2acfe5b..0ad6789 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -887,6 +887,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	ubi->autoresize_vol_id = -1;
 
 	ubi->fm_pool.used = ubi->fm_pool.size = 0;
+	ubi->fm_wl_pool.used = ubi->fm_wl_pool.size = 0;
 
 	/*
 	 * fm_pool.max_size is 5% of the total number of PEBs but it's also
@@ -897,7 +898,10 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	if (ubi->fm_pool.max_size < UBI_FM_MIN_POOL_SIZE)
 		ubi->fm_pool.max_size = UBI_FM_MIN_POOL_SIZE;
 
+	ubi->fm_wl_pool.max_size = UBI_FM_WL_POOL_SIZE;
+
 	ubi_msg("fastmap pool size: %d", ubi->fm_pool.max_size);
+	ubi_msg("fastmap WL pool size: %d", ubi->fm_wl_pool.max_size);
 
 	mutex_init(&ubi->buf_mutex);
 	mutex_init(&ubi->ckvol_mutex);
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1c2e906..29e6d69 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -500,7 +500,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmhdr;
-	struct ubi_fm_scan_pool *fmpl;
+	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
 	struct ubi_fm_ec *fmec;
 	struct ubi_fm_volhdr *fmvhdr;
 	struct ubi_fm_eba *fm_eba;
@@ -547,11 +547,18 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	if (fmhdr->magic != UBI_FM_HDR_MAGIC)
 		goto fail_bad;
 
-	fmpl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl);
+	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl1);
 	if (fm_pos >= fm_size)
 		goto fail_bad;
-	if (fmpl->magic != UBI_FM_POOL_MAGIC)
+	if (fmpl1->magic != UBI_FM_POOL_MAGIC)
+		goto fail_bad;
+
+	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl2);
+	if (fm_pos >= fm_size)
+		goto fail_bad;
+	if (fmpl2->magic != UBI_FM_POOL_MAGIC)
 		goto fail_bad;
 
 	/* read EC values from free list */
@@ -694,20 +701,15 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		kfree(ech);
 	}
 
-	/*
-	 * The remainning PEBs in the used list are not used.
-	 * They lived in the fastmap pool but got never used.
-	 */
-	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
-		list_del(&tmp_aeb->u.list);
-		list_add_tail(&tmp_aeb->u.list, &ai->free);
-	}
-
-	ret = scan_pool(ubi, ai, fmpl->pebs, be32_to_cpu(fmpl->size),
+	ret = scan_pool(ubi, ai, fmpl1->pebs, be32_to_cpu(fmpl1->size),
 		&max_sqnum, &eba_orphans);
 	if (ret)
 		goto fail;
 
+	ret = scan_pool(ubi, ai, fmpl2->pebs, be32_to_cpu(fmpl2->size),
+		&max_sqnum, &eba_orphans);
+	if (ret)
+		goto fail;
 
 	if (max_sqnum > ai->max_sqnum)
 		ai->max_sqnum = max_sqnum;
@@ -1024,7 +1026,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	char *fm_raw;
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmh;
-	struct ubi_fm_scan_pool *fmpl;
+	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
 	struct ubi_fm_ec *fec;
 	struct ubi_fm_volhdr *fvh;
 	struct ubi_fm_eba *feba;
@@ -1100,13 +1102,21 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	used_peb_count = 0;
 	vol_count = 0;
 
-	fmpl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
-	fm_pos += sizeof(*fmpl);
-	fmpl->magic = UBI_FM_POOL_MAGIC;
-	fmpl->size = cpu_to_be32(ubi->fm_pool.size);
+	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl1);
+	fmpl1->magic = UBI_FM_POOL_MAGIC;
+	fmpl1->size = cpu_to_be32(ubi->fm_pool.size);
 
 	for (i = 0; i < ubi->fm_pool.size; i++)
-		fmpl->pebs[i] = cpu_to_be32(ubi->fm_pool.pebs[i]);
+		fmpl1->pebs[i] = cpu_to_be32(ubi->fm_pool.pebs[i]);
+
+	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
+	fm_pos += sizeof(*fmpl2);
+	fmpl2->magic = UBI_FM_POOL_MAGIC;
+	fmpl2->size = cpu_to_be32(ubi->fm_wl_pool.size);
+
+	for (i = 0; i < ubi->fm_wl_pool.size; i++)
+		fmpl2->pebs[i] = cpu_to_be32(ubi->fm_wl_pool.pebs[i]);
 
 	for (node = rb_first(&ubi->free); node; node = rb_next(node)) {
 		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
@@ -1250,6 +1260,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 	new_fm->size = sizeof(struct ubi_fm_hdr) + \
 			sizeof(struct ubi_fm_scan_pool) + \
+			sizeof(struct ubi_fm_scan_pool) + \
 			(ubi->peb_count * sizeof(struct ubi_fm_ec)) + \
 			(sizeof(struct ubi_fm_eba) + \
 			(ubi->peb_count * sizeof(__be32))) + \
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index b4ecd1b..a36748c 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -403,6 +403,8 @@ struct ubi_vtbl_record {
 #define UBI_FM_MIN_POOL_SIZE	8
 #define UBI_FM_MAX_POOL_SIZE	256
 
+#define UBI_FM_WL_POOL_SIZE	25
+
 /**
  * struct ubi_fm_sb - UBI fastmap super block
  * @magic: fastmap super block magic number (%UBI_FM_SB_MAGIC)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index be1933b..ccd0da7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -480,6 +480,7 @@ struct ubi_device {
 	/* Fastmap stuff */
 	struct ubi_fastmap_layout *fm;
 	struct ubi_fm_pool fm_pool;
+	struct ubi_fm_pool fm_wl_pool;
 	struct mutex fm_mutex;
 	struct mutex fm_pool_mutex;
 	int attached_by_scanning;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 15e4895..8fb8b41 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -507,7 +507,6 @@ retry:
 	 */
 	rb_erase(&e->u.rb, &ubi->free);
 	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
-	prot_queue_add(ubi, e);
 	spin_unlock(&ubi->wl_lock);
 
 	err = ubi_self_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
@@ -520,6 +519,44 @@ retry:
 	return e->pnum;
 }
 
+static int refill_wl_pool(struct ubi_device *ubi)
+{
+	int ret, i;
+	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
+	struct ubi_wl_entry *e;
+
+	spin_lock(&ubi->wl_lock);
+	if (pool->used != pool->size && pool->size) {
+		spin_unlock(&ubi->wl_lock);
+		return 0;
+	}
+
+	for (i = 0; i < pool->max_size; i++) {
+		if (!ubi->free.rb_node) {
+			spin_unlock(&ubi->wl_lock);
+			break;
+		}
+
+		e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
+		self_check_in_wl_tree(ubi, e, &ubi->free);
+		rb_erase(&e->u.rb, &ubi->free);
+
+		pool->pebs[i] = e->pnum;
+	}
+	pool->size = i;
+	spin_unlock(&ubi->wl_lock);
+
+	ret = ubi_update_fastmap(ubi);
+	if (ret) {
+		ubi_ro_mode(ubi);
+
+		return ret > 0 ? -EINVAL : ret;
+	}
+	pool->used = 0;
+
+	return pool->size ? 0 : -ENOSPC;
+}
+
 /* ubi_wl_get_peb - works exaclty like __ubi_wl_get_peb but keeps track of
  * the fastmap pool.
  */
@@ -530,6 +567,8 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 
 	mutex_lock(&ubi->fm_pool_mutex);
 
+	refill_wl_pool(ubi);
+
 	/* pool contains no free blocks, create a new one
 	 * and write a fastmap */
 	if (pool->used == pool->size || !pool->size) {
@@ -549,13 +588,37 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 			return ret > 0 ? -EINVAL : ret;
 		}
 	}
-	mutex_unlock(&ubi->fm_pool_mutex);
 
 	/* we got not a single free PEB */
 	if (!pool->size)
-		return -ENOSPC;
+		ret = -ENOSPC;
+	else {
+		spin_lock(&ubi->wl_lock);
+		ret = pool->pebs[pool->used++];
+		prot_queue_add(ubi, ubi->lookuptbl[ret]);
+		spin_unlock(&ubi->wl_lock);
+	}
+
+	mutex_unlock(&ubi->fm_pool_mutex);
 
-	return pool->pebs[pool->used++];
+	return ret;
+}
+
+/* get_peb_for_wl - returns a PEB to be used internally by the WL sub-system
+ *
+ * @ubi: UBI device description object
+ */
+static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
+{
+	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
+	int pnum;
+
+	if (pool->used == pool->size || !pool->size) {
+		return NULL;
+	} else {
+		pnum = pool->pebs[pool->used++];
+		return ubi->lookuptbl[pnum];
+	}
 }
 
 /**
@@ -830,7 +893,9 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 * counters differ much enough, start wear-leveling.
 		 */
 		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
-		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
+		e2 = get_peb_for_wl(ubi);
+		if (!e2)
+			goto out_cancel;
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
 			dbg_wl("no WL needed: min used EC %d, max free EC %d",
@@ -845,14 +910,15 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		/* Perform scrubbing */
 		scrubbing = 1;
 		e1 = rb_entry(rb_first(&ubi->scrub), struct ubi_wl_entry, u.rb);
-		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
+		e2 = get_peb_for_wl(ubi);
+		if (!e2)
+			goto out_cancel;
+
 		self_check_in_wl_tree(ubi, e1, &ubi->scrub);
 		rb_erase(&e1->u.rb, &ubi->scrub);
 		dbg_wl("scrub PEB %d to PEB %d", e1->pnum, e2->pnum);
 	}
 
-	self_check_in_wl_tree(ubi, e2, &ubi->free);
-	rb_erase(&e2->u.rb, &ubi->free);
 	ubi->move_from = e1;
 	ubi->move_to = e2;
 	spin_unlock(&ubi->wl_lock);
-- 
1.7.6.5
