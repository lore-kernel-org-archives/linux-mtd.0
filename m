Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAMxb-00061s-PE
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 20:51:21 +0000
Date: Mon, 15 May 2017 22:50:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: don't leak buffers when ->scan_bbt() fails
Message-ID: <20170515225048.1baaf716@bbrezillon>
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
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

On Mon,  1 May 2017 17:04:50 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> This bug seems to have been here forever, although we came close to
> fixing all of them in [1]!
> 
> [1] 11eaf6df1cce ("mtd: nand: Remove BUG() abuse in nand_scan_tail")
> 
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to nand/fixes.

Thanks,

Boris

> ---
> The goto isn't *really* necessary, but I thought it'd be more consistent.
> 
> Compile tested only
> 
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 978242b1213f..e4919f9dece4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4794,7 +4794,11 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		return 0;
>  
>  	/* Build bad block table */
> -	return chip->scan_bbt(mtd);
> +	ret = chip->scan_bbt(mtd);
> +	if (ret)
> +		goto err_free;
> +	return 0;
> +
>  err_free:
>  	if (nbuf) {
>  		kfree(nbuf->databuf);
