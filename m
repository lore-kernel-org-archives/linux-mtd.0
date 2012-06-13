Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2E-0007Bj-1w
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:54 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/21] UBI: Fastmap: Minor fixes
Date: Wed, 13 Jun 2012 12:42:16 +0200
Message-Id: <1339584138-69914-20-git-send-email-richard@nod.at>
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

Fix some TODOs

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |  124 +++++++++++----------------------------------
 1 files changed, 29 insertions(+), 95 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 446dc0e..8b09c29 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -329,7 +329,8 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
 	for (node = rb_first(&ai->volumes); node; node = rb_next(node)) {
 		av = rb_entry(node, struct ubi_ainf_volume, rb);
 
-		for (node2 = rb_first(&av->root); node2; node2 = rb_next(node2)) {
+		for (node2 = rb_first(&av->root); node2;
+		     node2 = rb_next(node2)) {
 			aeb = rb_entry(node2, struct ubi_ainf_peb, u.rb);
 			if (aeb->pnum == pnum) {
 				rb_erase(&aeb->u.rb, &av->root);
@@ -356,11 +357,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
 	struct ubi_ainf_peb *new_aeb, *tmp_aeb;
-	int i;
-	int pnum;
-	int err;
-	int ret = 0;
-	int found_orphan;
+	int i, pnum, err, found_orphan, ret = 0;
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
@@ -386,7 +383,6 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		if (ubi_io_is_bad(ubi, pnum)) {
 			dbg_bld("bad PEB in fastmap pool!");
 			ret = UBI_BAD_FASTMAP;
-
 			goto out;
 		}
 
@@ -431,17 +427,10 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				list_del(&tmp_aeb->u.list);
 			}
 
-			/* TODO: could you please follow UBI style of how we
-			 * split lines? Notice that we aling arguments WRT the
-			 * bracket. We use few tabs, and then at the and use
-			 * few spaces for fine-tuning the alignment. Please,
-			 * let's be consistent. Take a look at any UBI file for
-			 * example. */
 			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
-				GFP_KERNEL);
+						   GFP_KERNEL);
 			if (!new_aeb) {
 				ret = -ENOMEM;
-
 				goto out;
 			}
 
@@ -458,14 +447,12 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			err = process_pool_aeb(ubi, ai, vh, new_aeb);
 			if (err) {
 				ret = err > 0 ? UBI_BAD_FASTMAP : err;
-
 				goto out;
 			}
 		} else {
 			/* We are paranoid and fall back to scanning mode */
 			ubi_err("fastmap pool PEBs contains damaged PEBs!");
 			ret = err > 0 ? UBI_BAD_FASTMAP : err;
-
 			goto out;
 		}
 
@@ -474,7 +461,6 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 out:
 	ubi_free_vid_hdr(ubi, vh);
 	kfree(ech);
-
 	return ret;
 }
 
@@ -484,29 +470,20 @@ out:
  * @fm_raw: the fastmap it self as byte array
  * @fm_size: size of the fastmap in bytes
  */
-/* TODO: please, make all pointers like 'fm_raw' of type void. It is indeed a
- * pointer to data blob, it is not a pointer to a string of characters. Note,
- * that in pointer arithmetics void * is the same as char *. */
 static int ubi_attach_fastmap(struct ubi_device *ubi,
 			      struct ubi_attach_info *ai,
-			      char *fm_raw, size_t fm_size)
+			      void *fm_raw, size_t fm_size)
 {
-	struct list_head used;
-	struct list_head eba_orphans;
-	/* TODO: please, try to declare variables of the same time on one line */
+	struct list_head used, eba_orphans;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
 	struct ubi_ec_hdr *ech;
-
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmhdr;
 	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
 	struct ubi_fm_ec *fmec;
 	struct ubi_fm_volhdr *fmvhdr;
 	struct ubi_fm_eba *fm_eba;
-
-	/* TODO: no blank lines in the local variable declaration block
-	 * please. */
 	int ret, i, j;
 	size_t fm_pos = 0;
 	unsigned long long max_sqnum = 0;
@@ -521,11 +498,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	ai->min_ec = UBI_MAX_ERASECOUNTER;
 
 	ai->aeb_slab_cache = kmem_cache_create("ubi_ainf_peb_slab",
-					      sizeof(struct ubi_ainf_peb),
-					      0, 0, NULL);
+					       sizeof(struct ubi_ainf_peb),
+					       0, 0, NULL);
 	if (!ai->aeb_slab_cache) {
 		ret = -ENOMEM;
-
 		goto fail;
 	}
 
