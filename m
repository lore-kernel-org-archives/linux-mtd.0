Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCpxq-00051A-TC
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 16:13:49 +0000
Date: Mon, 22 May 2017 18:13:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v5] mtd: create per-device and module-scope debugfs entries
Message-ID: <20170522181310.1f7513cb@bbrezillon>
In-Reply-To: <20170522150758.30985-1-mrugiero@gmail.com>
References: <20170516155616.26558-1-mrugiero@gmail.com>
 <20170522150758.30985-1-mrugiero@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 May 2017 12:07:58 -0300
"Mario J. Rugiero" <mrugiero@gmail.com> wrote:

> Several MTD devices are using debugfs entries created in the root of debugfs.
> This commit provides the means for a standardized subtree, creating one "mtd"
> entry at root, and one entry per device inside it, named after the device.
> Accordingly, cleanup of the debugfs tree is left for the generic MTD tree,
> instead of each doing it on its own.
> Devices docg3, mtdswap and nandsim were updated to use this subtree instead
> of custom ones.
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
> 
> v5: - cleanup drivers creating their own debugfs sub-tree.
>     - separate the patch again, as it makes sense on its own as cleanup.
> v4: - include in a bigger patchset which explains the use of this tree.
> v3: - move the changelog out of the commit message
> v2: - remove unused macros and add a commit message
> v1: - create the debugfs entries
>  drivers/mtd/devices/docg3.c | 36 ++++++++++++------------------------
>  drivers/mtd/mtdcore.c       | 23 +++++++++++++++++++++++
>  drivers/mtd/mtdcore.h       |  2 ++
>  drivers/mtd/mtdswap.c       | 17 ++---------------
>  drivers/mtd/nand/nandsim.c  | 29 +++++++----------------------
>  include/linux/mtd/mtd.h     | 10 ++++++++++
>  6 files changed, 56 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index b833e6cc684c..0532fb36352b 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1809,37 +1809,25 @@ static int dbg_protection_show(struct seq_file *s, void *p)
>  }
>  DEBUGFS_RO_ATTR(protection, dbg_protection_show);
>  
> -static int __init doc_dbg_register(struct docg3 *docg3)
> +static int __init doc_dbg_register(struct dentry *root)
>  {
> -	struct dentry *root, *entry;
> -
> -	root = debugfs_create_dir("docg3", NULL);
>  	if (!root)
>  		return -ENOMEM;
>  
> -	entry = debugfs_create_file("flashcontrol", S_IRUSR, root, docg3,
> -				  &flashcontrol_fops);
> -	if (entry)
> -		entry = debugfs_create_file("asic_mode", S_IRUSR, root,
> -					    docg3, &asic_mode_fops);
> -	if (entry)
> -		entry = debugfs_create_file("device_id", S_IRUSR, root,
> -					    docg3, &device_id_fops);
> -	if (entry)
> -		entry = debugfs_create_file("protection", S_IRUSR, root,
> -					    docg3, &protection_fops);
> -	if (entry) {
> -		docg3->debugfs_root = root;

You should also kill the ->debugfs_root field in struct doc3g [1].

> -		return 0;
> -	} else {
> -		debugfs_remove_recursive(root);
> -		return -ENOMEM;
> -	}
> +	debugfs_create_file("flashcontrol", S_IRUSR, root, docg3,
> +			    &flashcontrol_fops);
> +	debugfs_create_file("asic_mode", S_IRUSR, root, docg3,
> +			    &asic_mode_fops);
> +	debugfs_create_file("device_id", S_IRUSR, root, docg3,
> +			    &device_id_fops);
> +	debugfs_create_file("protection", S_IRUSR, root, docg3,
> +			    &protection_fops);
> +
> +	return 0;
>  }
>  
>  static void doc_dbg_unregister(struct docg3 *docg3)
>  {
> -	debugfs_remove_recursive(docg3->debugfs_root);
>  }

You can kill this function.

