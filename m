Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2yk0-00045q-GX
 for linux-mtd@lists.infradead.org; Fri, 13 Oct 2017 12:07:02 +0000
Subject: Re: [PATCH] mtd: nand: omap2: Do not assign omap_nand_info to
 platform drvdata
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-omap@vger.kernel.org>
References: <20171010133245.jlwto3gpmin5bmtw@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <ba3bdf7e-fae9-0541-756a-b1447ffb2dc6@ti.com>
Date: Fri, 13 Oct 2017 15:06:27 +0300
MIME-Version: 1.0
In-Reply-To: <20171010133245.jlwto3gpmin5bmtw@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFHi,


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 10/10/17 16:32, Ladislav Michl wrote:
> commit 67ce04bf2746 ("mtd: nand: add OMAP2/OMAP3 NAND driver") assigned
> pointer to omap_nand_info to the platform drvdata in probe function
> just to be reasigned later to the pointer to mtd_info, which is
> what remove function expects it to be. Remove useless assignment.
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

Tested on dra7-evm.

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  drivers/mtd/nand/omap2.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 01368a8f9e3f..a97c1aeed55e 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1823,7 +1823,6 @@ static int omap_nand_probe(struct platform_device *=
pdev)
>  	if (err)
>  		return err;
> =20
> -	platform_set_drvdata(pdev, info);
>  	info->ops =3D gpmc_omap_get_nand_ops(&info->reg, info->gpmc_cs);
>  	if (!info->ops) {
>  		dev_err(&pdev->dev, "Failed to get GPMC->NAND interface\n");
>=20

--=20
cheers,
-roger
