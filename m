Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyQ-0004tE-BH
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:22 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/46] mtd: nandsim: Rework init error paths
Date: Wed, 31 Aug 2016 09:28:46 +0200
Message-Id: <20160831072853.27822-40-dwalter@sigma-star.at>
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
 drivers/mtd/nand/nandsim.c | 97 +++++++++++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 05a3088..027b15d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -871,12 +871,14 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 
 		if (!part_sz || part_sz > remains) {
 			pr_err("bad partition size.\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_names;
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
 			pr_err("unable to allocate memory.\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_names;
 		}
 		ns->partitions[i].offset = next_offset;
 		ns->partitions[i].size   = part_sz;
@@ -887,12 +889,14 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	if (remains) {
 		if (nsparam->parts_num + 1 > ARRAY_SIZE(ns->partitions)) {
 			pr_err("too many partitions.\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_names;
 		}
 		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
 			pr_err("unable to allocate memory.\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_names;
 		}
 		ns->partitions[i].offset = next_offset;
 		ns->partitions[i].size   = remains;
@@ -921,22 +925,24 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 
 	ns->bops = nsparam->bops;
 
-	pr_info("Using backend: %s\n", ns->bops->name);
-	if ((ret = ns->bops->init(ns, nsparam)) != 0) {
-		pr_err("Unable to initialize simulator backend: %i\n", ret);
-		return ret;
-	}
-
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!ns->buf.byte) {
 		pr_err("unable to allocate %u bytes for the internal buffer\n",
 			ns->geom.pgszoob);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_buf;
 	}
 	memset(ns->buf.byte, 0xFF, ns->geom.pgszoob);
 
 	return 0;
+
+err_buf:
+	kfree(ns->buf.byte);
+err_names:
+	for (i = 0; i < ARRAY_SIZE(ns->partitions); i++)
+		kfree(ns->partitions[i].name);
+	return ret;
 }
 
 /*
@@ -944,8 +950,11 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
  */
 static void free_nandsim(struct nandsim *ns)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ns->partitions); i++)
+		kfree(ns->partitions[i].name);
 	kfree(ns->buf.byte);
-	ns->bops->destroy(ns);
 }
 
 static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd,
@@ -2751,7 +2760,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		pr_err("Cannot allocate more than %i instances!\n", NANDSIM_MAX_DEVICES);
 		retval = -ENFILE;
 		mutex_unlock(&ns_mtd_mutex);
-		goto error;
+		goto err_chip;
 	}
 
 	nsmtd = ns_mtds[i] = nand_to_mtd(chip);
@@ -2789,7 +2798,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	default:
 		pr_err("bbt has to be 0..2\n");
 		retval = -EINVAL;
-		goto error;
+		goto err_mtds;
 	}
 	/*
 	 * Perform minimum nandsim structure initialization to handle
@@ -2817,13 +2826,13 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	nsmtd->_put_device = ns_put_device;
 
 	if ((retval = parse_weakblocks(nand, nsparam->weakblocks)) != 0)
-		goto error;
+		goto err_lists;
 
 	if ((retval = parse_weakpages(nand, nsparam->weakpages)) != 0)
-		goto error;
+		goto err_lists;
 
 	if ((retval = parse_gravepages(nand, nsparam->gravepages)) != 0)
-		goto error;
+		goto err_lists;
 
 	nand->do_delays = nsparam->do_delays;
 	nand->access_delay = nsparam->access_delay;
@@ -2838,14 +2847,14 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		pr_err("cannot scan NAND Simulator device\n");
 		if (retval > 0)
 			retval = -ENXIO;
-		goto error;
+		goto err_lists;
 	}
 
 	if (nsparam->no_oob) {
 		if (nsparam->bch) {
 			pr_err("Cannot use ECC without OOB\n");
 			retval = -EINVAL;
-			goto error;
+			goto err_lists;
 		}
 
 		chip->ecc.mode = NAND_ECC_NONE;
@@ -2855,7 +2864,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		if (!mtd_nand_has_bch()) {
 			pr_err("BCH ECC support is disabled\n");
 			retval = -EINVAL;
-			goto error;
+			goto err_lists;
 		}
 		/* use 512-byte ecc blocks */
 		eccsteps = nsmtd->writesize/512;
