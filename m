From: Huang Shijie <b32955@freescale.com>
To: <vinod.koul@intel.com>
Subject: [PATCH 03/10] MXS-MMC : change the DMA header file
Date: Thu, 19 Jan 2012 14:16:00 +0800
Message-ID: <1326953767-24155-4-git-send-email-b32955@freescale.com>
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

use the new MXS-DMA header for mxs-mmc driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mmc/host/mxs-mmc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 382c835..1e18970 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -38,10 +38,10 @@
 #include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
+#include <linux/mxs-dma.h>
 
 #include <mach/mxs.h>
 #include <mach/common.h>
-#include <mach/dma.h>
 #include <mach/mmc.h>
 
 #define DRIVER_NAME	"mxs-mmc"
-- 
1.7.0.4
