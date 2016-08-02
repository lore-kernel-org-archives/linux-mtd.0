Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYc9-0002hp-SC
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:06 +0000
From: Baole Ni <baolex.ni@intel.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com,
 kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, chuansheng.liu@intel.com,
 baolex.ni@intel.com, grundler@chromium.org, lporzio@micron.com
Subject: [PATCH 0701/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:03 +0800
Message-Id: <20160802113803.28791-1-baolex.ni@intel.com>
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
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index b76ad7c..22db277 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -47,7 +47,7 @@
  * 2: NAND_WP is always cleared
  */
 static int wp_on = 1;
-module_param(wp_on, int, 0444);
+module_param(wp_on, int, S_IRUSR | S_IRGRP | S_IROTH);
 
 /***********************************************************************
  * Definitions
-- 
2.9.2
