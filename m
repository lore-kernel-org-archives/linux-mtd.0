Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYcK-0002jD-TR
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:18 +0000
From: Baole Ni <baolex.ni@intel.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, m.chehab@samsung.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com,
 k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0702/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:09 +0800
Message-Id: <20160802113809.28857-1-baolex.ni@intel.com>
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
 drivers/mtd/nand/cafe_nand.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 0b0c937..20f7abb 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -72,23 +72,23 @@ struct cafe_priv {
 };
 
 static int usedma = 1;
-module_param(usedma, int, 0644);
+module_param(usedma, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static int skipbbt = 0;
-module_param(skipbbt, int, 0644);
+module_param(skipbbt, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static int debug = 0;
-module_param(debug, int, 0644);
+module_param(debug, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static int regdebug = 0;
-module_param(regdebug, int, 0644);
+module_param(regdebug, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static int checkecc = 1;
-module_param(checkecc, int, 0644);
+module_param(checkecc, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static unsigned int numtimings;
 static int timing[3];
-module_param_array(timing, int, &numtimings, 0644);
+module_param_array(timing, int, &numtimings, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 
 static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 
-- 
2.9.2
