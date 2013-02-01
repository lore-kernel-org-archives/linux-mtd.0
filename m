Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U1Jug-0006Hq-Ar
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 16:56:31 +0000
Message-ID: <1359737889.2942.17.camel@sauron.fi.intel.com>
Subject: Re: question about mtd_torturetest.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 01 Feb 2013 18:58:09 +0200
In-Reply-To: <50FF9068.1030709@freescale.com>
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>
 <50FCB75D.1000200@freescale.com> <50FD02EA.5050209@parrot.com>
 <50FD0554.8030108@freescale.com> <50FD073C.8050209@parrot.com>
 <50FD0981.8050507@freescale.com> <50FD0B3D.2070803@parrot.com>
 <50FD0BE9.3020506@freescale.com> <50FF9068.1030709@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Qhd9HTTJO/4ArAXC8inN"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Lin Wei-B34918 <B34918@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Qhd9HTTJO/4ArAXC8inN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-23 at 15:25 +0800, Huang Shijie wrote:
> Hi all:
>=20
>     The mtd_torturetest.c uses the 55/AA patterns to torture the nand blo=
ck.
> Are the 55/AA patterns more tougher then the random data?

Probably not, please, improve the test.

--=20
Best Regards,
Artem Bityutskiy

--=-Qhd9HTTJO/4ArAXC8inN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRC/QhAAoJECmIfjd9wqK01VcQAL99Ds+y6Jl5tZ5JicE3486H
CdDNkMXvOpkyWkis8Uy1A2dxRJ6Er7aJIB+Lx4vrLYJFhuIV3dWIgJduQVdxKFKz
/qxyyHCXP22iZ4Qa1ggL8hnA9xOyYp1pj7inGx9W34RBK+YP+7g9lPOX1aw83ebW
hxhGGM6UCR5e3Nqg0oLtnIRz04HS6JFjz0xCHHv9NY8o5HRjyVLv6zXR47uoBT/e
f+gPhiCZ2EKAeb8JSvI7oCIcHGZ5k4apaixX6Qrs1yx1w6TpeIm4dYca6IudY+Vd
6MNPQX4IJOYfzdUPMFYG7EvowoMYX2D1cARdHRj6w0SBCeqEIF39TMV+xv1LXpMK
NxAvGTFIL4xOeafOIk5c3I65paOMDziY0vSRlQkIwAiU9/GFlbUooIPDKWB1BQB7
aFJma1bB56L8d/OXNXsyHI8Fn08bwABp2W5pSJ+9CZatDVgk0g4siBQohXyjX4NA
o44aC1vV6cdMxyOKMFLVb75fGb6lWS6qCY+zMRt65cxZQ+2M70JLf2u+q5P2QhQX
1jAKd/XlpFDGJNeAVkV6NIcAdh7fLeoueCRE3RMZ9VZ8Enme7yErPA6gP7cTN5zI
DEze6lmSnIreOsIAZOiNoqWN3+ElwWcyKmtiwMHzUgUXMGrDOZQ/OyRJhf8nV/yG
DWgx1LWQ3ruY3Ck3tsou
=/Koy
-----END PGP SIGNATURE-----

--=-Qhd9HTTJO/4ArAXC8inN--
