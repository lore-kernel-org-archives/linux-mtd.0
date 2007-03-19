Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTFQC-00071l-4b
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 06:50:00 -0400
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2JAmYf3006615
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:48:56 +0200
Message-ID: <45FE6A51.2010208@nokia.com>
Date: Mon, 19 Mar 2007 12:47:45 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Enhance nandsim to simulate flash errors
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

New module parameters have been added to nandsim to
simulate:

        bitflips        random bit flips
        badblocks       blocks that are initially marked bad
        weakblocks      blocks that fail to erase after a
                        small number of erase cycles
        weakpages       pages that fail to write after a
                        small number of successful writes
        gravepages      pages that fail to read after a
                        small number of successful reads

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |  301 +++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 300 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 638e6c2..05b4207 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -38,6 +38,7 @@ #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 #include <linux/list.h>
+#include <linux/random.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -93,6 +94,11 @@ static uint log            = CONFIG_NAND
 static uint dbg            = CONFIG_NANDSIM_DBG;
 static unsigned long parts[MAX_MTD_DEVICES];
 static unsigned int parts_num;
+static char *badblocks = NULL;
+static char *weakblocks = NULL;
+static char *weakpages = NULL;
+static unsigned int bitflips = 0;
+static char *gravepages = NULL;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -108,6 +114,11 @@ module_param(do_delays,      uint, 0400)
 module_param(log,            uint, 0400);
 module_param(dbg,            uint, 0400);
 module_param_array(parts, ulong, &parts_num, 0400);
+module_param(badblocks,      charp, 0400);
+module_param(weakblocks,     charp, 0400);
+module_param(weakpages,      charp, 0400);
+module_param(bitflips,       uint, 0400);
+module_param(gravepages,     charp, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
@@ -123,6 +134,18 @@ MODULE_PARM_DESC(do_delays,      "Simula
 MODULE_PARM_DESC(log,            "Perform logging if not zero");
 MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
 MODULE_PARM_DESC(parts,          "Partition sizes (in erase blocks) separated by commas");
+/* Page and erase block positions for the following parameters are independent of any partitions */
+MODULE_PARM_DESC(badblocks,      "Erase blocks that are initially marked bad, separated by commas");
+MODULE_PARM_DESC(weakblocks,     "Weak erase blocks [: remaining erase cycles (defaults to 3)]"
+				 " separated by commas e.g. 113:2 means eb 113"
+				 " can be erased only twice before failing");
+MODULE_PARM_DESC(weakpages,      "Weak pages [: maximum writes (defaults to 3)]"
+				 " separated by commas e.g. 1401:2 means page 1401"
+				 " can be written only twice before failing");
+MODULE_PARM_DESC(bitflips,       "Maximum number of random bit flips per page (zero by default)");
+MODULE_PARM_DESC(gravepages,     "Pages that lose data [: maximum reads (defaults to 3)]"
+				 " separated by commas e.g. 1401:2 means page 1401"
+				 " can be read only twice before failing");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -344,6 +367,33 @@ static struct nandsim_operations {
 			       STATE_DATAOUT, STATE_READY}}
 };
 
+struct weak_block {
+	struct list_head list;
+	unsigned int erase_block_no;
+	unsigned int max_erases;
+	unsigned int erases_done;
+};
+
+static LIST_HEAD(weak_blocks);
+
+struct weak_page {
+	struct list_head list;
+	unsigned int page_no;
+	unsigned int max_writes;
+	unsigned int writes_done;
+};
+
+static LIST_HEAD(weak_pages);
+
+struct grave_page {
+	struct list_head list;
+	unsigned int page_no;
+	unsigned int max_reads;
+	unsigned int reads_done;
+};
+
+static LIST_HEAD(grave_pages);
+
 /* MTD structure for NAND controller */
 static struct mtd_info *nsmtd;
 
@@ -555,6 +605,204 @@ static void free_nandsim(struct nandsim 
 	return;
 }
 
