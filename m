Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arKr3-0008DO-Ea
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 07:41:22 +0000
Date: Sat, 16 Apr 2016 09:40:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@atmel.com>, Josh
 Wu <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 04/12] mtd: nand: atmel: set ECC algorithm explicitly
Message-ID: <20160416094059.44d6a6aa@bbrezillon>
In-Reply-To: <1460750052-16285-5-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-5-git-send-email-zajec5@gmail.com>
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

On Fri, 15 Apr 2016 21:54:04 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Set it to value obtained from platform data with fallback to Hamming.
> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/atmel_nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index eec8ca7..6aa82e4 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1212,6 +1212,7 @@ static int atmel_pmecc_nand_init_params(struct plat=
form_device *pdev,
>  		dev_warn(host->dev,
>  			"Can't get I/O resource regs for PMECC controller, rolling back on so=
ftware ECC\n");
>  		nand_chip->ecc.mode =3D NAND_ECC_SOFT;
> +		nand_chip->ecc.algo =3D NAND_ECC_HAMMING;
>  		return 0;
>  	}
> =20
> @@ -1295,6 +1296,7 @@ static int atmel_pmecc_nand_init_params(struct plat=
form_device *pdev,
>  		/* page size not handled by HW ECC */
>  		/* switching back to soft ECC */
>  		nand_chip->ecc.mode =3D NAND_ECC_SOFT;
> +		nand_chip->ecc.algo =3D NAND_ECC_HAMMING;
>  		return 0;
>  	}
> =20
> @@ -1613,6 +1615,7 @@ static int atmel_of_init_port(struct atmel_nand_hos=
t *host,
>  	 * even if the nand-ecc-mode property is not defined.
>  	 */
>  	host->nand_chip.ecc.mode =3D NAND_ECC_SOFT;
> +	host->nand_chip.ecc.algo =3D NAND_ECC_HAMMING;
> =20
>  	return 0;
>  }
> @@ -1629,6 +1632,7 @@ static int atmel_hw_nand_init_params(struct platfor=
m_device *pdev,
>  		dev_err(host->dev,
>  			"Can't get I/O resource regs, use software ECC\n");
>  		nand_chip->ecc.mode =3D NAND_ECC_SOFT;
> +		nand_chip->ecc.algo =3D NAND_ECC_HAMMING;
>  		return 0;
>  	}
> =20
> @@ -1661,6 +1665,7 @@ static int atmel_hw_nand_init_params(struct platfor=
m_device *pdev,
>  		/* page size not handled by HW ECC */
>  		/* switching back to soft ECC */
>  		nand_chip->ecc.mode =3D NAND_ECC_SOFT;
> +		nand_chip->ecc.algo =3D NAND_ECC_HAMMING;
>  		return 0;
>  	}
> =20
> @@ -2159,6 +2164,7 @@ static int atmel_nand_probe(struct platform_device =
*pdev)
>  		memcpy(&host->board, dev_get_platdata(&pdev->dev),
>  		       sizeof(struct atmel_nand_data));
>  		nand_chip->ecc.mode =3D host->board.ecc_mode;
> +		nand_chip->ecc.algo =3D host->board.ecc_algo;

If you follow my suggestion on patch 3, it should be:

		if (host->board.ecc_mode =3D=3D NAND_ECC_SOFT)
			nand_chip->ecc.algo =3D NAND_ECC_HAMMING;

This way we avoid any dependency between the avr32 and nand tree.

> =20
>  		/* 16-bit bus width */
>  		if (host->board.bus_width_16)



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
