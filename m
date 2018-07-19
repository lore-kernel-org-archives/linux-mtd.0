Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGDj-0001rp-1i
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:12:20 +0000
Date: Thu, 19 Jul 2018 23:11:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] mtd: rawnand: jz4740: Use the proper format specifier
 to print chipnr
Message-ID: <20180719231156.2d3c53ee@xps13>
In-Reply-To: <20180719073720.19887-1-boris.brezillon@bootlin.com>
References: <20180719073720.19887-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
09:37:20 +0200:

> In jz_nand_detect_bank(), chipnr is a size_t argument. Use %zu instead
> of %i when printing it.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/jz4740_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz=
4740_nand.c
> index 1f7aff04ad8a..9bb8a89e09f9 100644
> --- a/drivers/mtd/nand/raw/jz4740_nand.c
> +++ b/drivers/mtd/nand/raw/jz4740_nand.c
> @@ -355,7 +355,7 @@ static int jz_nand_detect_bank(struct platform_device=
 *pdev,
>  		mtd->size +=3D chip->chipsize;
>  	}
> =20
> -	dev_info(&pdev->dev, "Found chip %i on bank %i\n", chipnr, bank);
> +	dev_info(&pdev->dev, "Found chip %zu on bank %i\n", chipnr, bank);
>  	return 0;
> =20
>  notfound_id:

Applied to nand/next.

Thanks,
Miqu=C3=A8l
