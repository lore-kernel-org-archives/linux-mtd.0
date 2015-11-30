Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Sgc-0007kd-Ct
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 17:56:26 +0000
Date: Mon, 30 Nov 2015 18:56:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] mtd: untangle error codes and number of partitions
Message-ID: <20151130185606.0095680e@bbrezillon>
In-Reply-To: <1447989997-108476-3-git-send-email-computersforpeace@gmail.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
 <1447989997-108476-3-git-send-email-computersforpeace@gmail.com>
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

On Thu, 19 Nov 2015 19:26:36 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> We're going to need to know how many partitions were registered, so
> let's disentangle the 'ret' and 'nr_parts' variables, so that nr_parts
> always represents the number of partitions we're registering.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 62f83b050978..c8d54948bbc1 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -592,23 +592,25 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  	struct mtd_partition *real_parts = NULL;
>  
>  	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
> -	if (ret <= 0 && nr_parts && parts) {
> +	if (ret > 0) {
> +		nr_parts = ret;
> +	} else if (ret <= 0 && nr_parts && parts) {
>  		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
>  				     GFP_KERNEL);
>  		if (!real_parts)
>  			ret = -ENOMEM;
>  		else
> -			ret = nr_parts;
> +			ret = 0;
>  	}
>  	/* Didn't come up with either parsed OR fallback partitions */
>  	if (ret < 0) {
>  		pr_info("mtd: failed to find partitions; one or more parsers reports errors (%d)\n",
>  			ret);
>  		/* Don't abort on errors; we can still use unpartitioned MTD */
> -		ret = 0;
> +		nr_parts = 0;
>  	}
>  
> -	ret = mtd_add_device_partitions(mtd, real_parts, ret);
> +	ret = mtd_add_device_partitions(mtd, real_parts, nr_parts);
>  	if (ret)
>  		goto out;
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
