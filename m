Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYbs-0002gK-9g
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:15:48 +0000
From: Baole Ni <baolex.ni@intel.com>
To: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 mchehab@redhat.com, m.chehab@samsung.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com,
 k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0698/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:37:47 +0800
Message-Id: <20160802113747.28593-1-baolex.ni@intel.com>
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
 drivers/mtd/devices/block2mtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 7c887f1..31e2b0b 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -458,7 +458,7 @@ static int block2mtd_setup(const char *val, struct kernel_param *kp)
 }
 
 
-module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
+module_param_call(block2mtd, block2mtd_setup, NULL, NULL, S_IWUSR);
 MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
 
 static int __init block2mtd_init(void)
-- 
2.9.2
