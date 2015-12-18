Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA1aA-0003Hi-A1
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 20:24:54 +0000
Date: Fri, 18 Dec 2015 21:24:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: docg4: simplify error case
Message-ID: <20151218212430.35579c90@bbrezillon>
In-Reply-To: <1450467593-90957-1-git-send-email-computersforpeace@gmail.com>
References: <1450467593-90957-1-git-send-email-computersforpeace@gmail.com>
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

On Fri, 18 Dec 2015 11:39:53 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Other refactorings have left the 'fail' label much simpler, so it
> shouldn't have to handle the failed allocation case.
> 
> This also fixes a -Wshadow warning.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/nand/docg4.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index cb6efadd712e..24d478d90dcc 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1353,14 +1353,10 @@ static int __init probe_docg4(struct platform_device *pdev)
>  	doc->mtd = mtd;
>  	return 0;
>  
> - fail:
> -	if (nand) {
> -		/* re-declarations avoid compiler warning */
> -		struct docg4_priv *doc = nand->priv;
> -		nand_release(mtd); /* deletes partitions and mtd devices */
> -		free_bch(doc->bch);
> -		kfree(nand);
> -	}
> +fail:
> +	nand_release(mtd); /* deletes partitions and mtd devices */
> +	free_bch(doc->bch);
> +	kfree(nand);
>  
>  fail_unmap:
>  	iounmap(virtadr);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
