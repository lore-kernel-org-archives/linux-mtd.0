Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuYFT-00079Y-G9
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2011 22:40:56 +0000
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p21MesWK011557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 1 Mar 2011 16:40:54 -0600
From: s-paulraj@ti.com
To: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: DaVinci: Removed header file that is not required
Date: Tue,  1 Mar 2011 17:40:51 -0500
Message-Id: <1299019251-19518-1-git-send-email-s-paulraj@ti.com>
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
header file; so removing it.

Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
---
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
