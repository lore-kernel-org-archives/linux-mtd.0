Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NLN0j-0005d5-Hf
	for linux-mtd@lists.infradead.org; Thu, 17 Dec 2009 20:31:49 +0000
Received: by yxe40 with SMTP id 40so2429355yxe.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Dec 2009 12:31:44 -0800 (PST)
From: Andrey Yurovsky <yurovsky@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandsim: (trivial) fix spelling
Date: Thu, 17 Dec 2009 12:31:20 -0800
Message-Id: <1261081880-18183-1-git-send-email-yurovsky@gmail.com>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrey Yurovsky <andrey@slug.(none)>

s/nanodeconds/nanoseconds

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 drivers/mtd/nand/nandsim.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7281000..3cf9180 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -135,8 +135,8 @@ MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read I
 MODULE_PARM_DESC(access_delay,   "Initial page access delay (microseconds)");
 MODULE_PARM_DESC(programm_delay, "Page programm delay (microseconds");
 MODULE_PARM_DESC(erase_delay,    "Sector erase delay (milliseconds)");
-MODULE_PARM_DESC(output_cycle,   "Word output (from flash) time (nanodeconds)");
-MODULE_PARM_DESC(input_cycle,    "Word input (to flash) time (nanodeconds)");
+MODULE_PARM_DESC(output_cycle,   "Word output (from flash) time (nanoseconds)");
+MODULE_PARM_DESC(input_cycle,    "Word input (to flash) time (nanoseconds)");
 MODULE_PARM_DESC(bus_width,      "Chip's bus width (8- or 16-bit)");
 MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
-- 
1.6.3.3
