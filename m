Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYbx-0002gm-Cy
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:15:53 +0000
From: Baole Ni <baolex.ni@intel.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, mchehab@redhat.com,
 m.chehab@samsung.com, pawel@osciak.com, m.szyprowski@samsung.com,
 kyungmin.park@samsung.com, k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0699/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:37:51 +0800
Message-Id: <20160802113751.28659-1-baolex.ni@intel.com>
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
 drivers/mtd/mtdoops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 97bb8f6..ec55c4a 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -40,17 +40,17 @@
 #define MTDOOPS_HEADER_SIZE   8
 
 static unsigned long record_size = 4096;
-module_param(record_size, ulong, 0400);
+module_param(record_size, ulong, S_IRUSR);
 MODULE_PARM_DESC(record_size,
 		"record size for MTD OOPS pages in bytes (default 4096)");
 
 static char mtddev[80];
-module_param_string(mtddev, mtddev, 80, 0400);
+module_param_string(mtddev, mtddev, 80, S_IRUSR);
 MODULE_PARM_DESC(mtddev,
 		"name or index number of the MTD device to use");
 
 static int dump_oops = 1;
-module_param(dump_oops, int, 0600);
+module_param(dump_oops, int, S_IRUSR | S_IWUSR);
 MODULE_PARM_DESC(dump_oops,
 		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
 
-- 
2.9.2
