Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYc2-0002hS-3O
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:15:58 +0000
From: Baole Ni <baolex.ni@intel.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, mchehab@redhat.com,
 m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com,
 kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0700/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:37:56 +0800
Message-Id: <20160802113756.28725-1-baolex.ni@intel.com>
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
 drivers/mtd/mtdswap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index cb06bdd..741b9e0 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -180,17 +180,17 @@ enum {
 #define MTDSWAP_MBD_TO_MTDSWAP(dev) ((struct mtdswap_dev *)dev->priv)
 
 static char partitions[128] = "";
-module_param_string(partitions, partitions, sizeof(partitions), 0444);
+module_param_string(partitions, partitions, sizeof(partitions), S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(partitions, "MTD partition numbers to use as swap "
 		"partitions=\"1,3,5\"");
 
 static unsigned int spare_eblocks = 10;
-module_param(spare_eblocks, uint, 0444);
+module_param(spare_eblocks, uint, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(spare_eblocks, "Percentage of spare erase blocks for "
 		"garbage collection (default 10%)");
 
 static bool header; /* false */
-module_param(header, bool, 0444);
+module_param(header, bool, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(header,
 		"Include builtin swap header (default 0, without header)");
 
-- 
2.9.2
