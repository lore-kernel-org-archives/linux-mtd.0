Received: from mail-db9lp0253.outbound.messaging.microsoft.com
 ([213.199.154.253] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgqjF-0007fl-Ly
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:39 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 1/8] mtd: gpmi: do not use the local array to do the DMA
 transfer
Date: Thu, 14 Nov 2013 14:25:44 +0800
Message-ID: <1384410351-2169-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1384410351-2169-1-git-send-email-b32955@freescale.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
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

The local array feature[] is in the stack. We can see the warning
when we enable the CONFIG_DMA_API_DEBUG:
----------------------------------------------------------
WARNING: at lib/dma-debug.c:950 check_for_stack+0xac/0xf8()
gpmi-nand 112000.gpmi-nand: DMA-API: device driver maps memory fromstack [addr=dc05be34]
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.10.17-16851-g2414a73 #1324
[<80014cbc>] (unwind_backtrace+0x0/0x138) from [<8001251c>] (show_stack+0x10/0x14)
[<8001251c>] (show_stack+0x10/0x14) from [<8002699c>] (warn_slowpath_common+0x4c/0x68)
[<8002699c>] (warn_slowpath_common+0x4c/0x68) from [<80026a4c>] (warn_slowpath_fmt+0x30/0x40)
[<80026a4c>] (warn_slowpath_fmt+0x30/0x40) from [<8028e2f8>] (check_for_stack+0xac/0xf8)
[<8028e2f8>] (check_for_stack+0xac/0xf8) from [<8028e438>] (debug_dma_map_sg+0xf4/0x188)
[<8028e438>] (debug_dma_map_sg+0xf4/0x188) from [<803968d0>] (prepare_data_dma+0xb8/0x1a8)
[<803968d0>] (prepare_data_dma+0xb8/0x1a8) from [<80397b20>] (gpmi_send_data+0x84/0xfc)
[<80397b20>] (gpmi_send_data+0x84/0xfc) from [<8038c2b4>] (nand_onfi_set_features+0x50/0x74)
[<8038c2b4>] (nand_onfi_set_features+0x50/0x74) from [<80397198>] (gpmi_extra_init+0x90/0x170)
[<80397198>] (gpmi_extra_init+0x90/0x170) from [<8039520c>] (gpmi_nand_probe+0x2f8/0xb3c)
[<8039520c>] (gpmi_nand_probe+0x2f8/0xb3c) from [<8031b974>] (platform_drv_probe+0x18/0x1c)
----------------------------------------------------------

The patch uses the kzalloc to allocate the buffer, and free it when
we do not use it anymore.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index c7a578c..10a6f07 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -20,6 +20,7 @@
  */
 #include <linux/delay.h>
 #include <linux/clk.h>
+#include <linux/slab.h>
 
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
@@ -911,10 +912,14 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 	struct resources  *r = &this->resources;
 	struct nand_chip *nand = &this->nand;
 	struct mtd_info	 *mtd = &this->mtd;
-	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
+	uint8_t *feature;
 	unsigned long rate;
 	int ret;
 
+	feature = kzalloc(ONFI_SUBFEATURE_PARAM_LEN, GFP_KERNEL);
+	if (!feature)
+		return -ENOMEM;
+
 	nand->select_chip(mtd, 0);
 
 	/* [1] send SET FEATURE commond to NAND */
@@ -942,11 +947,13 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
 
 	this->flags |= GPMI_ASYNC_EDO_ENABLED;
 	this->timing_mode = mode;
+	kfree(feature);
 	dev_info(this->dev, "enable the asynchronous EDO mode %d\n", mode);
 	return 0;
 
 err_out:
 	nand->select_chip(mtd, -1);
+	kfree(feature);
 	dev_err(this->dev, "mode:%d ,failed in set feature.\n", mode);
 	return -EINVAL;
 }
-- 
1.7.2.rc3
