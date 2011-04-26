Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEced-00071K-Ke
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:25:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q7PnSB010184
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 10:25:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] UBIFS: remove dead GC LEB recovery piece of code
Date: Tue, 26 Apr 2011 10:29:21 +0300
Message-Id: <1303802963-31612-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
References: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch removes a piece of code in 'ubifs_rcvry_gc_commit()' which is never
executed. We call 'ubifs_find_dirty_leb()' function with min_space =
wbuf->offs, so if it returns us an LEB, it is guaranteed to have at lease
'wbuf->offs' bytes of free+dirty space. So we can remove the subsequent code
which deals with "returned LEB has less than 'wbuf->offs' bytes of free+dirty
space". This simplifies 'ubifs_rcvry_gc_commit()' a little.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 1a72046..3e0eedbe 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1127,21 +1127,10 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	}
 
 	ubifs_assert(!(lp.flags & LPROPS_INDEX));
+	ubifs_assert(lp.free + lp.dirty >= wbuf->offs);
 	lnum = lp.lnum;
 
 	/*
-	 * There was no empty LEB so the used space in the dirtiest LEB must fit
-	 * in the GC head LEB.
-	 */
-	if (lp.free + lp.dirty < wbuf->offs) {
-		dbg_rcvry("LEB %d doesn't fit in GC head LEB %d:%d",
-			  lnum, wbuf->lnum, wbuf->offs);
-		err = ubifs_return_leb(c, lnum);
-		if (err)
-			return err;
-		goto find_free;
-	}
-	/*
 	 * We run the commit before garbage collection otherwise subsequent
 	 * mounts will see the GC and orphan deletion in a different order.
 	 */
-- 
1.7.2.3
