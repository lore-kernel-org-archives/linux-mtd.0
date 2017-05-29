Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFIrc-0006Ea-6r
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 11:29:34 +0000
Date: Mon, 29 May 2017 13:29:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, yrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v7] mtd: create per-device and module-scope debugfs entries
Message-ID: <20170529132909.4ce0d5a4@bbrezillon>
In-Reply-To: <20170529102348.10307-1-mrugiero@gmail.com>
References: <20170516155616.26558-1-mrugiero@gmail.com>
 <20170529102348.10307-1-mrugiero@gmail.com>
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

On Mon, 29 May 2017 07:23:48 -0300
"Mario J. Rugiero" <mrugiero@gmail.com> wrote:

> Several MTD devices are using debugfs entries created in the root.
> This commit provides the means for a standardized subtree, creating
> one "mtd" entry at root, and one entry per device inside it, named
> after the device.
> The tree is registered in add_mtd_device, and released in
> del_mtd_device.
> Devices docg3, mtdswap and nandsim were updated to use this subtree
> instead of custom ones, and their entries were prefixed with the
> drivers' names.
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>

Almost good (see my comments below). Once addressed:

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> v7: - as per derRichard and bbrezillon suggestion, dev_names are used
>       instead of 'pretty' names for the entries, and driver-specific
>       entries are prefixed with the drivers' names.
> v6: - as per bbrezillon suggestion, more cleanups were done in the drivers,
>       removing now unused structure members and functions.
>     - dropped explicit setting to NULL to the dfs_dir member for the MTD,
>       as it is expected to be zeroed out, thanks again to bbrezillon for
>       pointing this out.
>     - removed an extern declaration of a symbol which was never defined,
>       spotted by bbrezillon.
> v5: - cleanup drivers creating their own debugfs sub-tree.
>     - separate the patch again, as it makes sense on its own as cleanup.
> v4: - include in a bigger patchset which explains the use of this tree.
> v3: - move the changelog out of the commit message
> v2: - remove unused macros and add a commit message
> v1: - create the debugfs entries
> 
>  drivers/mtd/devices/docg3.c | 49 +++++++++++++++-----------------------------
>  drivers/mtd/devices/docg3.h |  2 --
>  drivers/mtd/mtdcore.c       | 16 +++++++++++++++
>  drivers/mtd/mtdswap.c       | 18 ++++------------
>  drivers/mtd/nand/nandsim.c  | 50 ++++++++++++---------------------------------
>  include/linux/mtd/mtd.h     | 10 +++++++++
>  6 files changed, 60 insertions(+), 85 deletions(-)
> 

[...]

>  
>  struct mtdswap_oobdata {
> @@ -1318,26 +1316,19 @@ static int mtdswap_add_debugfs(struct mtdswap_dev *d)
>  	struct gendisk *gd = d->mbd_dev->disk;
>  	struct device *dev = disk_to_dev(gd);
>  
> -	struct dentry *root;
> +	struct dentry *root = d->mtd->dbg.dfs_dir;
>  	struct dentry *dent;
>  
> -	root = debugfs_create_dir(gd->disk_name, NULL);
> -	if (IS_ERR(root))
> +	if (!IS_ENABLED(CONFIG_DEBUGFS))

Should be CONFIG_DEBUG_FS and not CONFIG_DEBUGFS.

>  		return 0;
>  
> -	if (!root) {
> -		dev_err(dev, "failed to initialize debugfs\n");
> +	if (IS_ERR_OR_NULL(root))
>  		return -1;
> -	}
> -
> -	d->debugfs_root = root;
>  
> -	dent = debugfs_create_file("stats", S_IRUSR, root, d,
> +	dent = debugfs_create_file("mtdswap_stats", S_IRUSR, root, d,
>  				&mtdswap_fops);
>  	if (!dent) {
>  		dev_err(d->dev, "debugfs_create_file failed\n");
> -		debugfs_remove_recursive(root);
> -		d->debugfs_root = NULL;
>  		return -1;
>  	}

[...]

>  /*
> @@ -524,39 +517,23 @@ static const struct file_operations dfs_fops = {
>   */
>  static int nandsim_debugfs_create(struct nandsim *dev)
>  {
> -	struct nandsim_debug_info *dbg = &dev->dbg;
> +	struct dentry *root = nsmtd->dbg.dfs_dir;
>  	struct dentry *dent;
>  
> -	if (!IS_ENABLED(CONFIG_DEBUG_FS))
> +	if (!IS_ENABLED(CONFIG_DEBUGFS))

Ditto.
