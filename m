Received: from xenotime.net ([66.160.160.81])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4IYR-0004VU-Jm
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 16:43:12 +0000
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for
	<linux-mtd@lists.infradead.org>; Thu, 5 Jun 2008 09:43:03 -0700
Date: Thu, 5 Jun 2008 09:43:03 -0700 (PDT)
From: "Randy.Dunlap" <rdunlap@xenotime.net>
To: dwmw2@infradead.org
Subject: [PATCH -next] MTD: missing header for do_div
Message-ID: <Pine.LNX.4.64.0806050941090.702@shark.he.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix MTD build error, missing #include:

linux-next-20080605/drivers/mtd/nand/nandsim.c: In function 'divide':
linux-next-20080605/drivers/mtd/nand/nandsim.c:462: error: implicit declaration of function 'do_div'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/nand/nandsim.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20080605.orig/drivers/mtd/nand/nandsim.c
+++ linux-next-20080605/drivers/mtd/nand/nandsim.c
@@ -37,6 +37,7 @@
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
+#include <asm/div64.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
