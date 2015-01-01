Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6fLA-00009G-DR
 for linux-mtd@lists.infradead.org; Thu, 01 Jan 2015 12:59:01 +0000
Date: Thu, 1 Jan 2015 13:58:32 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 1/3] mtd: nand: add asm9260 NFC driver
Message-ID: <20150101135832.3dac00a9@bbrezillon>
In-Reply-To: <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

I added a few more comments to the ECC config part.

On Wed, 31 Dec 2014 13:58:51 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> Add driver for Nand Flash Controller used on Alphascales ASM9260 chips.
> The IP core of this controller has some similarities with
> Evatronix NANDFLASH-CTRL IP (unknown revision), so probably it can be reused
> by some other SoCs.
> 
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/mtd/nand/Kconfig        |   7 +
>  drivers/mtd/nand/Makefile       |   1 +
>  drivers/mtd/nand/asm9260_nand.c | 989 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 997 insertions(+)
>  create mode 100644 drivers/mtd/nand/asm9260_nand.c
> 

[...]

> +
> +static int __init asm9260_nand_ecc_conf(struct asm9260_nand_priv *priv)
> +{
> +	struct device_node *np = priv->dev->of_node;
> +	struct nand_chip *nand = &priv->nand;
> +	struct mtd_info *mtd = &priv->mtd;
> +	struct nand_ecclayout *ecc_layout = &priv->ecc_layout;
> +	int i, ecc_strength;
> +
> +	nand->ecc.mode = of_get_nand_ecc_mode(np);
> +	switch (nand->ecc.mode) {
> +	case NAND_ECC_SOFT:
> +	case NAND_ECC_SOFT_BCH:
> +		dev_info(priv->dev, "Using soft ECC %i\n", nand->ecc.mode);
> +		/* nand_base will find needed settings */
> +		return 0;
> +	case NAND_ECC_HW:
> +	default:
> +		dev_info(priv->dev, "Using default NAND_ECC_HW\n");
> +		nand->ecc.mode = NAND_ECC_HW;
> +		break;
> +	}
> +
> +	ecc_strength = of_get_nand_ecc_strength(np);
> +	nand->ecc.size = ASM9260_ECC_STEP;

You might want to check the requested ECC step (either the one defined
in the DT or the one stored in ecc_step_ds) and fail if it is not 512.
This will force users to choose software ECC if their NAND require a
1024 bytes step.

> +	nand->ecc.steps = mtd->writesize / nand->ecc.size;
> +
> +	if (ecc_strength < nand->ecc_strength_ds) {
> +		int ds_corr;
> +

Hmm, actually one of the goal of DT definition is to force weaker ECC
than what's actually required.
Here you're just overriding the ECC strength retrieved from DT with the
one stored in ecc_strength_ds.
What you can do though is print a warning message to inform users that
they should not use weaker ECC than those required by the chip.

> +		/* Let's check if ONFI can help us. */
> +		if (nand->ecc_strength_ds <= 0) {
> +			/* No ONFI and no DT - it is bad. */
> +			dev_err(priv->dev,
> +					"nand-ecc-strength is not set by DT or ONFI. Please set nand-ecc-strength in DT or add chip quirk in nand_ids.c.\n");
> +			return -EINVAL;
> +		}
> +
> +		ds_corr = (mtd->writesize * nand->ecc_strength_ds) /
> +			nand->ecc_step_ds;
> +		ecc_strength = ds_corr / nand->ecc.steps;

Actually "N correctable bits per 512 bytes" is not equivalent to "2N
correctable bits per 1024 bytes" because in the latter the 2N
erroneous bits can be in the first 512 byte block (which is not
possible in the former).
I think this is safer to refuse to use HW_ECC with NAND chips that
require 1024 bytes step (or you could keep the same ECC strength but on
a 512 byte step size).

> +		dev_info(priv->dev, "ONFI:nand-ecc-strength = %i\n",
> +				ecc_strength);

Change the message here, because ecc_strength_ds is not necessarily
retrieved from ONFI parameters.

> +	} else
> +		dev_info(priv->dev, "DT:nand-ecc-strength = %i\n",
> +				ecc_strength);

Add brackets around the else statement (to be consistent with the if
statement which has brackets).

> +
> +	if (ecc_strength == 0 || ecc_strength > ASM9260_ECC_MAX_BIT) {
> +		dev_err(priv->dev,
> +				"Not supported ecc_strength value: %i\n",
> +				ecc_strength);
> +		return -EINVAL;
> +	}
> +
> +	if (ecc_strength & 0x1) {
> +		ecc_strength++;
> +		dev_info(priv->dev,
> +				"Only even ecc_strength value is supported. Recalculating: %i\n",
> +		       ecc_strength);
> +	}
> +
> +	/* FIXME: do we have max or min page size? */
> +
> +	/* 13 - the smallest integer for 512 (ASM9260_ECC_STEP). Div to 8bit. */
> +	nand->ecc.bytes = DIV_ROUND_CLOSEST(ecc_strength * 13, 8);

I'm pretty sure you should use DIV_ROUND_UP here.

> +
> +	ecc_layout->eccbytes = nand->ecc.bytes * nand->ecc.steps;
> +	nand->ecc.layout = ecc_layout;
> +	nand->ecc.strength = ecc_strength;
> +
> +	priv->spare_size = mtd->oobsize - ecc_layout->eccbytes;
> +
> +	ecc_layout->oobfree[0].offset = 2;
> +	ecc_layout->oobfree[0].length = priv->spare_size - 2;
> +
> +	/* FIXME: can we use same layout as SW_ECC? */

You mean NAND_ECC_SOFT_BCH, right ?
If this is the case, then you're already using the same layout.

Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
