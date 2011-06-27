Received: from smtp.ispras.ru ([83.149.198.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbIKA-0004wv-Fu
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 20:22:27 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: use mutex_is_locked() in __jffs2_flush_wbuf()
Date: Tue, 28 Jun 2011 00:21:30 +0400
Message-Id: <1309206090-2805-1-git-send-email-khoroshilov@ispras.ru>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use a helper to test if a mutex is held instead of a hack with
mutex_trylock().

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 fs/jffs2/wbuf.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 4515bea..a10fb24 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -578,8 +578,7 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
 	if (!jffs2_is_writebuffered(c))
 		return 0;
 
-	if (mutex_trylock(&c->alloc_sem)) {
-		mutex_unlock(&c->alloc_sem);
+	if (!mutex_is_locked(&c->alloc_sem)) {
 		printk(KERN_CRIT "jffs2_flush_wbuf() called with alloc_sem not locked!\n");
 		BUG();
 	}
-- 
1.7.4.1
