Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkuce-0006xC-2l
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:22 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 10/18] UBI: provide helpers to allocate and free aeb
 elements
Date: Fri, 16 Sep 2016 16:59:18 +0200
Message-Id: <1474037966-5524-11-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This not only hides the aeb allocation internals (which is always good in
case we ever want to change the allocation system), but also helps us
factorize the initialization of some common fields (ec and pnum).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c  | 69 ++++++++++++++++++++++++++++++++++-------------
 drivers/mtd/ubi/fastmap.c | 28 +++++++------------
 drivers/mtd/ubi/ubi.h     |  3 +++
 drivers/mtd/ubi/vtbl.c    |  4 +--
 4 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 5692b4ce0d9c..82b30c959a28 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -182,6 +182,47 @@ static struct ubi_ainf_volume *ubi_find_or_add_av(struct ubi_attach_info *ai,
 }
 
 /**
+ * ubi_alloc_aeb - allocate an aeb element
+ * @ai: attaching information
+ * @pnum: physical eraseblock number
+ * @ec: erase counter of the physical eraseblock
+ *
+ * Allocate an aeb object and initialize the pnum and ec information.
+ * vol_id and lnum are set to UBI_UNKNOWN, and the other fields are
+ * initialized to zero.
+ * Note that the element is not added in any list or RB tree.
+ */
+struct ubi_ainf_peb *ubi_alloc_aeb(struct ubi_attach_info *ai, int pnum,
+				   int ec)
+{
+	struct ubi_ainf_peb *aeb;
+
+	aeb = kmem_cache_zalloc(ai->aeb_slab_cache, GFP_KERNEL);
+	if (!aeb)
+		return NULL;
+
+	aeb->pnum = pnum;
+	aeb->ec = ec;
+	aeb->vol_id = UBI_UNKNOWN;
+	aeb->lnum = UBI_UNKNOWN;
+
+	return aeb;
+}
+
+/**
+ * ubi_free_aeb - free an aeb element
+ * @ai: attaching information
+ * @aeb: the element to free
+ *
+ * Free an aeb object. The caller must have removed the element from any list
+ * or RB tree.
+ */
+void ubi_free_aeb(struct ubi_attach_info *ai, struct ubi_ainf_peb *aeb)
+{
+	kmem_cache_free(ai->aeb_slab_cache, aeb);
+}
+
+/**
  * add_to_list - add physical eraseblock to a list.
  * @ai: attaching information
  * @pnum: physical eraseblock number to add
@@ -217,14 +258,12 @@ static int add_to_list(struct ubi_attach_info *ai, int pnum, int vol_id,
 	} else
 		BUG();
 
-	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	aeb = ubi_alloc_aeb(ai, pnum, ec);
 	if (!aeb)
 		return -ENOMEM;
 
-	aeb->pnum = pnum;
 	aeb->vol_id = vol_id;
 	aeb->lnum = lnum;
-	aeb->ec = ec;
 	if (to_head)
 		list_add(&aeb->u.list, list);
 	else
@@ -249,13 +288,11 @@ static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
-	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	aeb = ubi_alloc_aeb(ai, pnum, ec);
 	if (!aeb)
 		return -ENOMEM;
 
 	ai->corr_peb_count += 1;
-	aeb->pnum = pnum;
-	aeb->ec = ec;
 	list_add(&aeb->u.list, &ai->corr);
 	return 0;
 }
@@ -278,14 +315,12 @@ static int add_fastmap(struct ubi_attach_info *ai, int pnum,
 {
 	struct ubi_ainf_peb *aeb;
 
-	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	aeb = ubi_alloc_aeb(ai, pnum, ec);
 	if (!aeb)
 		return -ENOMEM;
 
-	aeb->pnum = pnum;
 	aeb->vol_id = be32_to_cpu(vid_hdr->vol_id);
 	aeb->sqnum = be64_to_cpu(vid_hdr->sqnum);
-	aeb->ec = ec;
 	list_add(&aeb->u.list, &ai->fastmap);
 
 	dbg_bld("add to fastmap list: PEB %d, vol_id %d, sqnum: %llu", pnum,
@@ -667,12 +702,10 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 	if (err)
 		return err;
 
-	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	aeb = ubi_alloc_aeb(ai, pnum, ec);
 	if (!aeb)
 		return -ENOMEM;
 
-	aeb->ec = ec;
-	aeb->pnum = pnum;
 	aeb->vol_id = vol_id;
 	aeb->lnum = lnum;
 	aeb->scrub = bitflips;
@@ -1278,7 +1311,7 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av,
 			if (list)
 				list_add_tail(&aeb->u.list, list);
 			else
-				kmem_cache_free(ai->aeb_slab_cache, aeb);
+				ubi_free_aeb(ai, aeb);
 		}
 	}
 	kfree(av);
@@ -1296,23 +1329,23 @@ static void destroy_ai(struct ubi_attach_info *ai)
 
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, aeb);
+		ubi_free_aeb(ai, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->erase, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, aeb);
+		ubi_free_aeb(ai, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->corr, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, aeb);
+		ubi_free_aeb(ai, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->free, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, aeb);
+		ubi_free_aeb(ai, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->fastmap, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, aeb);
+		ubi_free_aeb(ai, aeb);
 	}
 
 	/* Destroy the volume RB-tree */
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 7a07b8b53081..25e80a749a52 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -145,12 +145,10 @@ static int add_aeb(struct ubi_attach_info *ai, struct list_head *list,
 {
 	struct ubi_ainf_peb *aeb;
 
-	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	aeb = ubi_alloc_aeb(ai, pnum, ec);
 	if (!aeb)
 		return -ENOMEM;
 
-	aeb->pnum = pnum;
-	aeb->ec = ec;
 	aeb->lnum = -1;
 	aeb->scrub = scrub;
 	aeb->copy_flag = aeb->sqnum = 0;
@@ -276,7 +274,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		 */
 		if (aeb->pnum == new_aeb->pnum) {
 			ubi_assert(aeb->lnum == new_aeb->lnum);
-			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+			ubi_free_aeb(ai, new_aeb);
 
 			return 0;
 		}
@@ -287,13 +285,10 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		/* new_aeb is newer */
 		if (cmp_res & 1) {
-			victim = kmem_cache_alloc(ai->aeb_slab_cache,
-				GFP_KERNEL);
+			victim = ubi_alloc_aeb(ai, aeb->ec, aeb->pnum);
 			if (!victim)
 				return -ENOMEM;
 
-			victim->ec = aeb->ec;
-			victim->pnum = aeb->pnum;
 			list_add_tail(&victim->u.list, &ai->erase);
 
 			if (av->highest_lnum == be32_to_cpu(new_vh->lnum))
@@ -307,7 +302,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			aeb->pnum = new_aeb->pnum;
 			aeb->copy_flag = new_vh->copy_flag;
 			aeb->scrub = new_aeb->scrub;
-			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+			ubi_free_aeb(ai, new_aeb);
 
 		/* new_aeb is older */
 		} else {
@@ -353,7 +348,7 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	struct ubi_ainf_volume *av;
 
 	if (vol_id == UBI_FM_SB_VOLUME_ID || vol_id == UBI_FM_DATA_VOLUME_ID) {
-		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+		ubi_free_aeb(ai, new_aeb);
 
 		return 0;
 	}
@@ -362,7 +357,7 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	av = ubi_find_av(ai, vol_id);
 	if (!av) {
 		ubi_err(ubi, "orphaned volume in fastmap pool!");
-		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+		ubi_free_aeb(ai, new_aeb);
 		return UBI_BAD_FASTMAP;
 	}
 
@@ -390,7 +385,7 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
 			if (aeb->pnum == pnum) {
 				rb_erase(&aeb->u.rb, &av->root);
 				av->leb_count--;
-				kmem_cache_free(ai->aeb_slab_cache, aeb);
+				ubi_free_aeb(ai, aeb);
 				return;
 			}
 		}
@@ -485,15 +480,12 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			if (err == UBI_IO_BITFLIPS)
 				scrub = 1;
 
-			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
-						   GFP_KERNEL);
+			new_aeb = ubi_alloc_aeb(ai, pnum, be64_to_cpu(ech->ec));
 			if (!new_aeb) {
 				ret = -ENOMEM;
 				goto out;
 			}
 
-			new_aeb->ec = be64_to_cpu(ech->ec);
-			new_aeb->pnum = pnum;
 			new_aeb->lnum = be32_to_cpu(vh->lnum);
 			new_aeb->sqnum = be64_to_cpu(vh->sqnum);
 			new_aeb->copy_flag = vh->copy_flag;
@@ -800,11 +792,11 @@ fail_bad:
 fail:
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
 		list_del(&tmp_aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		ubi_free_aeb(ai, tmp_aeb);
 	}
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
 		list_del(&tmp_aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		ubi_free_aeb(ai, tmp_aeb);
 	}
 
 	return ret;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index fce142666bf3..f22c6c2e980f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -792,6 +792,9 @@ extern struct mutex ubi_devices_mutex;
 extern struct blocking_notifier_head ubi_notifiers;
 
 /* attach.c */
+struct ubi_ainf_peb *ubi_alloc_aeb(struct ubi_attach_info *ai, int pnum,
+				   int ec);
+void ubi_free_aeb(struct ubi_attach_info *ai, struct ubi_ainf_peb *aeb);
 int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
 struct ubi_ainf_volume *ubi_add_av(struct ubi_attach_info *ai, int vol_id);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index d85c19762160..9e1457708cbf 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -338,7 +338,7 @@ retry:
 	 * of this LEB as it will be deleted and freed in 'ubi_add_to_av()'.
 	 */
 	err = ubi_add_to_av(ubi, ai, new_aeb->pnum, new_aeb->ec, vid_hdr, 0);
-	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+	ubi_free_aeb(ai, new_aeb);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
 
@@ -351,7 +351,7 @@ write_error:
 		list_add(&new_aeb->u.list, &ai->erase);
 		goto retry;
 	}
-	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
+	ubi_free_aeb(ai, new_aeb);
 out_free:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
-- 
2.7.4
