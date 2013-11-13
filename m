Received: from mail-qe0-x22e.google.com ([2607:f8b0:400d:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vgj4l-00077h-9I
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 22:38:20 +0000
Received: by mail-qe0-f46.google.com with SMTP id s14so748234qeb.33
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 14:37:58 -0800 (PST)
Date: Wed, 13 Nov 2013 14:37:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v3 4/4] mtd: devices: elm: add checks ELM H/W
 constrains, driver code cleanup
Message-ID: <20131113223754.GJ9468@ld-irv-0074.broadcom.com>
References: <1383385576-26095-1-git-send-email-pekon@ti.com>
 <1383385576-26095-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383385576-26095-5-git-send-email-pekon@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 02, 2013 at 03:16:16PM +0530, Pekon Gupta wrote:
> ELM H/W engine is used by BCHx_ECC schemes for detecting and locating bit-flips.
> However, ELM H/W engine has some constrains like:
> - ELM can decode errors in chunks of 512 data bytes only
> - ELM can operate max upto 8 such buffers in parallel
> 
> This patch
> - add checks for above constrains
> - fixes ELM register configs based on number of info->eccsteps
> - cleans-up elm_load_syndrome()
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c         | 122 ++++++++++++++++++++++----------------
>  drivers/mtd/nand/omap2.c          |   2 +-
>  include/linux/platform_data/elm.h |   6 +-
>  3 files changed, 77 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index d1dd6a3..2167384 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -22,8 +22,11 @@
>  #include <linux/of.h>
>  #include <linux/sched.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
>  #include <linux/platform_data/elm.h>
>  
> +#define	DRIVER_NAME			"omap-elm"

The driver is actually named "elm", in the platform_driver struct.
Should you use the same name?

>  #define ELM_SYSCONFIG			0x010
>  #define ELM_IRQSTATUS			0x018
>  #define ELM_IRQENABLE			0x01c
> @@ -82,8 +85,10 @@ struct elm_info {
>  	void __iomem *elm_base;
>  	struct completion elm_completion;
>  	struct list_head list;
> +	struct mtd_info *mtd;
>  	enum bch_ecc bch_type;
>  	struct elm_registers elm_regs;
> +	int eccsteps;
>  };
>  
>  static LIST_HEAD(elm_devices);
> @@ -103,19 +108,42 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
>   * @dev:	ELM device
>   * @bch_type:	Type of BCH ecc
>   */
> -int elm_config(struct device *dev, enum bch_ecc bch_type)
> +int elm_config(struct device *dev, struct mtd_info *mtd,
> +		enum bch_ecc bch_type)
>  {
>  	u32 reg_val;
> -	struct elm_info *info = dev_get_drvdata(dev);
> -
> +	struct elm_info	 *info;
> +	struct nand_chip *chip;
> +	if (!dev) {
> +		pr_err("%s: ELM device not found\n", DRIVER_NAME);

How about defining pr_fmt(), so you don't have to repeat the DRIVER_NAME
boiler-plate?

> +		return -ENODEV;
> +	}
> +	info = dev_get_drvdata(dev);
>  	if (!info) {
> -		dev_err(dev, "Unable to configure elm - device not probed?\n");
> +		pr_err("%s: ELM device data not found\n", DRIVER_NAME);
>  		return -ENODEV;
>  	}
> -
> +	if (!mtd) {
> +		pr_err("%s: MTD device not found\n", DRIVER_NAME);
> +		return -ENODEV;
> +	}
> +	chip = mtd->priv;
> +	/* ELM supports error correction in chunks of 512bytes of data only
> +	 * where each 512bytes of data has its own ECC syndrome */
> +	if (chip->ecc.size != 512) {
> +		pr_err("%s: invalid ecc_size configuration", DRIVER_NAME);
> +		return -EINVAL;
> +	}
> +	if (mtd->writesize > 4096) {
> +		pr_err("%s: page-size > 4096 is not supported", DRIVER_NAME);
> +		return -EINVAL;
> +	}
> +	/* ELM eccsteps required to decode complete NAND page */
> +	info->mtd	= mtd;
> +	info->bch_type	= bch_type;
> +	info->eccsteps = mtd->writesize / chip->ecc.size;

Isn't this the same as chip->ecc.steps? Do we need to recalculate it
here?

>  	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
>  	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
> -	info->bch_type = bch_type;
>  
>  	return 0;
>  }
> @@ -152,55 +180,51 @@ static void elm_configure_page_mode(struct elm_info *info, int index,
>   * Load syndrome fragment registers with calculated ecc in reverse order.
>   */
>  static void elm_load_syndrome(struct elm_info *info,
> -		struct elm_errorvec *err_vec, u8 *ecc)
> +		struct elm_errorvec *err_vec, u8 *ecc_calc)
>  {
> +	struct nand_chip *chip	= info->mtd->priv;
> +	unsigned int eccbytes	= chip->ecc.bytes;
> +	u8 *ecc = ecc_calc;
>  	int i, offset;
>  	u32 val;
>  
> -	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
> -
> +	for (i = 0; i < info->eccsteps; i++) {
>  		/* Check error reported */
>  		if (err_vec[i].error_reported) {
>  			elm_configure_page_mode(info, i, true);
> -			offset = ELM_SYNDROME_FRAGMENT_0 +
> -				SYNDROME_FRAGMENT_REG_SIZE * i;
> -
> -			/* BCH8 */
> -			if (info->bch_type) {
> -
> -				/* syndrome fragment 0 = ecc[9-12B] */
> -				val = cpu_to_be32(*(u32 *) &ecc[9]);
> -				elm_write_reg(info, offset, val);
> -
> -				/* syndrome fragment 1 = ecc[5-8B] */
> -				offset += 4;
> -				val = cpu_to_be32(*(u32 *) &ecc[5]);
> -				elm_write_reg(info, offset, val);
> -
> -				/* syndrome fragment 2 = ecc[1-4B] */
> -				offset += 4;
> -				val = cpu_to_be32(*(u32 *) &ecc[1]);
> -				elm_write_reg(info, offset, val);
> -
> -				/* syndrome fragment 3 = ecc[0B] */
> -				offset += 4;
> -				val = ecc[0];
> -				elm_write_reg(info, offset, val);
> -			} else {
> -				/* syndrome fragment 0 = ecc[20-52b] bits */
> -				val = (cpu_to_be32(*(u32 *) &ecc[3]) >> 4) |
> -					((ecc[2] & 0xf) << 28);
> -				elm_write_reg(info, offset, val);
> -
> -				/* syndrome fragment 1 = ecc[0-20b] bits */
> -				offset += 4;
> -				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;
> -				elm_write_reg(info, offset, val);
> +			offset = SYNDROME_FRAGMENT_REG_SIZE * i;
> +			ecc = ecc_calc + (i * eccbytes);
> +			switch (info->bch_type) {
> +			case BCH4_ECC:
> +				val =	((*(ecc + 6) >>  4) & 0x0F) |
> +					*(ecc +  5) <<  4 | *(ecc +  4) << 12 |
> +					*(ecc +  3) << 20 | *(ecc +  2) << 28;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_0 +
> +						 offset), cpu_to_le32(val));
> +				val =	((*(ecc + 2) >>  4) & 0x0F) |
> +					*(ecc +  1) <<  4 | *(ecc +  0) << 12;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_1 +
> +						 offset), cpu_to_le32(val));
> +				break;
> +			case BCH8_ECC:
> +				val =	*(ecc + 12) << 0  | *(ecc + 11) <<  8 |
> +					*(ecc + 10) << 16 | *(ecc +  9) << 24;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_0 +
> +						 offset), cpu_to_le32(val));
> +				val =	*(ecc +  8) <<  0 | *(ecc +  7) <<  8 |
> +					*(ecc +  6) << 16 | *(ecc +  5) << 24;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_1 +
> +						 offset), cpu_to_le32(val));
> +				val =	*(ecc +  4) <<  0 | *(ecc +  3) <<  8 |
> +					*(ecc +  2) << 16 | *(ecc +  1) << 24;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_2 +
> +						 offset), cpu_to_le32(val));
> +				val =	*(ecc +  0) <<  0 & 0x000000FF;
> +				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_3 +
> +						 offset), cpu_to_le32(val));
> +				break;

