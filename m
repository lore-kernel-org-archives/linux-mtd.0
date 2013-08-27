Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEFgJ-0006EQ-HM
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 09:35:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 1/4] mtd: gpmi: decouple the chip select from the DMA
 channel
Date: Tue, 27 Aug 2013 17:29:04 +0800
Message-ID: <1377595747-21033-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1377595747-21033-1-git-send-email-b32955@freescale.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Decouple the chip select from the DMA channel, we use the DMA channel 0
to accecc all the nand devices.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |    6 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-regs.h |    3 +++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 4f8857f..7d56d87 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -187,6 +187,12 @@ int gpmi_init(struct gpmi_nand_data *this)
 	/* Select BCH ECC. */
 	writel(BM_GPMI_CTRL1_BCH_MODE, r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
+	/*
+	 * Decouple the chip select from dma channel. We use dma0 for all
+	 * the chips.
+	 */
+	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
+
 	gpmi_disable_clk(this);
 	return 0;
 err_out:
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
index 53397cc..82114cd 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-regs.h
@@ -108,6 +108,9 @@
 #define HW_GPMI_CTRL1_CLR				0x00000068
 #define HW_GPMI_CTRL1_TOG				0x0000006c
 
+#define BP_GPMI_CTRL1_DECOUPLE_CS			24
+#define BM_GPMI_CTRL1_DECOUPLE_CS	(1 << BP_GPMI_CTRL1_DECOUPLE_CS)
+
 #define BP_GPMI_CTRL1_WRN_DLY_SEL			22
 #define BM_GPMI_CTRL1_WRN_DLY_SEL	(0x3 << BP_GPMI_CTRL1_WRN_DLY_SEL)
 #define BF_GPMI_CTRL1_WRN_DLY_SEL(v)  \
-- 
1.7.1
