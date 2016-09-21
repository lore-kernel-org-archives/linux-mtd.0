Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeEx-0006vG-Gu
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:55:00 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 30/46] mtd: nandsim: Use pr_ style logging
Date: Wed, 21 Sep 2016 11:54:31 +0200
Message-Id: <e8aa939544f6b788d75a5cb9ebdd3bf54ba3379f.1474450296.git.dwalter@sigma-star.at>
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

These days we have CONFIG_DYNAMIC_DEBUG and stuff, there
is no need to open code logging.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 323 +++++++++++++++++++++------------------------
 1 file changed, 149 insertions(+), 174 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cf2694f..048beb0 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -23,6 +23,8 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/module.h>
@@ -84,12 +86,6 @@
 #ifndef CONFIG_NANDSIM_DO_DELAYS
 #define CONFIG_NANDSIM_DO_DELAYS  0
 #endif
-#ifndef CONFIG_NANDSIM_LOG
-#define CONFIG_NANDSIM_LOG        0
-#endif
-#ifndef CONFIG_NANDSIM_DBG
-#define CONFIG_NANDSIM_DBG        0
-#endif
 #ifndef CONFIG_NANDSIM_MAX_PARTS
 #define CONFIG_NANDSIM_MAX_PARTS  32
 #endif
@@ -101,8 +97,6 @@ static uint output_cycle   = CONFIG_NANDSIM_OUTPUT_CYCLE;
 static uint input_cycle    = CONFIG_NANDSIM_INPUT_CYCLE;
 static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
 static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
-static uint log            = CONFIG_NANDSIM_LOG;
-static uint dbg            = CONFIG_NANDSIM_DBG;
 static unsigned long parts[CONFIG_NANDSIM_MAX_PARTS];
 static unsigned int parts_num;
 static char *badblocks = NULL;
@@ -135,8 +129,6 @@ module_param(output_cycle,   uint, 0400);
 module_param(input_cycle,    uint, 0400);
 module_param(bus_width,      uint, 0400);
 module_param(do_delays,      uint, 0400);
-module_param(log,            uint, 0400);
-module_param(dbg,            uint, 0400);
 module_param_array(parts, ulong, &parts_num, 0400);
 module_param(badblocks,      charp, 0400);
 module_param(weakblocks,     charp, 0400);
@@ -155,14 +147,12 @@ MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read I
 MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command (obsolete)");
 MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read ID' command (obsolete)");
 MODULE_PARM_DESC(access_delay,   "Initial page access delay (microseconds)");
-MODULE_PARM_DESC(programm_delay, "Page programm delay (microseconds");
+MODULE_PARM_DESC(programm_delay, "Page program delay (microseconds");
 MODULE_PARM_DESC(erase_delay,    "Sector erase delay (milliseconds)");
 MODULE_PARM_DESC(output_cycle,   "Word output (from flash) time (nanoseconds)");
 MODULE_PARM_DESC(input_cycle,    "Word input (to flash) time (nanoseconds)");
 MODULE_PARM_DESC(bus_width,      "Chip's bus width (8- or 16-bit)");
 MODULE_PARM_DESC(do_delays,      "Simulate NAND delays using busy-waits if not zero");
-MODULE_PARM_DESC(log,            "Perform logging if not zero");
-MODULE_PARM_DESC(dbg,            "Output debug information if not zero");
 MODULE_PARM_DESC(parts,          "Partition sizes (in erase blocks) separated by commas");
 /* Page and erase block positions for the following parameters are independent of any partitions */
 MODULE_PARM_DESC(badblocks,      "Erase blocks that are initially marked bad, separated by commas");
@@ -189,21 +179,6 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
 
-/* The prefix for simulator output */
-#define NS_OUTPUT_PREFIX "[nandsim]"
-
-/* Simulator's output macros (logging, debugging, warning, error) */
-#define NS_LOG(args...) \
-	do { if (log) printk(KERN_DEBUG NS_OUTPUT_PREFIX " log: " args); } while(0)
-#define NS_DBG(args...) \
-	do { if (dbg) printk(KERN_DEBUG NS_OUTPUT_PREFIX " debug: " args); } while(0)
-#define NS_WARN(args...) \
-	do { printk(KERN_WARNING NS_OUTPUT_PREFIX " warning: " args); } while(0)
-#define NS_ERR(args...) \
-	do { printk(KERN_ERR NS_OUTPUT_PREFIX " error: " args); } while(0)
-#define NS_INFO(args...) \
-	do { printk(KERN_INFO NS_OUTPUT_PREFIX " " args); } while(0)
-
 /* Busy-wait delay macros (microseconds, milliseconds) */
 #define NS_UDELAY(ns, us) \
 	do { if (ns->do_delays) udelay(us); } while (0)
@@ -562,7 +537,7 @@ static int nandsim_debugfs_init(void)
 	if (IS_ERR_OR_NULL(dfs_root)) {
 		int err = dfs_root ? -ENODEV : PTR_ERR(dfs_root);
 
-		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
+		pr_err("cannot create \"nandsim\" debugfs directory, err %d\n",
 			err);
 		return err;
 	}
