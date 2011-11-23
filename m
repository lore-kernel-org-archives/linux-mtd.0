Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTEGI-0000c7-MW
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 14:57:24 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: gpmi: add missing include 'module.h'
Date: Wed, 23 Nov 2011 15:57:06 +0100
Message-Id: <1322060226-5208-1-git-send-email-w.sang@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes:

drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_nfc_init':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: error: 'THIS_MODULE' undeclared (first use in this function)
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1475:16: note: each undeclared identifier is reported only once for each function it appears in
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:15: error: expected declaration specifiers or '...' before string constant
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: data definition has no type or storage class
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1617:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'

and some more...

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 071b634..493ec2f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -21,9 +21,9 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/mtd/gpmi-nand.h>
 #include <linux/mtd/partitions.h>
-
 #include "gpmi-nand.h"
 
 /* add our owner bbt descriptor */
-- 
1.7.7.1