@@ -597,9 +573,9 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			goto fail_bad;
 
 		av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
-			be32_to_cpu(fmvhdr->used_ebs),
-			be32_to_cpu(fmvhdr->data_pad),
-			fmvhdr->vol_type, be32_to_cpu(fmvhdr->last_eb_bytes));
+			     be32_to_cpu(fmvhdr->used_ebs),
+			     be32_to_cpu(fmvhdr->data_pad),
+			     fmvhdr->vol_type, be32_to_cpu(fmvhdr->last_eb_bytes));
 
 		if (!av)
 			goto fail_bad;
@@ -618,14 +594,14 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			goto fail_bad;
 
 		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
+			int pnum = be32_to_cpu(fm_eba->pnum[j]);
 
 			if ((int)be32_to_cpu(fm_eba->pnum[j]) < 0)
 				continue;
 
 			aeb = NULL;
 			list_for_each_entry(tmp_aeb, &used, u.list) {
-				if (tmp_aeb->pnum == \
-					be32_to_cpu(fm_eba->pnum[j]))
+				if (tmp_aeb->pnum == pnum)
 					aeb = tmp_aeb;
 			}
 
@@ -638,7 +614,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			 */
 			if (!aeb) {
 				aeb = kmem_cache_alloc(ai->aeb_slab_cache,
-					GFP_KERNEL);
+						       GFP_KERNEL);
 				if (!aeb) {
 					ret = -ENOMEM;
 
@@ -649,9 +625,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 				aeb->pnum = be32_to_cpu(fm_eba->pnum[j]);
 				aeb->ec = -1;
 				aeb->scrub = aeb->copy_flag = aeb->sqnum = 0;
-
 				list_add_tail(&aeb->u.list, &eba_orphans);
-
 				continue;
 			}
 
@@ -669,18 +643,16 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 		if (!ech) {
 			ret = -ENOMEM;
-
 			goto fail;
 		}
 
 		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans,
-			u.list) {
+					 u.list) {
 			int err;
 
 			if (ubi_io_is_bad(ubi, tmp_aeb->pnum)) {
 				ret = UBI_BAD_FASTMAP;
 				kfree(ech);
-
 				goto fail;
 			}
 
@@ -702,12 +674,12 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	}
 
 	ret = scan_pool(ubi, ai, fmpl1->pebs, be32_to_cpu(fmpl1->size),
-		&max_sqnum, &eba_orphans);
+			&max_sqnum, &eba_orphans);
 	if (ret)
 		goto fail;
 
 	ret = scan_pool(ubi, ai, fmpl2->pebs, be32_to_cpu(fmpl2->size),
-		&max_sqnum, &eba_orphans);
+			&max_sqnum, &eba_orphans);
 	if (ret)
 		goto fail;
 
@@ -751,10 +723,13 @@ static int ubi_find_fastmap(struct ubi_device *ubi, int *fm_start)
 
 	*fm_start = -1;
 	for (i = 0; i < UBI_FM_MAX_START; i++) {
+		if (ubi_io_is_bad(ubi, i))
+			continue;
+
 		ret = ubi_io_read_vid_hdr(ubi, i, vhdr, 0);
 		if (ret < 0)
 			goto out;
-		else if (ret > 0)
+		else if (ret > 0 && ret != UBI_IO_BITFLIPS)
 			continue;
 
 		if (be32_to_cpu(vhdr->vol_id) == UBI_FM_SB_VOLUME_ID) {
@@ -798,7 +773,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
 	int ret, i, used_blocks, pnum, sb_pnum = 0;
-	char *fm_raw;
+	void *fm_raw;
 	size_t fm_size;
 	__be32 crc, tmp_crc;
 	unsigned long long sqnum = 0;
@@ -821,16 +796,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	 * care of? */
 	ret = ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fmsb));
 	if (ret && ret != UBI_IO_BITFLIPS) {
-		/* TODO: what are the error codes > 0 ? Why is this check? */
-		if (ret > 0)
-			ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
 		goto out;
 	}
 
