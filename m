Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFEf-0003Bh-IB
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:15:14 +0000
Received: by pbdx9 with SMTP id x9so3273278pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2012 01:15:12 -0800 (PST)
Message-ID: <1328260619.13362.0.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtd: nand: fix printk() warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Feb 2012 11:16:59 +0200
In-Reply-To: <20120131085405.GD22039@elgon.mountain>
References: <20120131085405.GD22039@elgon.mountain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/E15FAOOz6gZebtRJiDY"
Mime-Version: 1.0
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, kernel-janitors@vger.kernel.org,
 Mike Dunn <mikedunn@newsguy.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/E15FAOOz6gZebtRJiDY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 11:54 +0300, Dan Carpenter wrote:
> Gcc complains here:
> drivers/mtd/nand/docg4.c: In function =E2=80=98probe_docg4=E2=80=99:
> drivers/mtd/nand/docg4.c:1277:4: warning: format =E2=80=98%x=E2=80=99 exp=
ects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has ty=
pe =E2=80=98resource_size_t=E2=80=99 [-Wformat]
> drivers/mtd/nand/docg4.c:1277:4: warning: format =E2=80=98%x=E2=80=99 exp=
ects argument of type =E2=80=98unsigned int=E2=80=99, but argument 4 has ty=
pe =E2=80=98resource_size_t=E2=80=99 [-Wformat]
>=20
> We have a standard way of printing these using a format string
> extension.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy


--=-/E15FAOOz6gZebtRJiDY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK6YLAAoJECmIfjd9wqK0r08P/AjJBLWi3HrJWM31V7yBTKTa
GCWcyrPYrIw7fu9st+34aILyf1PFOa/yEcd6hNd9ieKwoZRhrnbWy9PwK8fvnQ5w
bcZEClM9hBf91UKXJPIneEiKON/n5lJtplEdd64eLOdzc/rzhCnJCJN4FX8r99Zu
YtkNScDviPj5ytIcj8Y8hWfPZXy9jiBaz4NBlu/DhU/BcjLegeZ6cfrB45toZOPo
KMIWMGM/PsSCzeRuqg6YJj4vnzFPp9wSZz9U2xfu0Lerd9E2EOTcgtCqVuOHkU9+
em4wnrDRK1UweDVIpdsFTqzMkMPj40Nu7cj/won1nP3ika/vXk5kI1ZktysaHSj0
YaVwxPk85e31zaYEQ3O+vI/nfdRG4pckojBpoQ/ped7jRoOHpL11UqYc5C0s2kQO
gaHSpVS5i+v4dP0YU1byX3R1HJ0PI+0+7ktYkKe7FNe14bJ4o0HGy8o8+1Vr1Wvg
fltkyI4MaQyzz1i0QKZ95Ey6mVWYEcxrVuyP5OSVJzi0GKDjK+WH9K0YIu3ANYYM
x27N32ruO85q2OjQkysMZH12jJtpdWUnHoAKEbmm/XmR78ATuVB4rdAHD3AnCnzO
8luaCHmvE4ChsWfAOd4wt46i3qqgNodFBIzBml48DyRVef1abAIgjXpZR2u82el0
s+3CbXPheC+MAWm9Li5z
=KwqD
-----END PGP SIGNATURE-----

--=-/E15FAOOz6gZebtRJiDY--
