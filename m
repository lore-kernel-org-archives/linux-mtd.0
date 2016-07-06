Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKmyC-0003E8-Ku
 for linux-mtd@lists.infradead.org; Wed, 06 Jul 2016 13:34:32 +0000
Date: Wed, 6 Jul 2016 15:34:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 2/5] mtd: nand: Propagate mtd_device_unregister() return
 value in tear down
Message-ID: <20160706153406.64822eb4@bbrezillon>
In-Reply-To: <1467669983-12105-3-git-send-email-richard@nod.at>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-3-git-send-email-richard@nod.at>
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

On Tue,  5 Jul 2016 00:06:20 +0200
Richard Weinberger <richard@nod.at> wrote:

> Provide a __nand_release() function for drivers which can deal
> with a failing nand release operation.
> Most drivers should be safe since they rely on module refcounting.
> To catch outliers implement a nand_release() with a WARN_ON().
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/nand/nand_base.c | 15 ++++++++++-----
>  include/linux/mtd/nand.h     | 12 +++++++++++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0b0dc29..5b9b65b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4601,19 +4601,22 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
>  EXPORT_SYMBOL(nand_scan);
>  
>  /**
> - * nand_release - [NAND Interface] Free resources held by the NAND device
> + * __nand_release - [NAND Interface] Free resources held by the NAND device
>   * @mtd: MTD device structure
>   */
> -void nand_release(struct mtd_info *mtd)
> +int __nand_release(struct mtd_info *mtd)

Can we find a better name? nand_release_safe()?

>  {
> +	int ret;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> +	ret = mtd_device_unregister(mtd);
> +	if (ret)
> +		return ret;
> +

The question is, should we unregister the MTD device in nand_release().
It feels a bit odd to have nand_scan_xxx() functions only doing the
nand_chip initialization and letting the NAND controller driver
register the MTD device, and have nand_release() unregister the MTD
device for us.

Maybe we should export a nand_cleanup() function that would just
release nand_chip resources and let NAND controller drivers that
really care about mtd_device_unregister() return code call it
themselves before calling nand_cleanup() (instead of calling
nand_release()).

>  	if (chip->ecc.mode == NAND_ECC_SOFT &&
>  	    chip->ecc.algo == NAND_ECC_BCH)
>  		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
>  
> -	mtd_device_unregister(mtd);
> -
>  	/* Free bad block table memory */
>  	kfree(chip->bbt);
>  	if (!(chip->options & NAND_OWN_BUFFERS))
> @@ -4623,8 +4626,10 @@ void nand_release(struct mtd_info *mtd)
>  	if (chip->badblock_pattern && chip->badblock_pattern->options
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
> +
> +	return 0;
>  }
> -EXPORT_SYMBOL_GPL(nand_release);
> +EXPORT_SYMBOL_GPL(__nand_release);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index fbe8e16..b3554ec 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -39,7 +39,7 @@ extern int nand_scan_ident(struct mtd_info *mtd, int max_chips,
>  extern int nand_scan_tail(struct mtd_info *mtd);
>  
>  /* Free resources held by the NAND device */
> -extern void nand_release(struct mtd_info *mtd);
> +extern int __nand_release(struct mtd_info *mtd);
>  
>  /* Internal helper for board drivers which need to override command function */
>  extern void nand_wait_ready(struct mtd_info *mtd);
> @@ -1022,6 +1022,16 @@ static inline int jedec_feature(struct nand_chip *chip)
>  		: 0;
>  }
>  
> +static inline void nand_release(struct mtd_info *mtd)
> +{
> +	/*
> +	 * If you face this warning your driver is doing something bad.
> +	 * Don't issue nand_release() when your MTD is in use.
> +	 * Use __nand_release() and handle the error correctly.
> +	 */
> +	WARN_ON(__nand_release(mtd) != 0);
> +}
> +
>  /*
>   * struct nand_sdr_timings - SDR NAND chip timings
>   *
