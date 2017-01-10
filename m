Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQu0J-0006QZ-P5
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 10:50:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, david@sigma-star.at, rockdotlee@gmail.com,
 stable@vger.kernel.org
Subject: [PATCH 1/2] ubifs: Fix journal replay wrt. xattr nodes
Date: Tue, 10 Jan 2017 11:49:40 +0100
Message-Id: <20170110104941.27067-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When replaying the journal it can happen that a journal entry points to
a garbage collected node.
This is the case when a power-cut occurred between a garbage collect run
and a commit. In such a case nodes have to be read using the failable
read functions to detect whether the found node matches what we expect.

One corner case was forgotten, when the journal contains an entry to
remove an inode all xattrs have to be removed too. UBIFS models xattr
like directory entries, so the TNC code iterates over
all xattrs of the inode and removes them too. This code re-uses the
functions for walking directories and calls ubifs_tnc_next_ent().
ubifs_tnc_next_ent() expects to be used only after the journal and
aborts when a node does not match the expected result. This behavior can
render an UBIFS volume unmountable after a power-cut when xattrs are
used.

Fix this issue by using failable read functions in ubifs_tnc_next_ent()
too when replaying the journal.
Cc: stable@vger.kernel.org
Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
Reported-by: Rock Lee <rockdotlee@gmail.com>
Reviewed-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>

---
 fs/ubifs/tnc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 74ae2de949df..709aa098dd46 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -34,6 +34,11 @@
 #include <linux/slab.h>
 #include "ubifs.h"
 
+static int try_read_node(const struct ubifs_info *c, void *buf, int type,
+			 int len, int lnum, int offs);
+static int fallible_read_node(struct ubifs_info *c, const union ubifs_key *key,
+			      struct ubifs_zbranch *zbr, void *node);
+
 /*
  * Returned codes of 'matches_name()' and 'fallible_matches_name()' functions.
  * @NAME_LESS: name corresponding to the first argument is less than second
@@ -402,7 +407,19 @@ static int tnc_read_hashed_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 		return 0;
 	}
 
-	err = ubifs_tnc_read_node(c, zbr, node);
+	if (c->replaying) {
+		err = fallible_read_node(c, &zbr->key, zbr, node);
+		/*
+		 * When the node was not found, return -ENOENT, 0 otherwise.
+		 * Negative return codes stay as-is.
+		 */
+		if (err == 0)
+			err = -ENOENT;
+		else if (err == 1)
+			err = 0;
+	} else {
+		err = ubifs_tnc_read_node(c, zbr, node);
+	}
 	if (err)
 		return err;
 
@@ -2857,7 +2874,11 @@ struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 	if (fname_len(nm) > 0) {
 		if (err) {
 			/* Handle collisions */
-			err = resolve_collision(c, key, &znode, &n, nm);
+			if (c->replaying)
+				err = fallible_resolve_collision(c, key, &znode, &n,
+							 nm, 0);
+			else
+				err = resolve_collision(c, key, &znode, &n, nm);
 			dbg_tnc("rc returned %d, znode %p, n %d",
 				err, znode, n);
 			if (unlikely(err < 0))
-- 
2.10.2
