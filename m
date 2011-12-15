Received: from ozlabs.org ([2402:b800:7003:1:1::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rb1v6-0002VV-09
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2011 03:23:45 +0000
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/15] sm_ftl: fix module parameter.
Date: Thu, 15 Dec 2011 13:35:49 +1030
Message-ID: <87y5uesfea.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Pawel Moll <pawel.moll@arm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You didn't mean this to be a bool.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
---
 drivers/mtd/sm_ftl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -25,7 +25,7 @@
 struct workqueue_struct *cache_flush_workqueue;
 
 static int cache_timeout = 1000;
-module_param(cache_timeout, bool, S_IRUGO);
+module_param(cache_timeout, int, S_IRUGO);
 MODULE_PARM_DESC(cache_timeout,
 	"Timeout (in ms) for cache flush (1000 ms default");
 
