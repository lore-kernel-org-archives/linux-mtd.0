Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYcI-0002jB-9j
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 12:16:14 +0000
From: Baole Ni <baolex.ni@intel.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, m.chehab@samsung.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com,
 k.kozlowski@samsung.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chuansheng.liu@intel.com, baolex.ni@intel.com, grundler@chromium.org,
 lporzio@micron.com
Subject: [PATCH 0703/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:38:13 +0800
Message-Id: <20160802113813.28923-1-baolex.ni@intel.com>
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
 drivers/mtd/nand/nandsim.c | 48 +++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1eb9344..08e78fd 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -115,30 +115,30 @@ static u_char id_bytes[8] = {
 	[4 ... 7] = 0xFF,
 };
 
-module_param_array(id_bytes, byte, NULL, 0400);
-module_param_named(first_id_byte, id_bytes[0], byte, 0400);
-module_param_named(second_id_byte, id_bytes[1], byte, 0400);
-module_param_named(third_id_byte, id_bytes[2], byte, 0400);
-module_param_named(fourth_id_byte, id_bytes[3], byte, 0400);
-module_param(access_delay,   uint, 0400);
-module_param(programm_delay, uint, 0400);
-module_param(erase_delay,    uint, 0400);
-module_param(output_cycle,   uint, 0400);
-module_param(input_cycle,    uint, 0400);
-module_param(bus_width,      uint, 0400);
-module_param(do_delays,      uint, 0400);
-module_param(log,            uint, 0400);
-module_param(dbg,            uint, 0400);
-module_param_array(parts, ulong, &parts_num, 0400);
-module_param(badblocks,      charp, 0400);
-module_param(weakblocks,     charp, 0400);
-module_param(weakpages,      charp, 0400);
-module_param(bitflips,       uint, 0400);
-module_param(gravepages,     charp, 0400);
-module_param(overridesize,   uint, 0400);
-module_param(cache_file,     charp, 0400);
-module_param(bbt,	     uint, 0400);
-module_param(bch,	     uint, 0400);
+module_param_array(id_bytes, byte, NULL, S_IRUSR);
+module_param_named(first_id_byte, id_bytes[0], byte, S_IRUSR);
+module_param_named(second_id_byte, id_bytes[1], byte, S_IRUSR);
+module_param_named(third_id_byte, id_bytes[2], byte, S_IRUSR);
+module_param_named(fourth_id_byte, id_bytes[3], byte, S_IRUSR);
+module_param(access_delay,   uint, S_IRUSR);
+module_param(programm_delay, uint, S_IRUSR);
+module_param(erase_delay,    uint, S_IRUSR);
+module_param(output_cycle,   uint, S_IRUSR);
+module_param(input_cycle,    uint, S_IRUSR);
+module_param(bus_width,      uint, S_IRUSR);
+module_param(do_delays,      uint, S_IRUSR);
+module_param(log,            uint, S_IRUSR);
+module_param(dbg,            uint, S_IRUSR);
+module_param_array(parts, ulong, &parts_num, S_IRUSR);
+module_param(badblocks,      charp, S_IRUSR);
+module_param(weakblocks,     charp, S_IRUSR);
+module_param(weakpages,      charp, S_IRUSR);
+module_param(bitflips,       uint, S_IRUSR);
+module_param(gravepages,     charp, S_IRUSR);
+module_param(overridesize,   uint, S_IRUSR);
+module_param(cache_file,     charp, S_IRUSR);
+module_param(bbt,	     uint, S_IRUSR);
+module_param(bch,	     uint, S_IRUSR);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
-- 
2.9.2
