Received: from [65.98.92.6] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MKLsw-0006kd-07
	for linux-mtd@lists.infradead.org; Sat, 27 Jun 2009 00:35:21 +0000
From: Kevin Cernekee <cernekee@gmail.com>
To: <dwmw2@infradead.org>, <dedekind@infradead.org>
Date: Fri, 26 Jun 2009 17:10:50 -0700
Subject: [PATCH] UBIFS: Fix integer overflow warnings
Message-Id: <3f15c0091535d0ab4a1d45cbc9eb3667@localhost>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This warning was observed on MIPS32 using 2.6.31-rc1 and gcc-4.2.0:

fs/ubifs/io.c: In function 'ubifs_wbuf_init':
fs/ubifs/io.c:860: warning: integer overflow in expression
fs/ubifs/io.c:860: warning: integer overflow in expression
fs/ubifs/io.c:860: warning: integer overflow in expression

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
index bc58571..184157e 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -857,7 +857,8 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 	 * and hard limits.
 	 */
 	hardlimit = ktime_set(DEFAULT_WBUF_TIMEOUT_SECS, 0);
-	wbuf->delta = (DEFAULT_WBUF_TIMEOUT_SECS * NSEC_PER_SEC) * 2 / 10;
+	wbuf->delta = ((unsigned long long)DEFAULT_WBUF_TIMEOUT_SECS *
+		       NSEC_PER_SEC) * 2 / 10;
 	wbuf->softlimit = ktime_sub_ns(hardlimit, wbuf->delta);
 	hrtimer_set_expires_range_ns(&wbuf->timer,  wbuf->softlimit,
 				     wbuf->delta);
--
