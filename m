Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxKXJ-0004lp-3G
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 14:38:50 +0000
Date: Wed, 9 Mar 2011 15:38:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [RFC PATCH] mtd: mxc_nand: fix OOB corruption when page size > 2k
Message-ID: <20110309143845.GZ29521@pengutronix.de>
References: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3d5dae673b532b4a4dbdb8edc6626aa49d7a626.1299679613.git.baruch@tkos.co.il>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 09, 2011 at 04:12:20PM +0200, Baruch Siach wrote:
> When page size is 4k, ecc.total is set to 8*9, and this causes
> nand_write_page_hwecc() to read past the initialized part of the eccpos array,
> which corrupts chip->oob_poi with bogus values from ecc_calc.
> 
> Fix this by creating a proper nand_ecclayout for 4k flashes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> 
> I'm not sure if this is the right fix. The proposed nandv2_hw_eccoob_4k is just 
> a natural extension of nandv2_hw_eccoob_largepage. However, I'm not convinced 
> that this actually matches the hardware behaviour. Anyway, this fixed a real 
> OOB corruption in BBT, which is the only place I know of where the OOB area is 
> actually used.

Does this work on barebox aswell? If yes you could verify the oob layout
by looking at md /dev/nand0_oob and verify that the ecc postitions
specified in your patch match the ecc positions written from the
hardware.

Sascha

> 
> Comments are welcome.
> 
>  drivers/mtd/nand/mxc_nand.c |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index ef932ba..0fc80db 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -211,6 +211,31 @@ static struct nand_ecclayout nandv2_hw_eccoob_largepage = {
>  	}
>  };
>  
> +/* OOB description for 4096 byte pages with 128 byte OOB */
> +static struct nand_ecclayout nandv2_hw_eccoob_4k = {
> +	.eccbytes = 8 * 9,
> +	.eccpos = {
> +		7,  8,  9, 10, 11, 12, 13, 14, 15,
> +		23, 24, 25, 26, 27, 28, 29, 30, 31,
> +		39, 40, 41, 42, 43, 44, 45, 46, 47,
> +		55, 56, 57, 58, 59, 60, 61, 62, 63,
> +		71, 72, 73, 74, 75, 76, 77, 78, 79,
> +		87, 88, 89, 90, 91, 92, 93, 94, 95,
> +		103, 104, 105, 106, 107, 108, 109, 110, 111,
> +		119, 120, 121, 122, 123, 124, 125, 126, 127,
> +	},
> +	.oobfree = {
> +		{.offset = 2, .length = 4},
> +		{.offset = 16, .length = 7},
> +		{.offset = 32, .length = 7},
> +		{.offset = 48, .length = 7},
> +		{.offset = 64, .length = 7},
> +		{.offset = 80, .length = 7},
> +		{.offset = 96, .length = 7},
> +		{.offset = 112, .length = 7},
> +	}
> +};
> +
>  #ifdef CONFIG_MTD_PARTITIONS
>  static const char *part_probes[] = { "RedBoot", "cmdlinepart", NULL };
>  #endif
> @@ -1186,6 +1211,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>  
>  	if (mtd->writesize == 2048)
>  		this->ecc.layout = oob_largepage;
> +	if (nfc_is_v21() && mtd->writesize == 4096)
> +		this->ecc.layout = &nandv2_hw_eccoob_4k;
>  
>  	/* second phase scan */
>  	if (nand_scan_tail(mtd)) {
> -- 
> 1.7.2.3
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
