Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzk7q-0002yZ-5d
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 13:54:51 +0000
Date: Wed, 4 Oct 2017 15:53:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: Re: [PATCH 1/2] mtd: Make sure MTD objects always have a valid
 debugfs dir
Message-ID: <20171004155342.32e096b8@bbrezillon>
In-Reply-To: <20171004135239.16316-1-boris.brezillon@free-electrons.com>
References: <20171004135239.16316-1-boris.brezillon@free-electrons.com>
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

On Wed,  4 Oct 2017 15:52:38 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Master MTD devices are not registered to MTD subsystem if they are
> exposing MTD partitions unless the CONFIG_MTD_PARTITIONED_MASTER option
> is enabled.
> 
> This lead to a weird situation where some MTD device drivers are trying
> to add debugfs files to the master MTD device, but this device has no
> valid debugfs directory.
> 
> Rework the core logic to do most of the MTD registration steps
> (including debugfs dir creation) except the registration to the device
> model, so that master devices are never exposed to the outside world
> but are still able to expose debugfs entries.
> 
> These devices will be exposed as mtd-hiddenX in the mtd debugfs dir.
> Note that X is unique within the hidden MTD device pool but can collide
> with ids of exposed MTD devs.
> 
> This commit fixes a bug introduced by commit e8e3edb95ce6 ("mtd: create
> per-device and module-scope debugfs entries") which is preventing
> nandsim from loading when CONFIG_DEBUG_FS is enabled.
> 
> Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")

Oops, I forgot

Reported-by: Richard Weinberger <richard@nod.at>

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/mtdcore.c   | 83 ++++++++++++++++++++++++++++++++-----------------
>  include/linux/mtd/mtd.h |  1 +
>  2 files changed, 56 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e7ea842ba3db..323e621f2eba 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -79,6 +79,10 @@ static struct class mtd_class = {
>  	.pm = MTD_CLS_PM_OPS,
>  };
>  
> +#define MTD_MAX_IDS		0x10000
> +#define MTD_ID_START		0x0
> +#define MTD_HIDDEN_ID_START	(MTD_ID_START + MTD_MAX_IDS)
> +
>  static DEFINE_IDR(mtd_idr);
>  
>  /* These are exported solely for the purpose of mtd_blkdevs.c. You
> @@ -88,7 +92,13 @@ EXPORT_SYMBOL_GPL(mtd_table_mutex);
>  
>  struct mtd_info *__mtd_next_device(int i)
>  {
> -	return idr_get_next(&mtd_idr, &i);
> +	struct mtd_info *mtd;
> +
> +	mtd = idr_get_next(&mtd_idr, &i);
> +	if (!mtd || i >= MTD_MAX_IDS)
> +		return NULL;
> +
> +	return mtd;
>  }
>  EXPORT_SYMBOL_GPL(__mtd_next_device);
>  
> @@ -505,7 +515,13 @@ int add_mtd_device(struct mtd_info *mtd)
>  	BUG_ON(mtd->writesize == 0);
>  	mutex_lock(&mtd_table_mutex);
>  
> -	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
> +	if (!mtd->hidden)
> +		i = idr_alloc(&mtd_idr, mtd, MTD_ID_START, MTD_MAX_IDS,
> +			      GFP_KERNEL);
> +	else
> +		i = idr_alloc(&mtd_idr, mtd, MTD_HIDDEN_ID_START,
> +			      MTD_HIDDEN_ID_START + MTD_MAX_IDS,
> +			      GFP_KERNEL);
>  	if (i < 0) {
>  		error = i;
>  		goto fail_locked;
> @@ -545,15 +561,20 @@ int add_mtd_device(struct mtd_info *mtd)
>  	/* Caller should have set dev.parent to match the
>  	 * physical device, if appropriate.
>  	 */
> -	mtd->dev.type = &mtd_devtype;
> -	mtd->dev.class = &mtd_class;
> -	mtd->dev.devt = MTD_DEVT(i);
> -	dev_set_name(&mtd->dev, "mtd%d", i);
>  	dev_set_drvdata(&mtd->dev, mtd);
>  	of_node_get(mtd_get_of_node(mtd));
> -	error = device_register(&mtd->dev);
> -	if (error)
> -		goto fail_added;
> +	if (!mtd->hidden) {
> +		mtd->dev.type = &mtd_devtype;
> +		mtd->dev.class = &mtd_class;
> +		mtd->dev.devt = MTD_DEVT(i);
> +		dev_set_name(&mtd->dev, "mtd%d", i);
> +		error = device_register(&mtd->dev);
> +		if (error)
> +			goto fail_added;
> +	} else {
> +		dev_set_name(&mtd->dev, "mtdmaster%d",
> +			     i - MTD_HIDDEN_ID_START);
> +	}
>  
>  	if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
>  		mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
> @@ -563,14 +584,16 @@ int add_mtd_device(struct mtd_info *mtd)
>  		}
>  	}
>  
> -	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
> -		      "mtd%dro", i);
> +	if (!mtd->hidden) {
> +		device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1,
> +			      NULL, "mtd%dro", i);
>  
> -	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
> -	/* No need to get a refcount on the module containing
> -	   the notifier, since we hold the mtd_table_mutex */
> -	list_for_each_entry(not, &mtd_notifiers, list)
> -		not->add(mtd);
> +		pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
> +		/* No need to get a refcount on the module containing
> +		   the notifier, since we hold the mtd_table_mutex */
> +		list_for_each_entry(not, &mtd_notifiers, list)
> +			not->add(mtd);
> +	}
>  
>  	mutex_unlock(&mtd_table_mutex);
>  	/* We _know_ we aren't being removed, because
> @@ -612,17 +635,20 @@ int del_mtd_device(struct mtd_info *mtd)
>  		goto out_error;
>  	}
>  
> -	/* No need to get a refcount on the module containing
> -		the notifier, since we hold the mtd_table_mutex */
> -	list_for_each_entry(not, &mtd_notifiers, list)
> -		not->remove(mtd);
> +	if (!mtd->hidden) {
> +		/* No need to get a refcount on the module containing
> +		   the notifier, since we hold the mtd_table_mutex */
> +		list_for_each_entry(not, &mtd_notifiers, list)
> +			not->remove(mtd);
> +	}
>  
>  	if (mtd->usecount) {
>  		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
>  		       mtd->index, mtd->name, mtd->usecount);
>  		ret = -EBUSY;
>  	} else {
> -		device_unregister(&mtd->dev);
> +		if (!mtd->hidden)
> +			device_unregister(&mtd->dev);
>  
>  		idr_remove(&mtd_idr, mtd->index);
>  		of_node_put(mtd_get_of_node(mtd));
> @@ -643,15 +669,16 @@ static int mtd_add_device_partitions(struct mtd_info *mtd,
>  	int nbparts = parts->nr_parts;
>  	int ret;
>  
> -	if (nbparts == 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
> -		ret = add_mtd_device(mtd);
> -		if (ret)
> -			return ret;
> -	}
> +	if (nbparts && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +		mtd->hidden = true;
> +
> +	ret = add_mtd_device(mtd);
> +	if (ret)
> +		return ret;
>  
>  	if (nbparts > 0) {
>  		ret = add_mtd_partitions(mtd, real_parts, nbparts);
> -		if (ret && IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +		if (ret)
>  			del_mtd_device(mtd);
>  		return ret;
>  	}
> @@ -857,7 +884,7 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
>  				break;
>  			}
>  		}
> -	} else if (num >= 0) {
> +	} else if (num >= MTD_ID_START && num < MTD_MAX_IDS) {
>  		ret = idr_find(&mtd_idr, num);
>  		if (mtd && mtd != ret)
>  			ret = NULL;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 6cd0f6b7658b..382c996b51df 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -268,6 +268,7 @@ struct mtd_info {
>  	unsigned int bitflip_threshold;
>  
>  	// Kernel-only stuff starts here.
> +	bool hidden;
>  	const char *name;
>  	int index;
>  
