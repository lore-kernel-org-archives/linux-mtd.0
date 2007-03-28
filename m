Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWYV3-0004y0-Jg
	for linux-mtd@lists.infradead.org; Wed, 28 Mar 2007 14:47:44 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l2SDlT8s331498
	for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2007 13:47:29 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2SDlTCW2015268
	for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2007 14:47:29 +0100
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2SDlTtQ010655
	for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2007 14:47:29 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC] [PATCH] UBI: refine wear leveling logic
Date: Wed, 28 Mar 2007 15:47:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703281547.18851.alexs@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch addresses the handling of blocks that are put by the user
while they are moved by the wear leveling thread. The schedule_erase
function is now called by put_peb() itself instead of notifying the wear
leveling thread.

Comments are welcome...

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/ubi.h |    2 -
 drivers/mtd/ubi/wl.c  |   77 ++++++++------------------------------------------
 2 files changed, 13 insertions(+), 66 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/ubi.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/ubi.h
@@ -316,8 +316,6 @@ struct ubi_device {
 	unsigned long long abs_ec;
 	struct ubi_wl_entry *move_from;
 	struct ubi_wl_entry *move_to;
-	int move_from_put;
-	int move_to_put;
 	struct list_head works;
 	int works_count;
 	struct task_struct *bgt_thread;
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/wl.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/wl.c
@@ -793,7 +793,7 @@ static int schedule_erase(struct ubi_dev
 static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int cancel)
 {
-	int err, put = 0;
+	int err;
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
 
@@ -864,7 +864,6 @@ static int wear_leveling_worker(struct u
 
 	free_tree_del(ubi, e2);
 	ubi_assert(!ubi->move_from && !ubi->move_to);
-	ubi_assert(!ubi->move_to_put && !ubi->move_from_put);
 	ubi->move_from = e1;
 	ubi->move_to = e2;
 	spin_unlock(&ubi->wl_lock);
@@ -907,28 +906,11 @@ static int wear_leveling_worker(struct u
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	spin_lock(&ubi->wl_lock);
-	if (unlikely(!ubi->move_to_put))
-		used_tree_add(ubi, e2);
-	else
-		put = 1;
+	used_tree_add(ubi, e2);
 	ubi->move_from = ubi->move_to = NULL;
-	ubi->move_from_put = ubi->move_to_put = 0;
 	ubi->wl_scheduled = 0;
 	spin_unlock(&ubi->wl_lock);
 
-	if (unlikely(put)) {
-		/*
-		 * Well, the target PEB was put meanwhile, schedule it for
-		 * erasure.
-		 */
-		dbg_wl("PEB %d was put meanwhile, erase", e2->pnum);
-		err = schedule_erase(ubi, e2, 0);
-		if (unlikely(err)) {
-			kmem_cache_free(wl_entries_slab, e2);
-			ubi_ro_mode(ubi);
-		}
-	}
-
 	err = schedule_erase(ubi, e1, 0);
 	if (unlikely(err)) {
 		kmem_cache_free(wl_entries_slab, e1);
@@ -950,27 +932,10 @@ error:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	spin_lock(&ubi->wl_lock);
 	ubi->wl_scheduled = 0;
-	if (ubi->move_from_put)
-		put = 1;
-	else
-		used_tree_add(ubi, e1);
+	used_tree_add(ubi, e1);
 	ubi->move_from = ubi->move_to = NULL;
-	ubi->move_from_put = ubi->move_to_put = 0;
 	spin_unlock(&ubi->wl_lock);
 
-	if (put) {
-		/*
-		 * Well, the target PEB was put meanwhile, schedule it for
-		 * erasure.
-		 */
-		dbg_wl("PEB %d was put meanwhile, erase", e1->pnum);
-		err = schedule_erase(ubi, e1, 0);
-		if (unlikely(err)) {
-			kmem_cache_free(wl_entries_slab, e1);
-			ubi_ro_mode(ubi);
-		}
-	}
-
 	err = schedule_erase(ubi, e2, 0);
 	if (unlikely(err)) {
 		kmem_cache_free(wl_entries_slab, e2);
@@ -1183,34 +1148,18 @@ int ubi_wl_put_peb(struct ubi_device *ub
 	if (unlikely(e == ubi->move_from)) {
 		/*
 		 * User is putting the physical eraseblock which was selected to
-		 * be moved. It will be scheduled for erasure in the
-		 * wear-leveling worker.
-		 */
-		dbg_wl("PEB %d is being moved", pnum);
-		ubi_assert(!ubi->move_from_put);
-		ubi->move_from_put = 1;
-		spin_unlock(&ubi->wl_lock);
-		return 0;
-	} else if (unlikely(e == ubi->move_to)) {
-		/*
-		 * User is putting the physical eraseblock which was selected
-		 * as the target the data is moved to. It may happen if the EBA
-		 * unit already re-mapped the LEB but the WL unit did has not
-		 * put the PEB to the "used" tree.
+		 * be moved. Schedule the destination block for erasure.
 		 */
-		dbg_wl("PEB %d is the target of data moving", pnum);
-		ubi_assert(!ubi->move_to_put);
-		ubi->move_to_put = 1;
-		spin_unlock(&ubi->wl_lock);
-		return 0;
-	} else {
-		if (in_wl_tree(e, &ubi->used))
-			used_tree_del(ubi, e);
-		else if (unlikely(in_wl_tree(e, &ubi->scrub)))
-			scrub_tree_del(ubi, e);
-		else
-			prot_tree_del(ubi, e->pnum);
+		dbg_wl("PEB %d is being moved");
+		e = ubi->move_to;
 	}
+
+	if (in_wl_tree(e, &ubi->used))
+		used_tree_del(ubi, e);
+	else if (unlikely(in_wl_tree(e, &ubi->scrub)))
+		scrub_tree_del(ubi, e);
+	else if (!in_wl_tree(e, &ubi->free))
+		prot_tree_del(ubi, e->pnum);
 	spin_unlock(&ubi->wl_lock);
 
 	err = schedule_erase(ubi, e, torture);
