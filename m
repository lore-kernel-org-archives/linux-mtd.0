Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwock-0000HQ-UT
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 09:56:59 +0000
Subject: Re: [PATCH v2 0/5] mkfs.ubifs: cleanups + extended attribute support
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
 <CAFLxGvzd8R3ZWD7WHUzTwjdEfd9y+249x7CTUWLJvbPWOF7cnA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <56446247.9030808@pengutronix.de>
Date: Thu, 12 Nov 2015 10:56:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzd8R3ZWD7WHUzTwjdEfd9y+249x7CTUWLJvbPWOF7cnA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WkTp212f4Vbu4OHv29NQKU3VP1xgxBcoj"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WkTp212f4Vbu4OHv29NQKU3VP1xgxBcoj
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2015 10:53 AM, Richard Weinberger wrote:
> On Thu, Nov 12, 2015 at 10:31 AM, Marc Kleine-Budde <mkl@pengutronix.de=
> wrote:
>> Hello,
>>
>> this series applies to current git master. The first 3 patches are cle=
anup
>> patches, in the 4th adds extended attributes support. Patch 5 adds a o=
ption to
>> write the used inode number to an extended attribute, so that other of=
fline
>> tools like IMA, that process the inode number can work. See descriptio=
n of
>> patch 5 for a detailed explanation.
>>
>> regards,
>> Marc
>>
>> changes since v1:
>> - add Daniel Walter's reviewed by to patches 1-3
>> - add option to build without xattr support - patches 4,5 (as Daniel s=
uggested)
>> - switch from dynamically allocated attr value buffer to fixed size ar=
ray on stack,
>>   as inode numbers where not stable between mkfs.ubifs invocations - p=
atch 4
>=20
> Applied and pushed.

Thanks.

> And bonus points for rebasing to the latest mtd-utils tree! :-)

I've to pass at least half of the bonus points to the git developers, as
git detected and handled the tree restructuring without any manual
interaction. \o/

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--WkTp212f4Vbu4OHv29NQKU3VP1xgxBcoj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJWRGJMAAoJEP5prqPJtc/HA0IH/0iVf48suinJE2kQYOmfoz7f
vqv2QXS8G8/a5S70/qS53NfPWnQNJu0dBgaUiFT4spcDGwMC1qp+ZjAQinxUsNp+
1ExJ/XSRokKSUm19XPlFRBxE9lbyc3taJJB+AbrjHwdyK9tFj4wE10xHml6KZagp
22SLe/6MuNdkQrtak2eSQduDh6i/dPKXkBskxgYRaB4SLEqRgI0rTmgk1zJEGehp
xsmLBwKzUvZLRmqyQDpGe8IX8wuFgK7BqscKdf3eBnZfY6s/edH8glHmsZ6RQeVw
CmwFl0gVwOhzLnCpzG3RSs6u6rQJlHDRYjvWPUB/SmRaoH/8lOFggYAsOy2mwGo=
=SD/5
-----END PGP SIGNATURE-----

--WkTp212f4Vbu4OHv29NQKU3VP1xgxBcoj--
