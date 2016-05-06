Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayisE-0006Ar-LU
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 16:45:07 +0000
Date: Fri, 6 May 2016 18:44:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand_bch: fix spelling of "probably"
Message-ID: <20160506184444.69e7cc9b@bbrezillon>
In-Reply-To: <1462552721-93132-1-git-send-email-computersforpeace@gmail.com>
References: <1462552721-93132-1-git-send-email-computersforpeace@gmail.com>
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

On Fri,  6 May 2016 09:38:41 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Can you take it directly into your tree before preparing your PR for
Linus?

> ---
>  drivers/mtd/nand/nand_bch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
> index 28ef7b178eac..44763f87eae4 100644
> --- a/drivers/mtd/nand/nand_bch.c
> +++ b/drivers/mtd/nand/nand_bch.c
> @@ -175,7 +175,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
>  	 * which is called by mtd_ooblayout_count_eccbytes().
>  	 * Make sure they are properly initialized before calling
>  	 * mtd_ooblayout_count_eccbytes().
> -	 * FIXME: we should probaly rework the sequencing in nand_scan_tail()
> +	 * FIXME: we should probably rework the sequencing in nand_scan_tail()
>  	 * to avoid setting those fields twice.
>  	 */
>  	nand->ecc.steps = eccsteps;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
