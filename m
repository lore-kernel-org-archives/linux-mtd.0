Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZVW4-0007ZY-My
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 19:54:21 +0000
Message-ID: <4A7C865C.9050905@boundarydevices.com>
Date: Fri, 07 Aug 2009 12:54:04 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: akpm@linux-foundation.org
Subject: Re: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
References: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
In-Reply-To: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dbrownell@users.sourceforge.net, s-paulraj@ti.com,
	linux-mtd@lists.infradead.org, nsnehaprabha@ti.com,
	tglx@linutronix.de, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

akpm@linux-foundation.org wrote:
> From: Sneha Narnakaje <nsnehaprabha@ti.com>
> 
> This patch adds 4-bit ECC support for large page NAND chips using the new
> ECC mode NAND_ECC_HW_OOB_FIRST.  The platform data from board-dm355-evm
> has been adjusted to use this mode.
> 
> The patches have been verified on DM355 device with 2K Micron devices
> using mtd-tests and JFFS2.  Error correction upto 4-bits has also been
> verified using nandwrite/nanddump utilities.
> 
> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  drivers/mtd/nand/davinci_nand.c |   45 ++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff -puN drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips drivers/mtd/nand/davinci_nand.c
> --- a/drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips
> +++ a/drivers/mtd/nand/davinci_nand.c
> @@ -348,6 +348,12 @@ compare:
>  	if (!(syndrome[0] | syndrome[1] | syndrome[2] | syndrome[3]))
>  		return 0;
>  
> +	/*
> +	 * Clear any previous address calculation by doing a dummy read of an
> +	 * error address register.
> +	 */
> +	davinci_nand_readl(info, NAND_ERR_ADD1_OFFSET);
> +
>  	/* Start address calculation, and wait for it to complete.
>  	 * We _could_ start reading more data while this is working,
>  	 * to speed up the overall page read.
> @@ -359,8 +365,10 @@ compare:
>  
>  		switch ((fsr >> 8) & 0x0f) {
>  		case 0:		/* no error, should not happen */
> +			davinci_nand_readl(info, NAND_ERR_ERRVAL1_OFFSET);
>  			return 0;
>  		case 1:		/* five or more errors detected */
> +			davinci_nand_readl(info, NAND_ERR_ERRVAL1_OFFSET);
>  			return -EIO;
>  		case 2:		/* error addresses computed */
>  		case 3:
> @@ -500,6 +508,26 @@ static struct nand_ecclayout hwecc4_smal
>  	},
>  };
>  
> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
> + * and not overlapping the default BBT markers.
> + */
> +static struct nand_ecclayout hwecc4_2048 __initconst = {
> +	.eccbytes = 40,
> +	.eccpos = {
> +		/* at the end of spare sector */
> +		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
> +		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
> +		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
> +		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> +		},
> +	.oobfree = {
> +		/* 1 byte at offset 0 holds manufacturer badblock marker */
> +		{.offset = 1, .length = 23, },

I thought Sneha Narnakaje was going to change offset = 2, length = 22 ?
