Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyR-0004st-ET
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:26 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 41/46] mtd: nandsim: Expose support for weakpages/blocks to
 userspace
Date: Wed, 31 Aug 2016 09:28:48 +0200
Message-Id: <20160831072853.27822-42-dwalter@sigma-star.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 338 ++++++++++++++++++++++++++++++++++++--------
 include/linux/mtd/nandsim.h |   7 +-
 2 files changed, 285 insertions(+), 60 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 222b2b8..0905451 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -322,9 +322,9 @@ struct nandsim {
 	struct ns_backend_ops *bops;
 	void *backend_data;
 
-	struct list_head weak_blocks;
-	struct list_head weak_pages;
-	struct list_head grave_pages;
+	struct list_head *weak_blocks;
+	struct list_head *weak_pages;
+	struct list_head *grave_pages;
 
 	unsigned long *erase_block_wear;
 	unsigned int wear_eb_count;
@@ -387,6 +387,11 @@ static struct nandsim_operations {
 			       STATE_DATAOUT, STATE_READY}},
 };
 
+struct bad_block {
+	struct list_head list;
+	unsigned int erase_block_no;
+};
+
 struct weak_block {
 	struct list_head list;
 	unsigned int erase_block_no;
@@ -957,16 +962,46 @@ static void free_nandsim(struct nandsim *ns)
 	kfree(ns->buf.byte);
 }
 
-static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
+static int process_badblocks(struct nandsim_params *nsparam, struct nandsim *ns)
+{
+	loff_t offset;
+	struct bad_block *bb, *_bb;
+	struct mtd_info *nsmtd = ns_to_mtd(ns);
+
+	if (!nsparam->bad_blocks)
+		return 0;
+
+	list_for_each_entry_safe(bb, _bb, nsparam->bad_blocks, list) {
+		offset = (loff_t)bb->erase_block_no * ns->geom.secsz;
+		if (mtd_block_markbad(nsmtd, offset))
+			pr_err("invalid badblocks: %i:\n", bb->erase_block_no);
+
+		list_del(&bb->list);
+		kfree(bb);
+	}
+
+	kfree(nsparam->bad_blocks);
+	nsparam->bad_blocks = NULL;
+
+	return 0;
+}
+
+static int parse_badblocks(struct nandsim_params *nsparam,
 			   unsigned char *badblocks)
 {
 	char *w;
 	int zero_ok;
 	unsigned int erase_block_no;
-	loff_t offset;
+	struct bad_block *bb;
+
+	nsparam->bad_blocks = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	if (!nsparam->bad_blocks)
+		return -ENOMEM;
 
+	INIT_LIST_HEAD(nsparam->bad_blocks);
 	if (!badblocks)
 		return 0;
+
 	w = badblocks;
 	do {
 		zero_ok = (*w == '0' ? 1 : 0);
@@ -975,18 +1010,21 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
 			pr_err("invalid badblocks.\n");
 			return -EINVAL;
 		}
-		offset = (loff_t)erase_block_no * ns->geom.secsz;
-		if (mtd_block_markbad(mtd, offset)) {
-			pr_err("invalid badblocks.\n");
-			return -EINVAL;
-		}
+		bb = kzalloc(sizeof(*bb), GFP_KERNEL);
+		if (!bb)
+			return -ENOMEM;
+
+		bb->erase_block_no = erase_block_no;
+		list_add(&bb->list, nsparam->bad_blocks);
+
 		if (*w == ',')
 			w += 1;
 	} while (*w);
 	return 0;
 }
 
-static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
+static int parse_weakblocks(struct nandsim_params *nsparam,
+			    unsigned char *weakblocks)
 {
 	char *w;
 	int zero_ok;
@@ -994,8 +1032,14 @@ static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
 	unsigned int max_erases;
 	struct weak_block *wb;
 
+	nsparam->weak_blocks = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	if (!nsparam->weak_blocks)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(nsparam->weak_blocks);
 	if (!weakblocks)
 		return 0;
+
 	w = weakblocks;
 	do {
 		zero_ok = (*w == '0' ? 1 : 0);
@@ -1018,7 +1062,7 @@ static int parse_weakblocks(struct nandsim *ns, unsigned char *weakblocks)
 		}
 		wb->erase_block_no = erase_block_no;
 		wb->max_erases = max_erases;
-		list_add(&wb->list, &ns->weak_blocks);
+		list_add(&wb->list, nsparam->weak_blocks);
 	} while (*w);
 	return 0;
 }