@@ -596,7 +571,7 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 	if (IS_ERR_OR_NULL(dent)) {
 		int err = dent ? -ENODEV : PTR_ERR(dent);
 
-		NS_ERR("cannot create nandsim debugfs sub-directory, err %d\n",
+		pr_err("cannot create nandsim debugfs sub-directory, err %d\n",
 			err);
 		return err;
 	}
@@ -636,7 +611,7 @@ static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	data->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
 	if (!data->pages) {
 		kfree(data);
-		NS_ERR("alloc_device: unable to allocate page array\n");
+		pr_err("unable to allocate page array\n");
 		return -ENOMEM;
 	}
 	for (i = 0; i < ns->geom.pgnum; i++) {
@@ -648,7 +623,7 @@ static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	if (!data->nand_pages_slab) {
 		vfree(data->pages);
 		kfree(data);
-		NS_ERR("cache_create: unable to create kmem_cache\n");
+		pr_err("unable to create kmem_cache\n");
 		return -ENOMEM;
 	}
 
@@ -679,19 +654,19 @@ static struct file *get_file_from_nsparam(struct nandsim_params *nsparam, bool *
 
 	inode = file->f_mapping->host;
 	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode)) {
-		NS_ERR("alloc_device: Backend file is not a regular file nor a block device\n");
+		pr_err("backing file is not a regular file nor a block device\n");
 		err = -EINVAL;
 		goto out;
 	}
 
 	if (!(file->f_mode & FMODE_CAN_READ)) {
-		NS_ERR("alloc_device: cache file not readable\n");
+		pr_err("cache file not readable\n");
 		err = -EINVAL;
 		goto out;
 	}
 
 	if (!(file->f_mode & FMODE_CAN_WRITE)) {
-		NS_ERR("alloc_device: cache file not writeable\n");
+		pr_err("cache file not writeable\n");
 		err = -EINVAL;
 		goto out;
 	}
@@ -724,13 +699,13 @@ static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	data->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
 				    sizeof(unsigned long));
 	if (!data->pages_written) {
-		NS_ERR("alloc_device: unable to allocate pages written array\n");
+		pr_err("unable to allocate pages written array\n");
 		err = -ENOMEM;
 		goto err_close;
 	}
 	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!data->file_buf) {
-		NS_ERR("alloc_device: unable to allocate file buf\n");
+		pr_err("unable to allocate file buf\n");
 		err = -ENOMEM;
 		goto err_free;
 	}
@@ -767,7 +742,7 @@ static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
 
 	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!data->file_buf) {
-		NS_ERR("alloc_device: unable to allocate file buf\n");
+		pr_err("unable to allocate file buf\n");
 		ret = -ENOMEM;
 		goto out_put;
 	}
@@ -868,7 +843,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	uint64_t next_offset;
 
 	if (NS_IS_INITIALIZED(ns)) {
-		NS_ERR("init_nandsim: nandsim is already initialized\n");
+		pr_err("init_nandsim: nandsim is already initialized\n");
 		return -EIO;
 	}
 
@@ -899,7 +874,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	} else if (ns->geom.pgsz == 4096) {
 		ns->options |= OPT_PAGE4096;
 	} else {
-		NS_ERR("init_nandsim: unknown page size %u\n", ns->geom.pgsz);
+		pr_err("unknown page size %u\n", ns->geom.pgsz);
 		return -EIO;
 	}
 
@@ -923,7 +898,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 
 	/* Fill the partition_info structure */
 	if (nsparam->parts_num > ARRAY_SIZE(ns->partitions)) {
-		NS_ERR("too many partitions.\n");
+		pr_err("too many partitions.\n");
 		return -EINVAL;
 	}
 	remains = ns->geom.totsz;
