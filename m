Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTFR2-000757-UY
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 06:50:58 -0400
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2JAn2RR023923
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:49:32 +0200
Message-ID: <45FE6A7A.3070705@nokia.com>
Date: Mon, 19 Mar 2007 12:48:26 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Enhance nandsim optionally to report wear
	information
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new module parameter 'rptwear' specifies how many erases between
reporting wear information.  Zero means never.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   98 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 05b4207..13c5927 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -99,6 +99,7 @@ static char *weakblocks = NULL;
 static char *weakpages = NULL;
 static unsigned int bitflips = 0;
 static char *gravepages = NULL;
+static unsigned int rptwear = 0;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -119,6 +120,7 @@ module_param(weakblocks,     charp, 0400
 module_param(weakpages,      charp, 0400);
 module_param(bitflips,       uint, 0400);
 module_param(gravepages,     charp, 0400);
+module_param(rptwear,        uint, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
@@ -146,6 +148,7 @@ MODULE_PARM_DESC(bitflips,       "Maximu
 MODULE_PARM_DESC(gravepages,     "Pages that lose data [: maximum reads (defaults to 3)]"
 				 " separated by commas e.g. 1401:2 means page 1401"
 				 " can be read only twice before failing");
+MODULE_PARM_DESC(rptwear,        "Number of erases inbetween reporting wear, if not zero");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -162,6 +165,8 @@ #define NS_WARN(args...) \
 	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: " args); } while(0)
 #define NS_ERR(args...) \
 	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: " args); } while(0)
+#define NS_INFO(args...) \
+	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); } while(0)
 
 /* Busy-wait delay macros (microseconds, milliseconds) */
 #define NS_UDELAY(us) \
@@ -394,6 +399,11 @@ struct grave_page {
 
 static LIST_HEAD(grave_pages);
 
+static unsigned long *erase_block_wear = NULL;
+static unsigned int wear_eb_count = 0;
+static unsigned long total_wear = 0;
+static unsigned int rptwear_cnt = 0;
+
 /* MTD structure for NAND controller */
 static struct mtd_info *nsmtd;
 
@@ -801,6 +811,88 @@ static void free_lists(void)
 		list_del(pos);
 		kfree(list_entry(pos, struct grave_page, list));
 	}
+	kfree(erase_block_wear);
+}
+
+static int setup_wear_reporting(struct mtd_info *mtd)
+{
+	size_t mem;
+
+	if (!rptwear)
+		return 0;
+	wear_eb_count = mtd->size / mtd->erasesize;
+	mem = wear_eb_count * sizeof(unsigned long);
+	if (mem / sizeof(unsigned long) != wear_eb_count) {
+		NS_ERR("Too many erase blocks for wear reporting\n");
+		return -ENOMEM;
+	}
+	erase_block_wear = kzalloc(mem, GFP_KERNEL);
+	if (!erase_block_wear) {
+		NS_ERR("Too many erase blocks for wear reporting\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static void update_wear(unsigned int erase_block_no)
+{
+	unsigned long wmin = -1, wmax = 0, avg;
+	unsigned long deciles[10], decile_max[10], tot = 0;
+	unsigned int i;
+
+	if (!erase_block_wear)
+		return;
+	total_wear += 1;
+	if (total_wear == 0)
+		NS_ERR("Erase counter total overflow\n");
+	erase_block_wear[erase_block_no] += 1;
+	if (erase_block_wear[erase_block_no] == 0)
+		NS_ERR("Erase counter overflow for erase block %u\n", erase_block_no);
+	rptwear_cnt += 1;
+	if (rptwear_cnt < rptwear)
+		return;
+	rptwear_cnt = 0;
+	/* Calc wear stats */
+	for (i = 0; i < wear_eb_count; ++i) {
+		unsigned long wear = erase_block_wear[i];
+		if (wear < wmin)
+			wmin = wear;
+		if (wear > wmax)
+			wmax = wear;
+		tot += wear;
+	}
+	for (i = 0; i < 9; ++i) {
+		deciles[i] = 0;
+		decile_max[i] = (wmax * (i + 1) + 5) / 10;
+	}
+	decile_max[9] = wmax;
+	for (i = 0; i < wear_eb_count; ++i) {
+		int d;
+		unsigned long wear = erase_block_wear[i];
+		for (d = 0; d < 10; ++d)
+			if (wear <= decile_max[d]) {
+				deciles[d] += 1;
+				break;
+			}
+	}
+	avg = tot / wear_eb_count;
+	/* Output wear report */
+	NS_INFO("*** Wear Report ***\n");
+	NS_INFO("Total numbers of erases:  %lu\n", tot);
+	NS_INFO("Number of erase blocks:   %u\n", wear_eb_count);
+	NS_INFO("Average number of erases: %lu\n", avg);
+	NS_INFO("Maximum number of erases: %lu\n", wmax);
+	NS_INFO("Minimum number of erases: %lu\n", wmin);
+	for (i = 0; i < 10; ++i) {
+		unsigned long from = (i ? decile_max[i - 1] + 1 : 0);
+		if (from > decile_max[i])
+			continue;
+		NS_INFO("Number of ebs with erase counts from %lu to %lu : %lu\n", 
+			from,
+			decile_max[i],
+			deciles[i]);
+	}
+	NS_INFO("*** End of Wear Report ***\n");
 }
 
 /*
@@ -1268,6 +1360,9 @@ static int do_state_action(struct nandsi
 
 		NS_MDELAY(erase_delay);
 
+		if (erase_block_wear)
+			update_wear(erase_block_no);
+
 		if (erase_error(erase_block_no)) {
 			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
 			return -1;
@@ -1903,6 +1998,9 @@ static int __init ns_init_module(void)
 		goto error;
 	}
 
+	if ((retval = setup_wear_reporting(nsmtd)) != 0)
+		goto err_exit;
+
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
-- 
1.4.3
