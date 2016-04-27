Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avKK2-0004HQ-Lq
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 07:55:47 +0000
Date: Wed, 27 Apr 2016 09:55:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, "open
 list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND
 subsystem
Message-ID: <20160427095525.4320cc83@bbrezillon>
In-Reply-To: <20160426055355.GA25981@localhost>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-3-git-send-email-zajec5@gmail.com>
 <20160426055355.GA25981@localhost>
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

On Mon, 25 Apr 2016 22:53:55 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> From: Brian Norris <computersforpeace@gmail.com>
> Date: Mon, 25 Apr 2016 20:48:02 -0700
> Subject: [PATCH] mtd: brcmnand: respect ECC algorithm set by the NAND
>  subsystem
> 
> This is more obvious than guessing based on ECC strength. It allows
> using NAND on devices with BCH-1 (e.g. D-Link DIR-885L).
> 
> This maintains DT backward compatibility by defaulting to Hamming if a
> 1-bit ECC algorithm is specified without a corresponding algorithm
> selection. i.e., to use BCH-1, you must specify:
> 
>   nand-ecc-strength = <1>;
>   nand-ecc-step-size = <512>;
>   nand-ecc-algo = "bch";
> 
> Also adds a check to ensure we haven't allowed someone to get by with SW
> ECC. If we want to support SW ECC, we need to refactor some other pieces
> of this driver.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied, thanks.

Boris

> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index c3331ffcaffd..b76ad7c0144f 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1925,9 +1925,31 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  	cfg->col_adr_bytes = 2;
>  	cfg->blk_adr_bytes = get_blk_adr_bytes(mtd->size, mtd->writesize);
>  
> +	if (chip->ecc.mode != NAND_ECC_HW) {
> +		dev_err(ctrl->dev, "only HW ECC supported; selected: %d\n",
> +			chip->ecc.mode);
> +		return -EINVAL;
> +	}
> +
> +	if (chip->ecc.algo == NAND_ECC_UNKNOWN) {
> +		if (chip->ecc.strength == 1 && chip->ecc.size == 512)
> +			/* Default to Hamming for 1-bit ECC, if unspecified */
> +			chip->ecc.algo = NAND_ECC_HAMMING;
> +		else
> +			/* Otherwise, BCH */
> +			chip->ecc.algo = NAND_ECC_BCH;
> +	}
> +
> +	if (chip->ecc.algo == NAND_ECC_HAMMING && (chip->ecc.strength != 1 ||
> +						   chip->ecc.size != 512)) {
> +		dev_err(ctrl->dev, "invalid Hamming params: %d bits per %d bytes\n",
> +			chip->ecc.strength, chip->ecc.size);
> +		return -EINVAL;
> +	}
> +
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength == 1) /* Hamming */
> +		if (chip->ecc.algo == NAND_ECC_HAMMING)
>  			cfg->ecc_level = 15;
>  		else
>  			cfg->ecc_level = chip->ecc.strength;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
