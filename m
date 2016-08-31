Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004sj-Pp
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:11 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/46] mtd: nandsim: Begin with removal of global state
Date: Wed, 31 Aug 2016 09:28:14 +0200
Message-Id: <20160831072853.27822-8-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

A first step to support multiple nandsim instances...
Remove global variables and put them into struct nandsim.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 115 ++++++++++++++++++++++++---------------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 0abbc88..c49999d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -373,6 +373,14 @@ struct nandsim {
 	struct page *held_pages[NS_MAX_HELD_PAGES];
 	int held_cnt;
 
+	struct list_head weak_blocks;
+	struct list_head weak_pages;
+	struct list_head grave_pages;
+
+	unsigned long *erase_block_wear;
+	unsigned int wear_eb_count;
+	unsigned long total_wear;
+
 	struct nandsim_debug_info dbg;
 };
 
@@ -426,8 +434,6 @@ struct weak_block {
 	unsigned int erases_done;
 };
 
-static LIST_HEAD(weak_blocks);
-
 struct weak_page {
 	struct list_head list;
 	unsigned int page_no;
@@ -435,8 +441,6 @@ struct weak_page {
 	unsigned int writes_done;
 };
 
-static LIST_HEAD(weak_pages);
-
 struct grave_page {
 	struct list_head list;
 	unsigned int page_no;
@@ -444,24 +448,19 @@ struct grave_page {
 	unsigned int reads_done;
 };
 
-static LIST_HEAD(grave_pages);
-
-static unsigned long *erase_block_wear = NULL;
-static unsigned int wear_eb_count = 0;
-static unsigned long total_wear = 0;
-
 /* MTD structure for NAND controller */
 static struct mtd_info *nsmtd;
 
 static int nandsim_debugfs_show(struct seq_file *m, void *private)
 {
+	struct nandsim *ns = (struct nandsim *)m->private;
 	unsigned long wmin = -1, wmax = 0, avg;
 	unsigned long deciles[10], decile_max[10], tot = 0;
 	unsigned int i;
 
 	/* Calc wear stats */
-	for (i = 0; i < wear_eb_count; ++i) {
-		unsigned long wear = erase_block_wear[i];
+	for (i = 0; i < ns->wear_eb_count; ++i) {
+		unsigned long wear = ns->erase_block_wear[i];
 		if (wear < wmin)
 			wmin = wear;
 		if (wear > wmax)
@@ -475,20 +474,20 @@ static int nandsim_debugfs_show(struct seq_file *m, void *private)
 	}
 	deciles[9] = 0;
 	decile_max[9] = wmax;
-	for (i = 0; i < wear_eb_count; ++i) {
+	for (i = 0; i < ns->wear_eb_count; ++i) {
 		int d;
-		unsigned long wear = erase_block_wear[i];
+		unsigned long wear = ns->erase_block_wear[i];
 		for (d = 0; d < 10; ++d)
 			if (wear <= decile_max[d]) {
 				deciles[d] += 1;
 				break;
 			}
 	}
-	avg = tot / wear_eb_count;
+	avg = tot / ns->wear_eb_count;
 
 	/* Output wear report */
 	seq_printf(m, "Total numbers of erases:  %lu\n", tot);
-	seq_printf(m, "Number of erase blocks:   %u\n", wear_eb_count);
+	seq_printf(m, "Number of erase blocks:   %u\n", ns->wear_eb_count);
 	seq_printf(m, "Average number of erases: %lu\n", avg);
 	seq_printf(m, "Maximum number of erases: %lu\n", wmax);
 	seq_printf(m, "Minimum number of erases: %lu\n", wmin);
@@ -843,7 +842,7 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 	return 0;
 }
 
-static int parse_weakblocks(void)
+static int parse_weakblocks(struct nandsim *ns)
 {
 	char *w;
 	int zero_ok;
@@ -875,16 +874,16 @@ static int parse_weakblocks(void)
 		}
 		wb->erase_block_no = erase_block_no;
 		wb->max_erases = max_erases;
-		list_add(&wb->list, &weak_blocks);
+		list_add(&wb->list, &ns->weak_blocks);
 	} while (*w);
 	return 0;
 }
 
-static int erase_error(unsigned int erase_block_no)
+static int erase_error(struct nandsim *ns, unsigned int erase_block_no)
 {
 	struct weak_block *wb;
 
-	list_for_each_entry(wb, &weak_blocks, list)
+	list_for_each_entry(wb, &ns->weak_blocks, list)
 		if (wb->erase_block_no == erase_block_no) {
 			if (wb->erases_done >= wb->max_erases)
 				return 1;
@@ -894,7 +893,7 @@ static int erase_error(unsigned int erase_block_no)
 	return 0;
 }
 
-static int parse_weakpages(void)
+static int parse_weakpages(struct nandsim *ns)
 {
 	char *w;
 	int zero_ok;
@@ -926,16 +925,16 @@ static int parse_weakpages(void)
 		}
 		wp->page_no = page_no;
 		wp->max_writes = max_writes;
-		list_add(&wp->list, &weak_pages);
+		list_add(&wp->list, &ns->weak_pages);
 	} while (*w);
 	return 0;
 }
 
-static int write_error(unsigned int page_no)
+static int write_error(struct nandsim *ns, unsigned int page_no)
 {
 	struct weak_page *wp;
 
-	list_for_each_entry(wp, &weak_pages, list)
+	list_for_each_entry(wp, &ns->weak_pages, list)
 		if (wp->page_no == page_no) {
 			if (wp->writes_done >= wp->max_writes)
 				return 1;
@@ -945,7 +944,7 @@ static int write_error(unsigned int page_no)
 	return 0;
 }
 
-static int parse_gravepages(void)
+static int parse_gravepages(struct nandsim *ns)
 {
 	char *g;
 	int zero_ok;
@@ -977,16 +976,16 @@ static int parse_gravepages(void)
 		}
 		gp->page_no = page_no;
 		gp->max_reads = max_reads;
-		list_add(&gp->list, &grave_pages);
+		list_add(&gp->list, &ns->grave_pages);
 	} while (*g);
 	return 0;
 }
 
