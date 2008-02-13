Received: from smtp4.pp.htv.fi ([213.243.153.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPPBS-0002I7-Au
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 21:30:33 +0000
Date: Wed, 13 Feb 2008 23:30:08 +0200
From: Adrian Bunk <bunk@kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>, David Woodhouse <dwmw2@infradead.org>
Subject: [2.6 patch] mtdoops.c: make struct oops_cxt static again
Message-ID: <20080213213008.GW3383@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct oops_cxt needlessly became global.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
--- linux-2.6/drivers/mtd/mtdoops.c.old	2008-02-11 23:19:45.000000000 +0200
+++ linux-2.6/drivers/mtd/mtdoops.c	2008-02-11 23:19:55.000000000 +0200
@@ -23,31 +23,31 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/console.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
 
 #define OOPS_PAGE_SIZE 4096
 
-struct mtdoops_context {
+static struct mtdoops_context {
 	int mtd_index;
 	struct work_struct work_erase;
 	struct work_struct work_write;
 	struct mtd_info *mtd;
 	int oops_pages;
 	int nextpage;
 	int nextcount;
 
 	void *oops_buf;
 
 	/* writecount and disabling ready are spin lock protected */
 	spinlock_t writecount_lock;
 	int ready;
 	int writecount;
 } oops_cxt;
