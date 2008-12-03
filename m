Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7tyy-0006yn-2f
	for linux-mtd@lists.infradead.org; Wed, 03 Dec 2008 15:49:44 +0000
Message-Id: <4A183575-1142-4EC2-83C4-145E721E6E8D@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20081126163840.GA21669@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [PATCH for 2.6.28] NAND: fsl_upm: fix build problem with
	2.6.28-rc2
Date: Wed, 3 Dec 2008 09:47:53 -0600
References: <20081126163840.GA21669@oksana.dev.rtsoft.ru>
Cc: linux-kernel Kernel <linux-kernel@vger.kernel.org>,
	linux-ppc list <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Anton Vorontsov <avorontsov@ru.mvista.com>,
	Wolfgang Grandegger <wg@grandegger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Nov 26, 2008, at 10:38 AM, Anton Vorontsov wrote:

> From: Wolfgang Grandegger <wg@grandegger.com>
>
> The patch fixes following build error:
>
>  CC      drivers/mtd/nand/fsl_upm.o
> drivers/mtd/nand/fsl_upm.c: In function 'fun_chip_init':
> drivers/mtd/nand/fsl_upm.c:168: warning: passing argument 2 of  
> 'of_mtd_parse_partitions' from incompatible pointer type
> drivers/mtd/nand/fsl_upm.c:168: warning: passing argument 3 of  
> 'of_mtd_parse_partitions' from incompatible pointer type
> drivers/mtd/nand/fsl_upm.c:168: error: too many arguments to  
> function 'of_mtd_parse_partitions'
> make[1]: *** [drivers/mtd/nand/fsl_upm.o] Error 1
>
> The breakage was introduced in  
> 69fd3a8d098faf41a04930afa83757c0555ee360
> ("[MTD] remove unused mtd parameter in of_mtd_parse_partitions()").
>
> While at it, also add a check for the of_mtd_parse_partitions() return
> value.
>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> ---
> drivers/mtd/nand/fsl_upm.c |    8 +++++---
> 1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 024e3ff..a83192f 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -163,9 +163,11 @@ static int __devinit fun_chip_init(struct  
> fsl_upm_nand *fun,
> 	ret = parse_mtd_partitions(&fun->mtd, part_types, &fun->parts, 0);
>
> #ifdef CONFIG_MTD_OF_PARTS
> -	if (ret == 0)
> -		ret = of_mtd_parse_partitions(fun->dev, &fun->mtd,
> -					      flash_np, &fun->parts);
> +	if (ret == 0) {
> +		ret = of_mtd_parse_partitions(fun->dev, flash_np, &fun->parts);
> +		if (ret < 0)
> +			goto err;
> +	}
> #endif
> 	if (ret > 0)
> 		ret = add_mtd_partitions(&fun->mtd, fun->parts, ret);
> -- 
> 1.5.6.5

David,

what's going on with this patch?

- k
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
