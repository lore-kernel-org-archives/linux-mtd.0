Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb2-0001h6-No
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/23] UBI: Fastmap: Remove ubi->old_fm logic
Date: Fri,  1 Jun 2012 17:16:30 +0200
Message-Id: <1338563804-85990-10-git-send-email-richard@nod.at>
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

There is no need to have this logic, we can do better. :-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |   24 ++++++++++++--------
 drivers/mtd/ubi/fastmap.c |   53 +++++++++++++++++++++-----------------------
 drivers/mtd/ubi/ubi.h     |    7 ++---
 3 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 288c15c..c4e7a3f 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1204,7 +1204,7 @@ out_vidh:
 out_ech:
 	kfree(ech);
 out_ai:
-	ubi_destroy_ai(ai);
+	ubi_destroy_ai(ubi, ai);
 	return ERR_PTR(err);
 }
 
@@ -1217,7 +1217,7 @@ out_ai:
  */
 int ubi_attach(struct ubi_device *ubi)
 {
-	int err, i;
+	int err;
 	struct ubi_attach_info *ai = NULL;
 
 	/* TODO: Allocate ai in this fuction. And destroy it here as well */
@@ -1271,12 +1271,7 @@ int ubi_attach(struct ubi_device *ubi)
 	if (err)
 		goto out_wl;
 
-	ubi_destroy_ai(ai);
-
-	/* Return all PEBs used by the found fastmap to the WL sub-system. */
-	if (ubi->old_fm)
-		for (i = 0; i < ubi->old_fm->used_blocks; i++)
-			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[i], 0);
+	ubi_destroy_ai(ubi, ai);
 
 	/* TODO: UBI auto formats the flash if it is empty (see ubi->is_empty).
 	 * It is currently done so that every sub-system writes initializes its
@@ -1293,7 +1288,7 @@ out_vtbl:
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_ai:
-	ubi_destroy_ai(ai);
+	ubi_destroy_ai(ubi, ai);
 	return err;
 }
 
@@ -1332,9 +1327,10 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 
 /**
  * ubi_destroy_ai - destroy attaching information.
+ * @ubi: UBI device object
  * @ai: attaching information
  */
-void ubi_destroy_ai(struct ubi_attach_info *ai)
+void ubi_destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *av;
@@ -1382,6 +1378,14 @@ void ubi_destroy_ai(struct ubi_attach_info *ai)
 	if (ai->aeb_slab_cache)
 		kmem_cache_destroy(ai->aeb_slab_cache);
 
+	/* Return all PEBs back to the WL sub-system */
+	if (ai->fm) {
+		while(ai->fm->used_blocks--)
+			ubi_wl_put_fm_peb(ubi, ai->fm->e[ai->fm->used_blocks], 0);
+
+		kfree(ai->fm);
+	}
+
 	kfree(ai);
 }
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2e12e2c..1a5f82e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -587,7 +587,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 fail_bad:
 	ret = UBI_BAD_FASTMAP;
 fail:
-	ubi_destroy_ai(ai);
+	ubi_destroy_ai(ubi, ai);
 	return ret;
 }
 
@@ -830,21 +830,20 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	if (ret) {
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
-		ubi_destroy_ai(*ai);
+		ubi_destroy_ai(ubi, *ai);
 
 		goto free_hdr;
 	}
 
