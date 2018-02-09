Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ek4OP-00067m-Av
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 08:50:51 +0000
Date: Fri, 9 Feb 2018 09:50:27 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: warn if hamming layout is used with too
 large ECC
Message-ID: <20180209095027.63da257d@bbrezillon>
In-Reply-To: <20180208233305.20583-1-stefan@agner.ch>
References: <20180208233305.20583-1-stefan@agner.ch>
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

On Fri,  9 Feb 2018 00:33:05 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Warn in case a driver uses too large ECC with hamming layout.
> This is especially helpful since hamming layout is the default
> layout when using hardware ECC and no specific OOB layout is
> specified.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/nand_base.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 96c97588e1ba..2f3f43d0e288 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -197,6 +197,8 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
>  		return -EINVAL;
>  	}
>  
> +	WARN_ON(mtd->oobsize - ecc_offset < ecc->total);
> +

Did you hit this problem? Anyway, if there's a case where the number of
ECC bytes does not fit in the space reserved for ECC, there's a bug
before this point, and this should be checked at init/probe time.

>  	if (section == 0) {
>  		oobregion->offset = 2;
>  		oobregion->length = ecc_offset - 2;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
