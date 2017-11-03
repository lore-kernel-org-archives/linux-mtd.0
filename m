Received: from gateway33.websitewelcome.com ([192.185.145.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAjlZ-0004pf-Ip
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 21:44:43 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 326AE14029
 for <linux-mtd@lists.infradead.org>; Fri,  3 Nov 2017 16:44:18 -0500 (CDT)
Date: Fri, 03 Nov 2017 16:44:17 -0500
Message-ID: <20171103164417.Horde.p89pi1EBBWDlR21NYU9PW9G@gator4166.hostgator.com>
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Han Xu <han.xu@nxp.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpmi: replace _manual_ swap with swap macro
References: <20171103203147.GA28309@embeddedor.com>
 <VI1PR0401MB222106C2C6F21BB106629FCE975D0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0401MB222106C2C6F21BB106629FCE975D0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Quoting Han Xu <han.xu@nxp.com>:

> ________________________________________
> From: Gustavo A. R. Silva <garsilva@embeddedor.com>
> Sent: Friday, November 3, 2017 3:31 PM
> To: Han Xu; Boris Brezillon; Richard Weinberger; David Woodhouse;  
> Brian Norris; Marek Vasut; Cyrille Pitchen
> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org;  
> Gustavo A. R. Silva
> Subject: [PATCH] mtd: nand: gpmi: replace _manual_ swap with swap macro
>
> Make use of the swap macro and remove unnecessary variables swap.
> This makes the code easier to read and maintain.
>
> This code was detected with the help of Coccinelle.
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c  
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 50f8d4a..9e365d4 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1487,12 +1487,8 @@ static int gpmi_ecc_read_page_raw(struct  
> mtd_info *mtd,
>          * See the layout description for a detailed explanation on why this
>          * is needed.
>          */
> -       if (this->swap_block_mark) {
> -               u8 swap = tmp_buf[0];
> -
> -               tmp_buf[0] = tmp_buf[mtd->writesize];
> -               tmp_buf[mtd->writesize] = swap;
> -       }
> +       if (this->swap_block_mark)
> +               swap(tmp_buf[0], tmp_buf[mtd->writesize]);
>
>         /*
>          * Copy the metadata section into the oob buffer (this section is
> @@ -1615,12 +1611,8 @@ static int gpmi_ecc_write_page_raw(struct  
> mtd_info *mtd,
>          * See the layout description for a detailed explanation on why this
>          * is needed.
>          */
> -       if (this->swap_block_mark) {
> -               u8 swap = tmp_buf[0];
> -
> -               tmp_buf[0] = tmp_buf[mtd->writesize];
> -               tmp_buf[mtd->writesize] = swap;
> -       }
> +       if (this->swap_block_mark)
> +               swap(tmp_buf[0], tmp_buf[mtd->writesize]);
>
>         chip->write_buf(mtd, tmp_buf, mtd->writesize + mtd->oobsize);
>
> Acked-by: Han Xu <han.xu@nxp.com>
>

Thank you, Han.
--
Gustavo A. R. Silva
