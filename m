Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYch-0002rg-6j
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:39 +0000
From: Baole Ni <baolex.ni@intel.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, m.chehab@samsung.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com,
 k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0706/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:28 +0800
Message-Id: <20160802113828.29121-1-baolex.ni@intel.com>
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
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef36182..c026268 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1482,7 +1482,7 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 		      "Example 4: mtd=/dev/mtd1,0,0,5 - attach MTD device /dev/mtd1 to UBI 5 and using default values for the other fields.\n"
 		      "\t(e.g. if the NAND *chipset* has 4096 PEB, 100 will be reserved for this UBI device).");
 #ifdef CONFIG_MTD_UBI_FASTMAP
-module_param(fm_autoconvert, bool, 0644);
+module_param(fm_autoconvert, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatically on images without a fastmap.");
 module_param(fm_debug, bool, 0);
 MODULE_PARM_DESC(fm_debug, "Set this parameter to enable fastmap debugging by default. Warning, this will make fastmap slow!");
-- 
2.9.2
