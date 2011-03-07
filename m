Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwfW5-00041N-2a
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 18:50:51 +0000
From: s-paulraj@ti.com
To: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
Subject: [PATCH v2] NAND: DaVinci: Removed header file that is not required
Date: Mon,  7 Mar 2011 13:50:44 -0500
Message-Id: <1299523844-14034-1-git-send-email-s-paulraj@ti.com>
Cc: Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sandeep Paulraj <s-paulraj@ti.com>

The DaVinci NAND driver was including the mach-types.h header
file.
This prevented the DaVinci NAND driver from getting used
in a DSP only device. The linux port on c6x devices can make
use of the same driver and does not define a corresponding
header file.

This header file was required in the driver because earlier there was code
dependent on a machine_* check. This piece of code has now been factored out
and is in arch/arm/mach-davinci/aemif.c

Thus removing the header file is harmless

Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
---
Changes since V1
-better patch description based on Artem's comments

 drivers/mtd/nand/davinci_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index a90fde3..aff3468 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -37,9 +37,6 @@
 #include <mach/nand.h>
 #include <mach/aemif.h>
 
-#include <asm/mach-types.h>
-
-
 /*
  * This is a device driver for the NAND flash controller found on the
  * various DaVinci family chips.  It handles up to four SoC chipselects,
-- 
1.6.0.4
