Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OqpnG-0004C9-12
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 16:04:15 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [RFC] jffs2: use cond_resched() instead of yield()
Date: Wed,  1 Sep 2010 18:03:41 +0200
Message-Id: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Ingo Molnar <mingo@elte.hu>,
	linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

yield() has different semantics meanwhile and even causes RT-kernels to
BUG. Replace the only appearance left in jffs2.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Ingo Molnar <mingo@elte.hu>
---

The aforementioned BUG() showed up in one of our customer's RT-projects. While
this could be handled by rearranging his thread-priorities, I wondered if such
a patch would be worthwhile, still. Reading through the material covering
yield() and related replacements, I believe this patch should be appropriate.
Please say if I missed some side-effects.

 fs/jffs2/erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index abac961..e513f19 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -151,7 +151,7 @@ int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 		}
 
 		/* Be nice */
-		yield();
+		cond_resched();
 		mutex_lock(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
-- 
1.7.1
