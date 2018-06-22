Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWHZO-0002Qh-Mo
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 08:37:28 +0000
Date: Fri, 22 Jun 2018 10:37:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v5 6/6] mtd: rawnand: micron: detect forced on-die ECC
Message-ID: <20180622103715.0ec496d9@bbrezillon>
In-Reply-To: <20180622012835.17874-7-chris.packham@alliedtelesis.co.nz>
References: <20180622012835.17874-1-chris.packham@alliedtelesis.co.nz>
 <20180622012835.17874-7-chris.packham@alliedtelesis.co.nz>
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

On Fri, 22 Jun 2018 13:28:35 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Some Micron NAND chips have on-die ECC forceably enabled. The detect

							    ^ Detect ?

> these based on chip ID as there seems to be no other way of
> distinguishing these chips from those that have optional support for
> on-die ECC.
> 
> When a chip with mandatory on-die ECC is detected change the current ECC
> mode to on-die.

That part is no longer true.

> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

With the commit message fixed:

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> 
> Notes:
>     Changes in v4:
>     - New
>     Changes in v5:
>     - fail if on-die ECC is mandatory and the current ecc.mode is not
>       NAND_ECC_ON_DIE.
> 
>  drivers/mtd/nand/raw/nand_micron.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index f83053562925..35fa6880a799 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -255,6 +255,14 @@ enum {
>  	MICRON_ON_DIE_MANDATORY,
>  };
>  
> +/*
> + * These parts are known to have on-die ECC forceably enabled
> + */
> +static u8 micron_on_die_ecc[] = {
> +	0xd1, /* MT29F1G08ABAFA */
> +	0xa1, /* MT29F1G08ABBFA */
> +};
> +
>  /*
>   * Try to detect if the NAND support on-die ECC. To do this, we enable
>   * the feature, and read back if it has been enabled as expected. We
> @@ -269,6 +277,11 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>  {
>  	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
>  	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)
> +		if (chip->id.data[1] == micron_on_die_ecc[i])
> +			return MICRON_ON_DIE_MANDATORY;
>  
>  	if (!chip->parameters.onfi.version)
>  		return MICRON_ON_DIE_UNSUPPORTED;
> @@ -322,7 +335,8 @@ static int micron_nand_init(struct nand_chip *chip)
>  
>  	ondie = micron_supports_on_die_ecc(chip);
>  
> -	if (ondie == MICRON_ON_DIE_MANDATORY) {
> +	if (ondie == MICRON_ON_DIE_MANDATORY &&
> +	    chip->ecc.mode != NAND_ECC_ON_DIE) {
>  		pr_err("On-die ECC forcefully enabled, not supported\n");
>  		return -EINVAL;
>  	}