That's some "interesting" shifting logic. But I think it looks OK...

>  			}
>  		}
> -
> -		/* Update ecc pointer with ecc byte size */
> -		ecc += info->bch_type ? BCH8_SIZE : BCH4_SIZE;
>  	}
>  }
>  
> @@ -223,7 +247,7 @@ static void elm_start_processing(struct elm_info *info,
>  	 * Set syndrome vector valid, so that ELM module
>  	 * will process it for vectors error is reported
>  	 */
> -	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
> +	for (i = 0; i < info->eccsteps; i++) {
>  		if (err_vec[i].error_reported) {
>  			offset = ELM_SYNDROME_FRAGMENT_6 +
>  				SYNDROME_FRAGMENT_REG_SIZE * i;
> @@ -252,7 +276,7 @@ static void elm_error_correction(struct elm_info *info,
>  	int offset;
>  	u32 reg_val;
>  
> -	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
> +	for (i = 0; i < info->eccsteps; i++) {
>  
>  		/* Check error reported */
>  		if (err_vec[i].error_reported) {
> @@ -263,14 +287,12 @@ static void elm_error_correction(struct elm_info *info,
>  			if (reg_val & ECC_CORRECTABLE_MASK) {
>  				offset = ELM_ERROR_LOCATION_0 +
>  					ERROR_LOCATION_SIZE * i;
> -

Random whitespace change? Might not belong in this patch.

>  				/* Read count of correctable errors */
>  				err_vec[i].error_count = reg_val &
>  					ECC_NB_ERRORS_MASK;
>  
>  				/* Update the error locations in error vector */
>  				for (j = 0; j < err_vec[i].error_count; j++) {
> -

Random whitespace change?

>  					reg_val = elm_read_reg(info, offset);
>  					err_vec[i].error_loc[j] = reg_val &
>  						ECC_ERROR_LOCATION_MASK;
> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
> index bf0a83b..d16465b 100644
> --- a/include/linux/platform_data/elm.h
> +++ b/include/linux/platform_data/elm.h
> @@ -25,6 +25,7 @@ enum bch_ecc {
>  
>  /* ELM support 8 error syndrome process */
>  #define ERROR_VECTOR_MAX		8
> +#define ELM_MAX_DETECTABLE_ERRORS	16

Why 16? Isn't 8 the actual max, with 4K page and 512B sector?

>  
>  #define BCH8_ECC_OOB_BYTES		13
>  #define BCH4_ECC_OOB_BYTES		7

Brian
