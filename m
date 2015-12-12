Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7fsD-00005N-Ag
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 08:49:55 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <shengyong1@huawei.com>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, <linux-cris-kernel@axis.com>,
 <starvik@axis.com>, <jesper.nilsson@axis.com>, <jschultz@xes-inc.com>,
 <ard.biesheuvel@linaro.org>, <asierra@xes-inc.com>,
 <colin.king@canonical.com>, <fabf@skynet.be>,
 <linux-mtd@lists.infradead.org>, <dmitry.torokhov@gmail.com>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 2/7] mtd: nansim: add support of multi devices.
Date: Sat, 12 Dec 2015 16:41:02 +0800
Message-ID: <1449909667-7759-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1449909667-7759-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1449909667-7759-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch introduces a new option names as dev_count to
specify the count of dev. Then we can simulate multi nand
flashes with memory.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/nand/nandsim.c | 307 ++++++++++++++++++++++++---------------------
 1 file changed, 166 insertions(+), 141 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index d4a94c4..479de7d 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -107,6 +107,7 @@ static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
+static unsigned int dev_count = 1;
 static u_char id_bytes[8] = {
 	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
 	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
@@ -139,6 +140,7 @@ module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
+module_param(dev_count,	     uint, 0400);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
@@ -447,8 +449,7 @@ static unsigned long *erase_block_wear = NULL;
 static unsigned int wear_eb_count = 0;
 static unsigned long total_wear = 0;
 
-/* MTD structure for NAND controller */
-static struct mtd_info *nsmtd;
+static struct mtd_info *nsmtds;
 
 static int nandsim_debugfs_show(struct seq_file *m, void *private)
 {
@@ -2221,6 +2222,9 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
+#define NSMTD_SIZE	(sizeof(struct mtd_info) + sizeof(struct nand_chip) + \
+			sizeof(struct nandsim))
+
 /*
  * Module initialization function
  */
@@ -2228,7 +2232,8 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
-	int retval = -ENOMEM, i;
+	struct mtd_info *nsmtd = NULL;
+	int retval = -ENOMEM, i, mtd_id;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2236,153 +2241,156 @@ static int __init ns_init_module(void)
 	}
 
 	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
