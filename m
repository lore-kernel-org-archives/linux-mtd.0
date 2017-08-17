Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diC8P-0002i5-UO
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 04:12:08 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AF21B8365F
 for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2017 16:09:48 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org
Cc: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] jffs2: Fix garbage collector BUG
Date: Thu, 17 Aug 2017 16:09:16 +1200
Message-Id: <20170817040916.32570-1-mark.tomlinson@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During garbage collection, the state INO_STATE_CLEARING is possible, but
was not checked. Even though this state is transient, there is a chance
that the garbage collector will see an inode in this state and needs to
be able to deal with it. Previously the default case was hit, resulting
in BUG().

The only time an inode can be in clearing state is during clear_inode.
After this, the inode is either removed or put into CHECKEDABSENT state.
So the fix here is to simply treat clearing state the same as
CHECKEDABSENT, i.e. ignore this node and move to the next.

Note that this is not a new issue. For example, there is a bug report
here:

http://lists.infradead.org/pipermail/linux-mtd/2011-December/038850.html

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 fs/jffs2/gc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26cf023..e153ef699ae8 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -196,6 +196,10 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 			continue;
 		}
 		switch(ic->state) {
+		case INO_STATE_CLEARING:
+			/* Once in CLEARING state, it will always transition to
+			 * CHECKEDABSENT, so may as well treat it as that now
+			 */
 		case INO_STATE_CHECKEDABSENT:
 		case INO_STATE_PRESENT:
 			spin_unlock(&c->inocache_lock);
-- 
2.14.1
