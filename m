Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e3O7b-0002IC-2s
 for linux-mtd@lists.infradead.org; Sat, 14 Oct 2017 15:13:28 +0000
Date: Sat, 14 Oct 2017 17:12:45 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Export nand_reset() symbol
Message-ID: <20171014171245.2522f9f7@bbrezillon>
In-Reply-To: <20171005165319.30391-1-boris.brezillon@free-electrons.com>
References: <20171005165319.30391-1-boris.brezillon@free-electrons.com>
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

On Thu,  5 Oct 2017 18:53:19 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit 6e532afaca8e ("mtd: nand: atmel: Add PM ops") started to use the
> nand_reset() function which was not yet exported by the NAND framework
> (because it was only used internally before that). Export this symbol
> to avoid build errors when the driver is enabled as a module.

Applied.

> 
> Fixes: 6e532afaca8e ("mtd: nand: atmel: Add PM ops")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c63e4a88a653..4c867115c53b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1244,6 +1244,7 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(nand_reset);
>  
>  /**
>   * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
