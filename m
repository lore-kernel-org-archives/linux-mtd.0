Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elt9R-0007ld-Qr
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 09:14:55 +0000
Date: Wed, 14 Feb 2018 10:14:28 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 6/6] mtd: nand: macronix: Unflag the support of changing
 timings for MX30LF2G18AC
Message-ID: <20180214101428.3ec6ae1d@bbrezillon>
In-Reply-To: <20180203095544.9855-7-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-7-miquel.raynal@bootlin.com>
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

On Sat,  3 Feb 2018 10:55:44 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Miquel Raynal <miquel.raynal@free-electrons.com>
> 
> The MX30LF2G18AC chip declares in its parameter page supporting
> SET/GET_FEATURES but when it comes to timings, experience shows that it
> is not the case.
> 
> Unflag this feature for this particular chip in the nand_parameters
> structure to avoid unnecessary errors and downturns.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_macronix.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_macronix.c b/drivers/mtd/nand/nand_macronix.c
> index d290ff2a6d2f..c58567834595 100644
> --- a/drivers/mtd/nand/nand_macronix.c
> +++ b/drivers/mtd/nand/nand_macronix.c
> @@ -19,9 +19,21 @@
>  
>  static int macronix_nand_init(struct nand_chip *chip)
>  {
> +	const char model[20] = "MX30LF2G18AC";
> +
>  	if (nand_is_slc(chip))
>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>  
> +	/*
> +	 * MX30LF2G18AC chip does not support using SET/GET_FEATURES to change
> +	 * the timings unlike what is declared in the parameter page. Unflag
> +	 * this feature to avoid unnecessary downturns.
> +	 */
> +	if (chip->parameters.support_setting_features &&
> +	    !strncmp(model, chip->parameters.model, ARRAY_SIZE(model)))

Why not

	    !strcmp("MX30LF2G18AC", chip->parameters.model)

?

> +		bitmap_clear(chip->parameters.feature_list,
> +			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
> +
>  	return 0;
>  }
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
