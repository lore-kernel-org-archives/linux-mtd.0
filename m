Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEYu5-0007Hb-LU
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 07:43:42 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so6998799pdj.9
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 23:43:19 -0800 (PST)
Date: Thu, 22 Jan 2015 23:43:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 2/2 v3 RESEND] mtd: fsl_upm: Support NAND ECC DTS
 properties
Message-ID: <20150123074310.GD3268@brian-ubuntu>
References: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com>
 <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jordan,

On Wed, Jan 14, 2015 at 05:41:49PM -0600, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> 
> Support the generic nand-ecc-mode, nand-ecc-strength, and
> nand-ecc-step-size device-tree properties with the Freescale UPM NAND
> driver.
> 
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC for larger NAND devices.
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> v2:
>     * Now using ECC mode and strength helpers from of_mtd.h
>     * ECC mode and strength checking is more robust
> v3 (resent due to [PATCH 1/2] v2 update):
>     * Require nand-ecc-step-size for soft_bch.
>     * Simplify mode/strength/step parameter checking.

This mostly looks pretty good.

>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       | 32 +++++++++++
>  drivers/mtd/nand/Kconfig                           |  1 +
>  drivers/mtd/nand/fsl_upm.c                         | 66 ++++++++++++++++++++--
>  3 files changed, 94 insertions(+), 5 deletions(-)
> 

...

> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index e5e3343..4c85daf 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -444,6 +444,7 @@ config MTD_NAND_FSL_UPM
>  	tristate "Support for NAND on Freescale UPM"
>  	depends on PPC_83xx || PPC_85xx
>  	select FSL_LBC
> +	select MTD_NAND_ECC_BCH

Hmm, do you really need to 'select' here? I think your driver compiles
just fine without it, and nand_base gives you a BUG() if you try to use
its soft BCH without building in the driver. It's normally bad form to
'select' an option that is normally user-configurable, unless you
absolutely require it.

>  	help
>  	  Enables support for NAND Flash chips wired onto Freescale PowerPC
>  	  processor localbus with User-Programmable Machine support.
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 72755d7..053d8bf 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c

...

> @@ -168,7 +174,61 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->chip.read_byte = fun_read_byte;
>  	fun->chip.read_buf = fun_read_buf;
>  	fun->chip.write_buf = fun_write_buf;
> -	fun->chip.ecc.mode = NAND_ECC_SOFT;
> +
> +	/*
> +	 * Support NAND_ECC_SOFT and NAND_ECC_SOFT_BCH, error otherwise.
> +	 */
> +	mode = of_get_nand_ecc_mode(flash_np);
> +	strength = of_get_nand_ecc_strength(flash_np);
> +	step_size = of_get_nand_ecc_step_size(flash_np);
> +	if (mode < 0) {
> +		dev_info(fun->dev, "ECC mode defaulting to 'soft'");
> +		mode = NAND_ECC_SOFT;
> +	} else if (mode != NAND_ECC_SOFT && mode != NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev, "ECC mode in device tree is unsupported");
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	/*
> +	 * In NAND_ECC_SOFT_BCH, require strength >= 1 and step >= 1.
> +	 * In NAND_ECC_SOFT:
> +	 *     a. ignore strength (1 implied)
> +	 *     b. step < 0, step = 256, or step = 512.

(I'm getting nitpicky here, but if you're going to change the Kconfig
above, you might as well address this.)

This comment is nice, but it's still slightly confusing, as it doesn't
have very good parallel structure. There needs to be a verb in bullet
point (b). Perhaps the following?

	 *     b. require step < 0 (default to 256), step = 256, or step = 512.

> +	 */
> +	if (mode == NAND_ECC_SOFT_BCH) {
> +		if (strength < 1)
> +			dev_err(fun->dev, "invalid nand-ecc-strength for BCH");
> +
> +		if (step_size < 1)
> +			dev_err(fun->dev, "invalid nand-ecc-step-size for BCH");
> +
> +		if (strength < 1 || step_size < 1) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		fun->chip.ecc.mode = mode;
> +		fun->chip.ecc.strength = strength;
> +		fun->chip.ecc.size = step_size;
> +	} else {
> +		if (strength >= 0)

I don't see why we should complain about strength == 1. It's a perfectly
descriptive value from DT. Maybe:

		if (strength != 1 && strength >= 0)

> +			dev_warn(fun->dev, "soft ECC implies 1-bit strength");
> +
> +		if (step_size < 0) {
> +			step_size = 256;
> +		} else if (step_size != 256 && step_size != 512) {
> +			dev_err(fun->dev,
> +				"soft ECC needs 256 or 512 byte step");
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		fun->chip.ecc.mode = mode;
> +		fun->chip.ecc.strength = 1;
> +		fun->chip.ecc.size = step_size;
> +	}
> +
>  	if (fun->mchip_count > 1)
>  		fun->chip.select_chip = fun_select_chip;
>  

...

Now that I think about it, I can just apply all these changes and apply
the patch myself, if you agree. Or send a new version yourself. Either
way.

Regards,
Brian
