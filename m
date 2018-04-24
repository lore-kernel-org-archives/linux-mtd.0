Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB09E-0002a6-FU
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 15:46:43 +0000
Date: Tue, 24 Apr 2018 17:46:16 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Fix nanddev_mtd_erase()
Message-ID: <20180424174616.776d18dd@bbrezillon>
In-Reply-To: <20180410151513.27898-1-boris.brezillon@bootlin.com>
References: <20180410151513.27898-1-boris.brezillon@bootlin.com>
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

On Tue, 10 Apr 2018 17:15:13 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Commit e7bfb3fdbde3 ("mtd: Stop updating erase_info->state and calling
> mtd_erase_callback()") removed the einfo->state field and the
> MTD_ERASE_XXX macros. At the same time, the generic NAND layer was added
> and made sure to update the erase info state.
> 
> It did not result in a build failure after merging the nand/for-4.17
> branch in mtd/next because the generic NAND layer is not selected yet.
> Let's fix that before a config option starts selecting MTD_NAND_CORE.
> 
> Fixes: e7bfb3fdbde3 ("mtd: Stop updating erase_info->state and calling mtd_erase_callback()")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied to master.

> ---
>  drivers/mtd/nand/core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
> index d0cd6f8635d7..9c9f8936b63b 100644
> --- a/drivers/mtd/nand/core.c
> +++ b/drivers/mtd/nand/core.c
> @@ -162,7 +162,6 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
>  		ret = nanddev_erase(nand, &pos);
>  		if (ret) {
>  			einfo->fail_addr = nanddev_pos_to_offs(nand, &pos);
> -			einfo->state = MTD_ERASE_FAILED;
>  
>  			return ret;
>  		}
> @@ -170,8 +169,6 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
>  		nanddev_pos_next_eraseblock(nand, &pos);
>  	}
>  
> -	einfo->state = MTD_ERASE_DONE;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(nanddev_mtd_erase);
