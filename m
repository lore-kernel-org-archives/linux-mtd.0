Received: from an-out-0708.google.com ([209.85.132.249])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVO3C-0002GQ-EP
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 10:35:13 +0000
Received: by an-out-0708.google.com with SMTP id c37so299388anc.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Feb 2009 02:34:50 -0800 (PST)
Message-ID: <498C1245.3040802@gmail.com>
Date: Fri, 06 Feb 2009 04:34:45 -0600
From: Nishanth Menon <menon.nishanth@gmail.com>
MIME-Version: 1.0
To: Reuben Dowle <Reuben.Dowle@navico.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: NAND Add support for MLC nand with alternate BB
	marker	locations
References: <70F6AAAFDC054F41B9994A9BCD3DF64E08611EC4@exch01-aklnz.MARINE.NET.INT>
In-Reply-To: <70F6AAAFDC054F41B9994A9BCD3DF64E08611EC4@exch01-aklnz.MARINE.NET.INT>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reuben Dowle said the following on 02/03/2009 09:20 PM:
> This patch adds support for some MLC NAND flashes that place the BB
> marker in the LAST page of the bad block rather than the FIRST page used
> for SLC NAND and other types of MLC nand.
>
> Lifted from Samsung datasheet for K9LG8G08U0A (1Gbyte MLC NAND):
> "
>
>   
link to the datasheet might be quick ;)..
> Signed-off-by: Reuben Dowle <reuben.dowle at navico.com>
> ---
>  drivers/mtd/nand/nand_base.c |   12 ++++++++++++
>  drivers/mtd/nand/nand_bbt.c  |    3 +++
>  include/linux/mtd/nand.h     |    3 ++-
>  3 files changed, 17 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> old mode 100644
> new mode 100755
> index 0c3afcc..a76ff7b
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -306,6 +306,9 @@ static int nand_block_bad(struct mtd_info *mtd,
> loff_t ofs, int getchip)
>  
>  	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>  
> +	if( chip->options & NAND_BB_LAST_PAGE )
>   
formatting... if( chip Vs if (chip.. did you run checkpatch.pl to verify
the patch?
> +		ofs += (mtd->erasesize - mtd->writesize);
>   
Would we consider extending bbt_desc as a generic handling technique for
all current and future NAND and kill the need ofchip->options for
BB_LAST_PAGE, ALL_PAGES etc? The argument being: what if a different
manufacturer uses last 2 pages of nand or 2 pages at a different page
offset - in all cases ALL_PAGES would not be efficient enough)..

Regards,
Nishanth Menon
Regards,
Nishanth Menon
