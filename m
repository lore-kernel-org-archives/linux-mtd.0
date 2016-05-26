Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5puV-00007d-90
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 07:40:52 +0000
Date: Thu, 26 May 2016 09:40:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 moritz.fischer.private@gmail.com
Subject: Re: [PATCH] mtd: ofpart: Assign device node to partitions parsed
 with ofpart
Message-ID: <20160526094020.2fbda715@bbrezillon>
In-Reply-To: <1464136660-13222-1-git-send-email-moritz.fischer@ettus.com>
References: <1464136660-13222-1-git-send-email-moritz.fischer@ettus.com>
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

On Tue, 24 May 2016 17:37:40 -0700
Moritz Fischer <moritz.fischer@ettus.com> wrote:

> This patch adds a struct device_node pointer to struct mtd_partition.
> Partitions parsed via ofpart can now be referenced via devicetree.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Hi all,
> 
> during my work on another patch series for supporting
> otp regions as nvmem providers via dt (follow up series),
> I realized we don't actually assign node pointers.
> While not used for ofpart atm, I can see cases where having
> the pointer is useful to reference raw mtd partitions.
> I can also (re)submit this as part of my upcoming series for
> nvmem / otp support

Yep, that's probably better if you embed this patch in your series.

> 
> Cheers,
> 
> Moritz
> 
> ---
>  drivers/mtd/mtdpart.c          | 1 +
>  drivers/mtd/ofpart.c           | 1 +
>  include/linux/mtd/partitions.h | 4 ++++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 6778ba2..3af9cf5 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -439,6 +439,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  
>  	slave->mtd.name = name;
>  	slave->mtd.owner = master->owner;
> +	slave->mtd.dev.of_node = part->node;
>  
>  	/* NOTE: Historically, we didn't arrange MTDs as a tree out of
>  	 * concern for showing the same data in multiple partitions.
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 6127ee6..caeaef0 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -108,6 +108,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>  
>  		parts[i].offset = of_read_number(reg, a_cells);
>  		parts[i].size = of_read_number(reg + a_cells, s_cells);
> +		parts[i].node = pp;
>  
>  		partname = of_get_property(pp, "label", &len);
>  		if (!partname)
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 70736e1..51d36ac 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -31,6 +31,9 @@
>   * 	master MTD flag set for the corresponding MTD partition.
>   * 	For example, to force a read-only partition, simply adding
>   * 	MTD_WRITEABLE to the mask_flags will do the trick.
> + * node: contains device node pointer, necessary to reference device using
> + *	devicetree.
> +
>   *
>   * Note: writeable partitions require their size and offset be
>   * erasesize aligned (e.g. use MTDPART_OFS_NEXTBLK).
> @@ -41,6 +44,7 @@ struct mtd_partition {
>  	uint64_t size;			/* partition size */
>  	uint64_t offset;		/* offset within the master MTD space */
>  	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
> +	struct device_node *node;	/* pointer to the device node */
>  };
>  
>  #define MTDPART_OFS_RETAIN	(-3)



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
