Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb7-0001if-4s
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/23] UBI: Fastmap: Rename fastmap attributes
Date: Fri,  1 Jun 2012 17:16:35 +0200
Message-Id: <1338563804-85990-15-git-send-email-richard@nod.at>
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

... rename them to match the UBI names.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c   |   50 +++++++++++++++++++++---------------------
 drivers/mtd/ubi/ubi-media.h |   26 ++++++++++------------
 2 files changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 80edfef..e2600cd 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -474,7 +474,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		goto fail_bad;
 
 	/* read EC values from free list */
-	for (i = 0; i < be32_to_cpu(fmhdr->nfree); i++) {
+	for (i = 0; i < be32_to_cpu(fmhdr->free_peb_count); i++) {
 		fmec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 		fm_pos += sizeof(*fmec);
 		if (fm_pos >= fm_size)
@@ -485,7 +485,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	}
 
 	/* read EC values from used list */
-	for (i = 0; i < be32_to_cpu(fmhdr->nused); i++) {
+	for (i = 0; i < be32_to_cpu(fmhdr->used_peb_count); i++) {
 		fmec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
 		fm_pos += sizeof(*fmec);
 		if (fm_pos >= fm_size)
@@ -496,10 +496,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	}
 
 	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
-	ai->bad_peb_count = be32_to_cpu(fmhdr->nbad);
+	ai->bad_peb_count = be32_to_cpu(fmhdr->bad_peb_count);
 
 	/* Iterate over all volumes and read their EBA table */
-	for (i = 0; i < be32_to_cpu(fmhdr->nvol); i++) {
+	for (i = 0; i < be32_to_cpu(fmhdr->vol_count); i++) {
 		fmvhdr = (struct ubi_fm_volhdr *)(fm_raw + fm_pos);
 		fm_pos += sizeof(*fmvhdr);
 		if (fm_pos >= fm_size)
@@ -522,14 +522,14 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 		fm_eba = (struct ubi_fm_eba *)(fm_raw + fm_pos);
 		fm_pos += sizeof(*fm_eba);
-		fm_pos += (sizeof(__be32) * be32_to_cpu(fm_eba->nused));
+		fm_pos += (sizeof(__be32) * be32_to_cpu(fm_eba->reserved_pebs));
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
 		if (fm_eba->magic != UBI_FM_EBA_MAGIC)
 			goto fail_bad;
 
-		for (j = 0; j < be32_to_cpu(fm_eba->nused); j++) {
+		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
 
 			if ((int)be32_to_cpu(fm_eba->pnum[j]) < 0)
 				continue;
@@ -639,7 +639,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	struct ubi_fm_sb *fmsb;
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
-	int ret, i, nblocks, pnum;
+	int ret, i, used_blocks, pnum;
 	int sb_pnum = 0;
 	char *fm_raw;
 	size_t fm_size;
@@ -691,9 +691,9 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto out;
 	}
 
-	nblocks = be32_to_cpu(fmsb->nblocks);
+	used_blocks = be32_to_cpu(fmsb->used_blocks);
 
-	if (nblocks > UBI_FM_MAX_BLOCKS || nblocks < 1) {
+	if (used_blocks > UBI_FM_MAX_BLOCKS || used_blocks < 1) {
 		ubi_err("number of fastmap blocks is invalid");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
@@ -701,7 +701,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto out;
 	}
 
-	fm_size = ubi->leb_size * nblocks;
+	fm_size = ubi->leb_size * used_blocks;
 	/* fm_raw will contain the whole fastmap */
 	fm_raw = vzalloc(fm_size);
 	if (!fm_raw) {
@@ -728,7 +728,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		goto free_raw;
 	}
 
-	for (i = 0; i < nblocks; i++) {
+	for (i = 0; i < used_blocks; i++) {
 		pnum = be32_to_cpu(fmsb->block_loc[i]);
 
 		if (ubi_io_is_bad(ubi, pnum)) {
@@ -834,9 +834,9 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	ai->fm->size = fm_size;
-	ai->fm->used_blocks = nblocks;
+	ai->fm->used_blocks = used_blocks;
 
-	for (i = 0; i < nblocks; i++) {
+	for (i = 0; i < used_blocks; i++) {
 		struct ubi_wl_entry *e;
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
@@ -891,7 +891,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 
 	struct ubi_vid_hdr *avhdr, *dvhdr;
 
-	int nfree, nused, nvol;
+	int free_peb_count, used_peb_count, vol_count;
 
 	fm_raw = vzalloc(new_fm->size);
 	if (!fm_raw) {
@@ -927,14 +927,14 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 
 	fmsb->magic = UBI_FM_SB_MAGIC;
 	fmsb->version = UBI_FM_FMT_VERSION;
-	fmsb->nblocks = cpu_to_be32(new_fm->used_blocks);
+	fmsb->used_blocks = cpu_to_be32(new_fm->used_blocks);
 	/* the max sqnum will be filled in while *reading* the fastmap */
 	fmsb->sqnum = 0;
 
 	fmh->magic = UBI_FM_HDR_MAGIC;
-	nfree = 0;
-	nused = 0;
-	nvol = 0;
+	free_peb_count = 0;
+	used_peb_count = 0;
+	vol_count = 0;
 
 	fmpl = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmpl);
@@ -951,11 +951,11 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fec->pnum = cpu_to_be32(wl_e->pnum);
 		fec->ec = cpu_to_be32(wl_e->ec);
 
-		nfree++;
+		free_peb_count++;
 		fm_pos += sizeof(*fec);
 		ubi_assert(fm_pos <= new_fm->size);
 	}
-	fmh->nfree = cpu_to_be32(nfree);
+	fmh->free_peb_count = cpu_to_be32(free_peb_count);
 
 	for (node = rb_first(&ubi->used); node; node = rb_next(node)) {
 		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
@@ -964,11 +964,11 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fec->pnum = cpu_to_be32(wl_e->pnum);
 		fec->ec = cpu_to_be32(wl_e->ec);
 
-		nused++;
+		used_peb_count++;
 		fm_pos += sizeof(*fec);
 		ubi_assert(fm_pos <= new_fm->size);
 	}
-	fmh->nused = cpu_to_be32(nused);
+	fmh->used_peb_count = cpu_to_be32(used_peb_count);
 
 	for (i = 0; i < UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT; i++) {
 		vol = ubi->volumes[i];
@@ -976,7 +976,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		if (!vol)
 			continue;
 
-		nvol++;
+		vol_count++;
 
 		fvh = (struct ubi_fm_volhdr *)(fm_raw + fm_pos);
 		fm_pos += sizeof(*fvh);
@@ -999,10 +999,10 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		for (j = 0; j < vol->used_ebs; j++)
 			feba->pnum[j] = cpu_to_be32(vol->eba_tbl[j]);
 
-		feba->nused = cpu_to_be32(j);
+		feba->reserved_pebs = cpu_to_be32(j);
 		feba->magic = UBI_FM_EBA_MAGIC;
 	}
-	fmh->nvol = cpu_to_be32(nvol);
+	fmh->vol_count = cpu_to_be32(vol_count);
 
 	avhdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	avhdr->lnum = 0;
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index adca33c..b4ecd1b 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -408,7 +408,7 @@ struct ubi_vtbl_record {
  * @magic: fastmap super block magic number (%UBI_FM_SB_MAGIC)
  * @version: format version of this fastmap
  * @data_crc: CRC over the fastmap data
- * @nblocks: number of PEBs used by this fastmap
+ * @used_blocks: number of PEBs used by this fastmap
  * @block_loc: an array containing the location of all PEBs of the fastmap
  * @block_ec: the erase counter of each used PEB
  * @sqnum: highest sequence number value at the time while taking the fastmap
@@ -419,7 +419,7 @@ struct ubi_fm_sb {
 	__u8 version;
 	__u8 padding1[3];
 	__be32 data_crc;
-	__be32 nblocks;
+	__be32 used_blocks;
 	__be32 block_loc[UBI_FM_MAX_BLOCKS];
 	__be32 block_ec[UBI_FM_MAX_BLOCKS];
 	__be64 sqnum;
@@ -429,19 +429,17 @@ struct ubi_fm_sb {
 /**
  * struct ubi_fm_hdr - header of the fastmap data set
  * @magic: fastmap header magic number (%UBI_FM_HDR_MAGIC)
- * @nfree: number of free PEBs known by this fastmap
- * @nused: number of used PEBs known by this fastmap
- * @nvol: number of UBI volumes known by this fastmap
+ * @free_peb_count: number of free PEBs known by this fastmap
+ * @free_peb_count: number of used PEBs known by this fastmap
+ * @vol_count: number of UBI volumes known by this fastmap
+ * @bad_peb_count: number of bad PEBs known by this fastmap
  */
 struct ubi_fm_hdr {
 	__be32 magic;
-	/* TODO: would you please name these fields using the same names UBI
-	 * uses in the in-RAM data structures (bad_peb_count, good_peb_count,
-	 * etc.) See struct ubi_device. */
-	__be32 nfree;
-	__be32 nused;
-	__be32 nvol;
-	__be32 nbad;
+	__be32 free_peb_count;
+	__be32 used_peb_count;
+	__be32 vol_count;
+	__be32 bad_peb_count;
 	__u8 padding[12];
 } __packed;
 
@@ -498,12 +496,12 @@ struct ubi_fm_volhdr {
 /**
  * struct ubi_fm_eba - denotes an association beween a PEB and LEB
  * @magic EBA table magic number
- * @nused: number of table entries
+ * @reserved_pebs: number of table entries
  * @pnum: PEB number of LEB (LEB is the index)
  */
 struct ubi_fm_eba {
 	__be32 magic;
-	__be32 nused;
+	__be32 reserved_pebs;
 	__be32 pnum[0];
 } __packed;
 #endif /* !__UBI_MEDIA_H__ */
-- 
1.7.6.5
