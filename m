Message-ID: <50BF3819.9010200@ti.com>
Date: Wed, 5 Dec 2012 17:33:37 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: omap2: Update nerrors using ecc.strength
References: <1354189595-12784-1-git-send-email-avinashphilip@ti.com>
 <1354189595-12784-2-git-send-email-avinashphilip@ti.com>
In-Reply-To: <1354189595-12784-2-git-send-email-avinashphilip@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: afzal@ti.com, linux-doc@vger.kernel.org, tony@atomide.com,
 artem.bityutskiy@linux.intel.com, devicetree-discuss@lists.ozlabs.org,
 broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org,
 gururaja.hebbar@ti.com, linux-mtd@lists.infradead.org,
 gregkh@linuxfoundation.org, rmk+kernel@arm.linux.org.uk,
 ivan.djelic@parrot.com, linux-omap@vger.kernel.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Avinash,

On 11/29/2012 5:16 PM, Philip, Avinash wrote:
> Update number of errors using nand ecc strength.
> Also add macro definitions BCH8_ERROR_MAX & BCH4_ERROR_MAX

Can you please describe why the original method of setting nerrors was
incorrect? Was it causing any issues in any particular configuration?
Mentioning this will help maintainers assign priority to your patch. If
this is a real bug affecting existing platforms, then there is a chance
this patch can get into v3.7 (or at least into v3.8-rc1).

Like Peter who commented on this before, I am not a fan of using macros
for self-describing constants - especially when you end up using the
same numbers inside the macro name itself. No need to resend any thing
just for this, you can wait to see if the maintainers are okay with it.

Thanks,
Sekhar

> 
> Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
> ---
> :100644 100644 359293e... 7e61dac... M	drivers/mtd/nand/omap2.c
>  drivers/mtd/nand/omap2.c |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 359293e..7e61dac 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -118,6 +118,9 @@
>  
>  #define OMAP24XX_DMA_GPMC		4
>  
> +#define BCH8_MAX_ERROR		8	/* upto 8 bit correctable */
> +#define BCH4_MAX_ERROR		4	/* upto 4 bit correctable */
> +
>  /* oob info generated runtime depending on ecc algorithm and layout selected */
>  static struct nand_ecclayout omap_oobinfo;
>  /* Define some generic bad / good block scan pattern which are used
> @@ -1042,7 +1045,7 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
>  	struct nand_chip *chip = mtd->priv;
>  	u32 val;
>  
> -	nerrors = (info->nand.ecc.bytes == 13) ? 8 : 4;
> +	nerrors = info->nand.ecc.strength;
>  	dev_width = (chip->options & NAND_BUSWIDTH_16) ? 1 : 0;
>  	nsectors = 1;
>  	/*
> @@ -1219,13 +1222,14 @@ static int omap3_init_bch(struct mtd_info *mtd, int ecc_opt)
>  	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
>  						   mtd);
>  #ifdef CONFIG_MTD_NAND_OMAP_BCH8
> -	const int hw_errors = 8;
> +	const int hw_errors = BCH8_MAX_ERROR;
>  #else
> -	const int hw_errors = 4;
> +	const int hw_errors = BCH4_MAX_ERROR;
>  #endif
>  	info->bch = NULL;
>  
> -	max_errors = (ecc_opt == OMAP_ECC_BCH8_CODE_HW) ? 8 : 4;
> +	max_errors = (ecc_opt == OMAP_ECC_BCH8_CODE_HW) ?
> +		BCH8_MAX_ERROR : BCH4_MAX_ERROR;
>  	if (max_errors != hw_errors) {
>  		pr_err("cannot configure %d-bit BCH ecc, only %d-bit supported",
>  		       max_errors, hw_errors);
> 
