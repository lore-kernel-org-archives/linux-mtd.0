Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel27-00078W-L2
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/21] UBI: Fastmap: Make ubi_wl_get_fm_peb() return a
 ubi_wl_entry
Date: Wed, 13 Jun 2012 12:42:06 +0200
Message-Id: <1339584138-69914-10-git-send-email-richard@nod.at>
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

...makes life easier

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |   36 +++++++++++-------------------------
 drivers/mtd/ubi/ubi.h     |    2 +-
 drivers/mtd/ubi/wl.c      |    8 +++-----
 3 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1d3f724..fb5dae5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1191,24 +1191,6 @@ out:
 }
 
 /**
- * get_ec - returns the erase counter of a given PEB
- * @ubi: UBI device object
- * @pnum: PEB number
- */
-static int get_ec(struct ubi_device *ubi, int pnum)
-{
-	struct ubi_wl_entry *e;
-
-	e = ubi->lookuptbl[pnum];
-
-	/* can this really happen? */
-	if (!e)
-		return ubi->mean_ec ?: 1;
-	else
-		return e->ec;
-}
-
-/**
  * ubi_update_fastmap - will be called by UBI if a volume changes or
  * a fastmap pool becomes full.
  * @ubi: UBI device object
@@ -1217,6 +1199,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 {
 	int ret, i;
 	struct ubi_fastmap_layout *new_fm, *old_fm;
+	struct ubi_wl_entry *tmp_e;
 
 	if (ubi->ro_mode)
 		return 0;
@@ -1252,12 +1235,12 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	ubi->fm = NULL;
 
 	spin_lock(&ubi->wl_lock);
-	new_fm->e[0]->pnum = ubi_wl_get_fm_peb(ubi, UBI_FM_MAX_START);
+	tmp_e = ubi_wl_get_fm_peb(ubi, UBI_FM_MAX_START);
 	spin_unlock(&ubi->wl_lock);
 
 	if (old_fm) {
 		/* no fresh early PEB was found, reuse the old one */
-		if (new_fm->e[0]->pnum < 0) {
+		if (!tmp_e) {
 			struct ubi_ec_hdr *ec_hdr;
 			long long ec;
 
@@ -1309,6 +1292,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			}
 
 			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
+			new_fm->e[0]->ec = old_fm->e[0]->ec;
 		} else {
 			/* we've got a new early PEB, return the old one */
 			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0);
@@ -1318,7 +1302,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		for (i = 1; i < old_fm->used_blocks; i++)
 			ubi_wl_put_fm_peb(ubi, old_fm->e[i], 0);
 	} else {
-		if (new_fm->e[0]->pnum < 0) {
+		if (!tmp_e) {
 			ubi_err("could not find an early PEB");
 			ret = -ENOSPC;
 
@@ -1326,7 +1310,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		}
 	}
 
-	new_fm->e[0]->ec = get_ec(ubi, new_fm->e[0]->pnum);
+	new_fm->e[0]->pnum = tmp_e->pnum;
+	new_fm->e[0]->ec = tmp_e->ec;
 
 	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
 		ubi_err("fastmap too large");
@@ -1340,10 +1325,10 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 	for (i = 1; i < new_fm->used_blocks; i++) {
 		spin_lock(&ubi->wl_lock);
-		new_fm->e[i]->pnum = ubi_wl_get_fm_peb(ubi, -1);
+		tmp_e = ubi_wl_get_fm_peb(ubi, -1);
 		spin_unlock(&ubi->wl_lock);
 
-		if (new_fm->e[i]->pnum < 0) {
+		if (!new_fm->e[i]) {
 			ubi_err("could not get any free erase block");
 
 			while (i--) {
@@ -1355,7 +1340,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 			goto err;
 		}
 
-		new_fm->e[i]->ec = get_ec(ubi, new_fm->e[i]->pnum);
+		new_fm->e[i]->pnum = tmp_e->pnum;
+		new_fm->e[i]->ec = tmp_e->ec;
 	}
 
 	if (old_fm) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0db97b0..be1933b 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -730,7 +730,7 @@ int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
 int ubi_thread(void *u);
-int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum);
+struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum);
 int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e, int torture);
 
 /* io.c */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 52548e7..15e4895 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -441,10 +441,9 @@ static struct ubi_wl_entry *find_early_wl_entry(struct rb_root *root,
  * If max_pnum is negative a PEB with a mean EC will be selected.
  * Must be called with wl_lock held!
  */
-int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum)
+struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum)
 {
-	int ret = -ENOSPC;
-	struct ubi_wl_entry *e;
+	struct ubi_wl_entry *e = NULL;
 
 	if (!ubi->free.rb_node) {
 		ubi_err("no free eraseblocks");
@@ -461,13 +460,12 @@ int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum)
 		goto out;
 
 	self_check_in_wl_tree(ubi, e, &ubi->free);
-	ret = e->pnum;
 
 	/* remove it from the free list,
 	 * the wl subsystem does no longer know this erase block */
 	rb_erase(&e->u.rb, &ubi->free);
 out:
-	return ret;
+	return e;
 }
 
 /**
-- 
1.7.6.5
