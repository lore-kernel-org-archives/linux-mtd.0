Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ej4ek-0005aV-PZ
 for linux-mtd@lists.infradead.org; Tue, 06 Feb 2018 14:55:41 +0000
Date: Tue, 6 Feb 2018 15:55:08 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 2/6] mtd: nand: Use wrappers to call onfi GET/SET_FEATURES
Message-ID: <20180206155508.071dc8a1@bbrezillon>
In-Reply-To: <20180203095544.9855-3-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-3-miquel.raynal@bootlin.com>
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

Hi Miquel,

On Sat,  3 Feb 2018 10:55:40 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Miquel Raynal <miquel.raynal@free-electrons.com>
> 
> Prepare the fact that some features managed by GET/SET_FEATURES could be
> overloaded by vendor code. To handle this logic, use new wrappers
> instead of directly call the ->onfi_get/set_features() hooks.
> 
> Also take into account that not having the proper SET/GET_FEATURES
> available is not a reason to return an error. The wrappers that are
> created here handle this case by returning a special error code:
> -ENOTSUPP. More logic in the calling function of the new helpers
> (nand_setup_data_interface()) is added to handle this case).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c   | 145 ++++++++++++++++++++++++++---------------
>  drivers/mtd/nand/nand_micron.c |  16 ++---
>  include/linux/mtd/rawnand.h    |   3 +
>  3 files changed, 104 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 00111e669c11..8d2c37011979 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1160,6 +1160,52 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	return status;
>  }
>  
> +/**
> + * nand_get_features - wrapper to perform a GET_FEATURE
> + * @chip: NAND chip info structure
> + * @addr: feature address
> + * @subfeature_param: the subfeature parameters, a four bytes array
> + *
> + * Returns 0 for success, a negative error otherwise. Returns -ENOTSUPP if the
> + * operation cannot be handled.
> + */
> +int nand_get_features(struct nand_chip *chip, int addr,
> +		      u8 *subfeature_param)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	if (!chip->onfi_version ||
> +	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> +	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> +		return -ENOTSUPP;
> +
> +	return chip->onfi_get_features(mtd, chip, addr, subfeature_param);
> +}
> +EXPORT_SYMBOL_GPL(nand_get_features);
> +
> +/**
> + * nand_set_features - wrapper to perform a SET_FEATURE
> + * @chip: NAND chip info structure
> + * @addr: feature address
> + * @subfeature_param: the subfeature parameters, a four bytes array
> + *
> + * Returns 0 for success, a negative error otherwise. Returns -ENOTSUPP if the
> + * operation cannot be handled.
> + */
> +int nand_set_features(struct nand_chip *chip, int addr,
> +		      u8 *subfeature_param)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	if (!chip->onfi_version ||
> +	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> +	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> +		return -ENOTSUPP;
> +
> +	return chip->onfi_set_features(mtd, chip, addr, subfeature_param);
> +}
> +EXPORT_SYMBOL_GPL(nand_set_features);
> +
>  /**
>   * nand_reset_data_interface - Reset data interface and timings
>   * @chip: The NAND chip
> @@ -1215,59 +1261,62 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
>  static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> +	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
> +		chip->onfi_timing_mode_default,
> +	};
>  	int ret;
>  
>  	if (!chip->setup_data_interface)
>  		return 0;
>  
> +	/* Change the mode on the chip side */
> +	chip->select_chip(mtd, chipnr);
> +	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
> +				tmode_param);
> +	chip->select_chip(mtd, -1);
> +
>  	/*
> -	 * Ensure the timing mode has been changed on the chip side
> -	 * before changing timings on the controller side.
> +	 * Do not fail because the mode cannot explicitly be set. If the NAND
> +	 * chip claims it supports it, let's just apply the timings on the
> +	 * controller side.
>  	 */
> -	if (chip->onfi_version &&
> -	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
> -	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
> -		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
> -			chip->onfi_timing_mode_default,
> -		};
> -
> -		chip->select_chip(mtd, chipnr);
> -		ret = chip->onfi_set_features(mtd, chip,
> -				ONFI_FEATURE_ADDR_TIMING_MODE,
> -				tmode_param);
> -		chip->select_chip(mtd, -1);
> -		if (ret)
> -			return ret;
> -	}
> +	if (ret && ret != -ENOTSUPP)
> +		return ret;
>  
> +	/* Change the mode on the controller side */
>  	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
>  	if (ret)
>  		return ret;
>  
> -	if (chip->onfi_version &&
> -	    (le16_to_cpu(chip->onfi_params.opt_cmd) &
> -	     ONFI_OPT_CMD_SET_GET_FEATURES)) {
> -		u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {};
> +	/* Check the mode has been accepted by the chip */
> +	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
> +	chip->select_chip(mtd, chipnr);
> +	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
> +				tmode_param);
> +	chip->select_chip(mtd, -1);
> +	if (ret && ret != -ENOTSUPP)
> +		goto err_reset_chip;
>  
> -		chip->select_chip(mtd, chipnr);
> -		ret = chip->onfi_get_features(mtd, chip,
> -					      ONFI_FEATURE_ADDR_TIMING_MODE,
> -					      tmode_param);
> -		chip->select_chip(mtd, -1);
> -		if (ret)
> -			goto err_reset_chip;
> +	/*
> +	 * Do not fail because the mode could not be checked. However, skip the
> +	 * comparison block that would probably raise an error.
> +	 */
> +	if (ret == -ENOTSUPP)
> +		return 0;
>  
> -		if (tmode_param[0] != chip->onfi_timing_mode_default) {
> -			pr_warn("timings mode %d not acknowledged by the NAND chip\n",
> -				chip->onfi_timing_mode_default);
> -			goto err_reset_chip;
> -		}
> +	if (tmode_param[0] != chip->onfi_timing_mode_default) {
> +		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
> +			chip->onfi_timing_mode_default);
> +		goto err_reset_chip;
>  	}
>  
>  	return 0;
>  
>  err_reset_chip:
> -	/* Fallback to timing mode 0 */
> +	/*
> +	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
> +	 * timing mode.
> +	 */
>  	nand_reset_data_interface(chip, chipnr);
>  	chip->select_chip(mtd, chipnr);
>  	nand_reset_op(chip);
> @@ -4905,38 +4954,30 @@ static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
>  }
>  
>  /**
> - * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
> + * nand_set_features_default - [REPLACEABLE] set features for ONFI NAND
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
>   * @subfeature_param: the subfeature parameters, a four bytes array.
>   */
> -static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
> -			int addr, uint8_t *subfeature_param)
> +static int nand_set_features_default(struct mtd_info *mtd,
> +				     struct nand_chip *chip, int addr,
> +				     uint8_t *subfeature_param)

