Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3suj-0004ow-3w
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 16:01:51 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 429B62597D6
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Oct 2010 18:01:47 +0200 (CEST)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: Fix serious write stall due to erase
Date: Thu, 7 Oct 2010 18:01:44 +0200
Message-Id: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop the alloc_sem before erasing flash in
jffs2_garbage_collect_pass().
Otherwise writes are put on hold until the erase
has finised.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---

 I am fairly sure it is safe to unlock the alloc_sem before
 calling jffs2_erase_pending_blocks(). Extra confirmation
 would be great though.

 This problem was introduced in 2.6.35

 fs/jffs2/gc.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index f5e96bd..b5f7175 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -218,13 +218,14 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 	if (!list_empty(&c->erase_complete_list) ||
 	    !list_empty(&c->erase_pending_list)) {
 		spin_unlock(&c->erase_completion_lock);
+		mutex_unlock(&c->alloc_sem);
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass() erasing pending blocks\n"));
-		if (jffs2_erase_pending_blocks(c, 1)) {
-			mutex_unlock(&c->alloc_sem);
+		if (jffs2_erase_pending_blocks(c, 1))
 			return 0;
-		}
+
 		D1(printk(KERN_DEBUG "No progress from erasing blocks; doing GC anyway\n"));
 		spin_lock(&c->erase_completion_lock);
+		mutex_lock(&c->alloc_sem);
 	}
 
 	/* First, work out which block we're garbage-collecting */
-- 
1.7.2.2