@@ -1027,7 +1071,7 @@ static int erase_error(struct nandsim *ns, unsigned int erase_block_no)
 {
 	struct weak_block *wb;
 
-	list_for_each_entry(wb, &ns->weak_blocks, list)
+	list_for_each_entry(wb, ns->weak_blocks, list)
 		if (wb->erase_block_no == erase_block_no) {
 			if (wb->erases_done >= wb->max_erases)
 				return 1;
@@ -1037,7 +1081,8 @@ static int erase_error(struct nandsim *ns, unsigned int erase_block_no)
 	return 0;
 }
 
-static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
+static int parse_weakpages(struct nandsim_params *nsparam,
+			   unsigned char *weakpages)
 {
 	char *w;
 	int zero_ok;
@@ -1045,8 +1090,14 @@ static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
 	unsigned int max_writes;
 	struct weak_page *wp;
 
+	nsparam->weak_pages = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	if (!nsparam->weak_pages)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(nsparam->weak_pages);
 	if (!weakpages)
 		return 0;
+
 	w = weakpages;
 	do {
 		zero_ok = (*w == '0' ? 1 : 0);
@@ -1069,7 +1120,7 @@ static int parse_weakpages(struct nandsim *ns, unsigned char *weakpages)
 		}
 		wp->page_no = page_no;
 		wp->max_writes = max_writes;
-		list_add(&wp->list, &ns->weak_pages);
+		list_add(&wp->list, nsparam->weak_pages);
 	} while (*w);
 	return 0;
 }
@@ -1078,7 +1129,7 @@ static int write_error(struct nandsim *ns, unsigned int page_no)
 {
 	struct weak_page *wp;
 
-	list_for_each_entry(wp, &ns->weak_pages, list)
+	list_for_each_entry(wp, ns->weak_pages, list)
 		if (wp->page_no == page_no) {
 			if (wp->writes_done >= wp->max_writes)
 				return 1;
@@ -1088,7 +1139,7 @@ static int write_error(struct nandsim *ns, unsigned int page_no)
 	return 0;
 }
 
-static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
+static int parse_gravepages(struct nandsim_params *nsparam, unsigned char *gravepages)
 {
 	char *g;
 	int zero_ok;
@@ -1096,8 +1147,14 @@ static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
 	unsigned int max_reads;
 	struct grave_page *gp;
 
+	nsparam->grave_pages = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	if (!nsparam->grave_pages)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(nsparam->grave_pages);
 	if (!gravepages)
 		return 0;
+
 	g = gravepages;
 	do {
 		zero_ok = (*g == '0' ? 1 : 0);
@@ -1120,7 +1177,7 @@ static int parse_gravepages(struct nandsim *ns, unsigned char *gravepages)
 		}
 		gp->page_no = page_no;
 		gp->max_reads = max_reads;
-		list_add(&gp->list, &ns->grave_pages);
+		list_add(&gp->list, nsparam->grave_pages);
 	} while (*g);
 	return 0;
 }