>  
>  /**
> @@ -2121,7 +2109,7 @@ static int __init docg3_probe(struct platform_device *pdev)
>  		goto err_probe;
>  
>  	platform_set_drvdata(pdev, cascade);
> -	doc_dbg_register(cascade->floors[0]->priv);
> +	doc_dbg_register(mtd->dbg.dfs_dir);
>  	return 0;
>  
>  notfound:
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 1517da3ddd7d..cf501adbd303 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -40,6 +40,7 @@
>  #include <linux/slab.h>
>  #include <linux/reboot.h>
>  #include <linux/leds.h>
> +#include <linux/debugfs.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> @@ -652,6 +653,7 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>   */
>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  {
> +	mtd->dbg.dfs_dir = NULL;

This is not needed? The core expect all callers to allocate their MTD
dev with kzalloc(), so all fields that are not explicitly set should be
NULL (or 0).

>  	if (mtd->dev.parent) {
>  		if (!mtd->owner && mtd->dev.parent->driver)
>  			mtd->owner = mtd->dev.parent->driver->owner;
> @@ -662,6 +664,8 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  	}
>  }
>  
> +static struct dentry *dfs_dir_mtd;
> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD device.
>   *
> @@ -701,6 +705,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  
>  	mtd_set_dev_defaults(mtd);
>  
> +	if (dfs_dir_mtd) {
> +		mtd->dbg.dfs_dir = debugfs_create_dir(mtd->name, dfs_dir_mtd);
> +		if (IS_ERR(mtd->dbg.dfs_dir)) {
> +			pr_debug("mtd device %s won't show data in debugfs\n",
> +				 mtd->name);
> +			mtd->dbg.dfs_dir = NULL;

Are you sure you need to explicitly set it to NULL? debugfs API seems
to gracefully handle the IS_ERR() case (see [2] or [2].

> +		}
> +	}
> +
>  	memset(&parsed, 0, sizeof(parsed));
>  
>  	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
> @@ -740,6 +753,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  out:
>  	/* Cleanup any parsed partitions */
>  	mtd_part_parser_cleanup(&parsed);
> +	if (ret)
> +		debugfs_remove_recursive(mtd->dbg.dfs_dir);

Actually, if you move the dbg.dfs_dir creation after
mtd_add_device_partitions(), and only do it if this operation
succeeded, you don't have to remove it here in case of failure.

It's even better to leave it as an ERR ptr, to avoid creating files at
the root of the debugfs FS.

>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> @@ -754,6 +769,8 @@ int mtd_device_unregister(struct mtd_info *master)
>  {
>  	int err;
>  
> +	debugfs_remove_recursive(master->dbg.dfs_dir);
> +
>  	if (master->_reboot)
>  		unregister_reboot_notifier(&master->reboot_notifier);
>  
> @@ -1807,6 +1824,10 @@ static int __init init_mtd(void)
>  
>  	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
>  
> +	dfs_dir_mtd = debugfs_create_dir("mtd", NULL);
> +	if (IS_ERR(dfs_dir_mtd))
> +		dfs_dir_mtd = NULL;
> +
>  	ret = init_mtdchar();
>  	if (ret)
>  		goto out_procfs;
> @@ -1816,6 +1837,7 @@ static int __init init_mtd(void)
>  out_procfs:
>  	if (proc_mtd)
>  		remove_proc_entry("mtd", NULL);
> +	debugfs_remove(dfs_dir_mtd);
>  	bdi_put(mtd_bdi);
>  err_bdi:
>  	class_unregister(&mtd_class);
> @@ -1826,6 +1848,7 @@ static int __init init_mtd(void)
>  
>  static void __exit cleanup_mtd(void)
>  {
> +	debugfs_remove_recursive(dfs_dir_mtd);
>  	cleanup_mtdchar();
>  	if (proc_mtd)
>  		remove_proc_entry("mtd", NULL);
> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
> index 55fdb8e1fd2a..b5d095d24087 100644
> --- a/drivers/mtd/mtdcore.h
> +++ b/drivers/mtd/mtdcore.h
> @@ -19,6 +19,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
>  
>  void mtd_part_parser_cleanup(struct mtd_partitions *parts);
>  
> +extern struct dentry *debug_mtd;

This symbol does not exist.

> +
>  int __init init_mtdchar(void);
>  void __exit cleanup_mtdchar(void);
>  
> diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> index f12879a3d4ff..8d096be702cd 100644
> --- a/drivers/mtd/mtdswap.c
> +++ b/drivers/mtd/mtdswap.c
> @@ -138,8 +138,6 @@ struct mtdswap_dev {
>  
>  	char *page_buf;
>  	char *oob_buf;
> -
> -	struct dentry *debugfs_root;
>  };
>  
>  struct mtdswap_oobdata {
> @@ -1318,26 +1316,16 @@ static int mtdswap_add_debugfs(struct mtdswap_dev *d)
>  	struct gendisk *gd = d->mbd_dev->disk;
>  	struct device *dev = disk_to_dev(gd);
>  
> -	struct dentry *root;
> +	struct dentry *root = d->mtd->dbg.dfs_dir;
>  	struct dentry *dent;
>  
> -	root = debugfs_create_dir(gd->disk_name, NULL);
> -	if (IS_ERR(root))
> -		return 0;
> -
> -	if (!root) {
> -		dev_err(dev, "failed to initialize debugfs\n");
> +	if (!root)

If you do not set mtd->dbg.dfs_dir to NULL in case of error, it should
be:

	if (IS_ERR(root))

>  		return -1;
> -	}
> -
> -	d->debugfs_root = root;
>  
>  	dent = debugfs_create_file("stats", S_IRUSR, root, d,
>  				&mtdswap_fops);
>  	if (!dent) {
>  		dev_err(d->dev, "debugfs_create_file failed\n");
> -		debugfs_remove_recursive(root);
> -		d->debugfs_root = NULL;
>  		return -1;
>  	}
>  
> @@ -1540,7 +1528,6 @@ static void mtdswap_remove_dev(struct mtd_blktrans_dev *dev)
>  {
>  	struct mtdswap_dev *d = MTDSWAP_MBD_TO_MTDSWAP(dev);
>  
> -	debugfs_remove_recursive(d->debugfs_root);
>  	del_mtd_blktrans_dev(dev);
>  	mtdswap_cleanup(d);
>  	kfree(d);
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 03a0d057bf2f..29f800cc5320 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -525,40 +525,26 @@ static const struct file_operations dfs_fops = {
>  static int nandsim_debugfs_create(struct nandsim *dev)
>  {
>  	struct nandsim_debug_info *dbg = &dev->dbg;
> +	struct dentry *root = nsmtd->dbg.dfs_dir;
>  	struct dentry *dent;
>  
> -	if (!IS_ENABLED(CONFIG_DEBUG_FS))
> +	if (!root)

	if (IS_ERR(root)

>  		return 0;
>  
> -	dent = debugfs_create_dir("nandsim", NULL);
> -	if (!dent) {
> -		NS_ERR("cannot create \"nandsim\" debugfs directory\n");
> -		return -ENODEV;
> -	}
> -	dbg->dfs_root = dent;
> -
>  	dent = debugfs_create_file("wear_report", S_IRUSR,
> -				   dbg->dfs_root, dev, &dfs_fops);
> -	if (!dent)
> -		goto out_remove;
> +				   root, dev, &dfs_fops);
> +	if (!dent || IS_ERR(dent)) {
> +		dent = NULL;
> +		NS_ERR("cannot create \"wear_report\" debugfs entry\n");
> +	}
>  	dbg->dfs_wear_report = dent;
>  
>  	return 0;
>  
>  out_remove:
> -	debugfs_remove_recursive(dbg->dfs_root);
>  	return -ENODEV;
>  }
>  
> -/**
> - * nandsim_debugfs_remove - destroy all debugfs files
> - */
> -static void nandsim_debugfs_remove(struct nandsim *ns)
> -{
> -	if (IS_ENABLED(CONFIG_DEBUG_FS))
> -		debugfs_remove_recursive(ns->dbg.dfs_root);
> -}
> -
>  /*
>   * Allocate array of page pointers, create slab allocation for an array
>   * and initialize the array by NULL pointers.
> @@ -2395,7 +2381,6 @@ static void __exit ns_cleanup_module(void)
>  	struct nandsim *ns = nand_get_controller_data(chip);
>  	int i;
>  
> -	nandsim_debugfs_remove(ns);

Please kill struct nandsim_debug_info and the ->dbg field in struct
nandsim.

>  	free_nandsim(ns);    /* Free nandsim private resources */
>  	nand_release(nsmtd); /* Unregister driver */
>  	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f8a2ef239c60..6cd0f6b7658b 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -206,6 +206,15 @@ struct mtd_pairing_scheme {
>  
>  struct module;	/* only needed for owner field in mtd_info */
>  
> +/**
> + * struct mtd_debug_info - debugging information for an MTD device.
> + *
> + * @dfs_dir: direntry object of the MTD device debugfs directory
> + */
> +struct mtd_debug_info {
> +	struct dentry *dfs_dir;
> +};
> +
>  struct mtd_info {
>  	u_char type;
>  	uint32_t flags;
> @@ -346,6 +355,7 @@ struct mtd_info {
>  	struct module *owner;
>  	struct device dev;
>  	int usecount;
> +	struct mtd_debug_info dbg;
>  };
>  
>  int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/devices/docg3.h#L315
[2]http://elixir.free-electrons.com/linux/latest/source/fs/debugfs/inode.c#L687
[3]http://elixir.free-electrons.com/linux/latest/source/fs/debugfs/inode.c#L294
