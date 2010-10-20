Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8hcu-000145-Vy
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 22:59:24 +0000
Message-Id: <201010202259.o9KMx8tG009573@imap1.linux-foundation.org>
Subject: [patch 2/2] jffs2: use cond_resched() instead of yield()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 20 Oct 2010 15:59:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, dedekind@infradead.org, w.sang@pengutronix.de,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org, mingo@elte.hu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wolfram Sang <w.sang@pengutronix.de>

yield() has different semantics meanwhile and even causes RT-kernels to
BUG.  Replace the only appearance left in jffs2.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/erase.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN fs/jffs2/erase.c~jffs2-use-cond_resched-instead-of-yield fs/jffs2/erase.c
--- a/fs/jffs2/erase.c~jffs2-use-cond_resched-instead-of-yield
+++ a/fs/jffs2/erase.c
@@ -151,7 +151,7 @@ int jffs2_erase_pending_blocks(struct jf
 		}
 
 		/* Be nice */
-		yield();
+		cond_resched();
 		mutex_lock(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
_