@@ -1129,7 +1186,7 @@ static int read_error(struct nandsim *ns, unsigned int page_no)
 {
 	struct grave_page *gp;
 
-	list_for_each_entry(gp, &ns->grave_pages, list)
+	list_for_each_entry(gp, ns->grave_pages, list)
 		if (gp->page_no == page_no) {
 			if (gp->reads_done >= gp->max_reads)
 				return 1;
@@ -1142,17 +1199,31 @@ static int read_error(struct nandsim *ns, unsigned int page_no)
 static void free_lists(struct nandsim *ns)
 {
 	struct list_head *pos, *n;
-	list_for_each_safe(pos, n, &ns->weak_blocks) {
-		list_del(pos);
-		kfree(list_entry(pos, struct weak_block, list));
+
+	if (ns->weak_blocks) {
+		list_for_each_safe(pos, n, ns->weak_blocks) {
+			list_del(pos);
+			kfree(list_entry(pos, struct weak_block, list));
+		}
+
+		kfree(ns->weak_blocks);
+		ns->weak_blocks = NULL;
 	}
-	list_for_each_safe(pos, n, &ns->weak_pages) {
-		list_del(pos);
-		kfree(list_entry(pos, struct weak_page, list));
+	if (ns->weak_pages) {
+		list_for_each_safe(pos, n, ns->weak_pages) {
+			list_del(pos);
+			kfree(list_entry(pos, struct weak_page, list));
+		}
+		kfree(ns->weak_pages);
+		ns->weak_pages = NULL;
 	}
-	list_for_each_safe(pos, n, &ns->grave_pages) {
-		list_del(pos);
-		kfree(list_entry(pos, struct grave_page, list));
+	if (ns->grave_pages) {
+		list_for_each_safe(pos, n, ns->grave_pages) {
+			list_del(pos);
+			kfree(list_entry(pos, struct grave_page, list));
+		}
+		kfree(ns->grave_pages);
+		ns->grave_pages = NULL;
 	}
 	kfree(ns->erase_block_wear);
 }
@@ -2579,8 +2650,122 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
-static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
+static void destroy_nsparam_lists(struct nandsim_params *nsparam)
+{
+	struct list_head *pos, *n;
+
+	if (nsparam->bad_blocks) {
+		list_for_each_safe(pos, n, nsparam->bad_blocks) {
+			list_del(pos);
+			kfree(list_entry(pos, struct bad_block, list));
+		}
+	}
+
+	if (nsparam->weak_blocks) {
+		list_for_each_safe(pos, n, nsparam->weak_blocks) {
+			list_del(pos);
+			kfree(list_entry(pos, struct weak_block, list));
+		}
+	}
+
+	if (nsparam->weak_pages) {
+		list_for_each_safe(pos, n, nsparam->weak_pages) {
+			list_del(pos);
+			kfree(list_entry(pos, struct weak_page, list));
+		}
+	}
+
+	if (nsparam->grave_pages) {
+		list_for_each_safe(pos, n, nsparam->grave_pages) {
+			list_del(pos);
+			kfree(list_entry(pos, struct grave_page, list));
+		}
+	}
+
+	kfree(nsparam->bad_blocks);
+	kfree(nsparam->weak_blocks);
+	kfree(nsparam->weak_pages);
+	kfree(nsparam->grave_pages);
+}
+
+static int process_element_params(struct nandsim_params *nsparam, int num,
+				  void __user *elem_argp)
+{
+	int i, err;
+	struct ns_simelement_prop sep;
+
+	for (i = 0; i < num; i++) {
+		err = copy_from_user(&sep, elem_argp + (i * sizeof(sep)),
+				     sizeof(sep));
+		if (err)
+			goto out_err;
+
+		err = -ENOMEM;
+
+		switch (sep.elem_type) {
+		case NANDSIM_SIMELEM_BADBLOCK:
+		{
+			struct bad_block *bb = kzalloc(sizeof(*bb), GFP_KERNEL);
+
+			if (!bb)
+				goto out_err;
+
+			bb->erase_block_no = sep.elem_id;
+			list_add(&bb->list, nsparam->bad_blocks);
+		}
+		break;
+		case NANDSIM_SIMELEM_WEAKBLOCK:
+		{
+			struct weak_block *wb = kzalloc(sizeof(*wb), GFP_KERNEL);
+
+			if (!wb)
+				goto out_err;
+
+			wb->erase_block_no = sep.elem_id;
+			wb->max_erases = sep.elem_attr;
+			list_add(&wb->list, nsparam->weak_blocks);
+		}
+		break;
+		case NANDSIM_SIMELEM_WEAKPAGE:
+		{
+			struct weak_page *wp = kzalloc(sizeof(*wp), GFP_KERNEL);
+
+			if (!wp)
+				goto out_err;
+
+			wp->page_no = sep.elem_id;
+			wp->max_writes = sep.elem_attr;
+			list_add(&wp->list, nsparam->weak_pages);
+		}
+		break;
+		case NANDSIM_SIMELEM_GRAVEPAGE:
+		{
+			struct grave_page *gp = kzalloc(sizeof(*gp), GFP_KERNEL);
+
+			if (!gp)
+				goto out_err;
+
+			gp->page_no = sep.elem_id;
+			gp->max_reads = sep.elem_attr;
+			list_add(&gp->list, nsparam->grave_pages);
+		}
+		break;
+		default:
+			err = -EINVAL;
+			goto out_err;
+		}
+	}
+
+	return 0;
+
+out_err:
+	destroy_nsparam_lists(nsparam);
+	return err;
+}
+
+static int ns_ctrl_new_instance(struct ns_new_instance_req *req, void __user *elem_argp)
 {
+	int ret = -EINVAL;
 	struct mtd_info *nsmtd;
 	struct nand_chip *chip;
 	struct nandsim *ns;
@@ -2599,20 +2784,20 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	nsparam->overridesize = req->overridesize;
 
 	if (req->bch_strength && req->no_oob)
-		goto err_inval;
+		goto err;
 
 	if (req->access_delay && req->program_delay && req->erase_delay &&
 	    req->output_cycle && req->input_cycle) {
 		if (req->access_delay > MAX_UDELAY_MS * 1000)
-			goto err_inval;
+			goto err;
 		if (req->program_delay > MAX_UDELAY_MS * 1000)
-			goto err_inval;
+			goto err;
 		if (req->erase_delay > 1000)
-			goto err_inval;
+			goto err;
 		if (req->output_cycle > MAX_UDELAY_MS * 1000)
-			goto err_inval;
+			goto err;
 		if (req->input_cycle > MAX_UDELAY_MS * 1000)
-			goto err_inval;
+			goto err;
 
 		nsparam->access_delay = req->access_delay;
 		nsparam->program_delay = req->program_delay;
@@ -2623,7 +2808,7 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	}
 
 	if (req->parts_num > NANDSIM_MAX_PARTS || req->parts_num < 0)
-		goto err_inval;
+		goto err;
 
 	if (req->parts_num > 0) {
 		nsparam->parts_num = req->parts_num;
@@ -2644,7 +2829,37 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 		break;
 
 		default:
-			goto err_inval;
+			goto err;
+	}
+
+	nsparam->bad_blocks = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	nsparam->weak_blocks = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	nsparam->weak_pages = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+	nsparam->grave_pages = kmalloc(sizeof(struct list_head), GFP_KERNEL);
+
+	if (!nsparam->bad_blocks || !nsparam->weak_blocks ||
+	    !nsparam->weak_pages || !nsparam->grave_pages) {
+		kfree(nsparam->bad_blocks);
+		kfree(nsparam->weak_blocks);
+		kfree(nsparam->weak_pages);
+		kfree(nsparam->grave_pages);
+
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	INIT_LIST_HEAD(nsparam->bad_blocks);
+	INIT_LIST_HEAD(nsparam->weak_blocks);
+	INIT_LIST_HEAD(nsparam->weak_pages);
+	INIT_LIST_HEAD(nsparam->grave_pages);
+
+	if (req->simelem_num > 0) {
+		if (req->simelem_num > 1000)
+			goto err;
+
+		ret = process_element_params(nsparam, req->simelem_num, elem_argp);
+		if (ret)
+			goto err;
 	}
 
 	nsmtd = ns_new_instance(nsparam);
@@ -2658,9 +2873,10 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 
 	return ns->index;
 
-err_inval:
+err:
+	destroy_nsparam_lists(nsparam);
 	kfree(nsparam);
-	return -EINVAL;
+	return ret;
 }
 
 static int ns_ctrl_destroy_instance(struct ns_destroy_instance_req *req)
@@ -2798,10 +3014,6 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	nand->index = i;
 	mutex_unlock(&ns_mtd_mutex);
 
-	INIT_LIST_HEAD(&nand->weak_blocks);
-	INIT_LIST_HEAD(&nand->grave_pages);
-	INIT_LIST_HEAD(&nand->weak_pages);
-	INIT_LIST_HEAD(&nand->weak_blocks);
 	spin_lock_init(&nand->refcnt_lock);
 
 	/*
@@ -2854,14 +3066,9 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	nsmtd->_get_device = ns_get_device;
 	nsmtd->_put_device = ns_put_device;
 
-	if ((retval = parse_weakblocks(nand, nsparam->weakblocks)) != 0)
-		goto err_lists;
-
-	if ((retval = parse_weakpages(nand, nsparam->weakpages)) != 0)
-		goto err_lists;
-
-	if ((retval = parse_gravepages(nand, nsparam->gravepages)) != 0)
-		goto err_lists;
+	nand->weak_blocks = nsparam->weak_blocks;
+	nand->weak_pages = nsparam->weak_pages;
+	nand->grave_pages = nsparam->grave_pages;
 
 	nand->do_delays = nsparam->do_delays;
 	nand->access_delay = nsparam->access_delay;
@@ -2960,7 +3167,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	if ((retval = chip->scan_bbt(nsmtd)) != 0)
 		goto err_nandsim;
 
-	if ((retval = parse_badblocks(nand, nsmtd, nsparam->badblocks)) != 0)
+	if ((retval = process_badblocks(nsparam, nand)) != 0)
 		goto err_nandsim;
 
 	/* Register NAND partitions */
@@ -3021,6 +3228,7 @@ static void ns_destroy_all(void)
 
 static int __init ns_init_default(void)
 {
+	int ret;
 	struct mtd_info *nsmtd;
 	struct nandsim_params *nsparam = kzalloc(sizeof(*nsparam), GFP_KERNEL);
 
@@ -3036,11 +3244,6 @@ static int __init ns_init_default(void)
 	nsparam->do_delays = do_delays;
 	memcpy(nsparam->parts, parts, sizeof(nsparam->parts));
 	nsparam->parts_num = parts_num;
-	nsparam->badblocks = badblocks;
-	nsparam->weakblocks = weakblocks;
-	nsparam->weakpages = weakpages;
-	nsparam->bitflips = bitflips;
-	nsparam->gravepages = gravepages;
 	nsparam->overridesize = overridesize;
 	nsparam->cache_file = cache_file;
 	nsparam->bbt = bbt;
@@ -3052,6 +3255,22 @@ static int __init ns_init_default(void)
 	else
 		nsparam->bops = &ns_cachefile_bops;
 
+	ret = parse_badblocks(nsparam, badblocks);
+	if (ret)
+		goto err_lists;
+
+	ret = parse_weakblocks(nsparam, weakblocks);
+	if (ret)
+		goto err_lists;
+
+	ret = parse_weakpages(nsparam, weakpages);
+	if (ret)
+		goto err_lists;
+
+	ret = parse_gravepages(nsparam, gravepages);
+	if (ret)
+		goto err_lists;
+
 	nsmtd = ns_new_instance(nsparam);
 	kfree(nsparam);
 
@@ -3059,6 +3278,11 @@ static int __init ns_init_default(void)
 		return PTR_ERR(nsmtd);
 
 	return 0;
+
+err_lists:
+	destroy_nsparam_lists(nsparam);
+	kfree(nsparam);
+	return ret;
 }
 
 static int __init ns_init_module(void)
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 880c0b1..702e49d 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -14,9 +14,10 @@ struct nandsim_params {
 	bool do_delays;
 	unsigned int parts[NANDSIM_MAX_PARTS];
 	unsigned int parts_num;
-	char *badblocks;
-	char *weakblocks;
-	char *weakpages;
+	struct list_head *bad_blocks;
+	struct list_head *weak_blocks;
+	struct list_head *weak_pages;
+	struct list_head *grave_pages;
 	unsigned int bitflips;
 	char *gravepages;
 	unsigned int overridesize;
-- 
2.8.3
