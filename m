Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZULrU-00061v-AA
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 21:34:33 +0000
Received: by pacdd16 with SMTP id dd16so136188211pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 14:34:11 -0700 (PDT)
Date: Tue, 25 Aug 2015 14:34:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: fsl_upm: Enable software BCH ECC support
Message-ID: <20150825213408.GP81844@google.com>
References: <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
 <288216793.189179.1438710774869.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288216793.189179.1438710774869.JavaMail.zimbra@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 04, 2015 at 12:52:54PM -0500, Aaron Sierra wrote:
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC (as required for larger NAND devices).
> 
> The BCH-required strength and step size values are pulled from the
> device-tree by nand_scan_ident(), so we replace nand_scan() with
> explicit calls to nand_scan_ident() and nand_scan_tail() in order
> to sanity check ECC properties from the device-tree.
> 
> Tested-by: Ryan Schaefer <rschaefer@xes-inc.com>
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       | 32 ++++++++++++++++++++
>  drivers/mtd/nand/fsl_upm.c                         | 35 +++++++++++++++++++++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> index fce4894..3643ee1 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> @@ -18,6 +18,9 @@ Optional properties:
>  - chip-delay : chip dependent delay for transferring data from array to
>  	read registers (tR). Required if property "gpios" is not used
>  	(R/B# pins not connected).
> +- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
> +- nand-ecc-strength : as defined by nand.txt.
> +- nand-ecc-step-size : as defined by nand.txt.

These three properties go under the flash node (which is not yet
documented, though it's mentioned in example and implementation), not
the controller node. Can you add a separate paragraph/section to
describe the flash node, and put these properties under that?

>  
>  Each flash chip described may optionally contain additional sub-nodes
>  describing partitions of the address space. See partition.txt for more
> @@ -65,3 +68,32 @@ upm@3,0 {
>  		};
>  	};
>  };
> +
> +/*
> + * Micron MT29F32G08AFABA (M62B)
> + * 32 Gb (4 GiB), 2 chipselect
> + */
> +upm@2,0 {
> +	#address-cells = <0>;
> +	#size-cells = <0>;
> +	compatible = "fsl,upm-nand";
> +	reg = <2 0x0 0x80000>;
> +	fsl,upm-addr-line-cs-offsets = <0x0 0x10000>;
> +	fsl,upm-addr-offset = <0x10>;
> +	fsl,upm-cmd-offset = <0x08>;
> +	fsl,upm-wait-flags = <0x1>;
> +	chip-delay = <50>;
> +
> +	nand@0 {
> +		#address-cells = <1>;
> +		#size-cells = <2>;
> +		nand-ecc-mode = "soft_bch";
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +
> +		partition@0 {
> +			label = "NAND filesystem";
> +			reg = <0x0 0x1 0x00000000>;
> +		};
> +	};
> +};
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 72755d7..0982d7a 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -182,6 +182,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	if (!flash_np)
>  		return -ENODEV;
>  
> +	fun->chip.dn = flash_np;
>  	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
>  				  flash_np->name);
>  	if (!fun->mtd.name) {
> @@ -189,7 +190,39 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  		goto err;
>  	}
>  
> -	ret = nand_scan(&fun->mtd, fun->mchip_count);
> +	ret = nand_scan_ident(&fun->mtd, fun->mchip_count, NULL);
> +	if (ret)
> +		goto err;
> +
> +	switch (fun->chip.ecc.mode) {
> +	case NAND_ECC_NONE:

Maybe a comment here, to say that we default to soft for legacy reasons?
"NONE" is actually a potentially valid option (but not likely or
useful).

> +		fun->chip.ecc.mode = NAND_ECC_SOFT;
> +		break;
> +	case NAND_ECC_SOFT:
> +		if (fun->chip.ecc.strength && fun->chip.ecc.strength != 1)
> +			dev_warn(fun->dev, "Ignoring %d-bit software ECC\n",
> +				fun->chip.ecc.strength);

Do you really want to ignore this? I think it's fair to make this an
error case in nand_scan_tail(). Like:

	case NAND_ECC_SOFT:
		...
		if (chip->ecc.strength && chip->ecc.strength != 1) {
			// error out
			// we really need to kill the heavy usage of
			// BUG() in nand_scan_tail()...
		}

> +		if (fun->chip.ecc.size &&
> +		    (fun->chip.ecc.size != 256) &&
> +		    (fun->chip.ecc.size != 512)) {
> +			dev_err(fun->dev, "Invalid software ECC step: %d\n",
> +				fun->chip.ecc.size);

Is that a generic soft ECC limitation? (Looks like it only supports 256
and 512 to me.) If so, then let's put this in nand_base.c. Either in
nand_dt_init(), or possibly in nand_scan_tail(), under the case for
NAND_ECC_SOFT.

> +			goto err;
> +		}
> +		break;
> +	case NAND_ECC_SOFT_BCH:
> +		if (fun->chip.ecc.strength < 2) {
> +			dev_err(fun->dev, "Invalid BCH ECC strength: %d\n",
> +				fun->chip.ecc.strength);

Same here. Maybe in nand_scan_tail()?

> +			goto err;
> +		}
> +		break;
> +	default:
> +		dev_err(fun->dev, "ECC mode unsupported");
> +		goto err;
> +	}
> +
> +	ret = nand_scan_tail(&fun->mtd);
>  	if (ret)
>  		goto err;
>  

Brian
