Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arKy2-0002cS-AT
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 07:48:35 +0000
Date: Sat, 16 Apr 2016 09:48:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 08/12] mtd: nand: hisi504: set ECC algorithm based on DT
 info
Message-ID: <20160416094811.0e8fcfff@bbrezillon>
In-Reply-To: <1460750052-16285-9-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-9-git-send-email-zajec5@gmail.com>
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

On Fri, 15 Apr 2016 21:54:08 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/hisi504_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_n=
and.c
> index 7bf844c..f917297 100644
> --- a/drivers/mtd/nand/hisi504_nand.c
> +++ b/drivers/mtd/nand/hisi504_nand.c
> @@ -768,6 +768,7 @@ static int hisi_nfc_probe(struct platform_device *pde=
v)
>  	chip->chip_delay	=3D HINFC504_CHIP_DELAY;
> =20
>  	chip->ecc.mode =3D of_get_nand_ecc_mode(np);
> +	chip->ecc.algo =3D of_get_nand_ecc_algo(np);

I'm trying to remove those explicit ecc.xxx =3D of_get_nand_xxx()
assignments and rely on the initialization done in nand_scan_ident()
(see this series [1]).
I'd like to apply the remaining patches in [1] before this series, which
means this patch will be useless. No need to resend the series though,
I'll skip this patch while applying, just wanted to let you know.

> =20
>  	buswidth =3D of_get_nand_bus_width(np);
>  	if (buswidth =3D=3D 16)

[1]http://lkml.iu.edu/hypermail/linux/kernel/1604.0/00298.html

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
