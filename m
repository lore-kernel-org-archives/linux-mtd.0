Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L6zmz-0003jv-9f
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 03:49:37 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2410626rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Nov 2008 19:49:35 -0800 (PST)
Message-ID: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
Date: Mon, 1 Dec 2008 11:49:35 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "ARM Linux" <linux-arm-kernel@lists.arm.linux.org.uk>
Subject: [ARM] pxa: explicit #include <mach/dma.h> in various drivers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: netdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Where 'pxa_dma_desc' and 'pxa_{request,free}_dma' are referenced.

Signed-off-by: Eric Miao <eric.miao@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 drivers/net/smc911x.h          |    3 +++
 sound/arm/pxa2xx-pcm.h         |    2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index c0fa9c9..64b3be1 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -20,8 +20,8 @@
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/irq.h>
-#include <asm/dma.h>

+#include <mach/dma.h>
 #include <mach/pxa-regs.h>
 #include <mach/pxa3xx_nand.h>

diff --git a/drivers/net/smc911x.h b/drivers/net/smc911x.h
index cc7d85b..870b4c3 100644
--- a/drivers/net/smc911x.h
+++ b/drivers/net/smc911x.h
@@ -200,6 +200,9 @@ static inline void SMC_outsl(struct smc911x_local
*lp, int reg,


 #ifdef SMC_USE_PXA_DMA
+
+#include <mach/dma.h>
+
 /*
  * Define the request and free functions
  * These are unfortunately architecture specific as no generic allocation
diff --git a/sound/arm/pxa2xx-pcm.h b/sound/arm/pxa2xx-pcm.h
index 5c4a4d3..65f86b5 100644
--- a/sound/arm/pxa2xx-pcm.h
+++ b/sound/arm/pxa2xx-pcm.h
@@ -9,7 +9,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#include <asm/dma.h>
+#include <mach/dma.h>

 struct pxa2xx_runtime_data {
 	int dma_ch;
-- 
1.6.0.4