This name change is not mentioned in the commit message, and it's
probably something you should do in a separate patch. And how about
moving the default specifier just after nand_ =>
nand_default_set_features().

>  {
> -	if (!chip->onfi_version ||
> -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> -		return -EINVAL;
> -
>  	return nand_set_features_op(chip, addr, subfeature_param);
>  }
>  
>  /**
> - * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
> + * nand_get_features_default - [REPLACEABLE] get features for ONFI NAND
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
>   * @subfeature_param: the subfeature parameters, a four bytes array.
>   */
> -static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
> -			int addr, uint8_t *subfeature_param)
> +static int nand_get_features_default(struct mtd_info *mtd,
> +				     struct nand_chip *chip, int addr,
> +				     uint8_t *subfeature_param)

Ditto.

>  {
> -	if (!chip->onfi_version ||
> -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> -		return -EINVAL;
> -
>  	return nand_get_features_op(chip, addr, subfeature_param);
>  }
>  
> @@ -5015,9 +5056,9 @@ static void nand_set_defaults(struct nand_chip *chip)
>  
>  	/* set for ONFI nand */
>  	if (!chip->onfi_set_features)
> -		chip->onfi_set_features = nand_onfi_set_features;
> +		chip->onfi_set_features = nand_set_features_default;
>  	if (!chip->onfi_get_features)
> -		chip->onfi_get_features = nand_onfi_get_features;
> +		chip->onfi_get_features = nand_get_features_default;

We should probably also rename the hooks at some point, because GET/SET
FEATURES operations are not limited to ONFi compliant chips.

Thanks,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
