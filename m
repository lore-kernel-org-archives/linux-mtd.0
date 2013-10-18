Received: from mail-pb0-f43.google.com ([209.85.160.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX7iY-0007Af-PF
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 10:55:43 +0000
Received: by mail-pb0-f43.google.com with SMTP id md4so3666056pbc.30
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2013 03:55:20 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: mxc_nand: Include linux/of.h header
Date: Fri, 18 Oct 2013 16:16:35 +0530
Message-Id: <1382093195-31929-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'of_match_ptr' is defined in linux/of.h. Include it explicitly to
avoid build breakage in the future.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/mxc_nand.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index ce8242b..1037755 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -32,6 +32,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/completion.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
 
-- 
1.7.9.5
