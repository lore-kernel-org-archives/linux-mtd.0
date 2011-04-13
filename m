Received: from forward.atmel.no ([194.19.124.53])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QA0Xa-0002is-IO
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:55:31 +0000
Received: from norsmtp01.norway.atmel.com (unknown [10.191.254.110])
	by forward.atmel.no (Postfix) with SMTP id 974532816D
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 15:55:27 +0200 (CEST)
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] atmel_nand: add missing include of linux/dmaengine.h
Date: Wed, 13 Apr 2011 15:55:17 +0200
Message-Id: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Including linux/dmaengine.h fixes the missing definition of the enum
dma_ctrl_flags type used in atmel_nand_dma_op function.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 950646a..380912f 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 
+#include <linux/dmaengine.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
 
-- 
1.7.1
