Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYcy-0002vL-QF
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:58 +0000
From: Baole Ni <baolex.ni@intel.com>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, m.chehab@samsung.com, pawel@osciak.com,
 m.szyprowski@samsung.com, k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0705/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:24 +0800
Message-Id: <20160802113824.29055-1-baolex.ni@intel.com>
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
 drivers/mtd/onenand/onenand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a4b029a..7f944e6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -44,7 +44,7 @@
 /* Default Flex-OneNAND boundary and lock respectively */
 static int flex_bdry[MAX_DIES * 2] = { -1, 0, -1, 0 };
 
-module_param_array(flex_bdry, int, NULL, 0400);
+module_param_array(flex_bdry, int, NULL, S_IRUSR);
 MODULE_PARM_DESC(flex_bdry,	"SLC Boundary information for Flex-OneNAND"
 				"Syntax:flex_bdry=DIE_BDRY,LOCK,..."
 				"DIE_BDRY: SLC boundary of the die"
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(flex_bdry,	"SLC Boundary information for Flex-OneNAND"
 /* Default OneNAND/Flex-OneNAND OTP options*/
 static int otp;
 
-module_param(otp, int, 0400);
+module_param(otp, int, S_IRUSR);
 MODULE_PARM_DESC(otp,	"Corresponding behaviour of OneNAND in OTP"
 			"Syntax : otp=LOCK_TYPE"
 			"LOCK_TYPE : Keys issued, for specific OTP Lock type"
-- 
2.9.2
