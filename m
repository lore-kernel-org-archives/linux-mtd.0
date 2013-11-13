Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgiGQ-0006Gl-Rd
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 21:46:19 +0000
Received: by mail-ie0-f172.google.com with SMTP id to1so1527342ieb.17
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 13:45:54 -0800 (PST)
Date: Wed, 13 Nov 2013 13:45:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v3 2/4] mtd: nand: omap: optimize chip->ecc.calculate()
 for H/W ECC schemes
Message-ID: <20131113214548.GH9468@ld-irv-0074.broadcom.com>
References: <1383385576-26095-1-git-send-email-pekon@ti.com>
 <1383385576-26095-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383385576-26095-3-git-send-email-pekon@ti.com>
Cc: linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Sat, Nov 02, 2013 at 03:16:14PM +0530, Pekon Gupta wrote:
> chip->ecc.calculate() is used for calculating and fetching of ECC syndrome by
> processing the data passed during Read/Write accesses.
> 
> All H/W based ECC schemes supported in omap2-nand driver use GPMC controller
> to calculate ECC syndrome. But each BCHx_ECC scheme implements its own function
> to process and fetch ECC syndrom from GPMC controller.
> 
> This patch tries to merges the common code for different BCHx_ECC schemes into
> single omap_calculate_ecc_bch(), And adds schemes specific post-possessing
> after fetching ECC-syndrome. This removes redundant code and adds scalability
> for future ECC-schemes. This patch:
> - [un-touched]	omap_calculate_ecc():		Used for HAM1_ECC
> - [merged]	omap3_calculate_ecc_bch4():	Used for BCH4_HW_DETECTION_SW
> - [merged]	omap3_calculate_ecc_bch8():	Used for BCH8_HW_DETECTION_SW
> - [merged]	omap3_calculate_ecc_bch():	Used for BCH4_HW and BCH8_HW
> - [new]		omap_calculate_ecc_bch():	Now used for all BCHx_ECC

This patch looks pretty good. Good job simplifying some things. It still
looks like there is some more repetition that could be shortened, but
that may be a little more difficult of a task.

> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 245 ++++++++++++++++++-----------------------------
>  1 file changed, 92 insertions(+), 153 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index c946f22..1f59505 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -146,7 +146,11 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
>  	0xac, 0x6b, 0xff, 0x99, 0x7b};
>  static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
>  #endif
> -
> +#if defined(CONFIG_MTD_NAND_ECC_BCH) || defined(CONFIG_MTD_NAND_OMAP_BCH)
> +static u8  bch4_polynomial[] = {0x28, 0x13, 0xcc, 0x39, 0x96, 0xac, 0x7f};
> +static u8  bch8_polynomial[] = {0xef, 0x51, 0x2e, 0x09, 0xed, 0x93, 0x9a, 0xc2,
> +				0x97, 0x79, 0xe5, 0x24, 0xb5};
> +#endif
>  /* oob info generated runtime depending on ecc algorithm and layout selected */
>  static struct nand_ecclayout omap_oobinfo;
>  
> @@ -934,9 +938,11 @@ static int omap_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
>  	u32 val;
>  
>  	val = readl(info->reg.gpmc_ecc_config);
> -	if (((val >> ECC_CONFIG_CS_SHIFT)  & ~CS_MASK) != info->gpmc_cs)
> +	if (((val >> 1) & 0x07) != info->gpmc_cs) {

Why are you dropping the macros in favor of magic numbers? You do this
in a few places.

> +		pr_err("%s: invalid ECC configuration for chip-select=%d",
> +				DRIVER_NAME, info->gpmc_cs);
>  		return -EINVAL;
> -
> +	}
>  	/* read ecc result */
>  	val = readl(info->reg.gpmc_ecc1_result);
>  	*ecc_code++ = val;          /* P128e, ..., P1e */
> @@ -1125,172 +1131,105 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
...
>  
> -	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
> -	/*
> -	 * find BCH scheme used
> -	 * 0 -> BCH4
> -	 * 1 -> BCH8
> -	 */
> -	eccbchtsel = ((readl(info->reg.gpmc_ecc_config) >> 12) & 0x3);
> +	val = readl(info->reg.gpmc_ecc_config);
> +	if (((val >> 1) & 0x07) != info->gpmc_cs) {

This seems to be the same construct from earlier. Why not use the macros
that explain the shift and mask?

> +		pr_err("%s: invalid ECC configuration for chip-select=%d",
> +				DRIVER_NAME, info->gpmc_cs);
> +		return -EINVAL;
> +	}
> +	nsectors = ((readl(gpmc_regs->gpmc_ecc_config) >> 4) & 0x7) + 1;
>  
>  	for (i = 0; i < nsectors; i++) {
...

Brian
