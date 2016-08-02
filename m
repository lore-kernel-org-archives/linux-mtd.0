Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYch-0002qh-6i
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:39 +0000
From: Baole Ni <baolex.ni@intel.com>
To: ezequiel.garcia@free-electrons.com, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com,
 kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0704/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:18 +0800
Message-Id: <20160802113818.28989-1-baolex.ni@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 436dd6d..a5896b8 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -283,7 +283,7 @@ struct pxa3xx_nand_info {
 };
 
 static bool use_dma = 1;
-module_param(use_dma, bool, 0444);
+module_param(use_dma, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(use_dma, "enable DMA for data transferring to/from NAND HW");
 
 struct pxa3xx_nand_timing {
-- 
2.9.2
