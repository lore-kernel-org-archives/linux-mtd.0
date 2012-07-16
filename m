Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqibw-0000yL-Lr
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 10:33:07 +0000
Received: by yenr9 with SMTP id r9so5219507yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 03:33:02 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] mtd: s3c2410: Use <linux/io.h> instead of <asm/io.h>
Date: Mon, 16 Jul 2012 16:02:24 +0530
Message-Id: <1342434747-27622-3-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following checkpatch warning:
WARNING: Use #include <linux/io.h> instead of <asm/io.h>

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 2383940..5907d1c 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -32,6 +32,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -45,8 +46,6 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 
-#include <asm/io.h>
-
 #include <plat/regs-nand.h>
 #include <plat/nand.h>
 
-- 
1.7.4.1
