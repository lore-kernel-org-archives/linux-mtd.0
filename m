Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb3-0001hg-QH
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/23] UBI: Fastmap: Fix messages
Date: Fri,  1 Jun 2012 17:16:32 +0200
Message-Id: <1338563804-85990-12-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove \n and do not start with a capital letter.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |    2 +-
 drivers/mtd/ubi/fastmap.c |   62 ++++++++++++++++++++++----------------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 1ee4a2f..4d86621 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -331,7 +331,7 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 		 * support these images anymore. Well, those images still work,
 		 * but only if no unclean reboots happened.
 		 */
-		ubi_err("unsupported on-flash UBI format\n");
+		ubi_err("unsupported on-flash UBI format");
 		return -EINVAL;
 	}
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 74e7963..80edfef 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -115,7 +115,7 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 	av->vol_type = vol_type;
 	av->root = RB_ROOT;
 
-	dbg_bld("Found volume (ID %i)", vol_id);
+	dbg_bld("found volume (ID %i)", vol_id);
 
 	rb_link_node(&av->rb, parent, p);
 	rb_insert_color(&av->rb, &ai->volumes);
@@ -219,7 +219,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				av->last_data_size = \
 					be32_to_cpu(new_vh->data_size);
 
-			dbg_bld("Vol %i: AEB %i's PEB %i is the newer\n",
+			dbg_bld("vol %i: AEB %i's PEB %i is the newer",
 				av->vol_id, aeb->lnum, new_aeb->pnum);
 
 			aeb->ec = new_aeb->ec;
@@ -229,7 +229,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		/* new_aeb is older */
 		} else {
-			dbg_bld("Vol %i: AEB %i's PEB %i is old, dropping it\n",
+			dbg_bld("vol %i: AEB %i's PEB %i is old, dropping it",
 				av->vol_id, aeb->lnum, new_aeb->pnum);
 			list_add_tail(&new_aeb->u.list, &ai->erase);
 		}
@@ -294,7 +294,7 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (found)
 		av = tmp_av;
 	else {
-		ubi_err("Orphaned volume in fastmap pool!");
+		ubi_err("orphaned volume in fastmap pool!");
 
 		return UBI_BAD_FASTMAP;
 	}
@@ -333,7 +333,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		return -ENOMEM;
 	}
 
-	dbg_bld("Scanning fastmap pool: size = %i", pool_size);
+	dbg_bld("scanning fastmap pool: size = %i", pool_size);
 
 	/*
 	 * Now scan all PEBs in the pool to find changes which have been made
@@ -343,7 +343,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		pnum = be32_to_cpu(pebs[i]);
 
 		if (ubi_io_is_bad(ubi, pnum)) {
-			dbg_bld("Bad PEB in fastmap pool!");
+			dbg_bld("bad PEB in fastmap pool!");
 			ret = UBI_BAD_FASTMAP;
 
 			goto out;
@@ -356,14 +356,14 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		else if (err == 0) {
 			err = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
 			if (err) {
-				dbg_bld("Unable to read EC header!");
+				dbg_bld("unable to read EC header!");
 				ret = err > 0 ? UBI_BAD_FASTMAP : err;
 
 				goto out;
 			}
 
 			if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
-				dbg_bld("Image seq mismatch!");
+				dbg_bld("image seq mismatch!");
 				err = UBI_BAD_FASTMAP;
 
 				goto out;
@@ -395,7 +395,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				*max_sqnum = new_aeb->sqnum;
 		} else {
 			/* We are paranoid and fall back to scanning mode */
-			ubi_err("Fastmap pool PEBs contains damaged PEBs!");
+			ubi_err("fastmap pool PEBs contains damaged PEBs!");
 			ret = err > 0 ? UBI_BAD_FASTMAP : err;
 
 			goto out;
@@ -552,7 +552,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 			assign_aeb_to_av(ai, aeb, av);
 
-			dbg_bld("Inserting PEB:%i (LEB %i) to vol %i",
+			dbg_bld("inserting PEB:%i (LEB %i) to vol %i",
 				aeb->pnum, aeb->lnum, av->vol_id);
 		}
 	}
