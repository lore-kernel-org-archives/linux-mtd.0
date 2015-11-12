Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwfYk-0001wk-F1
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 00:16:15 +0000
Received: by pabfh17 with SMTP id fh17so45655503pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 16:15:53 -0800 (PST)
Date: Wed, 11 Nov 2015 16:15:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Han Xu <han.xu@freescale.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/11] mtd: assign mtd->dev.of_node when creating
 partition devices
Message-ID: <20151112001550.GD96199@google.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446424721-23471-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446424721-23471-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 01:38:41AM +0100, Boris Brezillon wrote:
> MTD partitions may have been created from a DT definition, and in this case
> the ->of_node of the struct device embedded in mtd_info should point to
> the DT node that was used to create the partition.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

I like the idea of this patch, but I'm not sure about all of its
details.

> ---
> Hi Brian,
> 
> Yet another patch that IMO should go into your "mtd: migrate 'of_node'
> handling to core, not in mtd_part_parser_data" series.
> 
> Best Regards,
> 
> Boris
> 
>  drivers/mtd/mtdcore.c          | 17 +++++++++++++----
>  drivers/mtd/mtdpart.c          |  3 +++
>  drivers/mtd/ofpart.c           |  1 +
>  include/linux/mtd/partitions.h |  1 +
>  4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index b1eea48..6101288 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -32,6 +32,7 @@
>  #include <linux/err.h>
>  #include <linux/ioctl.h>
>  #include <linux/init.h>
> +#include <linux/of.h>
>  #include <linux/proc_fs.h>
>  #include <linux/idr.h>
>  #include <linux/backing-dev.h>
> @@ -584,11 +585,13 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  			      const struct mtd_partition *parts,
>  			      int nr_parts)
>  {
> -	int ret;
> +	int ret, i;
>  	struct mtd_partition *real_parts = NULL;
>  
>  	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
> -	if (ret <= 0 && nr_parts && parts) {
> +	if (ret > 0) {
> +		nr_parts = ret;
> +	} else if (nr_parts && parts) {
>  		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
>  				     GFP_KERNEL);
>  		if (!real_parts)
> @@ -604,7 +607,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  		ret = 0;
>  	}
>  
> -	ret = mtd_add_device_partitions(mtd, real_parts, ret);
> +	ret = mtd_add_device_partitions(mtd, real_parts, nr_parts);
>  	if (ret)
>  		goto out;
>  
> @@ -623,7 +626,13 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  	}
>  
>  out:
> -	kfree(real_parts);
> +	if (real_parts) {
> +		for (i = 0; i < nr_parts; i++)
> +			of_node_put(real_parts[i].of_node);
> +
> +		kfree(real_parts);
> +	}
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index f8ba153..95f3a0d 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -29,6 +29,7 @@
>  #include <linux/kmod.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/of.h>
>  #include <linux/err.h>
>  #include <linux/kconfig.h>
>  
> @@ -319,6 +320,7 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  
>  static inline void free_partition(struct mtd_part *p)
>  {
> +	of_node_put(mtd_get_of_node(&p->mtd));
>  	kfree(p->mtd.name);
>  	kfree(p);
>  }
> @@ -391,6 +393,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
>  				&master->dev :
>  				master->dev.parent;
> +	mtd_set_of_node(&slave->mtd, of_node_get(part->of_node));
>  
>  	slave->mtd._read = part_read;
>  	slave->mtd._write = part_write;
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index f78d2ae..5c64e04 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -111,6 +111,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  		if (of_get_property(pp, "lock", &len))
>  			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
>  
> +		(*pparts)[i].of_node = of_node_get(pp);

I don't think we should mix up too much of the error handling between
ofpart.c and mtdcore.c (right now, you do of_node_get() here but the
of_node_put() is forced into mtdcore.c). I think the problem here is the
same as the problem with Linus' patch here:

http://lists.infradead.org/pipermail/linux-mtd/2015-November/063219.html

It's just too easy to leak resources when MTD parsers don't have their
own cleanup functions (like C++ destructors, or the driver model's
remove() function, or so many other resource models). If we had a
cleanup function, then we could just put the release handling there.

But actually, I don't think we need to 'get' the property here; we only
need to 'get' it when we're putting it somewhere that will actually use
it long term. i.e., when it actually gets assigned to the
mtd.dev.of_node field and is headed for sysfs.

IOW, I think we can grab the reference in add_mtd_device() and drop it
in del_mtd_device(). This would handle both the partition and
non-partition case the same.

I have a patch to do that (for the non-partition case) queued up. I'll
push it out soon, then I expect you can make this patch a lot simpler.

Brian

>  		i++;
>  	}
>  
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 773975a..282644c 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -42,6 +42,7 @@ struct mtd_partition {
>  	uint64_t offset;		/* offset within the master MTD space */
>  	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
>  	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
> +	struct device_node *of_node;	/* OF node attached to the partition */
>  };
>  
>  #define MTDPART_OFS_RETAIN	(-3)
> -- 
> 2.1.4
> 