-static int read_error(unsigned int page_no)
+static int read_error(struct nandsim *ns, unsigned int page_no)
 {
 	struct grave_page *gp;
 
-	list_for_each_entry(gp, &grave_pages, list)
+	list_for_each_entry(gp, &ns->grave_pages, list)
 		if (gp->page_no == page_no) {
 			if (gp->reads_done >= gp->max_reads)
 				return 1;
@@ -996,55 +995,57 @@ static int read_error(unsigned int page_no)
 	return 0;
 }
 
-static void free_lists(void)
+static void free_lists(struct nandsim *ns)
 {
 	struct list_head *pos, *n;
-	list_for_each_safe(pos, n, &weak_blocks) {
+	list_for_each_safe(pos, n, &ns->weak_blocks) {
 		list_del(pos);
 		kfree(list_entry(pos, struct weak_block, list));
 	}
-	list_for_each_safe(pos, n, &weak_pages) {
+	list_for_each_safe(pos, n, &ns->weak_pages) {
 		list_del(pos);
 		kfree(list_entry(pos, struct weak_page, list));
 	}
-	list_for_each_safe(pos, n, &grave_pages) {
+	list_for_each_safe(pos, n, &ns->grave_pages) {
 		list_del(pos);
 		kfree(list_entry(pos, struct grave_page, list));
 	}
-	kfree(erase_block_wear);
+	kfree(ns->erase_block_wear);
 }
 
 static int setup_wear_reporting(struct mtd_info *mtd)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
 	size_t mem;
 
-	wear_eb_count = div_u64(mtd->size, mtd->erasesize);
-	mem = wear_eb_count * sizeof(unsigned long);
-	if (mem / sizeof(unsigned long) != wear_eb_count) {
+	ns->wear_eb_count = div_u64(mtd->size, mtd->erasesize);
+	mem = ns->wear_eb_count * sizeof(unsigned long);
+	if (mem / sizeof(unsigned long) != ns->wear_eb_count) {
 		NS_ERR("Too many erase blocks for wear reporting\n");
 		return -ENOMEM;
 	}
-	erase_block_wear = kzalloc(mem, GFP_KERNEL);
-	if (!erase_block_wear) {
+	ns->erase_block_wear = kzalloc(mem, GFP_KERNEL);
+	if (!ns->erase_block_wear) {
 		NS_ERR("Too many erase blocks for wear reporting\n");
 		return -ENOMEM;
 	}
 	return 0;
 }
 
-static void update_wear(unsigned int erase_block_no)
+static void update_wear(struct nandsim *ns, unsigned int erase_block_no)
 {
-	if (!erase_block_wear)
+	if (!ns->erase_block_wear)
 		return;
-	total_wear += 1;
+	ns->total_wear += 1;
 	/*
 	 * TODO: Notify this through a debugfs entry,
 	 * instead of showing an error message.
 	 */
-	if (total_wear == 0)
+	if (ns->total_wear == 0)
 		NS_ERR("Erase counter total overflow\n");
-	erase_block_wear[erase_block_no] += 1;
-	if (erase_block_wear[erase_block_no] == 0)
+	ns->erase_block_wear[erase_block_no] += 1;
+	if (ns->erase_block_wear[erase_block_no] == 0)
 		NS_ERR("Erase counter overflow for erase block %u\n", erase_block_no);
 }
 
@@ -1440,7 +1441,7 @@ static int do_read_error(struct nandsim *ns, int num)
 {
 	unsigned int page_no = ns->regs.row;
 
-	if (read_error(page_no)) {
+	if (read_error(ns, page_no)) {
 		prandom_bytes(ns->buf.byte, num);
 		NS_WARN("simulating read error in page %u\n", page_no);
 		return 1;
@@ -1688,10 +1689,10 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 
 		NS_MDELAY(erase_delay);
 
-		if (erase_block_wear)
-			update_wear(erase_block_no);
+		if (ns->erase_block_wear)
+			update_wear(ns, erase_block_no);
 
-		if (erase_error(erase_block_no)) {
+		if (erase_error(ns, erase_block_no)) {
 			NS_WARN("simulating erase failure in erase block %u\n", erase_block_no);
 			return -1;
 		}
@@ -1727,7 +1728,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 		NS_UDELAY(programm_delay);
 		NS_UDELAY(output_cycle * ns->geom.pgsz / 1000 / busdiv);
 
-		if (write_error(page_no)) {
+		if (write_error(ns, page_no)) {
 			NS_WARN("simulating write failure in page %u\n", page_no);
 			return -1;
 		}
@@ -2281,10 +2282,16 @@ static int __init ns_init_default(void)
 		NS_ERR("unable to allocate core structures.\n");
 		return -ENOMEM;
 	}
+
 	nsmtd       = nand_to_mtd(chip);
 	nand        = (struct nandsim *)(chip + 1);
 	nand_set_controller_data(chip, (void *)nand);
 
+	INIT_LIST_HEAD(&nand->weak_blocks);
+	INIT_LIST_HEAD(&nand->grave_pages);
+	INIT_LIST_HEAD(&nand->weak_pages);
+	INIT_LIST_HEAD(&nand->weak_blocks);
+
 	/*
 	 * Register simulator's callbacks.
 	 */
@@ -2335,13 +2342,13 @@ static int __init ns_init_default(void)
 
 	nsmtd->owner = THIS_MODULE;
 
-	if ((retval = parse_weakblocks()) != 0)
+	if ((retval = parse_weakblocks(nand)) != 0)
 		goto error;
 
-	if ((retval = parse_weakpages()) != 0)
+	if ((retval = parse_weakpages(nand)) != 0)
 		goto error;
 
-	if ((retval = parse_gravepages()) != 0)
+	if ((retval = parse_gravepages(nand)) != 0)
 		goto error;
 
 	retval = nand_scan_ident(nsmtd, 1, NULL);
@@ -2432,8 +2439,8 @@ err_exit:
 	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
 		kfree(nand->partitions[i].name);
 error:
+	free_lists(nand);
 	kfree(chip);
-	free_lists();
 
 	return retval;
 }
@@ -2445,12 +2452,12 @@ static void __exit ns_cleanup_default(void)
 	int i;
 
 	nandsim_debugfs_remove(ns);
+	free_lists(ns);
 	free_nandsim(ns);    /* Free nandsim private resources */
 	nand_release(nsmtd); /* Unregister driver */
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
 	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
-	free_lists();
 }
 
 static int __init ns_init_module(void)
-- 
2.8.3
