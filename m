Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBJGk-0005LP-3r
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 06:48:51 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Fix PEB leak in wear_leveling_worker()
Date: Mon, 19 Aug 2013 08:48:12 +0200
Message-Id: <1376894892-31519-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

get_peb_for_wl() removes the PEB from the free list.
If the WL subsystem detects that no wear leveling is needed
it cancels the operation and drops the gained PEB.
In this case we have to put the PEB back into the free list.

This issue was introduced with commit ed4b7021c
(UBI: remove PEB from free tree in get_peb_for_wl()).

Cc: <stable@vger.kernel.org> # 3.7.x
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5df49d3..c95bfb1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1069,6 +1069,9 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
 			dbg_wl("no WL needed: min used EC %d, max free EC %d",
 			       e1->ec, e2->ec);
+
+			/* Give the unused PEB back */
+			wl_tree_add(e2, &ubi->free);
 			goto out_cancel;
 		}
 		self_check_in_wl_tree(ubi, e1, &ubi->used);
-- 
1.8.1.4
