Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel2D-0007BT-Ea
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/21] UBI: Fastmap: Store magic values in be32
Date: Wed, 13 Jun 2012 12:42:15 +0200
Message-Id: <1339584138-69914-19-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/fastmap.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4a16570..446dc0e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -544,21 +544,21 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	if (fm_pos >= fm_size)
 		goto fail_bad;
 
-	if (fmhdr->magic != UBI_FM_HDR_MAGIC)
+	if (be32_to_cpu(fmhdr->magic) != UBI_FM_HDR_MAGIC)
 		goto fail_bad;
 
 	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmpl1);
 	if (fm_pos >= fm_size)
 		goto fail_bad;
-	if (fmpl1->magic != UBI_FM_POOL_MAGIC)
+	if (be32_to_cpu(fmpl1->magic) != UBI_FM_POOL_MAGIC)
 		goto fail_bad;
 
 	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmpl2);
 	if (fm_pos >= fm_size)
 		goto fail_bad;
-	if (fmpl2->magic != UBI_FM_POOL_MAGIC)
+	if (be32_to_cpu(fmpl2->magic) != UBI_FM_POOL_MAGIC)
 		goto fail_bad;
 
 	/* read EC values from free list */
@@ -593,7 +593,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		if (fmvhdr->magic != UBI_FM_VHDR_MAGIC)
+		if (be32_to_cpu(fmvhdr->magic) != UBI_FM_VHDR_MAGIC)
 			goto fail_bad;
 
 		av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
@@ -614,7 +614,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		if (fm_eba->magic != UBI_FM_EBA_MAGIC)
+		if (be32_to_cpu(fm_eba->magic) != UBI_FM_EBA_MAGIC)
 			goto fail_bad;
 
 		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
@@ -831,7 +831,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	/* TODO: please, use 'be32_to_cpu()' _every_ time you access a __be32 /
 	 * etc field. Please, look how things are done in io.c. Please, check
 	 * and fix globally. */
-	if (fmsb->magic != UBI_FM_SB_MAGIC) {
+	if (be32_to_cpu(fmsb->magic) != UBI_FM_SB_MAGIC) {
 		/* TODO: not urgent, but examine all the error messages and
 		 * print more information there. Here you should print what was
 		 * read and what was expected. See io.c and do similarly or
@@ -1091,20 +1091,20 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	fm_pos += sizeof(*fmh);
 	ubi_assert(fm_pos <= new_fm->size);
 
-	fmsb->magic = UBI_FM_SB_MAGIC;
+	fmsb->magic = cpu_to_be32(UBI_FM_SB_MAGIC);
 	fmsb->version = UBI_FM_FMT_VERSION;
 	fmsb->used_blocks = cpu_to_be32(new_fm->used_blocks);
 	/* the max sqnum will be filled in while *reading* the fastmap */
 	fmsb->sqnum = 0;
 
-	fmh->magic = UBI_FM_HDR_MAGIC;
+	fmh->magic = cpu_to_be32(UBI_FM_HDR_MAGIC);
 	free_peb_count = 0;
 	used_peb_count = 0;
 	vol_count = 0;
 
 	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmpl1);
-	fmpl1->magic = UBI_FM_POOL_MAGIC;
+	fmpl1->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
 	fmpl1->size = cpu_to_be32(ubi->fm_pool.size);
 
 	for (i = 0; i < ubi->fm_pool.size; i++)
@@ -1112,7 +1112,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 
 	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
 	fm_pos += sizeof(*fmpl2);
-	fmpl2->magic = UBI_FM_POOL_MAGIC;
+	fmpl2->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
 	fmpl2->size = cpu_to_be32(ubi->fm_wl_pool.size);
 
 	for (i = 0; i < ubi->fm_wl_pool.size; i++)
@@ -1156,7 +1156,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fm_pos += sizeof(*fvh);
 		ubi_assert(fm_pos <= new_fm->size);
 
-		fvh->magic = UBI_FM_VHDR_MAGIC;
+		fvh->magic = cpu_to_be32(UBI_FM_VHDR_MAGIC);
 		fvh->vol_id = cpu_to_be32(vol->vol_id);
 		fvh->vol_type = vol->vol_type;
 		fvh->used_ebs = cpu_to_be32(vol->used_ebs);
@@ -1174,7 +1174,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 			feba->pnum[j] = cpu_to_be32(vol->eba_tbl[j]);
 
 		feba->reserved_pebs = cpu_to_be32(j);
-		feba->magic = UBI_FM_EBA_MAGIC;
+		feba->magic = cpu_to_be32(UBI_FM_EBA_MAGIC);
 	}
 	fmh->vol_count = cpu_to_be32(vol_count);
 	fmh->bad_peb_count = cpu_to_be32(ubi->bad_peb_count);
-- 
1.7.6.5
