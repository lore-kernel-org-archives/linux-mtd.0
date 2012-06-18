Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefr-0000dp-Vb
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/22] UBI: Fastmap: Rework ubi_wl_put_fm_peb()
Date: Mon, 18 Jun 2012 18:18:48 +0200
Message-Id: <1340036345-96726-6-git-send-email-richard@nod.at>
In-Reply-To: <1340036345-96726-1-git-send-email-richard@nod.at>
References: <1340036345-96726-1-git-send-email-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a64cd83..369e07f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -827,13 +827,14 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
  *
  * see: ubi_wl_put_peb()
  */
-int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
-    int torture)
+int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
+		      int torture)
 {
 	struct ubi_wl_entry *e;
-	int pnum = used_e->pnum;
+	int pnum = fm_e->pnum;
 
 	dbg_wl("PEB %d", pnum);
+
 	ubi_assert(pnum >= 0);
 	ubi_assert(pnum < ubi->peb_count);
 
@@ -845,11 +846,11 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 	 * has never seen any PEB used by the original fastmap.
 	 */
 	if (!e) {
-		e = used_e;
-
+		e = fm_e;
 		ubi_assert(e->ec);
 		ubi->lookuptbl[pnum] = e;
-	}
+	} else
+		kfree(fm_e);
 
 	spin_unlock(&ubi->wl_lock);
 
-- 
1.7.6.5