@@ -661,7 +661,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 	ret = ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fmsb));
 	if (ret) {
-		ubi_err("Unable to read fastmap super block");
+		ubi_err("unable to read fastmap super block");
 		/* TODO: please, read what 'ubi_io_read()' returns.
 		 * This code is incorrect. All return codes are carefully
 		 * documented there. And do it globally, I see you ignore the
@@ -676,7 +676,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	if (fmsb->magic != UBI_FM_SB_MAGIC) {
-		ubi_err("Super block magic does not match");
+		ubi_err("super block magic does not match");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
 
@@ -684,7 +684,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	if (fmsb->version != UBI_FM_FMT_VERSION) {
-		ubi_err("Unknown fastmap format version!");
+		ubi_err("unknown fastmap format version!");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
 
@@ -694,7 +694,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	nblocks = be32_to_cpu(fmsb->nblocks);
 
 	if (nblocks > UBI_FM_MAX_BLOCKS || nblocks < 1) {
-		ubi_err("Number of fastmap blocks is invalid");
+		ubi_err("number of fastmap blocks is invalid");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
 
@@ -740,7 +740,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 		ret = ubi_io_read_ec_hdr(ubi, pnum, ech, 0);
 		if (ret) {
-			ubi_err("Unable to read fastmap block# %i EC (PEB: %i)",
+			ubi_err("unable to read fastmap block# %i EC (PEB: %i)",
 				i, pnum);
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
@@ -761,7 +761,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 		ret = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (ret) {
-			ubi_err("Unable to read fastmap block# %i (PEB: %i)",
+			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
@@ -793,7 +793,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			ubi->leb_start, ubi->leb_size);
 
 		if (ret) {
-			ubi_err("Unable to read fastmap block# %i (PEB: %i)",
+			ubi_err("unable to read fastmap block# %i (PEB: %i)",
 				i, pnum);
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
@@ -810,7 +810,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	fmsb->data_crc = 0;
 	crc = crc32_be(UBI_CRC32_INIT, fm_raw, fm_size);
 	if (crc != tmp_crc) {
-		ubi_err("Fastmap data CRC is invalid");
+		ubi_err("fastmap data CRC is invalid");
 		ret = UBI_BAD_FASTMAP;
 
 		goto free_hdr;
@@ -1010,10 +1010,10 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	spin_unlock(&ubi->wl_lock);
 	spin_unlock(&ubi->volumes_lock);
 
-	dbg_bld("Writing fastmap SB to PEB %i\n", new_fm->e[0]->pnum);
+	dbg_bld("writing fastmap SB to PEB %i", new_fm->e[0]->pnum);
 	ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avhdr);
 	if (ret) {
-		ubi_err("Unable to write vid_hdr to fastmap SB!\n");
+		ubi_err("unable to write vid_hdr to fastmap SB!");
 
 		goto out_kfree;
 	}
@@ -1029,11 +1029,11 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	for (i = 1; i < new_fm->used_blocks; i++) {
 		dvhdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 		dvhdr->lnum = cpu_to_be32(i);
-		dbg_bld("Writing fastmap data to PEB %i sqnum %llu\n",
+		dbg_bld("writing fastmap data to PEB %i sqnum %llu",
 			new_fm->e[i]->pnum, be64_to_cpu(dvhdr->sqnum));
 		ret = ubi_io_write_vid_hdr(ubi, new_fm->e[i]->pnum, dvhdr);
 		if (ret) {
-			ubi_err("Unable to write vid_hdr to PEB %i!\n",
+			ubi_err("unable to write vid_hdr to PEB %i!",
 				new_fm->e[i]->pnum);
 
 			goto out_kfree;
@@ -1044,7 +1044,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		ret = ubi_io_write(ubi, fm_raw + (i * ubi->leb_size),
 			new_fm->e[i]->pnum, ubi->leb_start, ubi->leb_size);
 		if (ret) {
-			ubi_err("Unable to write fastmap to PEB %i!\n",
+			ubi_err("unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
 
 			goto out_kfree;
@@ -1054,7 +1054,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	ubi_assert(new_fm);
 	ubi->fm = new_fm;
 
-	dbg_bld("Fastmap written!");
+	dbg_bld("fastmap written!");
 
 out_kfree:
 	ubi_free_vid_hdr(ubi, avhdr);
@@ -1148,7 +1148,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ret = ubi_io_read_ec_hdr(ubi, old_fm->e[0]->pnum,
 				ec_hdr, 0);
 			if (ret) {
-				ubi_err("Unable to read EC header");
+				ubi_err("unable to read EC header");
 				kfree(ec_hdr);
 
 				goto err;;
@@ -1157,7 +1157,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ret = ubi_io_sync_erase(ubi, old_fm->e[0]->pnum,
 				0);
 			if (ret < 0) {
-				ubi_err("Unable to erase old SB");
+				ubi_err("unable to erase old SB");
 				kfree(ec_hdr);
 
 				goto err;
@@ -1166,7 +1166,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ec = be64_to_cpu(ec_hdr->ec);
 			ec += ret;
 			if (ec > UBI_MAX_ERASECOUNTER) {
-				ubi_err("Erase counter overflow!");
+				ubi_err("erase counter overflow!");
 				kfree(ec_hdr);
 				ret = -EINVAL;
 
@@ -1178,7 +1178,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				ec_hdr);
 			kfree(ec_hdr);
 			if (ret) {
-				ubi_err("Unable to write new EC header");
+				ubi_err("unable to write new EC header");
 
 				goto err;
 			}
@@ -1195,7 +1195,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ubi_wl_put_fm_peb(ubi, old_fm->e[i], 0);
 	} else {
 		if (new_fm->e[0]->pnum < 0) {
-			ubi_err("Could not find an early PEB");
+			ubi_err("could not find an early PEB");
 			ret = -ENOSPC;
 
 			goto err;
@@ -1204,7 +1204,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	}
 
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
-		ubi_err("Fastmap too large");
+		ubi_err("fastmap too large");
 		ret = -ENOSPC;
 
 		goto err;
@@ -1219,7 +1219,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		spin_unlock(&ubi->wl_lock);
 
 		if (new_fm->e[i]->pnum < 0) {
-			ubi_err("Could not get any free erase block");
+			ubi_err("could not get any free erase block");
 
 			while (i--) {
 				ubi_wl_put_fm_peb(ubi, new_fm->e[i], 0);
-- 
1.7.6.5
