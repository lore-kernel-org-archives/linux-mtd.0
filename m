Received: from n16.bullet.mail.mud.yahoo.com ([68.142.206.43])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1xrJ-0003JT-Nq
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 07:17:40 +0000
From: David Brownell <david-b@pacbell.net>
To: nsnehaprabha@ti.com
Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Date: Thu, 7 May 2009 00:16:52 -0700
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
In-Reply-To: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200905070016.52356.david-b@pacbell.net>
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

I'm glad to see this patch is so small ... basically, just
adding a special case for 2K pages, and keeping the core of
this NAND driver the same.  Not needing to change the 4-bit
ECC support from the patch I sent earlier seems a good sign.

Two comments though:  (a) the board-dm355-evm.c file isn't
yet in mainline, so the MTD folk can't take this patch as-is;
(b) as noted elsewhere, there are still issues with 4K pages
and the NAND core infrastructure.

This patch is sufficient to support development boards for
the dm355, dm357, and dm365 ... right?  They all have 2 GByte
NAND chips, ISTR with 2K pages, and haven't yet had to switch
to more current parts with 4K pages.


On Wednesday 06 May 2009, nsnehaprabha@ti.com wrote:
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -500,6 +500,21 @@ static struct nand_ecclayout hwecc4_small __initconst
> = { },
>  };
>  
> +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
> + * storing ten ECC bytes plus the manufacturer's bad block marker byte,
> + * and not overlapping the default BBT markers.
> + */
> +static struct nand_ecclayout hwecc4_2048 __initconst = {
> +       .eccbytes = 10,

Not ".eccbytes = 40"?  This is 4 chunks, 10 ecc bytes each...


> +       .eccpos = { 0, 1, 2, 3, 4, 6, 7, 8, 9, 10,
> +               11, 12, 13, 14, 15, 24, 25, 26, 27, 28,
> +               29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
> +               39, 40, 41, 42, 43, 44, 45, 46, 47, 48, },
> +       .oobfree = {
> +               {.offset = 16, .length = 8, },
> +               {.offset = 49, },

Comments would be good, highlighting (a) byte 5 is reserved,
it's the manufacturer bad block marker, (b) 8 bytes @16 are
expected by JFFS2.  Not everyone will "just know" those.


> +       },
> +};
>  
>  static int __init nand_davinci_probe(struct platform_device *pdev)
>  {

> @@ -690,6 +705,13 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>                                 info->mtd.oobsize - 16;
>                         goto syndrome_done;
>                 }
> +               if (chunks == 4) {
> +                       info->ecclayout = hwecc4_2048;
> +                       info->ecclayout.oobfree[1].length =
> +                               info->mtd.oobsize - 49;
> +                       info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
> +                       goto syndrome_done;
> +               }
>  
>                 /* For large page chips we'll be wanting to use a
>                  * not-yet-implemented mode that reads OOB data

You should update that comment ... that not-yet-implemented mode
is now called "NAND_ECC_HW_OOB_FIRST", from patch 1/2 ... ;)
