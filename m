Message-ID: <1412077088.9388.98.camel@decadent.org.uk>
Subject: Re: [PATCH v2 3/5] spi-nor: Make spi_nor_scan() take a chip type
 name, not an spi_device_id
From: Ben Hutchings <ben@decadent.org.uk>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 30 Sep 2014 12:38:08 +0100
In-Reply-To: <CACna6ryNp7+4y7oSs60atDZhUwFhiAyV4Oq5ELi1gyen45zhVw@mail.gmail.com>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043317.9388.84.camel@decadent.org.uk>
 <CACna6ryNp7+4y7oSs60atDZhUwFhiAyV4Oq5ELi1gyen45zhVw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FaR6w+mkjz/rGUa+nUPR"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FaR6w+mkjz/rGUa+nUPR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-09-30 at 07:14 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 30 September 2014 04:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> > @@ -236,16 +236,13 @@ static int m25p_probe(struct spi_device *spi)
> >          * If that's the case, respect "type" and ignore a "name".
> >          */
> >         if (data && data->type)
> > -               id =3D spi_nor_match_id(data->type);
> > +               name =3D data->type;
> >
> >         /* If we didn't get name from platform, simply use "modalias". =
*/
> > -       if (!id) {
> > -               id =3D spi_nor_match_id(spi_get_device_id(spi)->name);
> > -               if (WARN_ON(!id))
> > -                       return -ENODEV;
> > -       }
> > +       if (!name)
> > +               name =3D spi_get_device_id(spi)->name;
>=20
> Huh? Iterating the whole id_table, checking the entries (looking for
> one with name equal to the spi->modalias) and then... getting that
> name?

Ah, I didn't realise what spi_get_device_id() was doing.

> Did it hurt to use the patch I've sent
> mtd: m25p80: get rid of spi_get_device_id
> https://patchwork.ozlabs.org/patch/394328/

It would make sense to insert that before this.

Ben.

--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-FaR6w+mkjz/rGUa+nUPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCqWIee/yOyVhhEJAQpbwQ/6AsCGHTguJy8VSxRdxRSY/iXoSaNTBdzL
zXCDNAyS1nu8wD/hoHE2uz8Y4S2VeP4jy1cusbA85sO1evQBV4qweRP7WiQy3QpI
bWn9LasF36EJ9PTBqoBFqcF8PXShv1xGv4FmDIZpAQ2Uwum6YmO/ErJoamNbrVCA
Z9l0ibY3s5flrKY5N/2PO66D5+3IUON8MKKHTdvwMvzIh2M/lfYlTyfpuYfeGJdM
PIQErUZ2znWBISKxstCqrNbP6qeH3xMbpi3BO0mu+0OCov+DhTMVTtBqP3B+yoi3
UCLT81XrVCNvNG8B0OHq36NEbG4tSGPEHqRUsCC0z/gh51XP50iI0RpObMXHouWa
dfmO8r2N2fi9DPtl6XCJ1bgZYpQBIENI35ZLA9NfsRwD/mdlUPiUf/Y1pD0I+g8F
wB9uzVcHCVtm45TTvSK8f+sjKlw5t/LWRi+NqbiYvel6IfUV/AtTHbX84+y4/hc7
B4PqIJed2dxTwNByjojaCT+cUf1rO7QIXShnb/bvtOh9MyoFpUaTprNbDIoLjIJS
elx4mU0WcgUuaz+YiuuknG30fSOK1n2/ATWWc8SxNASYgf+tYizLHf0G09nkBUe9
jLbUYO6RcqUb6UaAPSXZUExVhrgWsU9zTf1PNdmoZDAU805N4srZFydNNhfEd5ir
nmUfYX70CAU=
=16i9
-----END PGP SIGNATURE-----

--=-FaR6w+mkjz/rGUa+nUPR--
