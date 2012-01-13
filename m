Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlj84-0007PP-H3
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 15:33:21 +0000
Received: by ggnl1 with SMTP id l1so1961872ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 07:33:17 -0800 (PST)
Message-ID: <1326468894.19039.45.camel@sauron.fi.intel.com>
Subject: Re: ubiformat & linux 3.0.14-rt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tim Sander <tim01@iss.tu-darmstadt.de>
Date: Fri, 13 Jan 2012 17:34:54 +0200
In-Reply-To: <201201131006.33998.tim01@iss.tu-darmstadt.de>
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gVic4fP4bqkY12O+dA+3"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gVic4fP4bqkY12O+dA+3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-13 at 10:06 +0100, Tim Sander wrote:
> This happens with or without of ubifs master for 3.0 applied from
> git://git.infradead.org/~dedekind/ubifs-v3.0.git
>=20
> So is there some condition which causes UBI(FS) to take more time in an=
=20
> interrupt routine if the filesystem has been updated? If yes wouldn't it =
be=20
> possible to move this work into:
> ubifs_bgt0_0

Please the very latest patches:

http://git.infradead.org/ubifs-2.6.git

Namely, these should fix the issue:

http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aaa2d0f176=
24f8c2a6c52
http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146140ea4b2=
77193ee5e5f

--=20
Best Regards,
Artem Bityutskiy

--=-gVic4fP4bqkY12O+dA+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEE8eAAoJECmIfjd9wqK0IpMQAKW7fRt89cnjnTneG4/qSll2
dIg4hMePy3rQO2pNTzWwExrVmRBzjF/T53dFwNq4YYwUpkxoCzK+BHVlWboNt/kH
fPQ+xpQBSqb2L7P11TQbw3MHr6yGzjo2x9P9sGSD8Kme6PeJG6B8QL9/uAYFWy0N
w97UTtkwmerhWx1ipWxxKnA/I8Za6513lQhPZKpbhr6GA+1lFZTryvJpe1Wq8rNh
wtKE/2ZON+kNw0+5RcktbnZwa+t3h7668fqeApf0jL284uRQhg3VBmtrYdnIF9mc
2BjYGgznPI3oX+VSw+gPtG/IWkj42kgV0reIJz+8TFjkfNJe/XYHcmi57Vayftzy
L0VvET/zlO8HW+H7qKhxNspcHR0Mb1tV36K85JS9nEgYK9RikCoBYI8o4XnES2dM
IqNPI0lKt2dYm/1NoiuCdQlwPmF5PYlq3oArc+o94B5z3t69HPD1zRr4LzbYx2aY
4j7+ls71ju7pUyRsdj5tQcNYZXxGaLaScFJlzWkUALEEH1WUmYP7nzZfSaSarEw2
OhWbZam8tmsnzfxuVntJEPH2x9Zz7A0YE3VHunRN46oaX8f8PzfWyX36yMXQ044T
b2he5EEzH3MWBRWJNGnZNo7fIje2BMX0it1cN74arql+DxW/s6ILfSgoOTY4UtQg
QLs4v64ERlvXoObjlbbr
=H6Qh
-----END PGP SIGNATURE-----

--=-gVic4fP4bqkY12O+dA+3--
