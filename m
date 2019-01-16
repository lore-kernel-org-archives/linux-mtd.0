From: miquel.raynal@bootlin.com (Miquel Raynal)
Date: Wed, 16 Jan 2019 11:04:57 +0100
Subject: [PATCH] mtd: spinand: Add support for all Toshiba Memory products
In-Reply-To: <20190116055319.2755-1-tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
References: <20190116055319.2755-1-tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
Message-ID: <20190116110457.6ca57d77@xps13>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Yoshio,

Yoshio Furuyama <tmcmc-mb-yfuruyama7@ml.toshiba.co.jp> wrote on Wed, 16
Jan 2019 14:53:19 +0900:

> Add device table for Toshiba Memory products.
> Also, generalize OOB layout structure and function names.
> 
> Signed-off-by: Yoshio Furuyama <tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
> 
> ---
>  drivers/mtd/nand/spi/toshiba.c |   79 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index 0812655..0916962 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -25,19 +25,19 @@ static SPINAND_OP_VARIANTS(write_cache_variants,
>  static SPINAND_OP_VARIANTS(update_cache_variants,
>  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>  
> -static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info *mtd, int section,
> +static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				     struct mtd_oob_region *region)
>  {
> -	if (section > 7)
> +	if (section > 0)
>  		return -ERANGE;
>  
> -	region->offset = 128 + 16 * section;
> -	region->length = 16;
> +	region->offset = mtd->oobsize / 2;
> +	region->length = mtd->oobsize / 2;
>  
>  	return 0;
>  }
>  
> -static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
> +static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
>  				      struct mtd_oob_region *region)
>  {
>  	if (section > 0)
> @@ -45,17 +45,17 @@ static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
>  
>  	/* 2 bytes reserved for BBM */
>  	region->offset = 2;
> -	region->length = 126;
> +	region->length = mtd->oobsize / 2 - 2;

I know this is valid C but I am always puzzled when reading such
mathematical operation, I would prefer (mtd->oobsize / 2) - 2.

I'm fine with the rest so if there is no other comment I will fix when
applying.


Thanks,
Miqu?l
