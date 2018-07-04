Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faiMs-00022I-O3
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 14:02:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Handle LPT corruption better in
 ubifs_garbage_collect_leb()
Date: Wed,  4 Jul 2018 16:02:30 +0200
Message-Id: <20180704140230.5606-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If ubifs_garbage_collect_leb() notes a LPT problem, empty LEB, but
LPT has it makred as used, an ubifs_assert() is not enough.
We have to abort GC. Otherwise list_entry() returns an invalid
scan object and the kernel crashes.

c: <stable@vger.kernel.org>
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/gc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index a03a47cf880d..11c09ce3c795 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -513,7 +513,13 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 
-	ubifs_assert(!list_empty(&sleb->nodes));
+	if (list_empty(&sleb->nodes)) {
+		ubifs_err(c, "Bad accouting information, LEB %i is marked as used but no nodes found!",
+			  lnum);
+		dump_stack();
+		return -EUCLEAN;
+	}
+
 	snod = list_entry(sleb->nodes.next, struct ubifs_scan_node, list);
 
 	if (snod->type == UBIFS_IDX_NODE) {
-- 
2.18.0
