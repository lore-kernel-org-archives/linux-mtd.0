Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDw3Q-0001Yo-BJ
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 09:56:37 +0000
Received: from eru.research.nokia.com ([172.21.24.121])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3O9uWvF006619
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 12:56:33 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] UBIFS: fix oops in lprops dump function
Date: Sun, 24 Apr 2011 13:00:13 +0300
Message-Id: <1303639213-15372-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The 'dbg_dump_lprop()' is trying to detect journal head LEBs when printing,
so it looks at the write-buffers. However, if we are in R/O mode, we
de-allocate the write-buffers, so 'dbg_dump_lprop()' oopses. This patch fixes
the issue.

Note, this patch is not critical, it is only about the debugging code path, and
it is unlikely that anyone but UBIFS developers would ever hit this issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1c5852a..063bc2b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -746,7 +746,13 @@ void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 		if (bud->lnum == lp->lnum) {
 			int head = 0;
 			for (i = 0; i < c->jhead_cnt; i++) {
-				if (lp->lnum == c->jheads[i].wbuf.lnum) {
+				/*
+				 * Note, if we are in R/O mode or in the middle
+				 * of mounting/re-mounting, the write-buffers do
+				 * not exist.
+				 */
+				if (c->jheads &&
+				    lp->lnum == c->jheads[i].wbuf.lnum) {
 					printk(KERN_CONT ", jhead %s",
 					       dbg_jhead(i));
 					head = 1;
-- 
1.7.2.3
