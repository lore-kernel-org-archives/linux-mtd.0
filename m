Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB2GU-0004Xy-A9
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:25:19 +0000
Date: Sun, 27 Nov 2016 17:24:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 28/39] mtd: nand: denali: move multi NAND fixup code to
 a helper function
Message-ID: <20161127172456.5dba79f2@bbrezillon>
In-Reply-To: <1480183585-592-29-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-29-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:06:14 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Collect multi NAND fixups into a helper function instead of
> scattering them in denali_init().

Can you tell me more about this multi-NAND feature?
The core is already able to detect multi-die NAND chips in a generic
way, but I fear this is something else, like "put two 8-bits chips on a
16bits bus to emulate a single 16bits chip".
If that's a case, and this feature is actually used, then it's a bad
idea IMHO.
For example, how do you handle the case where one block is bad on a
chip but not on the other? And I fear this is not the only problem
with this approach :-/. 

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 51 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 60b0858..54dcd83 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1472,6 +1472,34 @@ static void denali_drv_init(struct denali_nand_info *denali)
>  	denali->irq_status = 0;
>  }
>  
> +static void denali_multidev_fixup(struct denali_nand_info *denali)
> +{
> +	struct nand_chip *chip = &denali->nand;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	/*
> +	 * Support for multi NAND:
> +	 * MTD knows nothing about multi NAND, so we should tell it
> +	 * the real pagesize and anything necessary
> +	 */
> +	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
> +
> +	mtd->size <<= denali->devnum - 1;
> +	mtd->erasesize <<= denali->devnum - 1;
> +	mtd->writesize <<= denali->devnum - 1;
> +	mtd->oobsize <<= denali->devnum - 1;
> +	chip->chipsize <<= denali->devnum - 1;
> +	chip->page_shift += denali->devnum - 1;
> +	chip->phys_erase_shift += denali->devnum - 1;
> +	chip->bbt_erase_shift += denali->devnum - 1;
> +	chip->chip_shift += denali->devnum - 1;
> +	chip->pagemask <<= denali->devnum - 1;
> +	chip->ecc.size *= denali->devnum;
> +	chip->ecc.bytes *= denali->devnum;
> +	chip->ecc.strength *= denali->devnum;
> +	denali->bbtskipbytes *= denali->devnum;
> +}
> +
>  int denali_init(struct denali_nand_info *denali)
>  {
>  	struct nand_chip *chip = &denali->nand;
> @@ -1553,23 +1581,6 @@ int denali_init(struct denali_nand_info *denali)
>  		goto failed_req_irq;
>  	}
>  
> -	/*
> -	 * support for multi nand
> -	 * MTD known nothing about multi nand, so we should tell it
> -	 * the real pagesize and anything necessery
> -	 */
> -	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
> -	chip->chipsize <<= denali->devnum - 1;
> -	chip->page_shift += denali->devnum - 1;
> -	chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
> -	chip->bbt_erase_shift += denali->devnum - 1;
> -	chip->phys_erase_shift = chip->bbt_erase_shift;
> -	chip->chip_shift += denali->devnum - 1;
> -	mtd->writesize <<= denali->devnum - 1;
> -	mtd->oobsize <<= denali->devnum - 1;
> -	mtd->erasesize <<= denali->devnum - 1;
> -	mtd->size = chip->numchips * chip->chipsize;
> -	denali->bbtskipbytes *= denali->devnum;
>  
>  	/*
>  	 * second stage of the NAND scan
> @@ -1614,11 +1625,9 @@ int denali_init(struct denali_nand_info *denali)
>  	}
>  
>  	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
> -	chip->ecc.bytes *= denali->devnum;
> -	chip->ecc.strength *= denali->devnum;
>  
>  	/* override the default read operations */
> -	chip->ecc.size = ECC_SECTOR_SIZE * denali->devnum;
> +	chip->ecc.size = ECC_SECTOR_SIZE;
>  	chip->ecc.read_page = denali_read_page;
>  	chip->ecc.read_page_raw = denali_read_page_raw;
>  	chip->ecc.write_page = denali_write_page;
> @@ -1627,6 +1636,8 @@ int denali_init(struct denali_nand_info *denali)
>  	chip->ecc.write_oob = denali_write_oob;
>  	chip->erase = denali_erase;
>  
> +	denali_multidev_fixup(denali);
> +
>  	ret = nand_scan_tail(mtd);
>  	if (ret)
>  		goto failed_req_irq;
