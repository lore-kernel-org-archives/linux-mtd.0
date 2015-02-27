Date: Thu, 26 Feb 2015 19:20:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v2 06/10] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
Message-ID: <20150227032015.GJ18140@ld-irv-0074>
References: <1423752816-26219-1-git-send-email-antoine.tenart@free-electrons.com>
 <1423752816-26219-7-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423752816-26219-7-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 12, 2015 at 03:53:32PM +0100, Antoine Tenart wrote:
> The nand controller on Marvell Berlin SoC reuse the pxa3xx nand driver
> as it quite close. The process of sending commands can be compared to
> the one of the Marvell armada 370: read and write commands are done in
> chunks.
> 
> But the Berlin nand controller has some other specificities which
> require some modifications of the pxa3xx nand driver:
> - there are no IRQ available so we need to poll the status register: we
>   have to use our own cmdfunc Berlin function, and early on the probing
>   function.
> - PAGEPROG are very different from the one used in the pxa3xx driver,
>   so we're using a specific process for this one
> - the SEQIN command is equivalent to a READ0 command
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 228 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 202 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 8ed045195d31..a74ce08ea95e 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c

> @@ -244,10 +249,11 @@ module_param(use_dma, bool, 0444);
>  MODULE_PARM_DESC(use_dma, "enable DMA for data transferring to/from NAND HW");
>  
>  static struct pxa3xx_nand_timing timing[] = {
> -	{ 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
> -	{ 10,  0, 20,  40, 30,  40, 11123, 110, 10, },
> -	{ 10, 25, 15,  25, 15,  30, 25000,  60, 10, },
> -	{ 10, 35, 15,  25, 15,  25, 25000,  60, 10, },
> +	{ 40, 80, 60, 100, 80, 100,  90000, 400, 40, },
> +	{ 10,  0, 20,  40, 30,  40,  11123, 110, 10, },
> +	{ 10, 25, 15,  25, 15,  30,  25000,  60, 10, },
> +	{ 10, 35, 15,  25, 15,  25,  25000,  60, 10, },
> +	{  5, 20, 10,  12, 10,  12, 200000, 120, 10, },

I thought I already made it clear that I'm not adding more to these
tables. Please rewrite this to use
onfi_async_timing_mode_to_sdr_timings() helpers

http://lists.infradead.org/pipermail/linux-mtd/2015-February/057726.html

>  };
>  
>  static struct pxa3xx_nand_flash builtin_flash_types[] = {
> @@ -260,6 +266,12 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
>  { "512MiB 8-bit",  0xdc2c,  64, 2048,  8,  8, 4096, &timing[2] },
>  { "512MiB 16-bit", 0xcc2c,  64, 2048, 16, 16, 4096, &timing[2] },
>  { "256MiB 16-bit", 0xba20,  64, 2048, 16, 16, 2048, &timing[3] },
> +{ },
> +};
> +
> +static struct pxa3xx_nand_flash berlin_builtin_flash_types[] = {
> +{ "4GiB 8-bit",    0xd7ec, 128, 8192,  8,  8, 4096, &timing[4] },
> +{ },
>  };
>  
>  static u8 bbt_pattern[] = {'M', 'V', 'B', 'b', 't', '0' };
> @@ -320,6 +332,18 @@ static struct nand_ecclayout ecc_layout_4KB_bch8bit = {
>  	.oobfree = { }
>  };
>  
> +static struct nand_ecclayout ecc_layout_oob_128 = {
> +        .eccbytes = 48,
> +        .eccpos = {
> +                   80, 81, 82, 83, 84, 85, 86, 87,
> +                   88, 89, 90, 91, 92, 93, 94, 95,
> +                   96, 97, 98, 99, 100, 101, 102, 103,
> +                   104, 105, 106, 107, 108, 109, 110, 111,
> +                   112, 113, 114, 115, 116, 117, 118, 119,
> +                   120, 121, 122, 123, 124, 125, 126, 127},
> +        .oobfree = { {.offset = 2, .length = 78} }
> +};

^^^ The indentation is all wrong in the above. Please use tabs.

> +
>  /* Define a default flash type setting serve as flash detecting only */
>  #define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
>  
> @@ -1452,19 +1621,24 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  		return -EINVAL;
>  	}
>  
> -	num = ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1;
> -	for (i = 0; i < num; i++) {
> -		if (i < pdata->num_flash)
> -			f = pdata->flash + i;
> -		else
> -			f = &builtin_flash_types[i - pdata->num_flash + 1];
> +	if (info->variant == PXA3XX_NAND_VARIANT_BERLIN2)
> +		flash_types = berlin_builtin_flash_types;
> +	else
> +		flash_types = builtin_flash_types;
>  
> -		/* find the chip in default list */
> +	for (i = 0; i < pdata->num_flash; i++) {
> +		f = pdata->flash + i;
>  		if (f->chip_id == id)
>  			break;
>  	}
>  
> -	if (i >= (ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1)) {
> +	if (f == NULL) {

The style is typically just to do:

	if (!f) {

> +		for (i = 0; (f = &flash_types[i]); i++)
> +			if (f->chip_id == id)
> +				break;
> +	}
> +
> +	if (f == NULL) {

Same.

>  		dev_err(&info->pdev->dev, "ERROR!! flash not defined!!!\n");
>  
>  		return -EINVAL;
> @@ -1516,9 +1690,11 @@ KEEP_CONFIG:
>  	 * (aka splitted) command handling,
>  	 */
>  	if (mtd->writesize > PAGE_CHUNK_SIZE) {
> -		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370) {
> +		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
>  			chip->cmdfunc = nand_cmdfunc_extended;
> -		} else {
> +
> +		if (info->variant != PXA3XX_NAND_VARIANT_ARMADA370 &&
> +				info->variant != PXA3XX_NAND_VARIANT_BERLIN2) {

Why did this 'else' have to get split into a separate conditional?
Couldn't you have just made it an else-if instead? e.g.:

		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370) {
			...
		} else if (info->variant != PXA3XX_NAND_VARIANT_BERLIN2) {
			...
		}

This could also be a switch/case.

>  			dev_err(&info->pdev->dev,
>  				"unsupported page size on this variant\n");
>  			return -ENODEV;

Brian
