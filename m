From: Huang Shijie <b32955@freescale.com>
To: <vinod.koul@intel.com>
Subject: [PATCH 04/10] MTD/GPMI : change the DMA header file
Date: Thu, 19 Jan 2012 14:16:01 +0800
Message-ID: <1326953767-24155-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1326953767-24155-1-git-send-email-b32955@freescale.com>
References: <1326953767-24155-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, artem.bityutskiy@intel.com,
 b29396@freescale.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 w.sang@pengutronix.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

change the DMA header file for GPMI NAND driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index e023bcc..1c7fdbb 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -20,7 +20,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-#include <mach/dma.h>
+#include <linux/mxs-dma.h>
 
 struct resources {
 	void          *gpmi_regs;
-- 
1.7.0.4
