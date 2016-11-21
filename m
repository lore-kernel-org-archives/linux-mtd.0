Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8p0J-0004xU-Sg
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 13:51:29 +0000
Date: Mon, 21 Nov 2016 14:51:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: ONFI timing mode with onfi_set_features unsupported
Message-ID: <20161121145104.376349f8@bbrezillon>
In-Reply-To: <20161121132327.hup6bi7zqu54jsia@pengutronix.de>
References: <20161121132327.hup6bi7zqu54jsia@pengutronix.de>
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

Hi Sascha,

On Mon, 21 Nov 2016 14:23:27 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi all,
> 
> I have a i.MX6ul here with a Cypress S34ML04G2 connected. This Nand chip
> has ONFI support, but onfi_set_features is unsupported (opt_cmd is
> 0x3b). Currently the gpmi Nand driver calls nand_onfi_set_features(),
> gets -EINVAL as error and continues with a very slow default timing.
> 
> I assume the nand_onfi_set_features() call is just unnecessary for this
> chip, if I skip it, the chip works with the fast timing.
> 
> Any idea how to cope with this situation? I attached the most obvious
> patch, but it looks a bit hackish. Any suggestions or is the patch fine
> as is?

It looks good to me. Why do you find this code hackish?
Of course, it would be even better to implement the
->setup_data_interface() method.

BTW, can you patch the core to only send the ->set_feature() command
(to change the timings mode) when the chip supports it?

Thanks,

Boris

> 
> Sascha
> 
> 
> ---------------------------------8<----------------------------
> 
> From 1d76ea80915b298b99def706cac0e20b65bd7ef4 Mon Sep 17 00:00:00 2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Mon, 21 Nov 2016 14:18:27 +0100
> Subject: [PATCH] mtd: nand: gpmi: Fix timing on ONFI chips with
>  onfi_set_features unsupported
> 
> Some chips like for example the Cypress S34ML04G2 are ONFI compliant,
> but do not support the get/set_feature commands. Do not call this
> command when it's not supported to allow for a fast timing on these
> chips.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 141bd70..7b2862c 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -930,23 +930,26 @@ static int enable_edo_mode(struct gpmi_nand_data *this, int mode)
>  	if (!feature)
>  		return -ENOMEM;
>  
> -	nand->select_chip(mtd, 0);
> +	if ((le16_to_cpu(nand->onfi_params.opt_cmd)
> +	      & ONFI_OPT_CMD_SET_GET_FEATURES)) {
> +		nand->select_chip(mtd, 0);
>  
> -	/* [1] send SET FEATURE commond to NAND */
> -	feature[0] = mode;
> -	ret = nand->onfi_set_features(mtd, nand,
> +		/* [1] send SET FEATURE commond to NAND */
> +		feature[0] = mode;
> +		ret = nand->onfi_set_features(mtd, nand,
>  				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
> -	if (ret)
> -		goto err_out;
> +		if (ret)
> +			goto err_out;
>  
> -	/* [2] send GET FEATURE command to double-check the timing mode */
> -	memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
> -	ret = nand->onfi_get_features(mtd, nand,
> +		/* [2] send GET FEATURE command to double-check the timing mode */
> +		memset(feature, 0, ONFI_SUBFEATURE_PARAM_LEN);
> +		ret = nand->onfi_get_features(mtd, nand,
>  				ONFI_FEATURE_ADDR_TIMING_MODE, feature);
> -	if (ret || feature[0] != mode)
> -		goto err_out;
> +		if (ret || feature[0] != mode)
> +			goto err_out;
>  
> -	nand->select_chip(mtd, -1);
> +		nand->select_chip(mtd, -1);
> +	}
>  
>  	/* [3] set the main IO clock, 100MHz for mode 5, 80MHz for mode 4. */
>  	rate = (mode == 5) ? 100000000 : 80000000;
