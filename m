Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am7X6-0000BY-V4
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 22:27:14 +0000
Received: by mail-pf0-x22a.google.com with SMTP id n5so99965409pfn.2
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 15:26:52 -0700 (PDT)
Date: Fri, 1 Apr 2016 15:26:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: nand: Drop mtd.owner requirement in nand_scan
Message-ID: <20160401222649.GK2545@google.com>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 01, 2016 at 06:29:23PM -0300, Ezequiel Garcia wrote:
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

Ooh, yikes! Forgot this was there. I guess no one noticed, because fewer
drivers are using plain nand_scan() these days (instead of splitting up
nand_scan_ident() and nand_scan_tail()), and also, many NAND users don't
run their drivers as modules.

Anyway, this is probably worth -stable, right? (i.e., "Fixes:
807f16d4db95 ..." and "Cc: <stable@vger.kernel.org>")

I can take this directly, or Boris, if you feel like there will be other
for-v4.5 NAND material, you can queue this up instead.

Brian

> -
>  	ret = nand_scan_ident(mtd, maxchips, NULL);
>  	if (!ret)
>  		ret = nand_scan_tail(mtd);
> -- 
> 2.7.0
> 
