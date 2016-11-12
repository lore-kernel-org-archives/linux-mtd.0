Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHs-00028g-Es
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:38 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so5292701wma.3
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:18 -0800 (PST)
Subject: Re: [PATCH 10/11] mtd: nand: denali: remove unneeded parentheses
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-11-git-send-email-yamada.masahiro@socionext.com>
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Dinh Nguyen
 <dinguyen@altera.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e5dd555f-2892-6bba-1e64-28ec0f77df22@gmail.com>
Date: Sat, 12 Nov 2016 22:41:22 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-11-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
> Remove parentheses surrounding the whole right side of an assignment.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index d482d8d..14e66ab 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1510,16 +1510,16 @@ int denali_init(struct denali_nand_info *denali)
>  	 * the real pagesize and anything necessery
>  	 */
>  	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
> -	denali->nand.chipsize <<= (denali->devnum - 1);
> -	denali->nand.page_shift += (denali->devnum - 1);
> +	denali->nand.chipsize <<= denali->devnum - 1;
> +	denali->nand.page_shift += denali->devnum - 1;
>  	denali->nand.pagemask = (denali->nand.chipsize >>
>  						denali->nand.page_shift) - 1;
> -	denali->nand.bbt_erase_shift += (denali->devnum - 1);
> +	denali->nand.bbt_erase_shift += denali->devnum - 1;
>  	denali->nand.phys_erase_shift = denali->nand.bbt_erase_shift;
> -	denali->nand.chip_shift += (denali->devnum - 1);
> -	mtd->writesize <<= (denali->devnum - 1);
> -	mtd->oobsize <<= (denali->devnum - 1);
> -	mtd->erasesize <<= (denali->devnum - 1);
> +	denali->nand.chip_shift += denali->devnum - 1;
> +	mtd->writesize <<= denali->devnum - 1;
> +	mtd->oobsize <<= denali->devnum - 1;
> +	mtd->erasesize <<= denali->devnum - 1;

I won't claim I completely understand what this code does, but it
certainly does raise some eyebrows.

>  	mtd->size = denali->nand.numchips * denali->nand.chipsize;
>  	denali->bbtskipbytes *= denali->devnum;
>  
> 


-- 
Best regards,
Marek Vasut
