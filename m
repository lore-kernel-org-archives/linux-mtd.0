Received: from rv-out-0708.google.com ([209.85.198.247])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKBNX-0007zo-11
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 13:22:13 +0000
Received: by rv-out-0708.google.com with SMTP id k29so751646rvb.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Jun 2009 06:22:05 -0700 (PDT)
From: tom.leiming@gmail.com
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][NAND]: fix omap2.c compile failure and warning
Date: Fri, 26 Jun 2009 21:21:49 +0800
Message-Id: <1246022509-16194-1-git-send-email-tom.leiming@gmail.com>
Cc: david-b@pacbell.net, Ming Lei <tom.leiming@gmail.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ming Lei <tom.leiming@gmail.com>

drivers/mtd/nand/omap2.c: In function 'omap_wait':
drivers/mtd/nand/omap2.c:543: error: 'jiffies' undeclared (first use in this function)
drivers/mtd/nand/omap2.c:543: error: (Each undeclared identifier is reported only once
drivers/mtd/nand/omap2.c:543: error: for each function it appears in.)
drivers/mtd/nand/omap2.c:557: error: implicit declaration of function 'time_before'

......

drivers/mtd/nand/omap2.c: In function 'omap_wait':
drivers/mtd/nand/omap2.c:545: warning: 'status' may be used uninitialized in this function

Signed-off-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/mtd/nand/omap2.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0cd76f8..2905c79 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
+#include <linux/jiffies.h>
 
 #include <asm/dma.h>
 
@@ -541,7 +542,8 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 							mtd);
 	unsigned long timeo = jiffies;
-	int status, state = this->state;
+	int state = this->state;
+	int status = 0;
 
 	if (state == FL_ERASING)
 		timeo += (HZ * 400) / 1000;
-- 
1.6.0.GIT
