Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRMv-0000Ct-TZ
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:17:14 +0000
Date: Sat, 3 Oct 2015 20:13:41 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] signal: remove
 jffs2_garbage_collect_thread()->allow_signal(SIGCONT)
Message-ID: <20151003181341.GA1064@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151003181319.GA1036@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2_garbage_collect_thread() does allow_signal(SIGCONT) for no reason,
SIGCONT will wake a stopped task up even if it is ignored.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 fs/jffs2/background.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 53cc735..e5c1783 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -80,7 +80,6 @@ static int jffs2_garbage_collect_thread(void *_c)
 	siginitset(&hupmask, sigmask(SIGHUP));
 	allow_signal(SIGKILL);
 	allow_signal(SIGSTOP);
-	allow_signal(SIGCONT);
 	allow_signal(SIGHUP);
 
 	c->gc_task = current;
-- 
2.4.3
