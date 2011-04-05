Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7649-00048g-49
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:13:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DD3mT026467
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:13:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: introduce lsave debugging
Date: Tue,  5 Apr 2011 16:16:14 +0300
Message-Id: <1302009374-14299-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302009374-14299-1-git-send-email-dedekind1@gmail.com>
References: <1302009374-14299-1-git-send-email-dedekind1@gmail.com>
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

Try to improve UBIFS testing coverage by randomly picking LEBs to
store in lsave, rather than picking them optimally. Create a debugging
version of 'populate_lsave()' for these purposes and enable it when
general debugging self-checks are enabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lpt_commit.c |   53 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 9fe376a..dfcb574 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -29,6 +29,12 @@
 #include <linux/slab.h>
 #include "ubifs.h"
 
+#ifdef CONFIG_UBIFS_FS_DEBUG
+static int dbg_populate_lsave(struct ubifs_info *c);
+#else
+#define dbg_populate_lsave(c) 0
+#endif
+
 /**
  * first_dirty_cnode - find first dirty cnode.
  * @c: UBIFS file-system description object
@@ -815,6 +821,10 @@ static void populate_lsave(struct ubifs_info *c)
 		c->lpt_drty_flgs |= LSAVE_DIRTY;
 		ubifs_add_lpt_dirt(c, c->lsave_lnum, c->lsave_sz);
 	}
+
+	if (dbg_populate_lsave(c))
+		return;
+
 	list_for_each_entry(lprops, &c->empty_list, list) {
 		c->lsave[cnt++] = lprops->lnum;
 		if (cnt >= c->lsave_cnt)
@@ -1994,4 +2004,47 @@ void dbg_dump_lpt_lebs(const struct ubifs_info *c)
 	       current->pid);
 }
 
+/**
+ * dbg_populate_lsave - debugging version of 'populate_lsave()'
+ * @c: UBIFS file-system description object
+ *
+ * This is a debugging version for 'populate_lsave()' which populates lsave
+ * with random LEBs instead of useful LEBs, which is good for test coverage.
+ * Returns zero if lsave has not been populated (this debugging feature is
+ * disabled) an non-zero if lsave has been populated.
+ */
+static int dbg_populate_lsave(struct ubifs_info *c)
+{
+	struct ubifs_lprops *lprops;
+	struct ubifs_lpt_heap *heap;
+	int i;
+
+	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+		return 0;
+	if (random32() & 3)
+		return 0;
+
+	for (i = 0; i < c->lsave_cnt; i++)
+		c->lsave[i] = c->main_first;
+
+	list_for_each_entry(lprops, &c->empty_list, list)
+		c->lsave[random32() % c->lsave_cnt] = lprops->lnum;
+	list_for_each_entry(lprops, &c->freeable_list, list)
+		c->lsave[random32() % c->lsave_cnt] = lprops->lnum;
+	list_for_each_entry(lprops, &c->frdi_idx_list, list)
+		c->lsave[random32() % c->lsave_cnt] = lprops->lnum;
+
+	heap = &c->lpt_heap[LPROPS_DIRTY_IDX - 1];
+	for (i = 0; i < heap->cnt; i++)
+		c->lsave[random32() % c->lsave_cnt] = heap->arr[i]->lnum;
+	heap = &c->lpt_heap[LPROPS_DIRTY - 1];
+	for (i = 0; i < heap->cnt; i++)
+		c->lsave[random32() % c->lsave_cnt] = heap->arr[i]->lnum;
+	heap = &c->lpt_heap[LPROPS_FREE - 1];
+	for (i = 0; i < heap->cnt; i++)
+		c->lsave[random32() % c->lsave_cnt] = heap->arr[i]->lnum;
+
+	return 1;
+}
+
 #endif /* CONFIG_UBIFS_FS_DEBUG */
-- 
1.7.2.3
