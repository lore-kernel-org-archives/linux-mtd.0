Subject: RE: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
From: Artem Bityutskiy <dedekind@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <000001c93271$5c6ab4c0$3dd66c6b@sisodomain.com>
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
	<000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
	<9c9fda240810091557j529495d5q284a8ab0e0d752dd@mail.gmail.com>
	<1224331498.6770.1362.camel@macbook.infradead.org>
	<000001c93271$5c6ab4c0$3dd66c6b@sisodomain.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Oct 2008 08:54:00 +0300
Message-Id: <1224482040.4466.73.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: 'Kyungmin Park' <kmpark@infradead.org>,
	'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +/**
>   * onenand_get_density - [DEFAULT] Get OneNAND density
>   * @param dev_id	OneNAND device ID
>   *
> @@ -196,6 +280,7 @@ static int onenand_command(struct mtd_info *mtd, int
> cmd, loff_t addr, size_t le
>  {
>  	struct onenand_chip *this =3D mtd->priv;
>  	int value, block, page;
> +	unsigned slc =3D 0;
> =20
>  	/* Address translation */
>  	switch (cmd) {
> @@ -207,15 +292,16 @@ static int onenand_command(struct mtd_info *mtd, in=
t
> cmd, loff_t addr, size_t le
>  		page =3D -1;
>  		break;
> =20
> +	case FLEXONENAND_CMD_PI_ACCESS:
>  	case ONENAND_CMD_ERASE:
>  	case ONENAND_CMD_BUFFERRAM:
>  	case ONENAND_CMD_OTP_ACCESS:
> -		block =3D (int) (addr >> this->erase_shift);
> +		block =3D onenand_get_block(mtd, addr, NULL);

Why do you make SLC slower by adding a function call it which it does
not need? Could you please make it in-line for SLC and a func for MLC.
IOW, I do not like that you make SLC degrade because of supporting MLC.

E.g., you may do it like this:

static inline onenand_get_block()
{
	if (SLC)
 		return addr >> this->erase_shift;
	else
		return flexonenand_get_block()
}

>  		page =3D -1;
>  		break;
> =20
>  	default:
> -		block =3D (int) (addr >> this->erase_shift);
> +		block =3D onenand_get_block(mtd, addr, &slc);
>  		page =3D (int) (addr >> this->page_shift);
> =20
>  		if (ONENAND_IS_2PLANE(this)) {
> @@ -227,6 +313,8 @@ static int onenand_command(struct mtd_info *mtd, int
> cmd, loff_t addr, size_t le
>  			page >>=3D 1;
>  		}
>  		page &=3D this->page_mask;
> +		if (FLEXONENAND(this) && slc)
> +			page &=3D (this->page_mask >> 1);

This is bad. Please, be consistent and use _one_ way to get the address.
Either a function or the if statement. Do not introduce mess by mixing
these approaches.

I tried to review the rest of the patch. But quite frankly, it is so
difficult to do, because you injected little pieces of

if (MLC) {
	do;
	various;
	stuff;
}

all over the place, and made the driver very difficult to follow. Could
you please work some more on the driver and try to improve the
readability? E.g., by making some functions to have 2 separate variants
- one for SLC, one for MLC. If you do not want to duplicate some code -
this is what fuctions exist for.

Also, the patch is line-wrapped. You should read this:
Documentation/SubmittingPatches

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
