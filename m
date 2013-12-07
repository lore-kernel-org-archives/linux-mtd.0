Date: Sat, 7 Dec 2013 18:23:15 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Disable "armada370-nand" compatible
 support
Message-ID: <20131207232315.GC11251@titan.lakedaemon.net>
References: <1386430787-2962-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1386430787-2962-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Transfer-Encoding: quoted-printable
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel,

I would prefer to call this a 'partial revert of c0f3b8643a6f ...'

On Sat, Dec 07, 2013 at 12:39:47PM -0300, Ezequiel Garcia wrote:
> Currently the "armada370-nand" compatible support is not complete,
> and it was mistake to add it. Instead of completely removing the compat=
ible,
> let's just disable it until all the needed infrastructure is in place.
>=20
> Cc: Emilio L=F3pez <emilio@elopez.com.ar>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---


> The compatible was added in:
>=20
> commit c0f3b8643a6fa2461d70760ec49d21d2b031d611
> Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Date:   Sat Aug 10 16:34:52 2013 -0300
>=20
>     mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible st=
ring

And add this as a oneline in the commit description.

>=20
> Which means the fix should be applied in v3.12 and v3.13.
>=20
> On Emilio's suggestion, I've opted for the disabling, given all the req=
uired
> support is already queued for v3.14. I'll push a patch removing the #if=
 0
> on top of current l2-mtd.git.
>=20
> Brian: Do you think this is OK to be pushed now for v3.13?
>=20
>  drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> index 3d143fe..2c5066f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -333,10 +333,16 @@ static struct of_device_id pxa3xx_nand_dt_ids[] =3D=
 {
>  		.compatible =3D "marvell,pxa3xx-nand",
>  		.data       =3D (void *)PXA3XX_NAND_VARIANT_PXA,
>  	},
> +/*
> + * Currently, the armada370 support is incomplete and can cause the
> + * system to crash. Disable it until all the infrastructure is in plac=
e.
> + */
> +#if 0
>  	{
>  		.compatible =3D "marvell,armada370-nand",
>  		.data       =3D (void *)PXA3XX_NAND_VARIANT_ARMADA370,
>  	},
> +#endif

I prefer to just remove the lines.

thx,

Jason.