+static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
+{
+	char *w;
+	int zero_ok;
+	unsigned int erase_block_no;
+	loff_t offset;
+
+	if (!badblocks)
+		return 0;
+	w = badblocks;
+	do {
+		zero_ok = (*w == '0' ? 1 : 0);
+		erase_block_no = simple_strtoul(w, &w, 0);
+		if (!zero_ok && !erase_block_no) {
+			NS_ERR("invalid badblocks.\n");
+			return -EINVAL;
+		}
+		offset = erase_block_no * ns->geom.secsz;
+		if (mtd->block_markbad(mtd, offset)) {
+			NS_ERR("invalid badblocks.\n");
+			return -EINVAL;
+		}
+		if (*w == ',')
+			w += 1;
+	} while (*w);
+	return 0;
+}
+
+static int parse_weakblocks(void)
+{
+	char *w;
+	int zero_ok;
+	unsigned int erase_block_no;
+	unsigned int max_erases;
+	struct weak_block *wb;
+
+	if (!weakblocks)
+		return 0;
+	w = weakblocks;
+	do {
+		zero_ok = (*w == '0' ? 1 : 0);
+		erase_block_no = simple_strtoul(w, &w, 0);
+		if (!zero_ok && !erase_block_no) {
+			NS_ERR("invalid weakblocks.\n");
+			return -EINVAL;
+		}
+		max_erases = 3;
+		if (*w == ':') {
+			w += 1;
+			max_erases = simple_strtoul(w, &w, 0);
+		}
+		if (*w == ',')
+			w += 1;
+		wb = kzalloc(sizeof(*wb), GFP_KERNEL);
+		if (!wb) {
+			NS_ERR("unable to allocate memory.\n");
+			return -ENOMEM;
+		}
+		wb->erase_block_no = erase_block_no;
+		wb->max_erases = max_erases;
+		list_add(&wb->list, &weak_blocks);
+	} while (*w);
+	return 0;
+}
+
+static int erase_error(unsigned int erase_block_no)
+{
+	struct weak_block *wb;
+
+	list_for_each_entry(wb, &weak_blocks, list)
+		if (wb->erase_block_no == erase_block_no) {
+			if (wb->erases_done >= wb->max_erases)
+				return 1;
+			wb->erases_done += 1;
+			return 0;
+		}
+	return 0;
+}
+
+static int parse_weakpages(void)
+{
+	char *w;
+	int zero_ok;
+	unsigned int page_no;
+	unsigned int max_writes;
+	struct weak_page *wp;
+
+	if (!weakpages)
+		return 0;
+	w = weakpages;
+	do {
+		zero_ok = (*w == '0' ? 1 : 0);
+		page_no = simple_strtoul(w, &w, 0);
+		if (!zero_ok && !page_no) {
+			NS_ERR("invalid weakpagess.\n");
+			return -EINVAL;
+		}
+		max_writes = 3;
+		if (*w == ':') {
+			w += 1;
+			max_writes = simple_strtoul(w, &w, 0);
+		}
+		if (*w == ',')
+			w += 1;
+		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
+		if (!wp) {
+			NS_ERR("unable to allocate memory.\n");
+			return -ENOMEM;
+		}
+		wp->page_no = page_no;
+		wp->max_writes = max_writes;
+		list_add(&wp->list, &weak_pages);
+	} while (*w);
+	return 0;
+}
+
+static int write_error(unsigned int page_no)
+{
+	struct weak_page *wp;
+
+	list_for_each_entry(wp, &weak_pages, list)
+		if (wp->page_no == page_no) {
+			if (wp->writes_done >= wp->max_writes)
+				return 1;
+			wp->writes_done += 1;
+			return 0;
+		}
+	return 0;
+}
+
+static int parse_gravepages(void)
+{
+	char *g;
+	int zero_ok;
+	unsigned int page_no;
+	unsigned int max_reads;
+	struct grave_page *gp;
+
+	if (!gravepages)
+		return 0;
+	g = gravepages;
+	do {
+		zero_ok = (*g == '0' ? 1 : 0);
+		page_no = simple_strtoul(g, &g, 0);
+		if (!zero_ok && !page_no) {
+			NS_ERR("invalid gravepagess.\n");
+			return -EINVAL;
+		}
+		max_reads = 3;
+		if (*g == ':') {
+			g += 1;
+			max_reads = simple_strtoul(g, &g, 0);
+		}
+		if (*g == ',')
+			g += 1;
+		gp = kzalloc(sizeof(*gp), GFP_KERNEL);
+		if (!gp) {
+			NS_ERR("unable to allocate memory.\n");
+			return -ENOMEM;
+		}
+		gp->page_no = page_no;
+		gp->max_reads = max_reads;
+		list_add(&gp->list, &grave_pages);
+	} while (*g);
+	return 0;
+}
+
+static int read_error(unsigned int page_no)
+{
+	struct grave_page *gp;
+
+	list_for_each_entry(gp, &grave_pages, list)
+		if (gp->page_no == page_no) {
+			if (gp->reads_done >= gp->max_reads)
+				return 1;
+			gp->reads_done += 1;
+			return 0;
+		}
+	return 0;
+}
+
+static void free_lists(void)
+{
+	struct list_head *pos, *n;
+	list_for_each_safe(pos, n, &weak_blocks) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_block, list));
+	}
+	list_for_each_safe(pos, n, &weak_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_page, list));
+	}
+	list_for_each_safe(pos, n, &grave_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct grave_page, list));
+	}
+}
+
 /*
  * Returns the string representation of 'state' state.
  */
