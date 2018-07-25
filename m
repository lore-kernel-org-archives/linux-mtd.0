Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiLyJ-00061L-05
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:45:04 +0000
Date: Wed, 25 Jul 2018 17:44:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 07/17] mtd: rawnand: do not execute nand_scan_ident()
 if maxchips is zero
Message-ID: <20180725174451.23a4a783@bbrezillon>
In-Reply-To: <20180725133152.30898-8-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-8-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 15:31:42 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Some driver (eg. docg4) will need to handle themselves the
> identification phase. As part of the migration to use nand_scan()
> everywhere (which will unconditionnaly call nand_scan_ident()), we add
> a condition at the start of nand_scan_with_ids() to jump over
> nand_scan_ident() if the maxchips parameters is zero, meaning that the
> driver does not want the core to handle this phase.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index dea41fa25be1..42a7a934a17b 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6735,7 +6735,9 @@ static void nand_detach(struct nand_chip *chip)
>  /**
>   * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> - * @maxchips: number of chips to scan for
> + * @maxchips: number of chips to scan for. @nand_scan_ident() will not be run if
> + *	      this parameter is zero (useful for specific drivers that must
> + *	      handle this part of the process themselves, e.g docg4).
>   * @ids: optional flash IDs table
>   *
>   * This fills out all the uninitialized function pointers with the defaults.
> @@ -6748,9 +6750,11 @@ int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	int ret;
>  
> -	ret = nand_scan_ident(mtd, maxchips, ids);
> -	if (ret)
> -		return ret;
> +	if (maxchips) {
> +		ret = nand_scan_ident(mtd, maxchips, ids);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = nand_attach(chip);
>  	if (ret)
