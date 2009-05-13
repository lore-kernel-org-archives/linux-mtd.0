Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4ANI-0003qD-9f
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 09:03:46 +0000
From: David Brownell <david-b@pacbell.net>
To: davinci-linux-open-source@linux.davincidsp.com
Subject: Re: [PATCH 1/2] NAND: Adding new ECC mode - NAND_ECC_HW_OOB_FIRST for
	TI DaVinci devices
Date: Wed, 13 May 2009 02:03:36 -0700
References: <1241663350-20416-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1241663350-20416-1-git-send-email-nsnehaprabha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905130203.36445.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, nsnehaprabha@ti.com,
	dwmw2@infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 May 2009, nsnehaprabha@ti.com wrote:
> From: Sneha Narnakaje <nsnehaprabha@ti.com>
> 
> This patch adds new ECC mode NAND_ECC_HW_OOB_FIRST in the nand core to
> support 4-bit ECC on TI DaVinci devices with large page NAND chips.

And it seems quite straightforward too:

  (a) add new "page" parameter to all the NAND read_page methods,
  (b) define a new nand_read_page_hwecc_oob_first() method, and
      kick it in for ECC_HW_OOB_FIRST

I can't see anything going wrong with (a), though some might prefer
to see it in a separate patch.  And (b) looks obvious too, given
that design.

Comments from any MTD folk?


> This ECC mode is similar to NAND_ECC_HW, with the exception of read_page
> handle that should first read the OOB area, read the data in chunks, feed the
> ECC from OOB area to the ECC hw engine and perform any correction on the data
> as per the ECC status reported by hw engine. In order to read the OOB area
> before the data area, the read_page handle has to send READOOB command and
> thus the read_page/read_page_raw APIs are changed to pass the page argument.
> 
> Note: This patch is dependent on [patch 2.6.30-rc1] NAND: don't walk past
> end of oobfree[] from David Brownell:
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025205.html

... both of which went from Andrew to David Woodhouse, and I'd
hope they would get into the MTD queue soon.


> 
> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> ---
>  drivers/mtd/nand/atmel_nand.c    |    2 +-
>  drivers/mtd/nand/cafe_nand.c     |    2 +-
>  drivers/mtd/nand/fsl_elbc_nand.c |    3 +-
>  drivers/mtd/nand/nand_base.c     |   72 +++++++++++++++++++++++++++++++++----
>  drivers/mtd/nand/sh_flctl.c      |    2 +-
>  include/linux/mtd/nand.h         |    5 ++-
>  6 files changed, 72 insertions(+), 14 deletions(-)
> 
> 	... snip ...
>
> 
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> 	... deletia ...
> 
> @@ -980,6 +980,49 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /**
> + * nand_read_page_hwecc_oob_first - [REPLACABLE] hw ecc, read oob first
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @buf:	buffer to store read data
> + *
> + * Hardware ECC for large page chips, require OOB to be read first

I'd explain this a bit here.  A key point is that unlike the
ECC_HW_SYNDROME support when multiple ECC "steps" are involved,
this doesn't clobber manufacturer bad block markings by using
an "infix ECC" scheme:  it puts ECC data *only* into the OOB.


> + */


And this is the guts of it all.  "Looks obvious":

> +static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
> +	struct nand_chip *chip, uint8_t *buf, int page)
> +{
> +	int i, eccsize = chip->ecc.size;
> +	int eccbytes = chip->ecc.bytes;
> +	int eccsteps = chip->ecc.steps;
> +	uint8_t *p = buf;
> +	uint8_t *ecc_code = chip->buffers->ecccode;
> +	uint32_t *eccpos = chip->ecc.layout->eccpos;
> +	uint8_t *ecc_calc = chip->buffers->ecccalc;
> +
> +	/* Read the OOB area first */
> +	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +
> +	for (i = 0; i < chip->ecc.total; i++)
> +		ecc_code[i] = chip->oob_poi[eccpos[i]];
> +
> +	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
> +		int stat;
> +
> +		chip->ecc.hwctl(mtd, NAND_ECC_READ);
> +		chip->read_buf(mtd, p, eccsize);
> +		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> +
> +		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
> +		if (stat < 0)
> +			mtd->ecc_stats.failed++;
> +		else
> +			mtd->ecc_stats.corrected += stat;
> +	}
> +	return 0;
> +}
> +
> +/**
>   * nand_read_page_syndrome - [REPLACABLE] hardware ecc syndrom based page read
>   * @mtd:	mtd info structure
>   * @chip:	nand chip info structure
>
>	... deletia ...
>
> @@ -2678,6 +2723,17 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	case NAND_ECC_HW3_512:
>  	case NAND_ECC_HW3_256:

You should reissue the patch against current GIT code.  Those two
constants are long gone.


>  #endif
> +	case NAND_ECC_HW_OOB_FIRST:
> +		/* Similar to NAND_ECC_HW, but a separate read_page handle */
> +		if (!chip->ecc.calculate || !chip->ecc.correct ||
> +		     !chip->ecc.hwctl) {
> +			printk(KERN_WARNING "No ECC functions supplied, "
> +			       "Hardware ECC not possible\n");
> +			BUG();
> +		}
> +		if (!chip->ecc.read_page)
> +			chip->ecc.read_page = nand_read_page_hwecc_oob_first;
> +
>  	case NAND_ECC_HW:
>  		/* Use standard hwecc read page function ? */
>  		if (!chip->ecc.read_page)
