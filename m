From: Huang Shijie <b32955@freescale.com>
To: <vinod.koul@intel.com>
Subject: [PATCH 02/10] MXS-DMA : change the header
Date: Thu, 19 Jan 2012 14:15:59 +0800
Message-ID: <1326953767-24155-3-git-send-email-b32955@freescale.com>
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

change the header for MXS-DMA driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/dma/mxs-dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index b06cd4c..c80fbed 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -22,10 +22,10 @@
 #include <linux/platform_device.h>
 #include <linux/dmaengine.h>
 #include <linux/delay.h>
+#include <linux/mxs-dma.h>
 
 #include <asm/irq.h>
 #include <mach/mxs.h>
-#include <mach/dma.h>
 #include <mach/common.h>
 
 /*
-- 
1.7.0.4
