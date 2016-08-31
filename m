Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyD-0004st-Iy
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:15 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/46] mtd: nandsim: Introduce backend operations
Date: Wed, 31 Aug 2016 09:28:22 +0200
Message-Id: <20160831072853.27822-16-dwalter@sigma-star.at>
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

...to untangle the ram based and cachefile based
code.
It will help us later supporting different backends.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 400 ++++++++++++++++++++++++++-------------------
 1 file changed, 228 insertions(+), 172 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 2e02089..633872a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -314,6 +314,7 @@ struct nandsim_params {
 	unsigned int bbt;
 	unsigned int bch;
 	unsigned char *id_bytes;
+	struct ns_backend_ops *bops;
 };
 
 struct nandsim_debug_info {
@@ -329,6 +330,22 @@ union ns_mem {
 	uint16_t *word;  /* for 16-bit word access */
 };
 
+struct ns_ram_data {
+	/* The simulated NAND flash pages array */
+	union ns_mem *pages;
+
+	/* Slab allocator for nand pages */
+	struct kmem_cache *nand_pages_slab;
+};
+
+struct ns_cachefile_data {
+	struct file *cfile; /* Open file */
+	unsigned long *pages_written; /* Which pages have been written */
+	void *file_buf;
+	struct page *held_pages[NS_MAX_HELD_PAGES];
+	int held_cnt;
+};
+
 /*
  * The structure which describes all the internal simulator data.
  */
@@ -348,12 +365,6 @@ struct nandsim {
 	uint16_t npstates;      /* number of previous states saved */
 	uint16_t stateidx;      /* current state index */
 
-	/* The simulated NAND flash pages array */
-	union ns_mem *pages;
-
-	/* Slab allocator for nand pages */
-	struct kmem_cache *nand_pages_slab;
-
 	/* Internal buffer of page + OOB size bytes */
 	union ns_mem buf;
 
@@ -394,12 +405,8 @@ struct nandsim {
                 int wp;  /* write Protect */
         } lines;
 
-	/* Fields needed when using a cache file */
-	struct file *cfile; /* Open file */
-	unsigned long *pages_written; /* Which pages have been written */
-	void *file_buf;
-	struct page *held_pages[NS_MAX_HELD_PAGES];
-	int held_cnt;
+	struct ns_backend_ops *bops;
+	void *backend_data;
 
 	struct list_head weak_blocks;
 	struct list_head weak_pages;
@@ -420,6 +427,17 @@ struct nandsim {
 	struct nandsim_debug_info dbg;
 };
 
+struct ns_backend_ops {
+	void (*erase_sector)(struct nandsim *ns);
+	int (*prog_page)(struct nandsim *ns, int num);
+	void (*read_page)(struct nandsim *ns, int num);
+	int (*init)(struct nandsim *ns, struct nandsim_params *nsparam);
+	void (*destroy)(struct nandsim *ns);
+};
+
+static struct ns_backend_ops ns_ram_bops;
+static struct ns_backend_ops ns_cachefile_bops;
+
 /*
  * Operations array. To perform any operation the simulator must pass
  * through the correspondent states chain.
@@ -641,95 +659,105 @@ static void nandsim_debugfs_remove(struct nandsim *ns)
 		debugfs_remove_recursive(ns->dbg.dfs_root);
 }
 
-/*
- * Allocate array of page pointers, create slab allocation for an array
- * and initialize the array by NULL pointers.
- *
- * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
- */
-static int alloc_device(struct nandsim *ns, struct nandsim_params *nsparam)
+static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 {
-	struct file *cfile;
-	int i, err;
-
-	if (nsparam->cache_file) {
-		cfile = filp_open(nsparam->cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
-		if (IS_ERR(cfile))
-			return PTR_ERR(cfile);
-		if (!(cfile->f_mode & FMODE_CAN_READ)) {
-			NS_ERR("alloc_device: cache file not readable\n");
-			err = -EINVAL;
-			goto err_close;
-		}
-		if (!(cfile->f_mode & FMODE_CAN_WRITE)) {
-			NS_ERR("alloc_device: cache file not writeable\n");
-			err = -EINVAL;
-			goto err_close;
-		}
-		ns->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
-					    sizeof(unsigned long));
-		if (!ns->pages_written) {
-			NS_ERR("alloc_device: unable to allocate pages written array\n");
-			err = -ENOMEM;
-			goto err_close;
-		}
-		ns->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
-		if (!ns->file_buf) {
-			NS_ERR("alloc_device: unable to allocate file buf\n");
-			err = -ENOMEM;
-			goto err_free;
-		}
-		ns->cfile = cfile;
-		return 0;
-	}
+	int i;
+	struct ns_ram_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
 
-	ns->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
-	if (!ns->pages) {
+	if (!data)
+		return -ENOMEM;
+
+	data->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
+	if (!data->pages) {
+		kfree(data);
 		NS_ERR("alloc_device: unable to allocate page array\n");
 		return -ENOMEM;
 	}
 	for (i = 0; i < ns->geom.pgnum; i++) {
-		ns->pages[i].byte = NULL;
+		data->pages[i].byte = NULL;
 	}
-	ns->nand_pages_slab = kmem_cache_create("nandsim",
+
+	data->nand_pages_slab = kmem_cache_create("nandsim",
 						ns->geom.pgszoob, 0, 0, NULL);
-	if (!ns->nand_pages_slab) {
+	if (!data->nand_pages_slab) {
+		vfree(data->pages);
+		kfree(data);
 		NS_ERR("cache_create: unable to create kmem_cache\n");
 		return -ENOMEM;
 	}
 
+	ns->backend_data = data;
+
+	return 0;
+}
+
+static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
+{
+	struct file *cfile;
+	int err;
+	struct ns_cachefile_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
+
+	cfile = filp_open(nsparam->cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
+	if (IS_ERR(cfile))
+		return PTR_ERR(cfile);
+	if (!(cfile->f_mode & FMODE_CAN_READ)) {
+		NS_ERR("alloc_device: cache file not readable\n");
+		err = -EINVAL;
+		goto err_close;
+	}
+	if (!(cfile->f_mode & FMODE_CAN_WRITE)) {
+		NS_ERR("alloc_device: cache file not writeable\n");
+		err = -EINVAL;
+		goto err_close;
+	}
+	data->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
+				    sizeof(unsigned long));
+	if (!data->pages_written) {
+		NS_ERR("alloc_device: unable to allocate pages written array\n");
+		err = -ENOMEM;
+		goto err_close;
+	}
+	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
+	if (!data->file_buf) {
+		NS_ERR("alloc_device: unable to allocate file buf\n");
+		err = -ENOMEM;
+		goto err_free;
+	}
+	data->cfile = cfile;
+
+	ns->backend_data = data;
+
 	return 0;
 
 err_free:
-	vfree(ns->pages_written);
+	vfree(data->pages_written);
 err_close:
 	filp_close(cfile, NULL);
 	return err;
 }
 
-/*
- * Free any allocated pages, and free the array of page pointers.
- */
-static void free_device(struct nandsim *ns)
+static void ns_ram_destroy(struct nandsim *ns)
 {
+	struct ns_ram_data *data = ns->backend_data;
 	int i;
 
-	if (ns->cfile) {
-		kfree(ns->file_buf);
-		vfree(ns->pages_written);
-		filp_close(ns->cfile, NULL);
-		return;
+	for (i = 0; i < ns->geom.pgnum; i++) {
+		if (data->pages[i].byte)
+			kmem_cache_free(data->nand_pages_slab,
+					data->pages[i].byte);
 	}
+	kmem_cache_destroy(data->nand_pages_slab);
+	vfree(data->pages);
+	kfree(data);
+}
 
-	if (ns->pages) {
-		for (i = 0; i < ns->geom.pgnum; i++) {
-			if (ns->pages[i].byte)
-				kmem_cache_free(ns->nand_pages_slab,
-						ns->pages[i].byte);
-		}
-		kmem_cache_destroy(ns->nand_pages_slab);
-		vfree(ns->pages);
-	}
+static void ns_cachefile_destroy(struct nandsim *ns)
+{
+	struct ns_cachefile_data *data = ns->backend_data;
+
+	kfree(data->file_buf);
+	vfree(data->pages_written);
+	filp_close(data->cfile, NULL);
 }
 
 static char *get_partition_name(struct nandsim *ns, int i)
@@ -864,7 +892,9 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if ((ret = alloc_device(ns, nsparam)) != 0)
+	ns->bops = nsparam->bops;
+
+	if ((ret = ns->bops->init(ns, nsparam)) != 0)
 		return ret;
 
 	/* Allocate / initialize the internal buffer */
@@ -885,9 +915,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 static void free_nandsim(struct nandsim *ns)
 {
 	kfree(ns->buf.byte);
-	free_device(ns);
-
-	return;
+	ns->bops->destroy(ns);
 }
 
 static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
@@ -1418,9 +1446,10 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 static void put_pages(struct nandsim *ns)
 {
 	int i;
+	struct ns_cachefile_data *data = ns->backend_data;
 
-	for (i = 0; i < ns->held_cnt; i++)
-		put_page(ns->held_pages[i]);
+	for (i = 0; i < data->held_cnt; i++)
+		put_page(data->held_pages[i]);
 }
 
 /* Get page cache pages in advance to provide NOFS memory allocation */
@@ -1429,12 +1458,13 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
 	pgoff_t index, start_index, end_index;
 	struct page *page;
 	struct address_space *mapping = file->f_mapping;
+	struct ns_cachefile_data *data = ns->backend_data;
 
 	start_index = pos >> PAGE_SHIFT;
 	end_index = (pos + count - 1) >> PAGE_SHIFT;
 	if (end_index - start_index + 1 > NS_MAX_HELD_PAGES)
 		return -EINVAL;
-	ns->held_cnt = 0;
+	data->held_cnt = 0;
 	for (index = start_index; index <= end_index; index++) {
 		page = find_get_page(mapping, index);
 		if (page == NULL) {
@@ -1449,7 +1479,7 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
 			}
 			unlock_page(page);
 		}
-		ns->held_pages[ns->held_cnt++] = page;
+		data->held_pages[data->held_cnt++] = page;
 	}
 	return 0;
 }
@@ -1503,7 +1533,9 @@ static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size
  */
 static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns)
 {
-	return &(ns->pages[ns->regs.row]);
+	struct ns_ram_data *data = ns->backend_data;
+
+	return &(data->pages[ns->regs.row]);
 }
 
 /*
@@ -1545,36 +1577,10 @@ static void do_bit_flips(struct nandsim *ns, int num)
 	}
 }
 
-/*
- * Fill the NAND buffer with data read from the specified page.
- */
-static void read_page(struct nandsim *ns, int num)
+static void ns_ram_read_page(struct nandsim *ns, int num)
 {
 	union ns_mem *mypage;
 
-	if (ns->cfile) {
-		if (!test_bit(ns->regs.row, ns->pages_written)) {
-			NS_DBG("read_page: page %d not written\n", ns->regs.row);
-			memset(ns->buf.byte, 0xFF, num);
-		} else {
-			loff_t pos;
-			ssize_t tx;
-
-			NS_DBG("read_page: page %d written, reading from %d\n",
-				ns->regs.row, ns->regs.column + ns->regs.off);
-			if (do_read_error(ns, num))
-				return;
-			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
-			if (tx != num) {
-				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
-				return;
-			}
-			do_bit_flips(ns, num);
-		}
-		return;
-	}
-
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
 		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
@@ -1589,81 +1595,67 @@ static void read_page(struct nandsim *ns, int num)
 	}
 }
 
-/*
- * Erase all pages in the specified sector.
- */
-static void erase_sector(struct nandsim *ns)
+static void ns_cachefile_read_page(struct nandsim *ns, int num)
 {
-	union ns_mem *mypage;
-	int i;
+	struct ns_cachefile_data *data = ns->backend_data;
 
-	if (ns->cfile) {
-		for (i = 0; i < ns->geom.pgsec; i++)
-			if (__test_and_clear_bit(ns->regs.row + i,
-						 ns->pages_written)) {
-				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
-			}
-		return;
+	if (!test_bit(ns->regs.row, data->pages_written)) {
+		NS_DBG("read_page: page %d not written\n", ns->regs.row);
+		memset(ns->buf.byte, 0xFF, num);
+	} else {
+		loff_t pos;
+		ssize_t tx;
+
+		NS_DBG("read_page: page %d written, reading from %d\n",
+			ns->regs.row, ns->regs.column + ns->regs.off);
+		if (do_read_error(ns, num))
+			return;
+		pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
+		tx = read_file(ns, data->cfile, ns->buf.byte, num, pos);
+		if (tx != num) {
+			NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			return;
+		}
+		do_bit_flips(ns, num);
 	}
+}
+
+static void ns_ram_erase_sector(struct nandsim *ns)
+{
+	union ns_mem *mypage;
+	int i;
+	struct ns_ram_data *data = ns->backend_data;
 
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
 			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
-			kmem_cache_free(ns->nand_pages_slab, mypage->byte);
+			kmem_cache_free(data->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
 		mypage++;
 	}
 }
 
-/*
- * Program the specified page with the contents from the NAND buffer.
- */
-static int prog_page(struct nandsim *ns, int num)
+static void ns_cachefile_erase_sector(struct nandsim *ns)
 {
 	int i;
-	union ns_mem *mypage;
-	u_char *pg_off;
+	struct ns_cachefile_data *data = ns->backend_data;
 
-	if (ns->cfile) {
-		loff_t off;
-		ssize_t tx;
-		int all;
-
-		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
-		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
-		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-		if (!test_bit(ns->regs.row, ns->pages_written)) {
-			all = 1;
-			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
-		} else {
-			all = 0;
-			tx = read_file(ns, ns->cfile, pg_off, num, off);
-			if (tx != num) {
-				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
-				return -1;
-			}
-		}
-		for (i = 0; i < num; i++)
-			pg_off[i] &= ns->buf.byte[i];
-		if (all) {
-			loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
-			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, pos);
-			if (tx != ns->geom.pgszoob) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
-				return -1;
-			}
-			__set_bit(ns->regs.row, ns->pages_written);
-		} else {
-			tx = write_file(ns, ns->cfile, pg_off, num, off);
-			if (tx != num) {
-				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
-				return -1;
-			}
+	for (i = 0; i < ns->geom.pgsec; i++) {
+		if (__test_and_clear_bit(ns->regs.row + i,
+					 data->pages_written)) {
+			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
 		}
-		return 0;
 	}
+}
+
+static int ns_ram_prog_page(struct nandsim *ns, int num)
+{
+	int i;
+	union ns_mem *mypage;
+	u_char *pg_off;
+	struct ns_ram_data *data = ns->backend_data;
 
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
@@ -1674,7 +1666,7 @@ static int prog_page(struct nandsim *ns, int num)
 		 * then kernel memory alloc runs writeback which goes to the FS
 		 * again and deadlocks. This was seen in practice.
 		 */
-		mypage->byte = kmem_cache_alloc(ns->nand_pages_slab, GFP_NOFS);
+		mypage->byte = kmem_cache_alloc(data->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
 			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
 			return -1;
@@ -1689,6 +1681,65 @@ static int prog_page(struct nandsim *ns, int num)
 	return 0;
 }
 
+static int ns_cachefile_prog_page(struct nandsim *ns, int num)
+{
+	int i, all;
+	loff_t off;
+	ssize_t tx;
+	u_char *pg_off;
+	struct ns_cachefile_data *data = ns->backend_data;
+
+	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
+	pg_off = data->file_buf + ns->regs.column + ns->regs.off;
+	off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
+	if (!test_bit(ns->regs.row, data->pages_written)) {
+		all = 1;
+		memset(data->file_buf, 0xff, ns->geom.pgszoob);
+	} else {
+		all = 0;
+		tx = read_file(ns, data->cfile, pg_off, num, off);
+		if (tx != num) {
+			NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			return -1;
+		}
+	}
+	for (i = 0; i < num; i++)
+		pg_off[i] &= ns->buf.byte[i];
+	if (all) {
+		loff_t pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
+		tx = write_file(ns, data->cfile, data->file_buf, ns->geom.pgszoob, pos);
+		if (tx != ns->geom.pgszoob) {
+			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			return -1;
+		}
+		__set_bit(ns->regs.row, data->pages_written);
+	} else {
+		tx = write_file(ns, data->cfile, pg_off, num, off);
+		if (tx != num) {
+			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+			return -1;
+		}
+	}
+	return 0;
+}
+
+static struct ns_backend_ops ns_ram_bops = {
+	.erase_sector = ns_ram_erase_sector,
+	.prog_page = ns_ram_prog_page,
+	.read_page = ns_ram_read_page,
+	.init = ns_ram_init,
+	.destroy = ns_ram_destroy,
+};
+
+static struct ns_backend_ops ns_cachefile_bops = {
+	.erase_sector = ns_cachefile_erase_sector,
+	.prog_page = ns_cachefile_prog_page,
+	.read_page = ns_cachefile_read_page,
+	.init = ns_cachefile_init,
+	.destroy = ns_cachefile_destroy,
+};
+
+
 /*
  * If state has any action bit, perform this action.
  *
@@ -1721,7 +1772,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
-		read_page(ns, num);
+		ns->bops->read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs.off);
@@ -1764,7 +1815,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 				ns->regs.row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %u\n", erase_block_no);
 
-		erase_sector(ns);
+		ns->bops->erase_sector(ns);
 
 		NS_MDELAY(ns, ns->erase_delay);
 
@@ -1795,7 +1846,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 
-		if (prog_page(ns, num) == -1)
+		if (ns->bops->prog_page(ns, num) == -1)
 			return -1;
 
 		page_no = ns->regs.row;
@@ -2603,6 +2654,11 @@ static int __init ns_init_default(void)
 	nsparam->bch = bch;
 	nsparam->id_bytes = id_bytes;
 
+	if (!nsparam->cache_file)
+		nsparam->bops = &ns_ram_bops;
+	else
+		nsparam->bops = &ns_cachefile_bops;
+
 	ret = ns_new_instance(nsparam);
 	kfree(nsparam);
 
-- 
2.8.3
