Received: from smtpauth02.csee.onr.siteprotect.com ([64.26.60.136])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6CiP-0004Ki-Kw
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 23:58:00 +0000
Message-ID: <4A11F5FC.40709@boundarydevices.com>
Date: Mon, 18 May 2009 16:57:48 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: nsnehaprabha@ti.com
Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, tglx@linutronix.de,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nsnehaprabha@ti.com wrote:
> From: Sneha Narnakaje <nsnehaprabha@ti.com>
> 
> This patch adds 4-bit ECC support for large page NAND chips using the new ECC
> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has been
> adjusted to use this mode.
> 
> The patches have been verified on DM355 device with 2K Micron devices using
> mtd-tests and JFFS2. Error correction upto 4-bits has also been verified using
> nandwrite/nanddump utilities.
> 
> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> ---
>  drivers/mtd/nand/davinci_nand.c |   37 +++++++++++++++++++++++++++++++------
>  1 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index ba6940d..4557b8d 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -500,6 +500,24 @@ static struct nand_ecclayout hwecc4_small __initconst = {
>  	},
>  };
>  
> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
> + * and not overlapping the default BBT markers.
> + */
> +static struct nand_ecclayout hwecc4_2048 __initconst = {
> +	.eccbytes = 40,
> +	.eccpos = { 0, 1, 2, 3, 4,
> +		/* offset 5 holds the badblock marker */

I don't see any bad block overrides to move it from bytes 0,1
to byte 5 in this patch. What am I missing?


> +		6, 7, 8, 9, 10,	11, 12, 13, 14, 15,
> +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
> +		24, 25, 26, 27, 28,
> +		29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
> +		39, 40, 41, 42, 43, 44, 45, 46, 47, 48, },
> +	.oobfree = {
> +		{.offset = 16, .length = 8, },
> +		{.offset = 49, },
> +	},
> +};
>  
>  static int __init nand_davinci_probe(struct platform_device *pdev)
>  {
> @@ -689,15 +707,22 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>  				info->mtd.oobsize - 16;
>  			goto syndrome_done;
>  		}
> +		if (chunks == 4) {
> +			info->ecclayout = hwecc4_2048;
> +			info->ecclayout.oobfree[1].length =
> +				info->mtd.oobsize - 49;

- info->ecclayout.oobfree[1].offset instead of 49 would look better.
or move the .offset = 49 here too.

> +			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
> +			goto syndrome_done;
> +		}
>  
> -		/* For large page chips we'll be wanting to use a
> -		 * not-yet-implemented mode that reads OOB data
> -		 * before reading the body of the page, to avoid
> -		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
> -		 * (and preserve manufacturer badblock markings).
> +		/* 4K page chips are not yet supported. The eccpos from
> +		 * nand_ecclayout cannot hold 80bytes and change to eccpos[]
> +		 * breaks userspace ioctl interface with mtd-utils. Once we
> +		 * resolve this issue, NAND_ECC_HW_OOB_FIRST mode can be used
> +		 * for the 4K page chips.
>  		 */
>  		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
> -				"for large page NAND\n");
> +				"for 4K page NAND\n");
>  		ret = -EIO;
>  		goto err_scan;
>  
