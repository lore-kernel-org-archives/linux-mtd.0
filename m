Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEFgP-0006EX-RW
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2013 09:35:36 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 4/4] mtd: gpmi: imx6: fix the wrong method for checking
 ready/busy
Date: Tue, 27 Aug 2013 17:29:07 +0800
Message-ID: <1377595747-21033-5-git-send-email-b32955@freescale.com>
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

In the imx6, all the ready/busy pins are binding togeter.
So we should always check the ready/busy pin of the chip 0.

In the other word, when the CS1 is enabled, we should also check the
ready/busy of chip 0; if we check the ready/busy of chip 1,
we will get the wrong result.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 7d56d87..5edd25b 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1079,6 +1079,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 		mask = MX23_BM_GPMI_DEBUG_READY0 << chip;
 		reg = readl(r->gpmi_regs + HW_GPMI_DEBUG);
 	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6Q(this)) {
+		/*
+		 * In the imx6, all the ready/busy pins are binding
+		 * togeter. So we only need to check the chip 0.
+		 */
+		if (GPMI_IS_MX6Q(this))
+			chip = 0;
+
 		/* MX28 shares the same R/B register as MX6Q. */
 		mask = MX28_BF_GPMI_STAT_READY_BUSY(1 << chip);
 		reg = readl(r->gpmi_regs + HW_GPMI_STAT);
-- 
1.7.1
