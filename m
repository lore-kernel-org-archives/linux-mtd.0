Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHk-00028G-1k
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:29 +0000
Received: by mail-wm0-x241.google.com with SMTP id g23so5330240wme.1
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:12 -0800 (PST)
Subject: Re: [PATCH 06/11] mtd: nand: denali: remove unused struct member
 totalblks, blksperchip
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-7-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Jason Roberts <jason.e.roberts@intel.com>, linux-kernel@vger.kernel.org,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>,
 Alan Cox <alan@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5c9e0f94-1ed5-8681-8829-4f025d5403e0@gmail.com>
Date: Sat, 12 Nov 2016 22:35:50 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-7-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
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
> The denali->blksperchip is set, but not referenced any more.  The
> denali->totalblks is used only for calculating denali->blksperchip.
> Both of them are unneeded.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c | 8 --------
>  drivers/mtd/nand/denali.h | 2 --
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 78d795b..548278b 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1573,14 +1573,6 @@ int denali_init(struct denali_nand_info *denali)
>  	denali->nand.ecc.bytes *= denali->devnum;
>  	denali->nand.ecc.strength *= denali->devnum;
>  
> -	/*
> -	 * Let driver know the total blocks number and how many blocks
> -	 * contained by each nand chip. blksperchip will help driver to
> -	 * know how many blocks is taken by FW.
> -	 */
> -	denali->totalblks = mtd->size >> denali->nand.phys_erase_shift;
> -	denali->blksperchip = denali->totalblks / denali->nand.numchips;
> -
>  	/* override the default read operations */
>  	denali->nand.ecc.size = ECC_SECTOR_SIZE * denali->devnum;
>  	denali->nand.ecc.read_page = denali_read_page;
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index 7c0800d..ea22191 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -462,8 +462,6 @@ struct denali_nand_info {
>  	int irq;
>  
>  	uint32_t devnum;	/* represent how many nands connected */
> -	uint32_t totalblks;
> -	uint32_t blksperchip;
>  	uint32_t bbtskipbytes;
>  	uint32_t max_banks;
>  };
> 


-- 
Best regards,
Marek Vasut
