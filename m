Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Qf2-0004G5-5a
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 03:22:40 +0000
Received: by mail-pa0-f47.google.com with SMTP id kx10so10880752pab.20
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 20:22:19 -0700 (PDT)
Date: Mon, 21 Jul 2014 20:21:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH 1/2] mxc_nand: fix err_limit and err_mask
Message-ID: <20140722032114.GA28323@ld-irv-0074>
References: <1403815368-29469-1-git-send-email-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403815368-29469-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,

Since I had a few comments for changes on patch 2, might as well comment
here...

On Thu, Jun 26, 2014 at 10:42:47PM +0200, Michael Grzeschik wrote:
> This patch fixes the error detection limits for the used
> eccsize of the 1, 4 and 8 bit eccmode.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index cb6c845..7fd495e 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -657,10 +657,14 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
>  	u32 ecc_stat, err;
>  	int no_subpages = 1;
>  	int ret = 0;
> -	u8 ecc_bit_mask, err_limit;
> +	u8 ecc_bit_mask, err_limit = 0x1;
>  
> -	ecc_bit_mask = (host->eccsize == 4) ? 0x7 : 0xf;
> -	err_limit = (host->eccsize == 4) ? 0x4 : 0x8;
> +	ecc_bit_mask = 0xf;
> +
> +	if (host->eccsize == 4)
> +		err_limit = 0x2;
> +	else if (host->eccsize == 8)
> +		err_limit = 0x4;

This would be a little more obvious as a switch statement.

But please do address my comments on patch 2 (or at least reply, if you
have questions).

>  
>  	no_subpages = mtd->writesize >> 9;
>  

Thanks,
Brian
