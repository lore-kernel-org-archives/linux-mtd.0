From: Huang Shijie <b32955@freescale.com>
To: <vinod.koul@intel.com>
Subject: [PATCH 01/10] MXS-DMA : move the mxs-dma.h to a more common place
Date: Thu, 19 Jan 2012 14:15:58 +0800
Message-ID: <1326953767-24155-2-git-send-email-b32955@freescale.com>
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

Move the header to a more common place.
The DMA engine is not only used in mx23/mx28, but also used
in mx50/mx6q.
It will also be used in the future chips.

Rename it to mxs-dma.h

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 arch/arm/mach-mxs/include/mach/dma.h |   28 ----------------------------
 include/linux/mxs-dma.h              |   28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 arch/arm/mach-mxs/include/mach/dma.h
 create mode 100644 include/linux/mxs-dma.h

diff --git a/arch/arm/mach-mxs/include/mach/dma.h b/arch/arm/mach-mxs/include/mach/dma.h
deleted file mode 100644
index 203d7c4..0000000
--- a/arch/arm/mach-mxs/include/mach/dma.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * Copyright 2011 Freescale Semiconductor, Inc. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef __MACH_MXS_DMA_H__
-#define __MACH_MXS_DMA_H__
-
-#include <linux/dmaengine.h>
-
-struct mxs_dma_data {
-	int chan_irq;
-};
-
-static inline int mxs_dma_is_apbh(struct dma_chan *chan)
-{
-	return !strcmp(dev_name(chan->device->dev), "mxs-dma-apbh");
-}
-
-static inline int mxs_dma_is_apbx(struct dma_chan *chan)
-{
-	return !strcmp(dev_name(chan->device->dev), "mxs-dma-apbx");
-}
-
-#endif /* __MACH_MXS_DMA_H__ */
diff --git a/include/linux/mxs-dma.h b/include/linux/mxs-dma.h
new file mode 100644
index 0000000..203d7c4
--- /dev/null
+++ b/include/linux/mxs-dma.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2011 Freescale Semiconductor, Inc. All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __MACH_MXS_DMA_H__
+#define __MACH_MXS_DMA_H__
+
+#include <linux/dmaengine.h>
+
+struct mxs_dma_data {
+	int chan_irq;
+};
+
+static inline int mxs_dma_is_apbh(struct dma_chan *chan)
+{
+	return !strcmp(dev_name(chan->device->dev), "mxs-dma-apbh");
+}
+
+static inline int mxs_dma_is_apbx(struct dma_chan *chan)
+{
+	return !strcmp(dev_name(chan->device->dev), "mxs-dma-apbx");
+}
+
+#endif /* __MACH_MXS_DMA_H__ */
-- 
1.7.0.4
