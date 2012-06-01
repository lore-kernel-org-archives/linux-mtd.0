Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb1-0001gE-LR
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/23] UBI: Fastmap: Simplify ubi_wl_put_fm_peb() logic
Date: Fri,  1 Jun 2012 17:16:28 +0200
Message-Id: <1338563804-85990-8-git-send-email-richard@nod.at>
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

ubi_wl_put_fm_peb() operates now on wl_entries instead of pnums.
Modifications to scan_peb() are no longer needed.
The fastmap used for attaching gets immediately freed after attaching.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |   22 +++++++++-------------
 drivers/mtd/ubi/fastmap.c |   38 +++++++++++++++++++-------------------
 drivers/mtd/ubi/ubi.h     |    2 +-
 drivers/mtd/ubi/wl.c      |   22 +++++-----------------
 4 files changed, 34 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 792808a..288c15c 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -978,11 +978,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 	vol_id = be32_to_cpu(vidh->vol_id);
 
-	if (vol_id > UBI_MAX_VOLUMES &&
-		vol_id != UBI_LAYOUT_VOLUME_ID &&
-		(ubi->attached_by_scanning ||
-		(vol_id != UBI_FM_SB_VOLUME_ID &&
-		vol_id != UBI_FM_DATA_VOLUME_ID))) {
+	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
 		int lnum = be32_to_cpu(vidh->lnum);
 
 		/* Unsupported internal volume */
@@ -1221,7 +1217,7 @@ out_ai:
  */
 int ubi_attach(struct ubi_device *ubi)
 {
-	int err;
+	int err, i;
 	struct ubi_attach_info *ai = NULL;
 
 	/* TODO: Allocate ai in this fuction. And destroy it here as well */
@@ -1238,16 +1234,11 @@ int ubi_attach(struct ubi_device *ubi)
 			ubi_err("Attach by fastmap failed! "
 				"Falling back to attach by scanning.");
 
-		/* TODO: please, remove this variable altogether, it is not
-		 * needed and it is a hack which you use to tell 'scan_peb()'
-		 * to handle fastmap volumes specially. Make this is a clean
-		 * way instead: after the scanning, go through the fastmap
-		 * volumes (if any was found) and delete them or do whatever
-		 * you need. Do not inject hacks to the scanning code. */
-		ubi->attached_by_scanning = 1;
 		ai = scan_all(ubi);
 		if (IS_ERR(ai))
 			return PTR_ERR(ai);
+		else
+			printk(KERN_ERR "attached by scanning!\n");
 	} else if (err < 0)
 		return err;
 
@@ -1282,6 +1273,11 @@ int ubi_attach(struct ubi_device *ubi)
 
 	ubi_destroy_ai(ai);
 
+	/* Return all PEBs used by the found fastmap to the WL sub-system. */
+	if (ubi->old_fm)
+		for (i = 0; i < ubi->old_fm->used_blocks; i++)
+			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[i], 0);
+
 	/* TODO: UBI auto formats the flash if it is empty (see ubi->is_empty).
 	 * It is currently done so that every sub-system writes initializes its
 	 * own stuff. Well, now it is only the vtbl sub-system - it creates
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index cbd8c0c..2e12e2c 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -836,34 +836,33 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	}
 
 	/* Store the fastmap position into the ubi_device struct */
