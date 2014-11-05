Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlvnR-0003T0-2B
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 08:18:29 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so313457pad.21
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 00:18:08 -0800 (PST)
Date: Wed, 5 Nov 2014 00:18:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 2/2] mtd: fsl_upm: Support NAND ECC DTS properties
Message-ID: <20141105081804.GD22361@norris-Latitude-E6410>
References: <2135487545.481347.1409098562105.JavaMail.zimbra@xes-inc.com>
 <716589480.189636.1409161543701.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <716589480.189636.1409161543701.JavaMail.zimbra@xes-inc.com>
Cc: Jordan Friendshuh <jfriendshuh@xes-inc.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 27, 2014 at 12:45:43PM -0500, Aaron Sierra wrote:
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 4d203e8..1fea897 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -160,6 +160,12 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	int ret;
>  	struct device_node *flash_np;
>  	struct mtd_part_parser_data ppdata;
> +	const char *mode;
> +	u32 strength;
> +
> +	flash_np = of_get_next_child(upm_np, NULL);
> +	if (!flash_np)
> +		return -ENODEV;
>  
>  	fun->chip.IO_ADDR_R = fun->io_base;
>  	fun->chip.IO_ADDR_W = fun->io_base;
> @@ -168,7 +174,28 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->chip.read_byte = fun_read_byte;
>  	fun->chip.read_buf = fun_read_buf;
>  	fun->chip.write_buf = fun_write_buf;
> -	fun->chip.ecc.mode = NAND_ECC_SOFT;
> +
> +	if (of_property_read_string(flash_np, "nand-ecc-mode", &mode) ||
> +	    !strcmp(mode, "soft")) {
> +		fun->chip.ecc.mode = NAND_ECC_SOFT;
> +	} else if (!strcmp(mode, "soft_bch")) {
> +		fun->chip.ecc.mode = NAND_ECC_SOFT_BCH;

Please use of_get_nand_ecc_mode() for the above.

> +	} else {
> +		dev_err(fun->dev, "ECC mode '%s' unsupported", mode);
> +		goto err;
> +	}
> +
> +	if (of_property_read_u32(flash_np, "nand-ecc-strength", &strength)) {

of_get_nand_ecc_strength()

> +		if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
> +			dev_err(fun->dev, "BCH ECC strength unspecified\n");
> +			goto err;
> +		}
> +	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT) {
> +		dev_warn(fun->dev, "Ignoring %d-bit software ECC\n", strength);
> +	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
> +		fun->chip.ecc.strength = strength;
> +	}
> +
>  	if (fun->mchip_count > 1)
>  		fun->chip.select_chip = fun_select_chip;
>  
> @@ -178,10 +205,6 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->mtd.priv = &fun->chip;
>  	fun->mtd.owner = THIS_MODULE;
>  
> -	flash_np = of_get_next_child(upm_np, NULL);
> -	if (!flash_np)
> -		return -ENODEV;
> -
>  	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
>  				  flash_np->name);
>  	if (!fun->mtd.name) {

Brian