@@ -932,12 +907,12 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 		uint64_t part_sz = (uint64_t)nsparam->parts[i] * ns->geom.secsz;
 
 		if (!part_sz || part_sz > remains) {
-			NS_ERR("bad partition size.\n");
+			pr_err("bad partition size.\n");
 			return -EINVAL;
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
-			NS_ERR("unable to allocate memory.\n");
+			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		ns->partitions[i].offset = next_offset;
@@ -948,12 +923,12 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	ns->nbparts = nsparam->parts_num;
 	if (remains) {
 		if (nsparam->parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
-			NS_ERR("too many partitions.\n");
+			pr_err("too many partitions.\n");
 			return -EINVAL;
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
-			NS_ERR("unable to allocate memory.\n");
+			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		ns->partitions[i].offset = next_offset;
@@ -962,37 +937,37 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	}
 
 	if (ns->busw == 16)
-		NS_WARN("16-bit flashes support wasn't tested\n");
+		pr_warn("16-bit flashes support wasn't tested\n");
 
-	NS_INFO("flash size: %llu MiB\n",
+	pr_info("flash size: %llu MiB\n",
 			(unsigned long long)ns->geom.totsz >> 20);
-	NS_INFO("page size: %u bytes\n",         ns->geom.pgsz);
-	NS_INFO("OOB area size: %u bytes\n",     ns->geom.oobsz);
-	NS_INFO("sector size: %u KiB\n",         ns->geom.secsz >> 10);
-	NS_INFO("pages number: %u\n",            ns->geom.pgnum);
-	NS_INFO("pages per sector: %u\n",        ns->geom.pgsec);
-	NS_INFO("bus width: %u\n",               ns->busw);
-	NS_INFO("bits in sector size: %u\n",     ns->geom.secshift);
-	NS_INFO("bits in page size: %u\n",       ns->geom.pgshift);
-	NS_INFO("bits in OOB size: %u\n",	ffs(ns->geom.oobsz) - 1);
-	NS_INFO("flash size with OOB: %llu KiB\n",
+	pr_info("page size: %u bytes\n",         ns->geom.pgsz);
+	pr_info("OOB area size: %u bytes\n",     ns->geom.oobsz);
+	pr_info("sector size: %u KiB\n",         ns->geom.secsz >> 10);
+	pr_info("pages number: %u\n",            ns->geom.pgnum);
+	pr_info("pages per sector: %u\n",        ns->geom.pgsec);
+	pr_info("bus width: %u\n",               ns->busw);
+	pr_info("bits in sector size: %u\n",     ns->geom.secshift);
+	pr_info("bits in page size: %u\n",       ns->geom.pgshift);
+	pr_info("bits in OOB size: %u\n",	ffs(ns->geom.oobsz) - 1);
+	pr_info("flash size with OOB: %llu KiB\n",
 			(unsigned long long)ns->geom.totszoob >> 10);
-	NS_INFO("page address bytes: %u\n",      ns->geom.pgaddrbytes);
-	NS_INFO("sector address bytes: %u\n",    ns->geom.secaddrbytes);
-	NS_INFO("options: %#x\n",                ns->options);
+	pr_info("page address bytes: %u\n",      ns->geom.pgaddrbytes);
+	pr_info("sector address bytes: %u\n",    ns->geom.secaddrbytes);
+	pr_info("options: %#x\n",                ns->options);
 
 	ns->bops = nsparam->bops;
 
-	NS_INFO("Using backend: %s\n", ns->bops->name);
+	pr_info("Using backend: %s\n", ns->bops->name);
 	if ((ret = ns->bops->init(ns, nsparam)) != 0) {
-		NS_ERR("Unable to initialize simulator backend: %i\n", ret);
+		pr_err("Unable to initialize simulator backend: %i\n", ret);
 		return ret;
 	}
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!ns->buf.byte) {
-		NS_ERR("init_nandsim: unable to allocate %u bytes for the internal buffer\n",
+		pr_err("unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
 		return -ENOMEM;
 	}
@@ -1025,12 +1000,12 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
 		zero_ok = (*w == '0' ? 1 : 0);
 		erase_block_no = simple_strtoul(w, &w, 0);
 		if (!zero_ok && !erase_block_no) {
-			NS_ERR("invalid badblocks.\n");
+			pr_err("invalid badblocks.\n");
 			return -EINVAL;
 		}
 		offset = (loff_t)erase_block_no * ns->geom.secsz;
 		if (mtd_block_markbad(mtd, offset)) {
-			NS_ERR("invalid badblocks.\n");
+			pr_err("invalid badblocks.\n");
 			return -EINVAL;
 		}
 		if (*w == ',')
@@ -1054,7 +1029,7 @@ static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
 		zero_ok = (*w == '0' ? 1 : 0);
 		erase_block_no = simple_strtoul(w, &w, 0);
 		if (!zero_ok && !erase_block_no) {
-			NS_ERR("invalid weakblocks.\n");
+			pr_err("invalid weakblocks.\n");
 			return -EINVAL;
 		}
 		max_erases = 3;
@@ -1066,7 +1041,7 @@ static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
 			w += 1;
 		wb = kzalloc(sizeof(*wb), GFP_KERNEL);
 		if (!wb) {
-			NS_ERR("unable to allocate memory.\n");
+			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		wb->erase_block_no = erase_block_no;
@@ -1105,7 +1080,7 @@ static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
 		zero_ok = (*w == '0' ? 1 : 0);
 		page_no = simple_strtoul(w, &w, 0);
 		if (!zero_ok && !page_no) {
-			NS_ERR("invalid weakpagess.\n");
+			pr_err("invalid weakpagess.\n");
 			return -EINVAL;
 		}
 		max_writes = 3;
@@ -1117,7 +1092,7 @@ static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
 			w += 1;
 		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
 		if (!wp) {
-			NS_ERR("unable to allocate memory.\n");
+			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		wp->page_no = page_no;
@@ -1156,7 +1131,7 @@ static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
 		zero_ok = (*g == '0' ? 1 : 0);
 		page_no = simple_strtoul(g, &g, 0);
 		if (!zero_ok && !page_no) {
-			NS_ERR("invalid gravepagess.\n");
+			pr_err("invalid gravepagess.\n");
 			return -EINVAL;
 		}
 		max_reads = 3;
@@ -1168,7 +1143,7 @@ static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
 			g += 1;
 		gp = kzalloc(sizeof(*gp), GFP_KERNEL);
 		if (!gp) {
-			NS_ERR("unable to allocate memory.\n");
+			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		gp->page_no = page_no;
@@ -1219,12 +1194,12 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 	ns->wear_eb_count = div_u64(mtd->size, mtd->erasesize);
 	mem = ns->wear_eb_count * sizeof(unsigned long);
 	if (mem / sizeof(unsigned long) != ns->wear_eb_count) {
-		NS_ERR("Too many erase blocks for wear reporting\n");
+		pr_err("Too many erase blocks for wear reporting\n");
 		return -ENOMEM;
 	}
 	ns->erase_block_wear = kzalloc(mem, GFP_KERNEL);
 	if (!ns->erase_block_wear) {
-		NS_ERR("Too many erase blocks for wear reporting\n");
+		pr_err("Too many erase blocks for wear reporting\n");
 		return -ENOMEM;
 	}
 	return 0;
@@ -1240,10 +1215,10 @@ static void update_wear(struct nandsim *ns, unsigned int erase_block_no)
 	 * instead of showing an error message.
 	 */
 	if (ns->total_wear == 0)
-		NS_ERR("Erase counter total overflow\n");
+		pr_err("Erase counter total overflow\n");
 	ns->erase_block_wear[erase_block_no] += 1;
 	if (ns->erase_block_wear[erase_block_no] == 0)
-		NS_ERR("Erase counter overflow for erase block %u\n", erase_block_no);
+		pr_err("Erase counter overflow for erase block %u\n", erase_block_no);
 }
 
 /*
@@ -1300,7 +1275,7 @@ static char *get_state_name(uint32_t state)
 			return "STATE_UNKNOWN";
 	}
 
-	NS_ERR("get_state_name: unknown state, BUG\n");
+	pr_err("unknown state, BUG\n");
 	return NULL;
 }
 
@@ -1367,7 +1342,7 @@ static uint32_t get_state_by_command(unsigned command)
 			return STATE_CMD_RNDOUTSTART;
 	}
 
-	NS_ERR("get_state_by_command: unknown command, BUG\n");
+	pr_err("unknown command, BUG\n");
 	return 0;
 }
 
@@ -1394,7 +1369,7 @@ static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
  */
 static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
 {
-	NS_DBG("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
+	pr_debug("switch to %s state\n", get_state_name(STATE_READY));
 
 	ns->state       = STATE_READY;
 	ns->nxstate     = STATE_UNKNOWN;
@@ -1503,7 +1478,7 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 		ns->npstates = 0;
 		ns->state = ns->op[ns->stateidx];
 		ns->nxstate = ns->op[ns->stateidx + 1];
-		NS_DBG("find_operation: operation found, index: %d, state: %s, nxstate %s\n",
+		pr_debug("operation found, index: %d, state: %s, nxstate %s\n",
 				idx, get_state_name(ns->state), get_state_name(ns->nxstate));
 		return 0;
 	}
@@ -1511,24 +1486,24 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 	if (opsfound == 0) {
 		/* Nothing was found. Try to ignore previous commands (if any) and search again */
 		if (ns->npstates != 0) {
-			NS_DBG("find_operation: no operation found, try again with state %s\n",
+			pr_debug("no operation found, try again with state %s\n",
 					get_state_name(ns->state));
 			ns->npstates = 0;
 			return find_operation(ns, 0);
 
 		}
-		NS_DBG("find_operation: no operations found\n");
+		pr_debug("no operations found\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return -2;
 	}
 
 	if (flag) {
 		/* This shouldn't happen */
-		NS_DBG("find_operation: BUG, operation must be known if address is input\n");
+		pr_err("BUG, operation must be known if address is input\n");
 		return -2;
 	}
 
-	NS_DBG("find_operation: there is still ambiguity\n");
+	pr_debug("there is still ambiguity\n");
 
 	ns->pstates[ns->npstates++] = ns->state;
 
@@ -1644,7 +1619,7 @@ static int do_read_error(struct nandsim *ns, int num)
 
 	if (read_error(ns, page_no)) {
 		prandom_bytes(ns->buf.byte, num);
-		NS_WARN("simulating read error in page %u\n", page_no);
+		pr_warn("simulating read error in page %u\n", page_no);
 		return 1;
 	}
 	return 0;
@@ -1661,7 +1636,7 @@ static void do_bit_flips(struct nandsim *ns, int num)
 		while (flips--) {
 			int pos = prandom_u32() % (num * 8);
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
-			NS_WARN("read_page: flipping bit %d in page %d "
+			pr_warn("flipping bit %d in page %d "
 				"reading from %d ecc: corrected=%u failed=%u\n",
 				pos, ns->regs.row, ns->regs.column + ns->regs.off,
 				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
@@ -1675,10 +1650,10 @@ static void ns_ram_read_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
+		pr_debug("page %d not allocated\n", ns->regs.row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
-		NS_DBG("read_page: page %d allocated, reading from %d\n",
+		pr_debug("page %d allocated, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
 		if (do_read_error(ns, num))
 			return;
@@ -1692,20 +1667,20 @@ static void ns_cachefile_read_page(struct nandsim *ns, int num)
 	struct ns_cachefile_data *data = ns->backend_data;
 
 	if (!test_bit(ns->regs.row, data->pages_written)) {
-		NS_DBG("read_page: page %d not written\n", ns->regs.row);
+		pr_debug("page %d not written\n", ns->regs.row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
 		loff_t pos;
 		ssize_t tx;
 
-		NS_DBG("read_page: page %d written, reading from %d\n",
+		pr_debug("page %d written, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
 		if (do_read_error(ns, num))
 			return;
 		pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 		tx = read_file(ns, data->cfile, ns->buf.byte, num, pos);
 		if (tx != num) {
-			NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 			return;
 		}
 		do_bit_flips(ns, num);
@@ -1719,7 +1694,7 @@ void __ns_file_read_page(struct nandsim *ns, int num,
 	loff_t pos;
 	ssize_t tx;
 
-	NS_DBG("read_page: page %d written, reading from %d\n",
+	pr_debug("page %d written, reading from %d\n",
 		ns->regs.row, ns->regs.column + ns->regs.off);
 
 	if (ns->no_oob) {
@@ -1745,7 +1720,7 @@ void __ns_file_read_page(struct nandsim *ns, int num,
 	if (tx == 0)
 		memset(ns->buf.byte, 0xff, num);
 	else if (tx != num)
-		NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 }
 EXPORT_SYMBOL_GPL(__ns_file_read_page);
 
@@ -1771,7 +1746,7 @@ static void ns_ram_erase_sector(struct nandsim *ns)
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
-			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
+			pr_debug("freeing page %d\n", ns->regs.row+i);
 			kmem_cache_free(data->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
@@ -1787,7 +1762,7 @@ static void ns_cachefile_erase_sector(struct nandsim *ns)
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (__test_and_clear_bit(ns->regs.row + i,
 					 data->pages_written)) {
-			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
+			pr_debug("freeing page %d\n", ns->regs.row + i);
 		}
 	}
 }
@@ -1816,7 +1791,7 @@ void __ns_file_erase_sector(struct nandsim *ns, char *file_buf,
 		pos = (loff_t)(ns->regs.row + i) * pagesz;
 		tx = write_fn(ns, file_buf, pagesz, pos);
 		if (tx != pagesz) {
-			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			pr_err("write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		}
 	}
 }
@@ -1838,7 +1813,7 @@ static int ns_ram_prog_page(struct nandsim *ns, int num)
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
-		NS_DBG("prog_page: allocating page %d\n", ns->regs.row);
+		pr_debug("allocating page %d\n", ns->regs.row);
 		/*
 		 * We allocate memory with GFP_NOFS because a flash FS may
 		 * utilize this. If it is holding an FS lock, then gets here,
@@ -1847,7 +1822,7 @@ static int ns_ram_prog_page(struct nandsim *ns, int num)
 		 */
 		mypage->byte = kmem_cache_alloc(data->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
-			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
+			pr_err("error allocating memory for page %d\n", ns->regs.row);
 			return -1;
 		}
 		memset(mypage->byte, 0xFF, ns->geom.pgszoob);
@@ -1868,7 +1843,7 @@ static int ns_cachefile_prog_page(struct nandsim *ns, int num)
 	u_char *pg_off;
 	struct ns_cachefile_data *data = ns->backend_data;
 
-	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
+	pr_debug("writing page %d\n", ns->regs.row);
 	pg_off = data->file_buf + ns->regs.column + ns->regs.off;
 	off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 	if (!test_bit(ns->regs.row, data->pages_written)) {
@@ -1878,7 +1853,7 @@ static int ns_cachefile_prog_page(struct nandsim *ns, int num)
 		all = 0;
 		tx = read_file(ns, data->cfile, pg_off, num, off);
 		if (tx != num) {
-			NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 			return -1;
 		}
 	}
@@ -1888,14 +1863,14 @@ static int ns_cachefile_prog_page(struct nandsim *ns, int num)
 		loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
 		tx = write_file(ns, data->cfile, data->file_buf, ns->geom.pgszoob, pos);
 		if (tx != ns->geom.pgszoob) {
-			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			pr_err("write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 			return -1;
 		}
 		__set_bit(ns->regs.row, data->pages_written);
 	} else {
 		tx = write_file(ns, data->cfile, pg_off, num, off);
 		if (tx != num) {
-			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			pr_err("write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 			return -1;
 		}
 	}
@@ -1913,7 +1888,7 @@ int __ns_file_prog_page(struct nandsim *ns, int num, char *file_buf,
 	ssize_t tx;
 	u_char *pg_off;
 
-	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
+	pr_debug("writing page %d\n", ns->regs.row);
 
 	if (ns->no_oob) {
 		loff_t pg_write_end = ns->regs.column + ns->regs.off + num;
@@ -1934,7 +1909,7 @@ int __ns_file_prog_page(struct nandsim *ns, int num, char *file_buf,
 	if (tx == 0)
 		memset(pg_off, 0xff, num);
 	else if (tx != num) {
-		NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		pr_err("read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		return -1;
 	}
 
@@ -1943,7 +1918,7 @@ int __ns_file_prog_page(struct nandsim *ns, int num, char *file_buf,
 
 	tx = write_fn(ns, pg_off, num, off);
 	if (tx != num) {
-		NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		pr_err("write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		return -1;
 	}
 
@@ -2001,7 +1976,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 	/* Check that page address input is correct */
 	if (action != ACTION_SECERASE && ns->regs.row >= ns->geom.pgnum) {
-		NS_WARN("do_state_action: wrong page number (%#x)\n", ns->regs.row);
+		pr_warn("wrong page number (%#x)\n", ns->regs.row);
 		return -1;
 	}
 
@@ -2014,21 +1989,21 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		/* Column shouldn't be very large */
 		if (ns->regs.column >= (ns->geom.pgszoob - ns->regs.off)) {
-			NS_ERR("do_state_action: column number is too large\n");
+			pr_err("column number is too large\n");
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
 		ns->bops->read_page(ns, num);
 
-		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
+		pr_debug("ACTION_CPY: copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs.off);
 
 		if (ns->regs.off == 0)
-			NS_LOG("read page %d\n", ns->regs.row);
+			pr_debug("read page %d\n", ns->regs.row);
 		else if (ns->regs.off < ns->geom.pgsz)
-			NS_LOG("read page %d (second half)\n", ns->regs.row);
+			pr_debug("read page %d (second half)\n", ns->regs.row);
 		else
-			NS_LOG("read OOB of page %d\n", ns->regs.row);
+			pr_debug("read OOB of page %d\n", ns->regs.row);
 
 		NS_UDELAY(ns, ns->access_delay);
 		NS_UDELAY(ns, ns->input_cycle * ns->geom.pgsz / 1000 / busdiv);
@@ -2041,13 +2016,13 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 */
 
 		if (ns->lines.wp) {
-			NS_ERR("do_state_action: device is write-protected, ignore sector erase\n");
+			pr_err("device is write-protected, ignore sector erase\n");
 			return -1;
 		}
 
 		if (ns->regs.row >= ns->geom.pgnum - ns->geom.pgsec
 			|| (ns->regs.row & ~(ns->geom.secsz - 1))) {
-			NS_ERR("do_state_action: wrong sector address (%#x)\n", ns->regs.row);
+			pr_err("wrong sector address (%#x)\n", ns->regs.row);
 			return -1;
 		}
 
@@ -2057,9 +2032,9 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		erase_block_no = ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift);
 
-		NS_DBG("do_state_action: erase sector at address %#x, off = %d\n",
+		pr_debug("erase sector at address %#x, off = %d\n",
 				ns->regs.row, NS_RAW_OFFSET(ns));
-		NS_LOG("erase sector %u\n", erase_block_no);
+		pr_debug("erase sector %u\n", erase_block_no);
 
 		ns->bops->erase_sector(ns);
 
@@ -2069,7 +2044,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			update_wear(ns, erase_block_no);
 
 		if (erase_error(ns, erase_block_no)) {
-			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
+			pr_warn("simulating erase failure in erase block %u\n", erase_block_no);
 			return -1;
 		}
 
@@ -2081,7 +2056,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		 */
 
 		if (ns->lines.wp) {
-			NS_WARN("do_state_action: device is write-protected, programm\n");
+			pr_warn("device is write-protected, program\n");
 			return -1;
 		}
 
@@ -2091,7 +2066,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
 
 		if (num != ns->regs.count) {
-			NS_ERR("do_state_action: too few bytes were input (%d instead of %d)\n",
+			pr_err("too few bytes were input (%d instead of %d)\n",
 					ns->regs.count, num);
 			return -1;
 		}
@@ -2101,42 +2076,42 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		page_no = ns->regs.row;
 
-		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
+		pr_debug("copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
-		NS_LOG("programm page %d\n", ns->regs.row);
+		pr_debug("program page %d\n", ns->regs.row);
 
 		NS_UDELAY(ns, ns->program_delay);
 		NS_UDELAY(ns, ns->output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
 		if (write_error(ns, page_no)) {
-			NS_WARN("simulating write failure in page %u\n", page_no);
+			pr_warn("simulating write failure in page %u\n", page_no);
 			return -1;
 		}
 
 		break;
 
 	case ACTION_ZEROOFF:
-		NS_DBG("do_state_action: set internal offset to 0\n");
+		pr_debug("set internal offset to 0\n");
 		ns->regs.off = 0;
 		break;
 
 	case ACTION_HALFOFF:
 		if (!(ns->options & OPT_PAGE512_8BIT)) {
-			NS_ERR("do_state_action: BUG! can't skip half of page for non-512"
+			pr_err("BUG! can't skip half of page for non-512"
 				"byte page size 8x chips\n");
 			return -1;
 		}
-		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz/2);
+		pr_debug("set internal offset to %d\n", ns->geom.pgsz/2);
 		ns->regs.off = ns->geom.pgsz/2;
 		break;
 
 	case ACTION_OOBOFF:
-		NS_DBG("do_state_action: set internal offset to %d\n", ns->geom.pgsz);
+		pr_debug("set internal offset to %d\n", ns->geom.pgsz);
 		ns->regs.off = ns->geom.pgsz;
 		break;
 
 	default:
-		NS_DBG("do_state_action: BUG! unknown action\n");
+		pr_err("BUG! unknown action\n");
 	}
 
 	return 0;
@@ -2157,7 +2132,7 @@ static void switch_state(struct nandsim *ns)
 		ns->state = ns->nxstate;
 		ns->nxstate = ns->op[ns->stateidx + 1];
 
-		NS_DBG("switch_state: operation is known, switch to the next state, "
+		pr_debug("operation is known, switch to the next state, "
 			"state: %s, nxstate: %s\n",
 			get_state_name(ns->state), get_state_name(ns->nxstate));
 
@@ -2179,7 +2154,7 @@ static void switch_state(struct nandsim *ns)
 		 */
 		ns->state = get_state_by_command(ns->regs.command);
 
-		NS_DBG("switch_state: operation is unknown, try to find it\n");
+		pr_debug("operation is unknown, try to find it\n");
 
 		if (find_operation(ns, 0) != 0)
 			return;
@@ -2192,7 +2167,7 @@ static void switch_state(struct nandsim *ns)
 
 	/* For 16x devices column means the page offset in words */
 	if ((ns->nxstate & STATE_ADDR_MASK) && ns->busw == 16) {
-		NS_DBG("switch_state: double the column number for 16x device\n");
+		pr_debug("double the column number for 16x device\n");
 		ns->regs.column <<= 1;
 	}
 
@@ -2206,12 +2181,12 @@ static void switch_state(struct nandsim *ns)
 		/* In case of data states, see if all bytes were input/output */
 		if ((ns->state & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK))
 			&& ns->regs.count != ns->regs.num) {
-			NS_WARN("switch_state: not all bytes were processed, %d left\n",
+			pr_warn("not all bytes were processed, %d left\n",
 					ns->regs.num - ns->regs.count);
 			status = NS_STATUS_FAILED(ns);
 		}
 
-		NS_DBG("switch_state: operation complete, switch to STATE_READY state\n");
+		pr_debug("operation complete, switch to STATE_READY state\n");
 
 		switch_to_ready_state(ns, status);
 
@@ -2225,7 +2200,7 @@ static void switch_state(struct nandsim *ns)
 		ns->nxstate    = ns->op[++ns->stateidx + 1];
 		ns->regs.num   = ns->regs.count = 0;
 
-		NS_DBG("switch_state: the next state is data I/O, switch, "
+		pr_debug("the next state is data I/O, switch, "
 			"state: %s, nxstate: %s\n",
 			get_state_name(ns->state), get_state_name(ns->nxstate));
 
@@ -2248,7 +2223,7 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			default:
-				NS_ERR("switch_state: BUG! unknown data state\n");
+				pr_err("BUG! unknown data state\n");
 		}
 
 	} else if (ns->nxstate & STATE_ADDR_MASK) {
@@ -2278,7 +2253,7 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			default:
-				NS_ERR("switch_state: BUG! unknown address state\n");
+				pr_err("BUG! unknown address state\n");
 		}
 	} else {
 		/*
@@ -2298,28 +2273,28 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
-		NS_ERR("read_byte: chip is disabled, return %#x\n", (uint)outb);
+		pr_err("chip is disabled, return %#x\n", (uint)outb);
 		return outb;
 	}
 	if (ns->lines.ale || ns->lines.cle) {
-		NS_ERR("read_byte: ALE or CLE pin is high, return %#x\n", (uint)outb);
+		pr_err("ALE or CLE pin is high, return %#x\n", (uint)outb);
 		return outb;
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
-		NS_WARN("read_byte: unexpected data output cycle, state is %s "
+		pr_warn("unexpected data output cycle, state is %s "
 			"return %#x\n", get_state_name(ns->state), (uint)outb);
 		return outb;
 	}
 
 	/* Status register may be read as many times as it is wanted */
 	if (NS_STATE(ns->state) == STATE_DATAOUT_STATUS) {
-		NS_DBG("read_byte: return %#x status\n", ns->regs.status);
+		pr_debug("return %#x status\n", ns->regs.status);
 		return ns->regs.status;
 	}
 
 	/* Check if there is any data in the internal buffer which may be read */
 	if (ns->regs.count == ns->regs.num) {
-		NS_WARN("read_byte: no more data to output, return %#x\n", (uint)outb);
+		pr_warn("no more data to output, return %#x\n", (uint)outb);
 		return outb;
 	}
 
@@ -2334,7 +2309,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 			}
 			break;
 		case STATE_DATAOUT_ID:
-			NS_DBG("read_byte: read ID byte %d, total = %d\n", ns->regs.count, ns->regs.num);
+			pr_debug("read ID byte %d, total = %d\n", ns->regs.count, ns->regs.num);
 			outb = ns->ids[ns->regs.count];
 			ns->regs.count += 1;
 			break;
@@ -2343,7 +2318,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 	}
 
 	if (ns->regs.count == ns->regs.num) {
-		NS_DBG("read_byte: all bytes were read\n");
+		pr_debug("all bytes were read\n");
 
 		if (NS_STATE(ns->nxstate) == STATE_READY)
 			switch_state(ns);
@@ -2359,11 +2334,11 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
-		NS_ERR("write_byte: chip is disabled, ignore write\n");
+		pr_err("chip is disabled, ignore write\n");
 		return;
 	}
 	if (ns->lines.ale && ns->lines.cle) {
-		NS_ERR("write_byte: ALE and CLE pins are high simultaneously, ignore write\n");
+		pr_err("ALE and CLE pins are high simultaneously, ignore write\n");
 		return;
 	}
 
@@ -2373,14 +2348,14 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 		 */
 
 		if (byte == NAND_CMD_RESET) {
-			NS_LOG("reset chip\n");
+			pr_debug("reset chip\n");
 			switch_to_ready_state(ns, NS_STATUS_OK(ns));
 			return;
 		}
 
 		/* Check that the command byte is correct */
 		if (check_command(byte)) {
-			NS_ERR("write_byte: unknown command %#x\n", (uint)byte);
+			pr_err("unknown command %#x\n", (uint)byte);
 			return;
 		}
 
@@ -2403,13 +2378,13 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 				 * was expected but command was input. In this case ignore
 				 * previous command(s)/state(s) and accept the last one.
 				 */
-				NS_WARN("write_byte: command (%#x) wasn't expected, expected state is %s, "
+				pr_warn("command (%#x) wasn't expected, expected state is %s, "
 					"ignore previous states\n", (uint)byte, get_state_name(ns->nxstate));
 			}
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		}
 
-		NS_DBG("command byte corresponding to %s state accepted\n",
+		pr_debug("command byte corresponding to %s state accepted\n",
 			get_state_name(get_state_by_command(byte)));
 		ns->regs.command = byte;
 		switch_state(ns);
@@ -2421,7 +2396,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		if (NS_STATE(ns->nxstate) == STATE_UNKNOWN) {
 
-			NS_DBG("write_byte: operation isn't known yet, identify it\n");
+			pr_debug("operation isn't known yet, identify it\n");
 
 			if (find_operation(ns, 1) < 0)
 				return;
@@ -2449,7 +2424,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check that chip is expecting address */
 		if (!(ns->nxstate & STATE_ADDR_MASK)) {
-			NS_ERR("write_byte: address (%#x) isn't expected, expected state is %s, "
+			pr_err("address (%#x) isn't expected, expected state is %s, "
 				"switch to STATE_READY\n", (uint)byte, get_state_name(ns->nxstate));
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
@@ -2457,7 +2432,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check if this is expected byte */
 		if (ns->regs.count == ns->regs.num) {
-			NS_ERR("write_byte: no more address bytes expected\n");
+			pr_err("no more address bytes expected\n");
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 			return;
 		}
@@ -2466,11 +2441,11 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		ns->regs.count += 1;
 
-		NS_DBG("write_byte: address byte %#x was accepted (%d bytes input, %d expected)\n",
+		pr_debug("address byte %#x was accepted (%d bytes input, %d expected)\n",
 				(uint)byte, ns->regs.count, ns->regs.num);
 
 		if (ns->regs.count == ns->regs.num) {
-			NS_DBG("address (%#x, %#x) is accepted\n", ns->regs.row, ns->regs.column);
+			pr_debug("address (%#x, %#x) is accepted\n", ns->regs.row, ns->regs.column);
 			switch_state(ns);
 		}
 
@@ -2481,7 +2456,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check that chip is expecting data input */
 		if (!(ns->state & STATE_DATAIN_MASK)) {
-			NS_ERR("write_byte: data input (%#x) isn't expected, state is %s, "
+			pr_err("data input (%#x) isn't expected, state is %s, "
 				"switch to %s\n", (uint)byte,
 				get_state_name(ns->state), get_state_name(STATE_READY));
 			switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
@@ -2490,7 +2465,7 @@ static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 
 		/* Check if this is expected byte */
 		if (ns->regs.count == ns->regs.num) {
-			NS_WARN("write_byte: %u input bytes has already been accepted, ignore write\n",
+			pr_warn("%u input bytes has already been accepted, ignore write\n",
 					ns->regs.num);
 			return;
 		}
@@ -2522,7 +2497,7 @@ static void ns_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int bitmask)
 
 static int ns_device_ready(struct mtd_info *mtd)
 {
-	NS_DBG("device_ready\n");
+	pr_debug("device_ready\n");
 	return 1;
 }
 
@@ -2530,7 +2505,7 @@ static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	NS_DBG("read_word\n");
+	pr_debug("read_word\n");
 
 	return chip->read_byte(mtd) | (chip->read_byte(mtd) << 8);
 }
@@ -2542,7 +2517,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 	/* Check that chip is expecting data input */
 	if (!(ns->state & STATE_DATAIN_MASK)) {
-		NS_ERR("write_buf: data input isn't expected, state is %s, "
+		pr_err("data input isn't expected, state is %s, "
 			"switch to STATE_READY\n", get_state_name(ns->state));
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
@@ -2550,7 +2525,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 
 	/* Check if these are expected bytes */
 	if (ns->regs.count + len > ns->regs.num) {
-		NS_ERR("write_buf: too many input bytes\n");
+		pr_err("too many input bytes\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
@@ -2559,7 +2534,7 @@ static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 	ns->regs.count += len;
 
 	if (ns->regs.count == ns->regs.num) {
-		NS_DBG("write_buf: %d bytes were written\n", ns->regs.count);
+		pr_debug("%d bytes were written\n", ns->regs.count);
 	}
 }
 
@@ -2570,15 +2545,15 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 	/* Sanity and correctness checks */
 	if (!ns->lines.ce) {
-		NS_ERR("read_buf: chip is disabled\n");
+		pr_err("chip is disabled\n");
 		return;
 	}
 	if (ns->lines.ale || ns->lines.cle) {
-		NS_ERR("read_buf: ALE or CLE pin is high\n");
+		pr_err("ALE or CLE pin is high\n");
 		return;
 	}
 	if (!(ns->state & STATE_DATAOUT_MASK)) {
-		NS_WARN("read_buf: unexpected data output cycle, current state is %s\n",
+		pr_warn("unexpected data output cycle, current state is %s\n",
 			get_state_name(ns->state));
 		return;
 	}
@@ -2594,7 +2569,7 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 
 	/* Check if these are expected bytes */
 	if (ns->regs.count + len > ns->regs.num) {
-		NS_ERR("read_buf: too many bytes to read\n");
+		pr_err("too many bytes to read\n");
 		switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
 		return;
 	}
@@ -2759,7 +2734,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	unsigned char *id_bytes = nsparam->id_bytes;
 
 	if (nsparam->bus_width != 8 && nsparam->bus_width != 16) {
-		NS_ERR("wrong bus width (%d), use only 8 or 16\n", nsparam->bus_width);
+		pr_err("wrong bus width (%d), use only 8 or 16\n", nsparam->bus_width);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -2767,7 +2742,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	chip = kzalloc(sizeof(struct nand_chip) + sizeof(struct nandsim),
 		       GFP_KERNEL);
 	if (!chip) {
-		NS_ERR("unable to allocate core structures.\n");
+		pr_err("unable to allocate core structures.\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -2778,7 +2753,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	}
 
 	if (i == NS_MAX_DEVICES) {
-		NS_ERR("Cannot allocate more than %i instances!\n", NS_MAX_DEVICES);
+		pr_err("Cannot allocate more than %i instances!\n", NS_MAX_DEVICES);
 		retval = -ENFILE;
 		mutex_unlock(&ns_mtd_mutex);
 		goto error;
@@ -2817,7 +2792,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	case 0:
 		break;
 	default:
-		NS_ERR("bbt has to be 0..2\n");
+		pr_err("bbt has to be 0..2\n");
 		retval = -EINVAL;
 		goto error;
 	}
@@ -2865,7 +2840,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 
 	retval = nand_scan_ident(nsmtd, 1, NULL);
 	if (retval) {
-		NS_ERR("cannot scan NAND Simulator device\n");
+		pr_err("cannot scan NAND Simulator device\n");
 		if (retval > 0)
 			retval = -ENXIO;
 		goto error;
@@ -2873,7 +2848,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 
 	if (nsparam->no_oob) {
 		if (nsparam->bch) {
-			NS_ERR("Cannot use ECC without OOB\n");
+			pr_err("Cannot use ECC without OOB\n");
 			retval = -EINVAL;
 			goto error;
 		}
@@ -2883,7 +2858,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	} else if (nsparam->bch) {
 		unsigned int eccsteps, eccbytes;
 		if (!mtd_nand_has_bch()) {
-			NS_ERR("BCH ECC support is disabled\n");
+			pr_err("BCH ECC support is disabled\n");
 			retval = -EINVAL;
 			goto error;
 		}
@@ -2892,12 +2867,12 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		eccbytes = (nsparam->bch * 13 + 7) / 8;
 		/* do not bother supporting small page devices */
 		if ((nsmtd->oobsize < 64) || !eccsteps) {
-			NS_ERR("bch not available on small page devices\n");
+			pr_err("bch not available on small page devices\n");
 			retval = -EINVAL;
 			goto error;
 		}
 		if ((eccbytes*eccsteps+2) > nsmtd->oobsize) {
-			NS_ERR("invalid bch value %u\n", nsparam->bch);
+			pr_err("invalid bch value %u\n", nsparam->bch);
 			retval = -EINVAL;
 			goto error;
 		}
@@ -2906,7 +2881,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		chip->ecc.size = 512;
 		chip->ecc.strength = nsparam->bch;
 		chip->ecc.bytes = eccbytes;
-		NS_INFO("using %u-bit/%u bytes BCH ECC\n", nsparam->bch, chip->ecc.size);
+		pr_info("using %u-bit/%u bytes BCH ECC\n", nsparam->bch, chip->ecc.size);
 	} else {
 		chip->ecc.mode = NAND_ECC_SOFT;
 		chip->ecc.algo = NAND_ECC_HAMMING;
@@ -2914,7 +2889,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 
 	retval = nand_scan_tail(nsmtd);
 	if (retval) {
-		NS_ERR("can't register NAND Simulator\n");
+		pr_err("can't register NAND Simulator\n");
 		if (retval > 0)
 			retval = -ENXIO;
 		goto error;
@@ -2923,7 +2898,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	if (nsparam->overridesize) {
 		uint64_t new_size = (uint64_t)nsmtd->erasesize << nsparam->overridesize;
 		if (new_size >> nsparam->overridesize != nsmtd->erasesize) {
-			NS_ERR("overridesize is too big\n");
+			pr_err("overridesize is too big\n");
 			retval = -EINVAL;
 			goto err_exit;
 		}
-- 
2.8.3
