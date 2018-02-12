Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elLgj-00040Y-Vm
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:31:03 +0000
Date: Mon, 12 Feb 2018 22:30:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org, Gregory Clement
 <gregory.clement@free-electrons.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] mtd: nand: add ->setup_data_interface() support for
 Marvell NFCv1
Message-ID: <20180212223049.342de3f4@bbrezillon>
In-Reply-To: <20180116231934.30119-1-miquel.raynal@free-electrons.com>
References: <20180116231934.30119-1-miquel.raynal@free-electrons.com>
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

On Wed, 17 Jan 2018 00:19:34 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> First generation of Marvell NAND flash controllers (eg. embedded in PXA
> boards) did not make use of the NAND core hook ->setup_data_interface()
> to setup controller timings. Add support for it.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
> 
> Changes since v1:
> =================
>   - Fixed an unsigned comparison with something negative
>   - Canceled the inversion of two lines in v1 with no meaning
>   - Took into accout a smaller delay when deriving tR which is tWB, the
>     time for the busy line to be valid.
> 
> 
>  drivers/mtd/nand/marvell_nand.c | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
> index 10f108cc08e2..48d78ca0d71c 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -379,6 +379,8 @@ struct marvell_nfc_timings {
>   * return the number of clock periods.
>   */
>  #define TO_CYCLES(ps, period_ns) (DIV_ROUND_UP(ps / 1000, period_ns))
> +#define TO_CYCLES64(ps, period_ns) (DIV_ROUND_UP_ULL(div_u64(ps, 1000), \
> +						     period_ns))
>  
>  /**
>   * NAND driver structure filled during the parsing of the ->exec_op() subop
> @@ -2239,8 +2241,20 @@ static int marvell_nfc_setup_data_interface(struct mtd_info *mtd, int chipnr,
>  	nfc_tmg.tRHW = TO_CYCLES(max_t(int, sdr->tRHW_min, sdr->tCCS_min),
>  				 period_ns);
>  
> -	/* Use WAIT_MODE (wait for RB line) instead of only relying on delays */
> -	nfc_tmg.tR = TO_CYCLES(sdr->tWB_max, period_ns);
> +	/*
> +	 * NFCv2: Use WAIT_MODE (wait for RB line), do not rely only on delays.
> +	 * NFCv1: No WAIT_MODE, tR must be maximal.
> +	 */
> +	if (nfc->caps->is_nfcv2) {
> +		nfc_tmg.tR = TO_CYCLES(sdr->tWB_max, period_ns);
> +	} else {
> +		nfc_tmg.tR = TO_CYCLES64(sdr->tWB_max + sdr->tR_max,
> +					 period_ns);
> +		if (nfc_tmg.tR + 3 > nfc_tmg.tCH)
> +			nfc_tmg.tR = nfc_tmg.tCH - 3;
> +		else
> +			nfc_tmg.tR = 0;
> +	}
>  
>  	if (chipnr < 0)
>  		return 0;
> @@ -2252,18 +2266,24 @@ static int marvell_nfc_setup_data_interface(struct mtd_info *mtd, int chipnr,
>  		NDTR0_TWP(nfc_tmg.tWP) |
>  		NDTR0_TWH(nfc_tmg.tWH) |
>  		NDTR0_TCS(nfc_tmg.tCS) |
> -		NDTR0_TCH(nfc_tmg.tCH) |
> -		NDTR0_RD_CNT_DEL(read_delay) |
> -		NDTR0_SELCNTR |
> -		NDTR0_TADL(nfc_tmg.tADL);
> +		NDTR0_TCH(nfc_tmg.tCH);
>  
>  	marvell_nand->ndtr1 =
>  		NDTR1_TAR(nfc_tmg.tAR) |
>  		NDTR1_TWHR(nfc_tmg.tWHR) |
> -		NDTR1_TRHW(nfc_tmg.tRHW) |
> -		NDTR1_WAIT_MODE |
>  		NDTR1_TR(nfc_tmg.tR);
>  
> +	if (nfc->caps->is_nfcv2) {
> +		marvell_nand->ndtr0 |=
> +			NDTR0_RD_CNT_DEL(read_delay) |
> +			NDTR0_SELCNTR |
> +			NDTR0_TADL(nfc_tmg.tADL);
> +
> +		marvell_nand->ndtr1 |=
> +			NDTR1_TRHW(nfc_tmg.tRHW) |
> +			NDTR1_WAIT_MODE;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2398,8 +2418,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
>  
>  	chip->exec_op = marvell_nfc_exec_op;
>  	chip->select_chip = marvell_nfc_select_chip;
> -	if (nfc->caps->is_nfcv2 &&
> -	    !of_property_read_bool(np, "marvell,nand-keep-config"))
> +	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
>  		chip->setup_data_interface = marvell_nfc_setup_data_interface;
>  
>  	mtd = nand_to_mtd(chip);



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
