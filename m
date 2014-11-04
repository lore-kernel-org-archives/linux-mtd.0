Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xle2N-0003CZ-PN
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 13:20:45 +0000
Message-ID: <5458D219.4010406@free-electrons.com>
Date: Tue, 04 Nov 2014 10:18:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Dragan Marinkovic <marinkovic.dragan@gmail.com>
Subject: Re: squashfs on top of ubi
References: <CAKNKmJS-vKgzjfU4A9t188HHrTqKBwW_i2D7rm4Jxw2rFUUYZA@mail.gmail.com>
In-Reply-To: <CAKNKmJS-vKgzjfU4A9t188HHrTqKBwW_i2D7rm4Jxw2rFUUYZA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="RXv0skpIunbqXXLh8g00nmkRercdBChSp"
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RXv0skpIunbqXXLh8g00nmkRercdBChSp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2014 01:12 AM, Dragan Marinkovic wrote:
[..] I was able to back port the changes =E2=80=8Bto=E2=80=8B Linux 3.4 a=
nd managed
> to get ubiblkvol userlan=E2=80=8Bd=E2=80=8B tool up and running. So far=
, so good.
>=20

Great! :)

> I have a few questions though=E2=80=8B:
> * What is the mechanics of actually adding squashfs image on top of UBI=
 and
> mount it from userland? I have monolithic kernel.
>=20

Well, once you have an ubiblock0_0 device it's just like any other block
device. The raw UBI volume and the block device are 1:1 so you can write
an image to the ubi0_0 volume and you'll be able to mount through the
block device:

mount -o,ro /dev/ubiblock0_0 /mnt

I have some notes with a sort of howto here waiting to be published, let
me see if I can get it in shape.

> * The current version of the driver is RO. I found some of your work fr=
om
> 2012 which introduces read-write ubiblock driver (
> http://lists.infradead.org/pipermail/linux-mtd/2012-December/045274.htm=
l).
> Is this something that could be potentially used? There is also
> http://webcache.googleusercontent.com/search?q=3Dcache:http://patchwork=
=2Eozlabs.org/patch/323628/
> which seems to indicate that there are two separate versions of ubi blo=
ck
> driver. With the exception of th=E2=80=8Bat=E2=80=8B post, I can't find=
 any other reference to RW ubiblock driver.
> Could you shed some light on this?
>=20

You can find the history and evolution of this driver in this cover lette=
r:

http://lists.infradead.org/pipermail/linux-mtd/2014-February/052228.html

As you can see at some point we decided to remove write support.

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com


--RXv0skpIunbqXXLh8g00nmkRercdBChSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUWNIgAAoJEIOKbhOEIHKi8JwQALpBcQZmaBtkgWTRGLt1Y00k
1x9wyghJk2KYj8Zd+owhV0yRnDlz6duln0uavbFaffIA0TjOfQHK/rwjfCp9MvWl
y8KQ0FlbGLpYLLDY4/qOHadXWrSWCthQE3bOXAB48flMlxnl9XA2wVQP+jeBhHtu
k3eWaHR6cq+OXrw8NpOTbt9/WHZ/92o7DzUsGO13ZRSAgrkmOcrS7b2P+Xn39A/X
IuW+rbMLIsw5rv14WVL9Elk1b+6CcgBHUIbSi314biusKz8ooACN1KuOcbUptuaC
cNeWd8lDMbABee44E3Ms0JWdn0WeTWoU3+mUg8cocBWz86JpcFjq0tdMv3R4xeM5
bg7kDj47RWclidB1oIlSHAGTvDSIh6+QhYsQgGIt9FPzvRGtpKqzmMwLCLAGBGvZ
hDJz2p+fU3E6nE/AM1v+Mo5ZAMxBydfTphBdYHTiYnpkFBGczDdKyFEDQSGYV2UP
Yv96J/sZmH2CcWAA7J7Plv9HWBPP6W5kbRxMqkkPVWYfisDM7+6FVeV6hHT6qae2
KFpsRcFsi5WCo1+HJlv8lXf6qIzwFdmkViSkkZuh1V39pzyYSxOhCQO4loc+aIGp
WJzeLTyf8csPyPJsmMDEpHsyj2on0bhKlLkZyBrM4XjG3Ts2Gw9OUJPUVKGjizE5
tdYCXfIAFfFob3KwTGKK
=ldPw
-----END PGP SIGNATURE-----

--RXv0skpIunbqXXLh8g00nmkRercdBChSp--
