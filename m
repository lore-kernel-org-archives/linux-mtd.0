Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Singh, Vimal" <vimalsingh@ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	, <ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Aug 2008 08:53:00 +0300
Message-Id: <1219384380.18027.99.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	Woodhouse <dwmw2@infradead.org>, David@mgw-mx06.nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-08-22 at 11:09 +0530, Singh, Vimal wrote:
> @@ -154,10 +156,12 @@ int nand_calculate_ecc(struct mtd_info *
>  {
>         int i;
>         const uint32_t *bp =3D (uint32_t *)buf;
> +       /* 256 or 512 bytes/ecc  */
> +       uint32_t j =3D(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;

"j" is not descriptive. And I guess "const" modifier may be used for it.
Not sure it'll give any performance benefit, but it may affect gcc
optimizations. I would instead introduce:

const int eccsize_mult =3D ((struct nand_chip *)mtd->priv)->ecc.size >> 8;

>         uint32_t cur;           /* current value in buffer */
> -       /* rp0..rp15 are the various accumulated parities (per byte) */
> +       /* rp0..rp15..rp17 are the various accumulated parities (per byte=
) */
>         uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
> -       uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
> +       uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15, rp16, rp17=
;
>         uint32_t par;           /* the cumulative parity for all data */
>         uint32_t tmppar;        /* the cumulative parity for this iterati=
on;
>                                    for rp12 and rp14 at the end of the lo=
op */
> @@ -169,6 +173,8 @@ int nand_calculate_ecc(struct mtd_info *
>         rp10 =3D 0;
>         rp12 =3D 0;
>         rp14 =3D 0;
> +       rp16 =3D 0;
> +       rp17 =3D 0; /* to make cmpiler happy */
>=20
>         /*
>          * The loop is unrolled a number of times;
> @@ -180,7 +186,7 @@ int nand_calculate_ecc(struct mtd_info *
>          * needed for calculating rp12, rp14 and par
>          * also used as a performance improvement for rp6, rp8 and rp10
>          */
> -       for (i =3D 0; i < 4; i++) {
> +       for (i =3D 0; i < 4*j; i++) {
Here I would rather use:

for (i =3D 0; i < eccsize_mult << 2; i++) {

to avoid multiplication.

> +               code[2] =3D
> +                   (invparity[par & 0xf0] << 7) |
> +                   (invparity[par & 0x0f] << 6) |
> +                   (invparity[par & 0xcc] << 5) |
> +                   (invparity[par & 0x33] << 4) |
> +                   (invparity[par & 0xaa] << 3) |
> +                   (invparity[par & 0x55] << 2) |
> +                   3;
> +       else if (j =3D=3D 2)
this should be just else, not else if.

> +               code[2] =3D
> +                   (invparity[par & 0xf0] << 7) |
> +                   (invparity[par & 0x0f] << 6) |
> +                   (invparity[par & 0xcc] << 5) |
> +                   (invparity[par & 0x33] << 4) |
> +                   (invparity[par & 0xaa] << 3) |
> +                   (invparity[par & 0x55] << 2) |
> +                   (invparity[rp17] << 1) |
> +                   (invparity[rp16] << 0);


> -               byte_addr =3D (addressbits[b1] << 4) + addressbits[b0];
> +               if (j =3D=3D 1)
> +                       byte_addr =3D (addressbits[b1] << 4) + addressbit=
s[b0];
> +               else if (j =3D=3D 2)
> +                       byte_addr =3D (addressbits[b2 & 0x3] << 8) +
> +                                   (addressbits[b1] << 4) + addressbits[=
b0];
Similar.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
