Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTbA-0001jV-2o
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/23] UBI: Fastmap: Handle protection queue correctly
Date: Fri,  1 Jun 2012 17:16:40 +0200
Message-Id: <1338563804-85990-20-git-send-email-richard@nod.at>
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

It can happen that fastmap finds a PEBs in the EBA of a volume
which is not in the used list nor in the fastmap pool.
In this case the fastmap was written while this PEB was protected.
Such a PEB has to be treated like a pool PEB.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   82 +++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 9edc6a1..78f196d 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -313,17 +313,20 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
  * @pebs: an array of all PEB numbers in the to be scanned pool
  * @pool_size: size of the pool (number of entries in @pebs)
  * @max_sqnum: pointer to the maximal sequence number
+ * @eba_orphans: list of PEBs which need to be scanned
  */
 static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
-	int *pebs, int pool_size, unsigned long long *max_sqnum)
+		     int *pebs, int pool_size, unsigned long long *max_sqnum,
+		     struct list_head *eba_orphans)
 {
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
-	struct ubi_ainf_peb *new_aeb;
+	struct ubi_ainf_peb *new_aeb, *tmp_aeb;
 	int i;
 	int pnum;
 	int err;
 	int ret = 0;
+	int found_orphan;
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
@@ -379,6 +382,18 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				goto out;
 			}
 
+			found_orphan = 0;
+			list_for_each_entry(tmp_aeb, eba_orphans, u.list) {
+				if (tmp_aeb->pnum == pnum) {
+					found_orphan = 1;
+					break;
+				}
+			}
+			if (found_orphan) {
+				kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+				list_del(&tmp_aeb->u.list);
+			}
+
 			new_aeb = kmem_cache_alloc(ai->aeb_slab_cache,
 				GFP_KERNEL);
 			if (!new_aeb) {
@@ -431,8 +446,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			      char *fm_raw, size_t fm_size)
 {
 	struct list_head used;
+	struct list_head eba_orphans;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
+	struct ubi_ec_hdr *ech;
 
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmhdr;
@@ -446,6 +463,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	unsigned long long max_sqnum = 0;
 
 	INIT_LIST_HEAD(&used);
+	INIT_LIST_HEAD(&eba_orphans);
 	INIT_LIST_HEAD(&ai->corr);
 	INIT_LIST_HEAD(&ai->free);
 	INIT_LIST_HEAD(&ai->erase);
@@ -551,9 +569,28 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 					aeb = tmp_aeb;
 			}
 
-			/* Corner case, this PEB must be in the pool */
-			if (!aeb)
+			/* This can happen if a PEB is already in an EBA known
+			 * by this fastmap but the PEB itself is not in the used list.
+			 * In this case the PEB can be within the fastmap pool or
+			 * while writing the fastmap it was in the protected queue.
+			 */
+			if (!aeb) {
+				aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+				if (!aeb) {
+					ret = -ENOMEM;
+
+					goto fail;
+				}
+
+				aeb->lnum = j;
+				aeb->pnum = be32_to_cpu(fm_eba->pnum[j]);
+				aeb->ec = -1;
+				aeb->scrub = aeb->copy_flag = aeb->sqnum = 0;
+
+				list_add_tail(&aeb->u.list, &eba_orphans);
+
 				continue;
+			}
 
 			aeb->lnum = j;
 
@@ -565,10 +602,43 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			dbg_bld("inserting PEB:%i (LEB %i) to vol %i",
 				aeb->pnum, aeb->lnum, av->vol_id);
 		}
+
+		ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+		if (!ech) {
+			ret = -ENOMEM;
+
+			goto fail;
+		}
+
+		list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
+			int err;
+
+			if (ubi_io_is_bad(ubi, tmp_aeb->pnum)) {
+				ret = UBI_BAD_FASTMAP;
+				kfree(ech);
+
+				goto fail;
+			}
+
+			err = ubi_io_read_ec_hdr(ubi, tmp_aeb->pnum, ech, 0);
+			if (err && err != UBI_IO_BITFLIPS) {
+				dbg_bld("unable to read EC header!");
+				ret = err > 0 ? UBI_BAD_FASTMAP : err;
+				kfree(ech);
+
+				goto fail;
+			} else if (err == UBI_IO_BITFLIPS)
+				tmp_aeb->scrub = 1;
+
+			tmp_aeb->ec = be64_to_cpu(ech->ec);
+			assign_aeb_to_av(ai, tmp_aeb, av);
+		}
+
+		kfree(ech);
 	}
 
 	/*
-	 * The remainning PEB in the used list are not used.
+	 * The remainning PEBs in the used list are not used.
 	 * They lived in the fastmap pool but got never used.
 	 */
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
@@ -577,7 +647,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	}
 
 	ret = scan_pool(ubi, ai, fmpl->pebs, be32_to_cpu(fmpl->size),
-		&max_sqnum);
+		&max_sqnum, &eba_orphans);
 	if (ret)
 		goto fail;
 
-- 
1.7.6.5