-	/* TODO: please, use 'be32_to_cpu()' _every_ time you access a __be32 /
-	 * etc field. Please, look how things are done in io.c. Please, check
-	 * and fix globally. */
 	if (be32_to_cpu(fmsb->magic) != UBI_FM_SB_MAGIC) {
 		/* TODO: not urgent, but examine all the error messages and
 		 * print more information there. Here you should print what was
@@ -913,11 +882,9 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		}
 
 		ret = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
-		if (ret) {
+		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
-			if (ret > 0)
-				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
 			goto free_hdr;
 		}
@@ -941,13 +908,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			sqnum = be64_to_cpu(vh->sqnum);
 
 		ret = ubi_io_read(ubi, fm_raw + (ubi->leb_size * i), pnum,
-			ubi->leb_start, ubi->leb_size);
-
-		if (ret) {
+				  ubi->leb_start, ubi->leb_size);
+		if (ret && ret != UBI_IO_BITFLIPS) {
 			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
-			if (ret > 0)
-				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
 			goto free_hdr;
 		}
@@ -1023,7 +987,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 			     struct ubi_fastmap_layout *new_fm)
 {
 	size_t fm_pos = 0;
-	char *fm_raw;
+	void *fm_raw;
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmh;
 	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
@@ -1039,44 +1003,18 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	fm_raw = vzalloc(new_fm->size);
 	if (!fm_raw) {
 		ret = -ENOMEM;
-
-		/* TODO: nitpick, sorry for being annoying, but this should not
-		 * be difficult to fix. I find it very irritating when there
-		 * are useless blank lines like this - they only make less code
-		 * fit my screen and make large functions even larger.
-		 *
-		 * Why we use blank lines inside a single function? To make
-		 * code more readable. How we make it more readable? By
-		 * separating logically different blocks of code with a
-		 * newline.
-		 *
-		 * What is the perbose of these newlines before goto's? This is
-		 * a single piece of error-handling code - you assing the
-		 * return value and go to the further error processing. These
-		 * newlines serve no purpose just blow the lines number in the
-		 * code. Could we please kill them globally?
-		 *
-		 * I am again sorry - probably this is not completely
-		 * technical, but I gave the explanation why these newlines are
-		 * annying. And as a person who spent a lot of personal
-		 * (non-paid) time maintaining this code and who will keep
-		 * doing this - I think I have right to require to do such
-		 * cosmetic things :-) If you do not agree with my reasoning,
-		 * may be this is better - you'll keep me happier :-) */
 		goto out;
 	}
 
 	avhdr = new_fm_vhdr(ubi, UBI_FM_SB_VOLUME_ID);
 	if (!avhdr) {
 		ret = -ENOMEM;
-
 		goto out_vfree;
 	}
 
 	dvhdr = new_fm_vhdr(ubi, UBI_FM_DATA_VOLUME_ID);
 	if (!dvhdr) {
 		ret = -ENOMEM;
-
 		goto out_kfree;
 	}
 
@@ -1189,7 +1127,6 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avhdr);
 	if (ret) {
 		ubi_err("unable to write vid_hdr to fastmap SB!");
-
 		goto out_kfree;
 	}
 
@@ -1210,7 +1147,6 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err("unable to write vid_hdr to PEB %i!",
 				new_fm->e[i]->pnum);
-
 			goto out_kfree;
 		}
 	}
@@ -1221,7 +1157,6 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (ret) {
 			ubi_err("unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
-
 			goto out_kfree;
 		}
 	}
@@ -1303,9 +1238,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			}
 
 			/* we have to erase the block by hand */
-
 			ret = ubi_io_read_ec_hdr(ubi, old_fm->e[0]->pnum,
-				ec_hdr, 0);
+						 ec_hdr, 0);
 			if (ret && ret != UBI_IO_BITFLIPS) {
 				ubi_err("unable to read EC header");
 				kfree(ec_hdr);
@@ -1314,7 +1248,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			}
 
 			ret = ubi_io_sync_erase(ubi, old_fm->e[0]->pnum,
-				0);
+						0);
 			if (ret < 0) {
 				ubi_err("unable to erase old SB");
 				kfree(ec_hdr);
@@ -1334,7 +1268,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			ec_hdr->ec = cpu_to_be64(ec);
 			ret = ubi_io_write_ec_hdr(ubi, old_fm->e[0]->pnum,
-				ec_hdr);
+						  ec_hdr);
 			kfree(ec_hdr);
 			if (ret) {
 				ubi_err("unable to write new EC header");
-- 
1.7.6.5