-	nsmtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip)
-				+ sizeof(struct nandsim), GFP_KERNEL);
-	if (!nsmtd) {
+	nsmtds = kzalloc(NSMTD_SIZE * dev_count, GFP_KERNEL);
+	if (!nsmtds) {
 		NS_ERR("unable to allocate core structures.\n");
 		return -ENOMEM;
 	}
-	chip        = (struct nand_chip *)(nsmtd + 1);
-        nsmtd->priv = (void *)chip;
-	nand        = (struct nandsim *)(chip + 1);
-	chip->priv  = (void *)nand;
 
-	/*
-	 * Register simulator's callbacks.
-	 */
-	chip->cmd_ctrl	 = ns_hwcontrol;
-	chip->read_byte  = ns_nand_read_byte;
-	chip->dev_ready  = ns_device_ready;
-	chip->write_buf  = ns_nand_write_buf;
-	chip->read_buf   = ns_nand_read_buf;
-	chip->read_word  = ns_nand_read_word;
-	chip->ecc.mode   = NAND_ECC_SOFT;
-	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
-	/* and 'badblocks' parameters to work */
-	chip->options   |= NAND_SKIP_BBTSCAN;
-
-	switch (bbt) {
-	case 2:
-		 chip->bbt_options |= NAND_BBT_NO_OOB;
-	case 1:
-		 chip->bbt_options |= NAND_BBT_USE_FLASH;
-	case 0:
-		break;
-	default:
-		NS_ERR("bbt has to be 0..2\n");
-		retval = -EINVAL;
-		goto error;
-	}
-	/*
-	 * Perform minimum nandsim structure initialization to handle
-	 * the initial ID read command correctly
-	 */
-	if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
-		nand->geom.idbytes = 8;
-	else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
-		nand->geom.idbytes = 6;
-	else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
-		nand->geom.idbytes = 4;
-	else
-		nand->geom.idbytes = 2;
-	nand->regs.status = NS_STATUS_OK(nand);
-	nand->nxstate = STATE_UNKNOWN;
-	nand->options |= OPT_PAGE512; /* temporary value */
-	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
-	if (bus_width == 16) {
-		nand->busw = 16;
-		chip->options |= NAND_BUSWIDTH_16;
-	}
-
-	nsmtd->owner = THIS_MODULE;
-
-	if ((retval = parse_weakblocks()) != 0)
-		goto error;
-
-	if ((retval = parse_weakpages()) != 0)
-		goto error;
-
-	if ((retval = parse_gravepages()) != 0)
-		goto error;
-
-	retval = nand_scan_ident(nsmtd, 1, NULL);
-	if (retval) {
-		NS_ERR("cannot scan NAND Simulator device\n");
-		if (retval > 0)
-			retval = -ENXIO;
-		goto error;
-	}
-
-	if (bch) {
-		unsigned int eccsteps, eccbytes;
-		if (!mtd_nand_has_bch()) {
-			NS_ERR("BCH ECC support is disabled\n");
+	for (mtd_id = 0; mtd_id < dev_count; mtd_id++) {
+		nsmtd       = ((void *)nsmtds) + NSMTD_SIZE * mtd_id;
+		chip        = (struct nand_chip *)(nsmtd + 1);
+		nsmtd->priv = (void *)chip;
+		nand        = (struct nandsim *)(chip + 1);
+		chip->priv  = (void *)nand;
+
+		/*
+		 * Register simulator's callbacks.
+		 */
+		chip->cmd_ctrl	 = ns_hwcontrol;
+		chip->read_byte  = ns_nand_read_byte;
+		chip->dev_ready  = ns_device_ready;
+		chip->write_buf  = ns_nand_write_buf;
+		chip->read_buf   = ns_nand_read_buf;
+		chip->read_word  = ns_nand_read_word;
+		chip->ecc.mode   = NAND_ECC_SOFT;
+		/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
+		/* and 'badblocks' parameters to work */
+		chip->options   |= NAND_SKIP_BBTSCAN;
+
+		switch (bbt) {
+		case 2:
+			 chip->bbt_options |= NAND_BBT_NO_OOB;
+		case 1:
+			 chip->bbt_options |= NAND_BBT_USE_FLASH;
+		case 0:
+			break;
+		default:
+			NS_ERR("bbt has to be 0..2\n");
 			retval = -EINVAL;
 			goto error;
 		}
-		/* use 512-byte ecc blocks */
-		eccsteps = nsmtd->writesize/512;
-		eccbytes = (bch*13+7)/8;
-		/* do not bother supporting small page devices */
-		if ((nsmtd->oobsize < 64) || !eccsteps) {
-			NS_ERR("bch not available on small page devices\n");
-			retval = -EINVAL;
-			goto error;
+		/*
+		 * Perform minimum nandsim structure initialization to handle
+		 * the initial ID read command correctly
+		 */
+		if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
+			nand->geom.idbytes = 8;
+		else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
+			nand->geom.idbytes = 6;
+		else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
+			nand->geom.idbytes = 4;
+		else
+			nand->geom.idbytes = 2;
+		nand->regs.status = NS_STATUS_OK(nand);
+		nand->nxstate = STATE_UNKNOWN;
+		nand->options |= OPT_PAGE512; /* temporary value */
+		memcpy(nand->ids, id_bytes, sizeof(nand->ids));
+		if (bus_width == 16) {
+			nand->busw = 16;
+			chip->options |= NAND_BUSWIDTH_16;
 		}
-		if ((eccbytes*eccsteps+2) > nsmtd->oobsize) {
-			NS_ERR("invalid bch value %u\n", bch);
-			retval = -EINVAL;
+
+		nsmtd->owner = THIS_MODULE;
+
+		if ((retval = parse_weakblocks()) != 0)
+			goto error;
+
+		if ((retval = parse_weakpages()) != 0)
+			goto error;
+
+		if ((retval = parse_gravepages()) != 0)
+			goto error;
+
+		retval = nand_scan_ident(nsmtd, 1, NULL);
+		if (retval) {
+			NS_ERR("cannot scan NAND Simulator device\n");
+			if (retval > 0)
+				retval = -ENXIO;
 			goto error;
 		}
-		chip->ecc.mode = NAND_ECC_SOFT_BCH;
-		chip->ecc.size = 512;
-		chip->ecc.strength = bch;
-		chip->ecc.bytes = eccbytes;
-		NS_INFO("using %u-bit/%u bytes BCH ECC\n", bch, chip->ecc.size);
-	}
 
-	retval = nand_scan_tail(nsmtd);
-	if (retval) {
-		NS_ERR("can't register NAND Simulator\n");
-		if (retval > 0)
-			retval = -ENXIO;
-		goto error;
-	}
+		if (bch) {
+			unsigned int eccsteps, eccbytes;
+			if (!mtd_nand_has_bch()) {
+				NS_ERR("BCH ECC support is disabled\n");
+				retval = -EINVAL;
+				goto error;
+			}
+			/* use 512-byte ecc blocks */
+			eccsteps = nsmtd->writesize/512;
+			eccbytes = (bch*13+7)/8;
+			/* do not bother supporting small page devices */
+			if ((nsmtd->oobsize < 64) || !eccsteps) {
+				NS_ERR("bch not available on small page devices\n");
+				retval = -EINVAL;
+				goto error;
+			}
+			if ((eccbytes*eccsteps+2) > nsmtd->oobsize) {
+				NS_ERR("invalid bch value %u\n", bch);
+				retval = -EINVAL;
+				goto error;
+			}
+			chip->ecc.mode = NAND_ECC_SOFT_BCH;
+			chip->ecc.size = 512;
+			chip->ecc.strength = bch;
+			chip->ecc.bytes = eccbytes;
+			NS_INFO("using %u-bit/%u bytes BCH ECC\n", bch, chip->ecc.size);
+		}
+
+		retval = nand_scan_tail(nsmtd);
+		if (retval) {
+			NS_ERR("can't register NAND Simulator\n");
+			if (retval > 0)
+				retval = -ENXIO;
+			goto error;
+		}
 
-	if (overridesize) {
-		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
-		if (new_size >> overridesize != nsmtd->erasesize) {
-			NS_ERR("overridesize is too big\n");
-			retval = -EINVAL;
-			goto err_exit;
+		if (overridesize) {
+			uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
+			if (new_size >> overridesize != nsmtd->erasesize) {
+				NS_ERR("overridesize is too big\n");
+				retval = -EINVAL;
+				goto err_exit;
+			}
+			/* N.B. This relies on nand_scan not doing anything with the size before we change it */
+			nsmtd->size = new_size;
+			chip->chipsize = new_size;
+			chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
+			chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
 		}
-		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
-		nsmtd->size = new_size;
-		chip->chipsize = new_size;
-		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
-		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
-	}
 
-	if ((retval = setup_wear_reporting(nsmtd)) != 0)
-		goto err_exit;
+		if ((retval = setup_wear_reporting(nsmtd)) != 0)
+			goto err_exit;
 
-	if ((retval = nandsim_debugfs_create(nand)) != 0)
-		goto err_exit;
+		if ((retval = nandsim_debugfs_create(nand)) != 0)
+			goto err_exit;
 
-	if ((retval = init_nandsim(nsmtd)) != 0)
-		goto err_exit;
+		if ((retval = init_nandsim(nsmtd)) != 0)
+			goto err_exit;
 
-	if ((retval = chip->scan_bbt(nsmtd)) != 0)
-		goto err_exit;
+		if ((retval = chip->scan_bbt(nsmtd)) != 0)
+			goto err_exit;
 
-	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
-		goto err_exit;
+		if ((retval = parse_badblocks(nand, nsmtd)) != 0)
+			goto err_exit;
 
-	/* Register NAND partitions */
-	retval = mtd_device_register(nsmtd, &nand->partitions[0],
-				     nand->nbparts);
-	if (retval != 0)
-		goto err_exit;
+		/* Register NAND partitions */
+		retval = mtd_device_register(nsmtd, &nand->partitions[0],
+					     nand->nbparts);
+		if (retval != 0)
+			goto err_exit;
+	}
 
         return 0;
 
@@ -2392,7 +2400,19 @@ err_exit:
 	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
 		kfree(nand->partitions[i].name);
 error:
-	kfree(nsmtd);
+	/* Cleanup for already */
+	while (mtd_id) {
+		nsmtd = ((void *)nsmtds) + NSMTD_SIZE * mtd_id;
+		nand = ((struct nand_chip *)nsmtd->priv)->priv;
+
+		free_nandsim(nand);
+		nand_release(nsmtd);
+		for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
+			kfree(nand->partitions[i].name);
+		mtd_id--;
+	}
+
+	kfree(nsmtds);
 	free_lists();
 
 	return retval;
@@ -2405,15 +2425,20 @@ module_init(ns_init_module);
  */
 static void __exit ns_cleanup_module(void)
 {
-	struct nandsim *ns = ((struct nand_chip *)nsmtd->priv)->priv;
-	int i;
-
-	nandsim_debugfs_remove(ns);
-	free_nandsim(ns);    /* Free nandsim private resources */
-	nand_release(nsmtd); /* Unregister driver */
-	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-		kfree(ns->partitions[i].name);
-	kfree(nsmtd);        /* Free other structures */
+	struct nandsim *ns;
+	struct mtd_info *nsmtd;
+	int i, mtd_id;
+
+	for (mtd_id = 0; mtd_id < dev_count; mtd_id++) {
+		nsmtd = ((void *)nsmtds) + NSMTD_SIZE * mtd_id;
+		ns = ((struct nand_chip *)nsmtd->priv)->priv;
+		nandsim_debugfs_remove(ns);
+		free_nandsim(ns);    /* Free nandsim private resources */
+		nand_release(nsmtd); /* Unregister driver */
+		for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
+			kfree(ns->partitions[i].name);
+	}
+	kfree(nsmtds);        /* Free other structures */
 	free_lists();
 }
 
-- 
1.8.4.2