-	ubi->fm = kmalloc(sizeof(*ubi->fm), GFP_KERNEL);
-	if (!ubi->fm) {
+	ubi->old_fm = kzalloc(sizeof(*ubi->old_fm), GFP_KERNEL);
+	if (!ubi->old_fm) {
 		ret = -ENOMEM;
 
 		goto free_hdr;
 	}
 
-	ubi->fm->size = fm_size;
-	ubi->fm->used_blocks = nblocks;
+	ubi->old_fm->size = fm_size;
+	ubi->old_fm->used_blocks = nblocks;
 
 	for (i = 0; i < nblocks; i++) {
-		ubi->fm->e[i] = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-		if (!ubi->fm->e[i]) {
+		struct ubi_wl_entry *e;
+
+		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
+		if (!e) {
 			while (i--)
-				kfree(ubi->fm->e[i]);
+				kfree(ubi->old_fm->e[i]);
 
-			kfree(ubi->fm);
+			kfree(ubi->old_fm);
 			ret = -ENOMEM;
+
 			goto free_hdr;
 		}
-	}
+		e->pnum = be32_to_cpu(fmsb->block_loc[i]);
+		e->ec = be32_to_cpu(fmsb->block_ec[i]);
 
-	for (i = 0; i < UBI_FM_MAX_BLOCKS; i++) {
-		if (i < nblocks) {
-			ubi->fm->e[i]->pnum = be32_to_cpu(fmsb->block_loc[i]);
-			ubi->fm->e[i]->ec = be32_to_cpu(fmsb->block_ec[i]);
-		} else
-			ubi->fm->e[i] = NULL;
+		ubi->old_fm->e[i] = e;
 	}
 
 free_hdr:
@@ -1103,6 +1102,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	int ret, i;
 	struct ubi_fastmap_layout *new_fm;
 
+	ubi_msg("ubi_update_fastmap!!!!");
+
 	if (ubi->ro_mode)
 		return 0;
 
@@ -1197,13 +1198,12 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			new_fm->e[0]->ec = ubi->old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
-			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[0]->pnum, 0);
-			new_fm->e[0]->ec = get_ec(ubi, new_fm->e[0]->pnum);
+			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[0], 0);
 		}
 
 		/* return all other fastmap block to the wl system */
 		for (i = 1; i < ubi->old_fm->used_blocks; i++)
-			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[i]->pnum, 0);
+			ubi_wl_put_fm_peb(ubi, ubi->old_fm->e[i], 0);
 	} else {
 		if (new_fm->e[0]->pnum < 0) {
 			ubi_err("Could not find an early PEB");
@@ -1233,7 +1233,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			ubi_err("Could not get any free erase block");
 
 			while (i--) {
-				ubi_wl_put_fm_peb(ubi, new_fm->e[i]->pnum, 0);
+				ubi_wl_put_fm_peb(ubi, new_fm->e[i], 0);
 				kfree(new_fm->e[i]);
 			}
 			ret = -ENOSPC;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c19131f..4360312 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -732,7 +732,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
 int ubi_thread(void *u);
 int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum);
-int ubi_wl_put_fm_peb(struct ubi_device *ubi, int pnum, int torture);
+int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e, int torture);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5bd7d99..0b1cabc 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -739,10 +739,10 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
  *
  * see: ubi_wl_put_peb()
  */
-int ubi_wl_put_fm_peb(struct ubi_device *ubi, int pnum, int torture)
+int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e, int torture)
 {
-	int i, err = 0;
 	struct ubi_wl_entry *e;
+	int pnum = used_e->pnum;
 
 	dbg_wl("PEB %d", pnum);
 	ubi_assert(pnum >= 0);
@@ -756,27 +756,15 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, int pnum, int torture)
 	 * has never seen any PEB used by the original fastmap.
 	 */
 	if (!e) {
-		ubi_assert(ubi->old_fm);
-
-		/* use the ec value from the fastmap */
-		for (i = 0; i < ubi->old_fm->used_blocks; i++) {
-			if (ubi->old_fm->e[i] &&
-				pnum == ubi->old_fm->e[i]->pnum) {
-				e = ubi->old_fm->e[i];
-				ubi->old_fm->e[i] = NULL;
-				break;
-			}
-		}
-		ubi_assert(e);
+		e = used_e;
+
 		ubi_assert(e->ec);
 		ubi->lookuptbl[pnum] = e;
 	}
 
 	spin_unlock(&ubi->wl_lock);
 
-	err = schedule_erase(ubi, e, torture);
-
-	return err;
+	return schedule_erase(ubi, e, torture);
 }
 
 /**
-- 
1.7.6.5
