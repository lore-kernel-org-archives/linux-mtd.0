Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAMwq-0005jH-KS
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 20:50:34 +0000
Date: Mon, 15 May 2017 22:50:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: drop unneeded module.h include
Message-ID: <20170515225001.1f98424e@bbrezillon>
In-Reply-To: <20170502000455.13240-3-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-3-computersforpeace@gmail.com>
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

On Mon,  1 May 2017 17:04:52 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> nand_ids isn't a separate module anymore and doesn't need this header.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to nand/fixes.

Thanks,

Boris

> ---
>  drivers/mtd/nand/nand_ids.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index 9d5ca0e540b5..92e2cf8e9ff9 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -6,7 +6,6 @@
>   * published by the Free Software Foundation.
>   *
>   */
> -#include <linux/module.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/sizes.h>
>  