@@ -2864,12 +2873,12 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		if ((nsmtd->oobsize < 64) || !eccsteps) {
 			pr_err("bch not available on small page devices\n");
 			retval = -EINVAL;
-			goto error;
+			goto err_lists;
 		}
 		if ((eccbytes*eccsteps+2) > nsmtd->oobsize) {
 			pr_err("invalid bch value %u\n", nsparam->bch);
 			retval = -EINVAL;
-			goto error;
+			goto err_lists;
 		}
 		chip->ecc.mode = NAND_ECC_SOFT;
 		chip->ecc.algo = NAND_ECC_BCH;
@@ -2887,7 +2896,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		pr_err("can't register NAND Simulator\n");
 		if (retval > 0)
 			retval = -ENXIO;
-		goto error;
+		goto err_lists;
 	}
 
 	if (nsparam->overridesize) {
@@ -2895,7 +2904,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		if (new_size >> nsparam->overridesize != nsmtd->erasesize) {
 			pr_err("overridesize is too big\n");
 			retval = -EINVAL;
-			goto err_exit;
+			goto err_nand;
 		}
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
 		nsmtd->size = new_size;
@@ -2905,35 +2914,45 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	}
 
 	if ((retval = setup_wear_reporting(nsmtd)) != 0)
-		goto err_exit;
+		goto err_nand;
 
 	if ((retval = nandsim_debugfs_create(nand)) != 0)
-		goto err_exit;
+		goto err_nand;
 
 	if ((retval = init_nandsim(nsmtd, nsparam)) != 0)
-		goto err_exit;
+		goto err_debugfs;
+
+	pr_info("Using backend: %s\n", nand->bops->name);
+	if ((retval = nand->bops->init(nand, nsparam)) != 0) {
+		pr_err("Unable to initialize simulator backend: %i\n", retval);
+		goto err_nandsim;
+	}
 
 	if ((retval = chip->scan_bbt(nsmtd)) != 0)
-		goto err_exit;
+		goto err_nandsim;
 
 	if ((retval = parse_badblocks(nand, nsmtd, nsparam->badblocks)) != 0)
-		goto err_exit;
+		goto err_nandsim;
 
 	/* Register NAND partitions */
 	retval = mtd_device_register(nsmtd, &nand->partitions[0],
 				     nand->nbparts);
 	if (retval != 0)
-		goto err_exit;
+		goto err_nandsim;
 
 	return nsmtd;
 
-err_exit:
+err_nandsim:
 	free_nandsim(nand);
+err_debugfs:
+	nandsim_debugfs_remove(nand);
+err_nand:
 	nand_release(nsmtd);
-	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
-		kfree(nand->partitions[i].name);
-error:
+err_lists:
 	free_lists(nand);
+err_mtds:
+	ns_mtds[nand->index] = NULL;
+err_chip:
 	kfree(chip);
 
 	return ERR_PTR(retval);
@@ -2942,7 +2961,7 @@ EXPORT_SYMBOL_GPL(ns_new_instance);
 
 int ns_destroy_instance(struct mtd_info *nsmtd)
 {
-	int i, ret;
+	int ret;
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 
@@ -2951,12 +2970,10 @@ int ns_destroy_instance(struct mtd_info *nsmtd)
 		return ret;
 
 	nandsim_debugfs_remove(ns);
+	ns->bops->destroy(ns);
+	free_nandsim(ns);
 	free_lists(ns);
-	free_nandsim(ns);    /* Free nandsim private resources */
-	nand_release(nsmtd); /* Unregister driver */
-	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-		kfree(ns->partitions[i].name);
-	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
+	kfree(chip);
 
 	return 0;
 }
-- 
2.8.3
