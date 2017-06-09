Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dJHab-0003cO-EJ
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 10:56:26 +0000
Date: Fri, 9 Jun 2017 12:56:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Pavel Machek <pavel@ucw.cz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fsl_ifc: remove unused variable
Message-ID: <20170609125603.4ed0a8ff@bbrezillon>
In-Reply-To: <20170609104829.3488073-1-arnd@arndb.de>
References: <20170609104829.3488073-1-arnd@arndb.de>
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

On Fri,  9 Jun 2017 12:47:43 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> This one was accidentally introduced without any references,
> and it causes a harmless warning:
> 
> drivers/mtd/nand/fsl_ifc_nand.c: In function 'fsl_ifc_read_page':
> drivers/mtd/nand/fsl_ifc_nand.c:696:7: error: unused variable 'res' [-Werror=unused-variable]
> 
> Fixes: 79f40cc12fd3 ("mtd: nand: fsl_ifc: fix handing of bit flips in erased pages")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

If you don't mind, I'll squash the change in the initial commit.

Thanks,

Boris

> ---
>  drivers/mtd/nand/fsl_ifc_nand.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 14ef2f4524ac..d1c4538f870f 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -693,8 +693,6 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  
>  	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
> -		int res;
> -
>  		if (!oob_required)
>  			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  
