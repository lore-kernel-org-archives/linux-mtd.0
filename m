Message-ID: <1412076963.9388.96.camel@decadent.org.uk>
Subject: Re: [PATCH v2 5/5] m25p80,spi-nor: Share the list of supported chip
 type names again
From: Ben Hutchings <ben@decadent.org.uk>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 30 Sep 2014 12:36:03 +0100
In-Reply-To: <CACna6ry3=+1GLRCvd_xOGBHjQmEGdYT-eM4YFfzO2Fkw9BHSTA@mail.gmail.com>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043352.9388.86.camel@decadent.org.uk>
 <CACna6ry3=+1GLRCvd_xOGBHjQmEGdYT-eM4YFfzO2Fkw9BHSTA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rqTtrhfOyP8quG7KpDqQ"
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


--=-rqTtrhfOyP8quG7KpDqQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-09-30 at 10:02 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 30 September 2014 04:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> > Move the list of chip type information to a macro in spi-nor.h, but
> > leave the definitions of INFO and CAT25_INFO in spi-nor.
> >
> > In m25p80, define the INFO and CAT25_INFO macros to initialise a
> > struct spi_device_id with the name, ignoring the remaining parameters.
>=20
> Anyone would consider my idea proposed in 1/5 thread?
>=20
> We could simply follow the way Linux-specific platform data works. We
> could always use
> compatible =3D "m25p80";
> and then for some rare cases (where JEDEC fails) add something like
> model =3D "at25df321a";
>=20
> Using above way we could use a one single "compatible" in m25p80.c and
> avoid this messy share of id_table.

You *cannot* define a DT compatible string by reference to out-of-band
information about all the chips that has to be updated for each new
chip.

That is not 'compatible'.

Ben.

--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-rqTtrhfOyP8quG7KpDqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCqVo+e/yOyVhhEJAQpmwQ//T8sXfO872ZM2rdIETSlCqWGy1okTabEe
Olrjr9WzQ90ewsuCCITZ7GZGPRNfCZF6mhW9/mTLIAkBBezaIfDr7qbkJ3IyhduP
XI9fhLgz5IMpbbXH1aJZs8SeXdkAFoB/2kPtP/HEAtqV0x7udhExriISKZadHU6g
1orVnbuiajW73jTJCO6uXzdmMktiw5hwaM1ebS7TXkL6qbgViaz+NMaf+y0bJMlw
9ZohWmgM1VYahhOTZdfU2tyh49/k324aE/26LhIgmw+kVqks99+KSCkqV9bXGTZI
ZvXF7AlDkwQKuBcT4N8xts5oiT+ANtom5oLqdG+tlQtLkDjlebeb/bgBRDGZvgv8
Vi74u0wFdyMaWMnwlVvXqBUzYblxb/lzWyRMRnNRc3PZTwLIwyWl/waA+cVb7gT7
QTBJvdinuGxhqPZZ6/kk86fSAo0xMwjQAbDOKBXRCcmdI5ETLfFJ4hON/q4Awf7b
/sWTrwWaEWMILYGGAStq7kRwLHplV0Cx+AS/9z0CDkUPgJ2SSqM+UVLTTLfQcUKL
UkbcBOSmEidDBEC23XlZg3W0YlE5ovYlY6B/f8OqsJBfV9GjnS+4+tmPkz2dYpKB
M3FDsEceX/NtlDK8H995oIqwrBlYZN6LuEfEHSkovczUWr9I4EiESmFnbza6yeD5
aaL8Ncs5qmA=
=68IN
-----END PGP SIGNATURE-----

--=-rqTtrhfOyP8quG7KpDqQ--
