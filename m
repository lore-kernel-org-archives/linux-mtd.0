Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elLZJ-00087n-MR
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:23:23 +0000
Date: Mon, 12 Feb 2018 22:22:59 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: nand: vf610: set correct ooblayout
Message-ID: <20180212222259.57b62131@bbrezillon>
In-Reply-To: <20180209122142.13272-1-stefan@agner.ch>
References: <20180209122142.13272-1-stefan@agner.ch>
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

On Fri,  9 Feb 2018 13:21:42 +0100
Stefan Agner <stefan@agner.ch> wrote:

> With commit 3cf32d180227 ("mtd: nand: vf610: switch to
> mtd_ooblayout_ops") the driver started to use the NAND cores
> default large page ooblayout. However, shortly after commit
> 6a623e076944 ("mtd: nand: add ooblayout for old hamming layout")
> changed the default layout to the old hamming layout, which is
> not what vf610_nfc is using. Specify the default large page
> layout explicitly.

Applied.

Thanks,

Boris

> 
> Fixes: 6a623e076944 ("mtd: nand: add ooblayout for old hamming layout")
> Cc: <stable@vger.kernel.org> # v4.12+
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/vf610_nfc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 80d31a58e558..f367144f3c6f 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -752,10 +752,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  		if (mtd->oobsize > 64)
>  			mtd->oobsize = 64;
>  
> -		/*
> -		 * mtd->ecclayout is not specified here because we're using the
> -		 * default large page ECC layout defined in NAND core.
> -		 */
> +		/* Use default large page ECC layout defined in NAND core */
> +		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
>  		if (chip->ecc.strength == 32) {
>  			nfc->ecc_mode = ECC_60_BYTE;
>  			chip->ecc.bytes = 60;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
