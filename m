From: Huang Shijie <b32955@freescale.com>
To: <vinod.koul@intel.com>
Subject: [PATCH 05/10] ASoc : change the DMA header file
Date: Thu, 19 Jan 2012 14:16:02 +0800
Message-ID: <1326953767-24155-6-git-send-email-b32955@freescale.com>
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

change these files to use the new DMA header file.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 sound/soc/mxs/mxs-pcm.c  |    2 +-
 sound/soc/mxs/mxs-pcm.h  |    2 +-
 sound/soc/mxs/mxs-saif.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mxs/mxs-pcm.c b/sound/soc/mxs/mxs-pcm.c
index 105f42a..7eb186f 100644
--- a/sound/soc/mxs/mxs-pcm.c
+++ b/sound/soc/mxs/mxs-pcm.c
@@ -28,6 +28,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/dmaengine.h>
+#include <linux/mxs-dma.h>
 
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -35,7 +36,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include <mach/dma.h>
 #include "mxs-pcm.h"
 
 static struct snd_pcm_hardware snd_mxs_hardware = {
diff --git a/sound/soc/mxs/mxs-pcm.h b/sound/soc/mxs/mxs-pcm.h
index f55ac4f..3ac9956 100644
--- a/sound/soc/mxs/mxs-pcm.h
+++ b/sound/soc/mxs/mxs-pcm.h
@@ -19,7 +19,7 @@
 #ifndef _MXS_PCM_H
 #define _MXS_PCM_H
 
-#include <mach/dma.h>
+#include <linux/mxs-dma.h>
 
 struct mxs_pcm_dma_params {
 	int chan_irq;
diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index dccfb37..ada6344 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -24,12 +24,12 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/time.h>
+#include <linux/mxs-dma.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/saif.h>
-#include <mach/dma.h>
 #include <asm/mach-types.h>
 #include <mach/hardware.h>
 #include <mach/mxs.h>
-- 
1.7.0.4
