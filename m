Received: from [208.101.48.4] (helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gzcrq-0000Hc-LI
	for linux-mtd@lists.infradead.org; Wed, 27 Dec 2006 17:47:07 +0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17810.36897.44930.853654@vaishnavi.localdomain>
Date: Wed, 27 Dec 2006 20:54:17 +0530
To: dedekind@infradead.org
Subject: [PATCH] NAND: nandsim bad block injection
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem, here's the update patch.

Adds support for bad block creation on block erase and page program,
by returning erase/program failed in the status byte. The probability
of fault occurrence can be specified through module parameters.

Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c3bca95..00b60dc 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -37,6 +37,8 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
+#include <linux/random.h>
+#include <linux/stringify.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -70,6 +72,12 @@
 #ifndef CONFIG_NANDSIM_DO_DELAYS
 #define CONFIG_NANDSIM_DO_DELAYS  0
 #endif
+#ifndef CONFIG_NANDSIM_ERASE_FAIL_PROB
+#define CONFIG_NANDSIM_ERASE_FAIL_PROB 0
+#endif
+#ifndef CONFIG_NANDSIM_PROG_FAIL_PROB
+#define CONFIG_NANDSIM_PROG_FAIL_PROB 0
+#endif
 #ifndef CONFIG_NANDSIM_LOG
 #define CONFIG_NANDSIM_LOG        0
 #endif
@@ -77,6 +85,9 @@
 #define CONFIG_NANDSIM_DBG        0
 #endif
 
+#define PROB_SCALE_FACTOR         1000
+#define PROB_SCALE_FACTOR_STR     __stringify(PROB_SCALE_FACTOR)
+
 static uint first_id_byte  = CONFIG_NANDSIM_FIRST_ID_BYTE;
 static uint second_id_byte = CONFIG_NANDSIM_SECOND_ID_BYTE;
 static uint third_id_byte  = CONFIG_NANDSIM_THIRD_ID_BYTE;
@@ -88,6 +99,8 @@ static uint output_cycle   = CONFIG_NAND
 static uint input_cycle    = CONFIG_NANDSIM_INPUT_CYCLE;
 static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
 static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
+static uint erase_fail_prob = CONFIG_NANDSIM_ERASE_FAIL_PROB;
+static uint prog_fail_prob = CONFIG_NANDSIM_PROG_FAIL_PROB;
 static uint log            = CONFIG_NANDSIM_LOG;
 static uint dbg            = CONFIG_NANDSIM_DBG;
 
@@ -102,6 +115,8 @@ module_param(output_cycle,   uint, 0400)
 module_param(input_cycle,    uint, 0400);
 module_param(bus_width,      uint, 0400);
 module_param(do_delays,      uint, 0400);
+module_param(erase_fail_prob, uint, 0400);
+module_param(prog_fail_prob, uint, 0400);
 module_param(log,            uint, 0400);
 module_param(dbg,            uint, 0400);
 
@@ -116,6 +131,8 @@ MODULE_PARM_DESC(output_cycle,   "Word o
 MODULE_PARM_DESC(input_cycle,    "Word input (to flash) time (nanodeconds)");
 MODULE_PARM_DESC(bus_width,      "Chip's bus width (8- or 16-bit)");
 MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
+MODULE_PARM_DESC(erase_fail_prob, "Probability (scaled by " PROB_SCALE_FACTOR_STR ") of erase failing, default 0");
+MODULE_PARM_DESC(prog_fail_prob, "Probability (scaled by " PROB_SCALE_FACTOR_STR ") of program failing, default 0");
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
 MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
 
@@ -875,6 +892,32 @@ static int prog_page(struct nandsim *ns,
 }
 
 /*
+ * The function determines whether erase failure has to be
+ * injected. 
+ *
+ * RETURNS: 1 if fault should be injected, 0 if fault should not be
+ * injected.
+ */
+static inline int inject_erase_fault(void)
+{
+	int rnd = random32() % PROB_SCALE_FACTOR;
+	return rnd < erase_fail_prob;
+}
+
+/*
+ * The function determines whether prog failure has to be
+ * injected. 
+ *
+ * RETURNS: 1 if fault should be injected, 0 if fault should not be
+ * injected.
+ */
+static inline int inject_prog_fault(void)
+{
+	int rnd = random32() % PROB_SCALE_FACTOR;
+	return rnd < prog_fail_prob;
+}
+
+/*
  * If state has any action bit, perform this action.
  *
  * RETURNS: 0 if success, -1 if error.
@@ -948,6 +991,16 @@ static int do_state_action(struct nandsi
 
 		erase_sector(ns);
 
+		/* 
+		 * Injecting fault after erasing the sector, saves
+		 * memory since the memory used by the bad block is
+		 * freed.
+		 */
+		if (inject_erase_fault()) {
+			NS_DBG("do_state_action: injecting erase fault\n");
+			return -1;
+		}
+
 		NS_MDELAY(erase_delay);
 
 		break;
@@ -969,6 +1022,15 @@ static int do_state_action(struct nandsi
 			return -1;
 		}
 
+		/* 
+		 * Injecting fault before programming the sector,
+		 * helps to save memory.
+		 */
+		if (inject_prog_fault()) {
+			NS_DBG("do_state_action: injecting page prog fault\n");
+			return -1;
+		}
+
 		if (prog_page(ns, num) == -1)
 			return -1;
 
