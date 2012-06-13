Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel23-00076q-TD
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/21] UBI: Fastmap: Add PEB leak detection
Date: Wed, 13 Jun 2012 12:41:59 +0200
Message-Id: <1339584138-69914-3-git-send-email-richard@nod.at>
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
 drivers/mtd/ubi/wl.c |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8f6321a..ea0ab86 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1557,7 +1557,7 @@ static void cancel_pending(struct ubi_device *ubi)
  */
 int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
-	int err, i;
+	int err, i, found_pebs = 0;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp;
@@ -1596,6 +1596,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			kmem_cache_free(ubi_wl_entry_slab, e);
 			goto out_free;
 		}
+
+		found_pebs++;
 	}
 
 	list_for_each_entry(aeb, &ai->free, u.list) {
@@ -1613,6 +1615,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		wl_tree_add(e, &ubi->free);
 
 		ubi->lookuptbl[e->pnum] = e;
+
+		found_pebs++;
 	}
 
 	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
@@ -1638,9 +1642,18 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				       e->pnum, e->ec);
 				wl_tree_add(e, &ubi->scrub);
 			}
+
+			found_pebs++;
 		}
 	}
 
+	dbg_wl("found %i PEBs", found_pebs);
+
+	if (ai->fm)
+		ubi_assert(ubi->peb_count == found_pebs + ai->fm->used_blocks);
+	else
+		ubi_assert(ubi->peb_count == found_pebs);
+
 	if (ubi->avail_pebs < WL_RESERVED_PEBS) {
 		ubi_err("no enough physical eraseblocks (%d, need %d)",
 			ubi->avail_pebs, WL_RESERVED_PEBS);
-- 
1.7.6.5
