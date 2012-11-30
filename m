Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeP6j-0005tr-FY
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:50:16 +0000
Message-ID: <1354276262.30168.102.camel@sauron.fi.intel.com>
Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Fri, 30 Nov 2012 13:51:02 +0200
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3AF1D4E4@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
 <1353483740.2701.1.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AF1D4E4@SI-MBX14.de.bosch.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+xtzo/nwRXaoobGhnNEB"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+xtzo/nwRXaoobGhnNEB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, sorry for long delay, but would you please re-send this in a nice
form:

1. Wrap commit message lines to 80 characters.
2. Make the patch applicable with 'git am' - this one does not apply.

Thanks!

On Thu, 2012-11-22 at 16:20 +0100, Prins Anton (ST-CO/ENG1.1) wrote:
> [PATCH] mtd: maps/physmap_of.c: change error checking to prevent a NULL p=
ointer dereference if no DTS tuple is mappable
>=20
> This patch solves a NULL pointer dereference, this may occur if the tuple=
 is not mappable (jumps to continue in the for-loop).
> Out of the loop possible results are:=20
> - info->list_size =3D=3D 0  if no of the tuples is mappable
> - info->list_size =3D=3D 1
> - info->list_size > 1
> If no one of the supplied tuples is mappable (info->list_size =3D=3D 0) a=
nd info->cmtd will not be set.
> But it is used in mtd_device_parse_register, OOPS... if should generate a=
n error in this case!
>=20
> [From: Anton Prins <anton.prins@nl.bosch.com>]
>=20
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.=
c
> index 2e6fb68..f6de444 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -268,6 +268,7 @@ static int __devinit of_flash_probe(struct platform_d=
evice *dev)
>         }
>=20
>         err =3D 0;
> +       info->cmtd =3D NULL;
>         if (info->list_size =3D=3D 1) {
>                 info->cmtd =3D info->list[0].mtd;
>         } else if (info->list_size > 1) {
> @@ -276,9 +277,10 @@ static int __devinit of_flash_probe(struct platform_=
device *dev)
>                  */
>                 info->cmtd =3D mtd_concat_create(mtd_list, info->list_siz=
e,
>                                                dev_name(&dev->dev));=0D- =
              if (info->cmtd =3D=3D NULL)
> -                       err =3D -ENXIO;
>         }
> +       if (info->cmtd =3D=3D NULL)
> +               err =3D -ENXIO;
> +
>         if (err)
>                 goto err_out;
>=20
> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
> Sent: woensdag 21 november 2012 8:42
> To: Prins Anton (ST-CO/ENG1.1)
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c
> On Fri, 2012-11-09 at 08:45 +0100, Prins Anton (ST-CO/ENG1.1) wrote:=0D> =
commit 0905a6f4aec377123e94d2260f2f7a0d867e19be
> > Author: Anton Prins <anton.prins@nl.bosch.com>
> > Date:   Fri Nov 9 10:12:58 2012 +0100
> >=20
> >     Correct error checking to prevent a NULL pointer dereference
> >=20
> >     The problem only occurs if the DTS is not correct, the requested ma=
pping is not reserved on the parent bus.
> >     In this special case the count is 1, but the list_size after mappin=
g is 0. list_size 0 should generate an error!
>=20
> Sorry, I do not really understand which problem this patch solves, could
> you please improve the commit message and re-send?
>=20
> >=20
> > diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_o=
f.c
> > index 2e6fb68..83d121e 100644
> > --- a/drivers/mtd/maps/physmap_of.c
> > +++ b/drivers/mtd/maps/physmap_of.c
> > @@ -267,13 +267,14 @@ static int __devinit of_flash_probe(struct platfo=
rm_device *dev)
> >                 info->list[i].mtd->dev.parent =3D &dev->dev;
> >         }
> >=20
>=20
> It seems the error condition should be checked and acted upon here. What
> you looks more like making the code less readable.
>=20
> > -       err =3D 0;
> >         if (info->list_size =3D=3D 1) {
> > +               err =3D 0;
> >                 info->cmtd =3D info->list[0].mtd;
> >         } else if (info->list_size > 1) {
> >                 /*
> >                  * We detected multiple devices. Concatenate them toget=
her.
> >                  */
> > +               err =3D 0;
> >                 info->cmtd =3D mtd_concat_create(mtd_list, info->list_s=
ize,
> >                                                dev_name(&dev->dev));=
=0D>                 if (info->cmtd =3D=3D NULL)
>=20

--=20
Best Regards,
Artem Bityutskiy

--=-+xtzo/nwRXaoobGhnNEB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJ2mAAoJECmIfjd9wqK0wrUP/jA+3ZbuLD5zREG0H573xtMI
KHIO+P27RZ3D/Ny8k20mKoh/dj6sQGoaOjZdl06BHlk1GbYOD94/h604H96ChGv5
H5nst+39eDRpTH3Qfa4t9c8RxWVH9QCBog++Bxwf/cV4q04XuEb4IfAseBwzhIG8
eTta8hXnTN+6X82cWMtJJrKBu51XDm23aVaMT3SOyrxqUxotyKW1mj0DGzXRXIbQ
gO3TbYDrMx4pfOCmc+Z64h4fPJs/XotzOfG6nrM01Y50SUPepYNw8HC7Uh0Bbuy1
QdhIgrabaxdEKmq/zRspaCiXSuWacDQl9CfGf43BvgMm2foo5Gs/tBg81vNB5+LN
xZXGfVa+roWQFa0BEal3FA73O9Xok83CCkmeWu2nlgZ7A94ukAiQMtCJwi3j2Kif
2CzpbYqCaqqxxroX2d/AXnYvoCxyNkpCFEBocRxPvCQb5QWv+WlDQOTq32JHvCuk
4IQRlsYt8HqjVYe8+C8Mc7jqudb02Ki5r6Jq2UXB7rtW+EMK7eWFyjXdAdZzAA1q
Z6dsop0bXU2eyD4VjsNtYO7QAc0S6aljiXJMI7/pf+6lUtOCsg9WblMUFiP/Qwzy
+sDHUnhQZ3VebAdX47zDHGjhwU2vBVGRJB8MeTXn2N2Ffhz/cURYyI7lXKWZMxZe
zYIGK8fFN4jKYk8qwKbe
=WN+7
-----END PGP SIGNATURE-----

--=-+xtzo/nwRXaoobGhnNEB--