@@ -867,9 +1115,31 @@ static void read_page(struct nandsim *ns
 		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
+		unsigned int page_no = ns->regs.row;
 		NS_DBG("read_page: page %d allocated, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
+		if (read_error(page_no)) {
+			int i;
+			memset(ns->buf.byte, 0xFF, num);
+			for (i = 0; i < num; ++i)
+				ns->buf.byte[i] = random32();
+			NS_WARN("simulating read error in page %u\n", page_no);
+			return;
+		}
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
+		if (bitflips && random32() < (1 << 22)) {
+			int flips = 1;
+			if (bitflips > 1)
+				flips = (random32() % (int) bitflips) + 1;
+			while (flips--) {
+				int pos = random32() % (num * 8);
+				ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
+				NS_WARN("read_page: flipping bit %d in page %d "
+					"reading from %d ecc: corrected=%u failed=%u\n",
+					pos, ns->regs.row, ns->regs.column + ns->regs.off,
+					nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
+			}
+		}
 	}
 }
 
@@ -928,6 +1198,7 @@ static int do_state_action(struct nandsi
 {
 	int num;
 	int busdiv = ns->busw == 8 ? 1 : 2;
+	unsigned int erase_block_no, page_no;
 
 	action &= ACTION_MASK;
 
@@ -987,14 +1258,21 @@ static int do_state_action(struct nandsi
 				8 * (ns->geom.pgaddrbytes - ns->geom.secaddrbytes)) | ns->regs.column;
 		ns->regs.column = 0;
 
+		erase_block_no = ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift);
+
 		NS_DBG("do_state_action: erase sector at address %#x, off = %d\n",
 				ns->regs.row, NS_RAW_OFFSET(ns));
-		NS_LOG("erase sector %d\n", ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift));
+		NS_LOG("erase sector %u\n", erase_block_no);
 
 		erase_sector(ns);
 
 		NS_MDELAY(erase_delay);
 
+		if (erase_error(erase_block_no)) {
+			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
+			return -1;
+		}
+
 		break;
 
 	case ACTION_PRGPAGE:
@@ -1017,6 +1295,8 @@ static int do_state_action(struct nandsi
 		if (prog_page(ns, num) == -1)
 			return -1;
 
+		page_no = ns->regs.row;
+
 		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
 		NS_LOG("programm page %d\n", ns->regs.row);
@@ -1024,6 +1304,11 @@ static int do_state_action(struct nandsi
 		NS_UDELAY(programm_delay);
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
+		if (write_error(page_no)) {
+			NS_WARN("simulating write failure in page %u\n", page_no);
+			return -1;
+		}
+
 		break;
 
 	case ACTION_ZEROOFF:
@@ -1602,6 +1887,15 @@ static int __init ns_init_module(void)
 
 	nsmtd->owner = THIS_MODULE;
 
+	if ((retval = parse_weakblocks()) != 0)
+		goto error;
+
+	if ((retval = parse_weakpages()) != 0)
+		goto error;
+
+	if ((retval = parse_gravepages()) != 0)
+		goto error;
+
 	if ((retval = nand_scan(nsmtd, 1)) != 0) {
 		NS_ERR("can't register NAND Simulator\n");
 		if (retval > 0)
@@ -1612,6 +1906,9 @@ static int __init ns_init_module(void)
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
+	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
+		goto err_exit;
+
 	if ((retval = nand_default_bbt(nsmtd)) != 0)
 		goto err_exit;
 
@@ -1628,6 +1925,7 @@ err_exit:
 		kfree(nand->partitions[i].name);
 error:
 	kfree(nsmtd);
+	free_lists();
 
 	return retval;
 }
@@ -1647,6 +1945,7 @@ static void __exit ns_cleanup_module(voi
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
 	kfree(nsmtd);        /* Free other structures */
+	free_lists();
 }
 
 module_exit(ns_cleanup_module);
-- 
1.4.3
