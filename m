Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme95-0007FE-13
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:49:11 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 11/46] mtd: nandsim: Factor out nandsim parameters
Date: Wed, 21 Sep 2016 11:48:27 +0200
Message-Id: <ac875f33a70086c914c191dbc4ca139766d4a5e2.1474450296.git.dwalter@sigma-star.at>
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

...such that we have a way to pass different
parameters to different instances.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 129 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 93 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f26e983..ab4859d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -289,6 +289,28 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 /* Maximum page cache pages needed to read or write a NAND page to the cache_file */
 #define NS_MAX_HELD_PAGES 16
 
+struct nandsim_params {
+	unsigned int access_delay;
+	unsigned int program_delay;
+	unsigned int erase_delay;
+	unsigned int output_cycle;
+	unsigned int input_cycle;
+	unsigned int bus_width;
+	unsigned int do_delays;
+	unsigned long *parts;
+	unsigned int parts_num;
+	char *badblocks;
+	char *weakblocks;
+	char *weakpages;
+	unsigned int bitflips;
+	char *gravepages;
+	unsigned int overridesize;
+	char *cache_file;
+	unsigned int bbt;
+	unsigned int bch;
+	unsigned char *id_bytes;
+};
+
 struct nandsim_debug_info {
 	struct dentry *dfs_root;
 	struct dentry *dfs_wear_report;
@@ -593,13 +615,13 @@ static void nandsim_debugfs_remove(struct nandsim *ns)
  *
  * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
  */
-static int __init alloc_device(struct nandsim *ns)
+static int alloc_device(struct nandsim *ns, struct nandsim_params *nsparam)
 {
 	struct file *cfile;
 	int i, err;
 
-	if (cache_file) {
-		cfile = filp_open(cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
+	if (nsparam->cache_file) {
+		cfile = filp_open(nsparam->cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
 		if (IS_ERR(cfile))
 			return PTR_ERR(cfile);
 		if (!(cfile->f_mode & FMODE_CAN_READ)) {
@@ -688,7 +710,7 @@ static char __init *get_partition_name(int i)
  *
  * RETURNS: 0 if success, -ERRNO if failure.
  */
-static int __init init_nandsim(struct mtd_info *mtd)
+static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nandsim   *ns   = nand_get_controller_data(chip);
@@ -751,14 +773,14 @@ static int __init init_nandsim(struct mtd_info *mtd)
 	}
 
 	/* Fill the partition_info structure */
-	if (parts_num > ARRAY_SIZE(ns->partitions)) {
+	if (nsparam->parts_num > ARRAY_SIZE(ns->partitions)) {
 		NS_ERR("too many partitions.\n");
 		return -EINVAL;
 	}
 	remains = ns->geom.totsz;
 	next_offset = 0;
-	for (i = 0; i < parts_num; ++i) {
-		uint64_t part_sz = (uint64_t)parts[i] * ns->geom.secsz;
+	for (i = 0; i < nsparam->parts_num; ++i) {
+		uint64_t part_sz = (uint64_t)nsparam->parts[i] * ns->geom.secsz;
 
 		if (!part_sz || part_sz > remains) {
 			NS_ERR("bad partition size.\n");
@@ -774,9 +796,9 @@ static int __init init_nandsim(struct mtd_info *mtd)
 		next_offset += ns->partitions[i].size;
 		remains -= ns->partitions[i].size;
 	}
-	ns->nbparts = parts_num;
+	ns->nbparts = nsparam->parts_num;
 	if (remains) {
-		if (parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
+		if (nsparam->parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
 			NS_ERR("too many partitions.\n");
 			return -EINVAL;
 		}
@@ -810,7 +832,7 @@ static int __init init_nandsim(struct mtd_info *mtd)
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if ((ret = alloc_device(ns)) != 0)
+	if ((ret = alloc_device(ns, nsparam)) != 0)
 		return ret;
 
 	/* Allocate / initialize the internal buffer */
@@ -2289,15 +2311,16 @@ static struct miscdevice nandsim_ctrl_cdev = {
 	.fops = &nansim_ctrl_fops,
 };
 
-static int __init ns_init_default(void)
+static int ns_new_instance(struct nandsim_params *nsparam)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
 	struct mtd_info *nsmtd;
 	int retval = -ENOMEM, i;
+	unsigned char *id_bytes = nsparam->id_bytes;
 
-	if (bus_width != 8 && bus_width != 16) {
-		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
+	if (nsparam->bus_width != 8 && nsparam->bus_width != 16) {
+		NS_ERR("wrong bus width (%d), use only 8 or 16\n", nsparam->bus_width);
 		return -EINVAL;
 	}
 
@@ -2334,7 +2357,7 @@ static int __init ns_init_default(void)
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
 
-	switch (bbt) {
+	switch (nsparam->bbt) {
 	case 2:
 		 chip->bbt_options |= NAND_BBT_NO_OOB;
 	case 1:
@@ -2362,29 +2385,29 @@ static int __init ns_init_default(void)
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
 	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
-	if (bus_width == 16) {
+	if (nsparam->bus_width == 16) {
 		nand->busw = 16;
 		chip->options |= NAND_BUSWIDTH_16;
 	}
 
 	nsmtd->owner = THIS_MODULE;
 
-	if ((retval = parse_weakblocks(nand, weakblocks)) != 0)
+	if ((retval = parse_weakblocks(nand, nsparam->weakblocks)) != 0)
 		goto error;
 
-	if ((retval = parse_weakpages(nand, weakpages)) != 0)
+	if ((retval = parse_weakpages(nand, nsparam->weakpages)) != 0)
 		goto error;
 
-	if ((retval = parse_gravepages(nand, gravepages)) != 0)
+	if ((retval = parse_gravepages(nand, nsparam->gravepages)) != 0)
 		goto error;
 
-	nand->do_delays = do_delays;
-	nand->access_delay = access_delay;
-	nand->program_delay = programm_delay;
-	nand->erase_delay = erase_delay;
-	nand->output_cycle = output_cycle;
-	nand->input_cycle = input_cycle;
-	nand->bitflips = bitflips;
+	nand->do_delays = nsparam->do_delays;
+	nand->access_delay = nsparam->access_delay;
+	nand->program_delay = nsparam->program_delay;
+	nand->erase_delay = nsparam->erase_delay;
+	nand->output_cycle = nsparam->output_cycle;
+	nand->input_cycle = nsparam->input_cycle;
+	nand->bitflips = nsparam->bitflips;
 
 	retval = nand_scan_ident(nsmtd, 1, NULL);
 	if (retval) {
@@ -2394,7 +2417,7 @@ static int __init ns_init_default(void)
 		goto error;
 	}
 
-	if (bch) {
+	if (nsparam->bch) {
 		unsigned int eccsteps, eccbytes;
 		if (!mtd_nand_has_bch()) {
 			NS_ERR("BCH ECC support is disabled\n");
@@ -2403,7 +2426,7 @@ static int __init ns_init_default(void)
 		}
 		/* use 512-byte ecc blocks */
 		eccsteps = nsmtd->writesize/512;
-		eccbytes = (bch*13+7)/8;
+		eccbytes = (nsparam->bch * 13 + 7) / 8;
 		/* do not bother supporting small page devices */
 		if ((nsmtd->oobsize < 64) || !eccsteps) {
 			NS_ERR("bch not available on small page devices\n");
@@ -2411,16 +2434,16 @@ static int __init ns_init_default(void)
 			goto error;
 		}
 		if ((eccbytes*eccsteps+2) > nsmtd->oobsize) {
-			NS_ERR("invalid bch value %u\n", bch);
+			NS_ERR("invalid bch value %u\n", nsparam->bch);
 			retval = -EINVAL;
 			goto error;
 		}
 		chip->ecc.mode = NAND_ECC_SOFT;
 		chip->ecc.algo = NAND_ECC_BCH;
 		chip->ecc.size = 512;
-		chip->ecc.strength = bch;
+		chip->ecc.strength = nsparam->bch;
 		chip->ecc.bytes = eccbytes;
-		NS_INFO("using %u-bit/%u bytes BCH ECC\n", bch, chip->ecc.size);
+		NS_INFO("using %u-bit/%u bytes BCH ECC\n", nsparam->bch, chip->ecc.size);
 	}
 
 	retval = nand_scan_tail(nsmtd);
@@ -2431,9 +2454,9 @@ static int __init ns_init_default(void)
 		goto error;
 	}
 
-	if (overridesize) {
-		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
-		if (new_size >> overridesize != nsmtd->erasesize) {
+	if (nsparam->overridesize) {
+		uint64_t new_size = (uint64_t)nsmtd->erasesize << nsparam->overridesize;
+		if (new_size >> nsparam->overridesize != nsmtd->erasesize) {
 			NS_ERR("overridesize is too big\n");
 			retval = -EINVAL;
 			goto err_exit;
@@ -2441,7 +2464,7 @@ static int __init ns_init_default(void)
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
 		nsmtd->size = new_size;
 		chip->chipsize = new_size;
-		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
+		chip->chip_shift = ffs(nsmtd->erasesize) + nsparam->overridesize - 1;
 		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
 	}
 
@@ -2451,13 +2474,13 @@ static int __init ns_init_default(void)
 	if ((retval = nandsim_debugfs_create(nand)) != 0)
 		goto err_exit;
 
-	if ((retval = init_nandsim(nsmtd)) != 0)
+	if ((retval = init_nandsim(nsmtd, nsparam)) != 0)
 		goto err_exit;
 
 	if ((retval = chip->scan_bbt(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = parse_badblocks(nand, nsmtd, badblocks)) != 0)
+	if ((retval = parse_badblocks(nand, nsmtd, nsparam->badblocks)) != 0)
 		goto err_exit;
 
 	/* Register NAND partitions */
@@ -2496,6 +2519,40 @@ static void __exit ns_cleanup_default(void)
 	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
 }
 
+static int __init ns_init_default(void)
+{
+	int ret;
+	struct nandsim_params *nsparam = kzalloc(sizeof(*nsparam), GFP_KERNEL);
+
+	if (!nsparam)
+		return -ENOMEM;
+
+	nsparam->access_delay = access_delay;
+	nsparam->program_delay = programm_delay;
+	nsparam->erase_delay = erase_delay;
+	nsparam->output_cycle = output_cycle;
+	nsparam->input_cycle = input_cycle;
+	nsparam->bus_width = bus_width;
+	nsparam->do_delays = do_delays;
+	nsparam->parts = parts;
+	nsparam->parts_num = parts_num;
+	nsparam->badblocks = badblocks;
+	nsparam->weakblocks = weakblocks;
+	nsparam->weakpages = weakpages;
+	nsparam->bitflips = bitflips;
+	nsparam->gravepages = gravepages;
+	nsparam->overridesize = overridesize;
+	nsparam->cache_file = cache_file;
+	nsparam->bbt = bbt;
+	nsparam->bch = bch;
+	nsparam->id_bytes = id_bytes;
+
+	ret = ns_new_instance(nsparam);
+	kfree(nsparam);
+
+	return ret;
+}
+
 static int __init ns_init_module(void)
 {
 	int ret;
-- 
2.8.3
