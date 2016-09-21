Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeG0-00070i-GI
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:56:01 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 36/46] mtd: nandsim: Cleanup constants
Date: Wed, 21 Sep 2016 11:55:42 +0200
Message-Id: <a98f8f3e87c3b5bdffcce2746f7326c93e685f2a.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Rename CONFIG_NANDSIM_* to NANDSIM_* since these
constants are not exposed to kconfig.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 74 ++++++++++++++++------------------------------
 1 file changed, 25 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 31a9f89..d46eb18 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -54,50 +54,26 @@
 #include <linux/mutex.h>
 #include <linux/file.h>
 
-/* Default simulator parameters values */
-#if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
-    !defined(CONFIG_NANDSIM_SECOND_ID_BYTE) || \
-    !defined(CONFIG_NANDSIM_THIRD_ID_BYTE)  || \
-    !defined(CONFIG_NANDSIM_FOURTH_ID_BYTE)
-#define CONFIG_NANDSIM_FIRST_ID_BYTE  0x98
-#define CONFIG_NANDSIM_SECOND_ID_BYTE 0x39
-#define CONFIG_NANDSIM_THIRD_ID_BYTE  0xFF /* No byte */
-#define CONFIG_NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
-#endif
-
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
-#ifndef CONFIG_NANDSIM_BUS_WIDTH
-#define CONFIG_NANDSIM_BUS_WIDTH  8
-#endif
-#ifndef CONFIG_NANDSIM_DO_DELAYS
-#define CONFIG_NANDSIM_DO_DELAYS  0
-#endif
-#ifndef CONFIG_NANDSIM_MAX_PARTS
-#define CONFIG_NANDSIM_MAX_PARTS  32
-#endif
-
-static uint access_delay   = CONFIG_NANDSIM_ACCESS_DELAY;
-static uint programm_delay = CONFIG_NANDSIM_PROGRAMM_DELAY;
-static uint erase_delay    = CONFIG_NANDSIM_ERASE_DELAY;
-static uint output_cycle   = CONFIG_NANDSIM_OUTPUT_CYCLE;
-static uint input_cycle    = CONFIG_NANDSIM_INPUT_CYCLE;
-static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
-static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
-static unsigned long parts[CONFIG_NANDSIM_MAX_PARTS];
+#define NANDSIM_FIRST_ID_BYTE  0x98
+#define NANDSIM_SECOND_ID_BYTE 0x39
+#define NANDSIM_THIRD_ID_BYTE  0xFF /* No byte */
+#define NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
+#define NANDSIM_ACCESS_DELAY 25
+#define NANDSIM_PROGRAMM_DELAY 200
+#define NANDSIM_ERASE_DELAY 2
+#define NANDSIM_OUTPUT_CYCLE 40
+#define NANDSIM_INPUT_CYCLE  50
+#define NANDSIM_BUS_WIDTH  8
+#define NANDSIM_DO_DELAYS  0
+
+static uint access_delay   = NANDSIM_ACCESS_DELAY;
+static uint programm_delay = NANDSIM_PROGRAMM_DELAY;
+static uint erase_delay    = NANDSIM_ERASE_DELAY;
+static uint output_cycle   = NANDSIM_OUTPUT_CYCLE;
+static uint input_cycle    = NANDSIM_INPUT_CYCLE;
+static uint bus_width      = NANDSIM_BUS_WIDTH;
+static uint do_delays      = NANDSIM_DO_DELAYS;
+static unsigned long parts[NANDSIM_MAX_PARTS];
 static unsigned int parts_num;
 static char *badblocks = NULL;
 static char *weakblocks = NULL;
@@ -109,10 +85,10 @@ static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
 static u_char id_bytes[8] = {
-	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
-	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
-	[2] = CONFIG_NANDSIM_THIRD_ID_BYTE,
-	[3] = CONFIG_NANDSIM_FOURTH_ID_BYTE,
+	[0] = NANDSIM_FIRST_ID_BYTE,
+	[1] = NANDSIM_SECOND_ID_BYTE,
+	[2] = NANDSIM_THIRD_ID_BYTE,
+	[3] = NANDSIM_FOURTH_ID_BYTE,
 	[4 ... 7] = 0xFF,
 };
 static bool defaults = true;
@@ -304,8 +280,8 @@ struct nandsim {
 	unsigned int index;
 	unsigned int refcnt;
 	spinlock_t refcnt_lock;
-	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
 	bool destroying;
+	struct mtd_partition partitions[NANDSIM_MAX_PARTS];
 	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
-- 
2.8.3
