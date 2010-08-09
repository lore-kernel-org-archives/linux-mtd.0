Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiR21-00062Y-VN
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 12:00:42 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
References: <350720.60481.qm@web180309.mail.gq1.yahoo.com>	<1280920127.19499.20.camel@localhost>	<000401cb3533$5c982470$15c86d50$@raj@ti.com>
	<1281270198.19967.258.camel@macbook.infradead.org>
In-Reply-To: <1281270198.19967.258.camel@macbook.infradead.org>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
Date: Mon, 9 Aug 2010 17:25:13 +0530
Message-ID: <006e01cb37b9$b9d25d80$2d771880$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	'David Brownell' <david-b@pacbell.net>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	'Nicolas Pitre' <nico@fluxnic.net>,
	'Kevin Hilman' <khilman@deeprootsystems.com>, linux-kernel@vger.kernel.org,
	'David Howells' <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Sun, Aug 08, 2010 at 17:53:18, David Woodhouse wrote:
> On Fri, 2010-08-06 at 12:18 +0530, Sudhakar Rajashekhara wrote:
> > 
> > Thanks for the feedback. I'll be re-working on this patch and will
> > re-post
> > the updated patch soon. 
> 
> Start with this, perhaps...
> 
> Subject: mtd/partitions: Add add_mtd_partitions_ret() function
> 
> Some callers want access to the MTD devices which get registered for
> them when they call add_mtd_partitions(). Add a variant on the function
> which does that.
> 
> Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 4c539de..b9ee79b 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -522,26 +522,36 @@ out_register:
>   * for reasons of data integrity.
>   */
>  
> -int add_mtd_partitions(struct mtd_info *master,
> -		       const struct mtd_partition *parts,
> -		       int nbparts)
> +int add_mtd_partitions_ret(struct mtd_info *master,
> +			   const struct mtd_partition *parts,
> +			   int nbparts, struct mtd_info ***mtds_ret)
>  {
>  	struct mtd_part *slave;
>  	uint64_t cur_offset = 0;
> +	struct mtd_info **mtds = NULL;
>  	int i;
>  
>  	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
>  
> +	if (mtds_ret) {
> +		mtds = kmalloc(sizeof(*mtds) * nbparts, GFP_KERNEL);
> +		if (!mtds)
> +			return -ENOMEM;
> +	}
>  	for (i = 0; i < nbparts; i++) {
>  		slave = add_one_partition(master, parts + i, i, cur_offset);
> -		if (!slave)
> +		if (!slave) {
> +			kfree(mtds);
>  			return -ENOMEM;
> +		}
>  		cur_offset = slave->offset + slave->mtd.size;
>  	}
>  
> +	if (mtds_ret)
> +		*mtds_ret = mtds;
>  	return 0;
>  }
> -EXPORT_SYMBOL(add_mtd_partitions);
> +EXPORT_SYMBOL_GPL(add_mtd_partitions_ret);
>  
>  static DEFINE_SPINLOCK(part_parser_lock);
>  static LIST_HEAD(part_parsers);
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 274b619..f7935fa 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -49,9 +49,12 @@ struct mtd_partition {
>  
>  struct mtd_info;
>  
> -int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
> +int add_mtd_partitions_ret(struct mtd_info *, const struct mtd_partition *, int,
> +			   struct mtd_info ***);
>  int del_mtd_partitions(struct mtd_info *);
>  
> +#define add_mtd_partitions(m, p, n) add_mtd_partitions_ret(m, p, n, NULL)
> +
>  /*
>   * Functions dealing with the various ways of partitioning the space
>   */
> 
> -- 

Thanks very much for this piece of code, it reduced my work. But while working
on this, I found out that, for m25p80 device, the MTD device is available even
for the add_mtd_partitions() case. So the method to read the MAC address remains
same both for un-partitioned and partitioned MTD device. I'll post the modified
patch tomorrow. I'll be looking forward to hearing your comments on that patch
as well.

Thanks,
Sudhakar 
