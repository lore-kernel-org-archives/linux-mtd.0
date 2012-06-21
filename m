Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShpGi-0001iX-Dh
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2012 21:50:28 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/15] UBI: Fastmap: Amend locking
Date: Thu, 21 Jun 2012 23:49:58 +0200
Message-Id: <1340315408-27375-6-git-send-email-richard@nod.at>
In-Reply-To: <1340315408-27375-1-git-send-email-richard@nod.at>
References: <UBI fastmap updates>
 <1340315408-27375-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

__ubi_wl_get_peb() gets called under wl_lock.
So need to grab it again.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ec0a954..e014f7e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -255,7 +255,6 @@ static int produce_free_peb(struct ubi_device *ubi)
 {
 	int err;
 
-	spin_lock(&ubi->wl_lock);
 	while (!ubi->free.rb_node) {
 		spin_unlock(&ubi->wl_lock);
 
@@ -266,7 +265,6 @@ static int produce_free_peb(struct ubi_device *ubi)
 
 		spin_lock(&ubi->wl_lock);
 	}
-	spin_unlock(&ubi->wl_lock);
 
 	return 0;
 }
@@ -460,7 +458,6 @@ static int __ubi_wl_get_peb(struct ubi_device *ubi)
 	struct ubi_wl_entry *e;
 
 retry:
-	spin_lock(&ubi->wl_lock);
 	if (!ubi->free.rb_node) {
 		if (ubi->works_count == 0) {
 			ubi_assert(list_empty(&ubi->works));
@@ -468,7 +465,6 @@ retry:
 			spin_unlock(&ubi->wl_lock);
 			return -ENOSPC;
 		}
-		spin_unlock(&ubi->wl_lock);
 
 		err = produce_free_peb(ubi);
 		if (err < 0)
@@ -486,7 +482,6 @@ retry:
 	 */
 	rb_erase(&e->u.rb, &ubi->free);
 	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
-	spin_unlock(&ubi->wl_lock);
 
 	err = ubi_self_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
 				    ubi->peb_size - ubi->vid_hdr_aloffset);
-- 
1.7.6.5
