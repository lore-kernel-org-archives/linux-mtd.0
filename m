Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK3Cn-0005tY-6Z
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 12:42:29 +0000
Date: Mon, 4 Jul 2016 14:42:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] mtd: nand: sunxi: prevent a small memory leak
Message-ID: <20160704144207.369cdd48@bbrezillon>
In-Reply-To: <20160624122403.GC23169@mwanda>
References: <20160624122403.GC23169@mwanda>
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

On Fri, 24 Jun 2016 15:24:03 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I moved the sanity check on ecc->size before the allocation so that we
> don't leak memory on error.
> 
> Fixes: 05af074a4b73 ('mtd: nand: sunxi: check ecc->size values')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,

Boris

> 
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index f582fe4..9f4e1c7 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -1812,13 +1812,13 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
>  	int ret;
>  	int i;
>  
> +	if (ecc->size != 512 && ecc->size != 1024)
> +		return -EINVAL;
> +
>  	data = kzalloc(sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> -	if (ecc->size != 512 && ecc->size != 1024)
> -		return -EINVAL;
> -
>  	/* Prefer 1k ECC chunk over 512 ones */
>  	if (ecc->size == 512 && mtd->writesize > 512) {
>  		ecc->size = 1024;
