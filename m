From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] mtd: nand: atmel_nand: drop unused include
Date: Tue, 13 Jun 2017 14:58:42 +0200
Message-Id: <20170613125842.16422-1-alexandre.belloni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Atmel NAND driver doesn't used anything from
linux/platform_data/atmel.h, stop including it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/mtd/nand/atmel/nand-controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 3b2446896147..6bd61acfc2c8 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -64,7 +64,6 @@
 #include <linux/of_platform.h>
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/atmel.h>
 #include <linux/regmap.h>
 
 #include "pmecc.h"
-- 
2.11.0
