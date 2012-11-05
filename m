Received: from mail.ispras.ru ([83.149.199.43])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVRbJ-0008BP-7T
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2012 18:40:47 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: Make handling of erase_completion_lock consistent in
 jffs2_do_reserve_space()
Date: Mon,  5 Nov 2012 22:40:14 +0400
Message-Id: <1352140814-25208-1-git-send-email-khoroshilov@ispras.ru>
Cc: ldv-project@linuxtesting.org,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Users of jffs2_do_reserve_space() expect they still held
erase_completion_lock after call to it. But there is a path
where jffs2_do_reserve_space() leaves erase_completion_lock unlocked.
The patch fixes it.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 fs/jffs2/nodemgmt.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 0c96eb5..0331072 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -417,14 +417,16 @@ static int jffs2_do_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			spin_unlock(&c->erase_completion_lock);
 
 			ret = jffs2_prealloc_raw_node_refs(c, jeb, 1);
-			if (ret)
-				return ret;
+
 			/* Just lock it again and continue. Nothing much can change because
 			   we hold c->alloc_sem anyway. In fact, it's not entirely clear why
 			   we hold c->erase_completion_lock in the majority of this function...
 			   but that's a question for another (more caffeine-rich) day. */
 			spin_lock(&c->erase_completion_lock);
 
+			if (ret)
+				return ret;
+
 			waste = jeb->free_size;
 			jffs2_link_node_ref(c, jeb,
 					    (jeb->offset + c->sector_size - waste) | REF_OBSOLETE,
-- 
1.7.9.5
