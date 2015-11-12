Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwnTI-0003xj-OP
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:43:09 +0000
Date: Thu, 12 Nov 2015 09:42:41 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Brian Foster
 <brian.foster@maximintegrated.com>
Subject: Re: [PATCH] mtd: partitions: kill unused ecclayout struct
Message-ID: <20151112094241.598944ec@bbrezillon>
In-Reply-To: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
References: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
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

On Wed, 11 Nov 2015 17:05:56 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> This field is not used.
> 
> Reported here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-October/062417.html
> 
> Reported-by: Brian Foster <brian.foster@maximintegrated.com>
> Cc: Brian Foster <brian.foster@maximintegrated.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Depends on this for killing its last use:
> 
>   http://patchwork.ozlabs.org/patch/543159/
> 
>  include/linux/mtd/partitions.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 282644c0c5c0..34388ced421a 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -41,7 +41,6 @@ struct mtd_partition {
>  	uint64_t size;			/* partition size */
>  	uint64_t offset;		/* offset within the master MTD space */
>  	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
> -	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
>  	struct device_node *of_node;	/* OF node attached to the partition */
>  };
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
