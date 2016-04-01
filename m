Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am75B-0003DR-72
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 21:58:22 +0000
Subject: Re: [PATCH 1/2] mtd: nand: Drop mtd.owner requirement in nand_scan
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56FEEEE6.40307@nod.at>
Date: Fri, 1 Apr 2016 23:57:58 +0200
MIME-Version: 1.0
In-Reply-To: <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.04.2016 um 23:29 schrieb Ezequiel Garcia:
> Since commit 807f16d4db95 ("mtd: core: set some defaults
> when dev.parent is set"), it's now legal for drivers
> to call nand_scan and nand_scan_ident without setting
> mtd.owner.
> 
> Drop the check and while at it remove the BUG() abuse.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/nand_base.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c3733a10a6e7..befa04ef4a04 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4013,7 +4013,6 @@ static int nand_dt_init(struct nand_chip *chip)
>   * This is the first phase of the normal nand_scan() function. It reads the
>   * flash ID and sets up MTD fields accordingly.
>   *
> - * The mtd->owner field must be set to the module of the caller.
>   */
>  int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		    struct nand_flash_dev *table)
> @@ -4433,19 +4432,12 @@ EXPORT_SYMBOL(nand_scan_tail);
>   *
>   * This fills out all the uninitialized function pointers with the defaults.
>   * The flash ID is read and the mtd/chip structures are filled with the
> - * appropriate values. The mtd->owner field must be set to the module of the
> - * caller.
> + * appropriate values.
>   */
>  int nand_scan(struct mtd_info *mtd, int maxchips)
>  {
>  	int ret;
>  
> -	/* Many callers got this wrong, so check for it for a while... */
> -	if (!mtd->owner && caller_is_module()) {
> -		pr_crit("%s called with NULL mtd->owner!\n", __func__);
> -		BUG();
> -	}

Look okay to me.
Do we have an in-kernel user which currently hits this condition?

Thanks,
//richard
