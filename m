Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAkj7-0000OB-FN
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 17:55:50 +0000
Received: by mail-pd0-f180.google.com with SMTP id y10so3392008pdj.25
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 10:55:24 -0700 (PDT)
Date: Sat, 17 Aug 2013 10:55:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v4 4/6] mtd: set ONFI nand's default hooks in
 nand_set_defaults()
Message-ID: <20130817175507.GA5034@norris.computersforpeace.net>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376619009-8622-5-git-send-email-b32955@freescale.com>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 Florian Fainelli <ffainelli@freebox.fr>, dwmw2@infradead.org,
 Brian Foster <brian.foster@maximintegrated.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 10:10:07AM +0800, Huang Shijie wrote:
> We may do some ONFI get/set features operations before we call the
> nand_scan_tail().
> 
> So move the default ONFI nand hooks into nand_set_defaults().
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

This patch looks similar to a one forwarded by Brian Foster/Florian
Fainelli a while back. But since I don't have a good copy of the other
one, I'll take this.

(BTW, this patch is new for the v4 series, but I don't mind this time)

> ---
>  drivers/mtd/nand/nand_base.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index fa35699..61a7d14 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2794,6 +2794,12 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  	if (!chip->select_chip)
>  		chip->select_chip = nand_select_chip;
>  
> +	/* set for ONFI nand */
> +	if (!chip->onfi_set_features)
> +		chip->onfi_set_features = nand_onfi_set_features;
> +	if (!chip->onfi_get_features)
> +		chip->onfi_get_features = nand_onfi_get_features;
> +
>  	/* If called twice, pointers that depend on busw may need to be reset */
>  	if (!chip->read_byte || chip->read_byte == nand_read_byte)
>  		chip->read_byte = busw ? nand_read_byte16 : nand_read_byte;
> @@ -3560,12 +3566,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	if (!chip->write_page)
>  		chip->write_page = nand_write_page;
>  
> -	/* set for ONFI nand */
> -	if (!chip->onfi_set_features)
> -		chip->onfi_set_features = nand_onfi_set_features;
> -	if (!chip->onfi_get_features)
> -		chip->onfi_get_features = nand_onfi_get_features;
> -
>  	/*
>  	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
>  	 * selected and we have 256 byte pagesize fallback to software ECC

Brian
