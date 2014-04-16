Received: from mail-pa0-f44.google.com ([209.85.220.44])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaKC3-0002WO-U9
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 07:23:40 +0000
Received: by mail-pa0-f44.google.com with SMTP id bj1so10661445pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 00:23:15 -0700 (PDT)
Date: Wed, 16 Apr 2014 00:23:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: nand: fix a typo in a comment line
Message-ID: <20140416072311.GC5512@norris-Latitude-E6410>
References: <1397028386-16304-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397028386-16304-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 04:26:26PM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9d01c4d..33ec641 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3607,7 +3607,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  
>  	chip->onfi_version = 0;
>  	if (!type->name || !type->pagesize) {
> -		/* Check is chip is ONFI compliant */
> +		/* Check if the chip is ONFI compliant */

Really? We don't spell out "the chip" every time we refer to "chip". I
think this is just fine as-is.

>  		if (nand_flash_detect_onfi(mtd, chip, &busw))
>  			goto ident_done;
>  

Regards,
Brian
