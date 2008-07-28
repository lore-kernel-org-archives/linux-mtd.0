From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 28 Jul 2008 10:06:26 +0300
Message-Id: <20080728070626.4707.99096.sendpatchset@localhost.localdomain>
Subject: [PATCH resend] MTD: nandsim: remove useless module parameters
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nandsim pretends it may emulate real flash delays and has
corresponding module parameters. But the emulation is anyway
broken and useless, so remove it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   52 --------------------------------------------
 1 files changed, 0 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index bb885d1..8e73a66 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -36,7 +36,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
 
@@ -51,27 +50,9 @@
 #define CONFIG_NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
 #endif
 
-#ifndef CONFIG_NANDSIM_ACCESS_DELAY
-#define CONFIG_NANDSIM_ACCESS_DELAY 25
-#endif
-#ifndef CONFIG_NANDSIM_PROGRAMM_DELAY
-#define CONFIG_NANDSIM_PROGRAMM_DELAY 200
-#endif
-#ifndef CONFIG_NANDSIM_ERASE_DELAY
-#define CONFIG_NANDSIM_ERASE_DELAY 2
-#endif
-#ifndef CONFIG_NANDSIM_OUTPUT_CYCLE
-#define CONFIG_NANDSIM_OUTPUT_CYCLE 40
-#endif
-#ifndef CONFIG_NANDSIM_INPUT_CYCLE
-#define CONFIG_NANDSIM_INPUT_CYCLE  50
-#endif
 #ifndef CONFIG_NANDSIM_BUS_WIDTH
 #define CONFIG_NANDSIM_BUS_WIDTH  8
 #endif
-#ifndef CONFIG_NANDSIM_DO_DELAYS
-#define CONFIG_NANDSIM_DO_DELAYS  0
-#endif
 #ifndef CONFIG_NANDSIM_LOG
 #define CONFIG_NANDSIM_LOG        0
 #endif
@@ -83,13 +64,7 @@ static uint first_id_byte  = CONFIG_NANDSIM_FIRST_ID_BYTE;
 static uint second_id_byte = CONFIG_NANDSIM_SECOND_ID_BYTE;
 static uint third_id_byte  = CONFIG_NANDSIM_THIRD_ID_BYTE;
 static uint fourth_id_byte = CONFIG_NANDSIM_FOURTH_ID_BYTE;
-static uint access_delay   = CONFIG_NANDSIM_ACCESS_DELAY;
-static uint programm_delay = CONFIG_NANDSIM_PROGRAMM_DELAY;
-static uint erase_delay    = CONFIG_NANDSIM_ERASE_DELAY;
-static uint output_cycle   = CONFIG_NANDSIM_OUTPUT_CYCLE;
-static uint input_cycle    = CONFIG_NANDSIM_INPUT_CYCLE;
 static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
-static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
 static uint log            = CONFIG_NANDSIM_LOG;
 static uint dbg            = CONFIG_NANDSIM_DBG;
 static unsigned long parts[MAX_MTD_DEVICES];
@@ -106,13 +81,7 @@ module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
 module_param(third_id_byte,  uint, 0400);
 module_param(fourth_id_byte, uint, 0400);
-module_param(access_delay,   uint, 0400);
-module_param(programm_delay, uint, 0400);
-module_param(erase_delay,    uint, 0400);
-module_param(output_cycle,   uint, 0400);
-module_param(input_cycle,    uint, 0400);
 module_param(bus_width,      uint, 0400);
-module_param(do_delays,      uint, 0400);
 module_param(log,            uint, 0400);
 module_param(dbg,            uint, 0400);
 module_param_array(parts, ulong, &parts_num, 0400);
@@ -128,13 +97,7 @@ MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
 MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read ID' command");
-MODULE_PARM_DESC(access_delay,   "Initial page access delay (microiseconds)");
-MODULE_PARM_DESC(programm_delay, "Page programm delay (microseconds");
-MODULE_PARM_DESC(erase_delay,    "Sector erase delay (milliseconds)");
-MODULE_PARM_DESC(output_cycle,   "Word output (from flash) time (nanodeconds)");
-MODULE_PARM_DESC(input_cycle,    "Word input (to flash) time (nanodeconds)");
 MODULE_PARM_DESC(bus_width,      "Chip's bus width (8- or 16-bit)");
-MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
 MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
 MODULE_PARM_DESC(parts,          "Partition sizes (in erase blocks) separated by commas");
@@ -173,12 +136,6 @@ MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the I
 #define NS_INFO(args...) \
 	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); } while(0)
 
-/* Busy-wait delay macros (microseconds, milliseconds) */
-#define NS_UDELAY(us) \
-        do { if (do_delays) udelay(us); } while(0)
-#define NS_MDELAY(us) \
-        do { if (do_delays) mdelay(us); } while(0)
-
 /* Is the nandsim structure initialized ? */
 #define NS_IS_INITIALIZED(ns) ((ns)->geom.totsz != 0)
 
@@ -1301,7 +1258,6 @@ static int prog_page(struct nandsim *ns, int num)
 static int do_state_action(struct nandsim *ns, uint32_t action)
 {
 	int num;
-	int busdiv = ns->busw == 8 ? 1 : 2;
 	unsigned int erase_block_no, page_no;
 
 	action &= ACTION_MASK;
@@ -1337,9 +1293,6 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		else
 			NS_LOG("read OOB of page %d\n", ns->regs.row);
 
-		NS_UDELAY(access_delay);
-		NS_UDELAY(input_cycle * ns->geom.pgsz / 1000 / busdiv);
-
 		break;
 
 	case ACTION_SECERASE:
@@ -1370,8 +1323,6 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		erase_sector(ns);
 
-		NS_MDELAY(erase_delay);
-
 		if (erase_block_wear)
 			update_wear(erase_block_no);
 
@@ -1408,9 +1359,6 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
 		NS_LOG("programm page %d\n", ns->regs.row);
 
-		NS_UDELAY(programm_delay);
-		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
-
 		if (write_error(page_no)) {
 			NS_WARN("simulating write failure in page %u\n", page_no);
 			return -1;
-- 
1.5.4.1
