Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyT-0004su-2h
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:22 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/46] mtd: nandsim: Don't printk on ENOMEM
Date: Wed, 31 Aug 2016 09:28:49 +0200
Message-Id: <20160831072853.27822-43-dwalter@sigma-star.at>
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

Memory allocation failures are tabu, we don't talk
about them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 0905451..34b0c24 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -579,7 +579,6 @@ static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	data->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
 	if (!data->pages) {
 		kfree(data);
-		pr_err("unable to allocate page array\n");
 		return -ENOMEM;
 	}
 	for (i = 0; i < ns->geom.pgnum; i++) {
@@ -591,7 +590,6 @@ static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	if (!data->nand_pages_slab) {
 		vfree(data->pages);
 		kfree(data);
-		pr_err("unable to create kmem_cache\n");
 		return -ENOMEM;
 	}
 
@@ -667,13 +665,11 @@ static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	data->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
 				    sizeof(unsigned long));
 	if (!data->pages_written) {
-		pr_err("unable to allocate pages written array\n");
 		err = -ENOMEM;
 		goto err_close;
 	}
 	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!data->file_buf) {
-		pr_err("unable to allocate file buf\n");
 		err = -ENOMEM;
 		goto err_free;
 	}
@@ -710,7 +706,6 @@ static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
 
 	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!data->file_buf) {
-		pr_err("unable to allocate file buf\n");
 		ret = -ENOMEM;
 		goto out_put;
 	}
@@ -881,7 +876,6 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
-			pr_err("unable to allocate memory.\n");
 			ret = -ENOMEM;
 			goto err_names;
 		}
@@ -899,7 +893,6 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
-			pr_err("unable to allocate memory.\n");
 			ret = -ENOMEM;
 			goto err_names;
 		}
@@ -933,8 +926,6 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!ns->buf.byte) {
-		pr_err("unable to allocate %u bytes for the internal buffer\n",
-			ns->geom.pgszoob);
 		ret = -ENOMEM;
 		goto err_buf;
 	}
@@ -1057,7 +1048,6 @@ static int parse_weakblocks(struct nandsim_params *nsparam,
 			w += 1;
 		wb = kzalloc(sizeof(*wb), GFP_KERNEL);
 		if (!wb) {
-			pr_err("unable to allocate memory.\n");
 			return -ENOMEM;
 		}
 		wb->erase_block_no = erase_block_no;
@@ -1114,10 +1104,9 @@ static int parse_weakpages(struct nandsim_params *nsparam,
 		if (*w == ',')
 			w += 1;
 		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
-		if (!wp) {
-			pr_err("unable to allocate memory.\n");
+		if (!wp)
 			return -ENOMEM;
-		}
+
 		wp->page_no = page_no;
 		wp->max_writes = max_writes;
 		list_add(&wp->list, nsparam->weak_pages);
@@ -1171,10 +1160,9 @@ static int parse_gravepages(struct nandsim_params *nsparam, unsigned char *grave
 		if (*g == ',')
 			g += 1;
 		gp = kzalloc(sizeof(*gp), GFP_KERNEL);
-		if (!gp) {
-			pr_err("unable to allocate memory.\n");
+		if (!gp)
 			return -ENOMEM;
-		}
+
 		gp->page_no = page_no;
 		gp->max_reads = max_reads;
 		list_add(&gp->list, nsparam->grave_pages);
@@ -1236,15 +1224,11 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 
 	ns->wear_eb_count = div_u64(mtd->size, mtd->erasesize);
 	mem = ns->wear_eb_count * sizeof(unsigned long);
-	if (mem / sizeof(unsigned long) != ns->wear_eb_count) {
-		pr_err("Too many erase blocks for wear reporting\n");
+	if (mem / sizeof(unsigned long) != ns->wear_eb_count)
 		return -ENOMEM;
-	}
 	ns->erase_block_wear = kzalloc(mem, GFP_KERNEL);
-	if (!ns->erase_block_wear) {
-		pr_err("Too many erase blocks for wear reporting\n");
+	if (!ns->erase_block_wear)
 		return -ENOMEM;
-	}
 	return 0;
 }
 
@@ -1886,10 +1870,9 @@ static int ns_ram_prog_page(struct nandsim *ns, int num)
 		 * again and deadlocks. This was seen in practice.
 		 */
 		mypage->byte = kmem_cache_alloc(data->nand_pages_slab, GFP_NOFS);
-		if (mypage->byte == NULL) {
-			pr_err("error allocating memory for page %d\n", ns->regs.row);
+		if (mypage->byte == NULL)
 			return -1;
-		}
+
 		memset(mypage->byte, 0xFF, ns->geom.pgszoob);
 	}
 
@@ -2990,10 +2973,8 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
 	chip = kzalloc(sizeof(struct nand_chip) + sizeof(struct nandsim),
 		       GFP_KERNEL);
-	if (!chip) {
-		pr_err("unable to allocate core structures.\n");
+	if (!chip)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	mutex_lock(&ns_mtd_mutex);
 	for (i = 0; i < NANDSIM_MAX_DEVICES; i++) {
-- 
2.8.3