-	/* Store the fastmap position into the ubi_device struct */
-	ubi->old_fm = kzalloc(sizeof(*ubi->old_fm), GFP_KERNEL);
-	if (!ubi->old_fm) {
+	(*ai)->fm = kzalloc(sizeof(*(*ai)->fm), GFP_KERNEL);
+	if (!(*ai)->fm) {
 		ret = -ENOMEM;
 
 		goto free_hdr;
 	}
 
-	ubi->old_fm->size = fm_size;
-	ubi->old_fm->used_blocks = nblocks;
+	(*ai)->fm->size = fm_size;
+	(*ai)->fm->used_blocks = nblocks;
 
 	for (i = 0; i < nblocks; i++) {
 		struct ubi_wl_entry *e;
@@ -852,9 +851,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 		if (!e) {
 			while (i--)
-				kfree(ubi->old_fm->e[i]);
+				kfree((*ai)->fm->e[i]);
 
-			kfree(ubi->old_fm);
+			kfree((*ai)->fm);
+			(*ai)->fm = NULL;
 			ret = -ENOMEM;
 
 			goto free_hdr;
@@ -862,7 +862,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		e->pnum = be32_to_cpu(fmsb->block_loc[i]);
 		e->ec = be32_to_cpu(fmsb->block_ec[i]);
 
-		ubi->old_fm->e[i] = e;
+		(*ai)->fm->e[i] = e;
 	}
 
 free_hdr:
@@ -1100,9 +1100,7 @@ static int get_ec(struct ubi_device *ubi, int pnum)
 int ubi_update_fastmap(struct ubi_device *ubi)
 {
 	int ret, i;
-	struct ubi_fastmap_layout *new_fm;
-
-	ubi_msg("ubi_update_fastmap!!!!");
+	struct ubi_fastmap_layout *new_fm, *old_fm;
 
 	if (ubi->ro_mode)
 		return 0;
@@ -1134,14 +1132,14 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 	mutex_lock(&ubi->fm_mutex);
 
-	ubi->old_fm = ubi->fm;
+	old_fm = ubi->fm;
 	ubi->fm = NULL;
 
 	spin_lock(&ubi->wl_lock);
 	new_fm->e[0]->pnum = ubi_wl_get_fm_peb(ubi, UBI_FM_MAX_START);
 	spin_unlock(&ubi->wl_lock);
 
-	if (ubi->old_fm) {
+	if (old_fm) {
 		/* no fresh early PEB was found, reuse the old one */
 		if (new_fm->e[0]->pnum < 0) {
 			struct ubi_ec_hdr *ec_hdr;
@@ -1156,7 +1154,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 			/* we have to erase the block by hand */
 
-			ret = ubi_io_read_ec_hdr(ubi, ubi->old_fm->e[0]->pnum,
+			ret = ubi_io_read_ec_hdr(ubi, old_fm->e[0]->pnum,
 				ec_hdr, 0);
 			if (ret) {
 				ubi_err("Unable to read EC header");
@@ -1165,7 +1163,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;;
 			}
 
-			ret = ubi_io_sync_erase(ubi, ubi->old_fm->e[0]->pnum,
+			ret = ubi_io_sync_erase(ubi, old_fm->e[0]->pnum,
 				0);
 			if (ret < 0) {
 				ubi_err("Unable to erase old SB");
@@ -1185,7 +1183,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			}
 
 			ec_hdr->ec = cpu_to_be64(ec);
-			ret = ubi_io_write_ec_hdr(ubi, ubi->old_fm->e[0]->pnum,
+			ret = ubi_io_write_ec_hdr(ubi, old_fm->e[0]->pnum,
 				ec_hdr);
 			kfree(ec_hdr);
 			if (ret) {
@@ -1194,16 +1192,16 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;
 			}
 
-			new_fm->e[0]->pnum = ubi->old_fm->e[0]->pnum;
-			new_fm->e[0]->ec = ubi->old_fm->e[0]->ec;
+			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
+			new_fm->e[0]->ec = old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
-			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[0], 0);
+			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0);
 		}
 
 		/* return all other fastmap block to the wl system */
-		for (i = 1; i < ubi->old_fm->used_blocks; i++)
-			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[i], 0);
+		for (i = 1; i < old_fm->used_blocks; i++)
+			ubi_wl_put_fm_peb(ubi, old_fm->e[i], 0);
 	} else {
 		if (new_fm->e[0]->pnum < 0) {
 			ubi_err("Could not find an early PEB");
@@ -1244,12 +1242,11 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		new_fm->e[i]->ec = get_ec(ubi, new_fm->e[i]->pnum);
 	}
 
-	if (ubi->old_fm) {
-		for (i = 0; i < ubi->old_fm->used_blocks; i++)
-			kfree(ubi->old_fm->e[i]);
+	if (old_fm) {
+		for (i = 0; i < old_fm->used_blocks; i++)
+			kfree(old_fm->e[i]);
 
-		kfree(ubi->old_fm);
-		ubi->old_fm = NULL;
+		kfree(old_fm);
 	}
 
 	ret = ubi_write_fastmap(ubi, new_fm);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 4360312..c677c19 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -380,8 +380,6 @@ struct ubi_wl_entry;
  * @alc_mutex: serializes "atomic LEB change" operations
  *
  * @fm: in-memory data structure of the currently used fastmap
- * @old_fm: in-memory data structure old fastmap.
- *	    (only valid while writing a new one)
  * @fm_pool: in-memory data structure of the fastmap pool
  * @fm_pool_mutex: serializes ubi_wl_get_peb()
  * @fm_mutex: serializes ubi_update_fastmap()
@@ -481,7 +479,6 @@ struct ubi_device {
 
 	/* Fastmap stuff */
 	struct ubi_fastmap_layout *fm;
-	struct ubi_fastmap_layout *old_fm;
 	struct ubi_fm_pool fm_pool;
 	struct mutex fm_mutex;
 	struct mutex fm_pool_mutex;
@@ -626,6 +623,7 @@ struct ubi_ainf_volume {
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
  * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
+ * @fm: the fastmap used for attaching
  *
  * This data structure contains the result of attaching an MTD device and may
  * be used by other UBI sub-systems to build final UBI data structures, further
@@ -652,6 +650,7 @@ struct ubi_attach_info {
 	uint64_t ec_sum;
 	int ec_count;
 	struct kmem_cache *aeb_slab_cache;
+	struct ubi_fastmap_layout *fm;
 };
 
 #include "debug.h"
@@ -673,7 +672,7 @@ void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 				       struct ubi_attach_info *ai);
 int ubi_attach(struct ubi_device *ubi);
-void ubi_destroy_ai(struct ubi_attach_info *ai);
+void ubi_destroy_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
-- 
1.7.6.5
