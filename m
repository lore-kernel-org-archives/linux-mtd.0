Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeObB-0003nV-MR
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:17:38 +0000
Message-ID: <1354274305.30168.96.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Nov 2012 13:18:25 +0200
In-Reply-To: <20121121110518.3147bd34@skate>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kBgH08TUbCV5FE9LGYs4"
Mime-Version: 1.0
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kBgH08TUbCV5FE9LGYs4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 11:05 +0100, Thomas Petazzoni wrote:
> Dear Ricard Wanderlof,
>=20
> On Wed, 21 Nov 2012 11:00:49 +0100, Ricard Wanderlof wrote:
>=20
> > > The idea, when David Wagner implemented this, was to be able to use
> > > read-only block filesystems such as squashfs on top of a UBI volume.
> > > squashfs provides an excellent compression ratio, which makes it
> > > interesting.
> >=20
> > Yes, I agree, that would be useful.
>=20
> Yes, but only the read-only side of ubiblock. The write side is
> dangerous and useless, IMO.

Oh, I think it is natural to always expand on the topic when calling
something dangerous and useless. Would you explain what you meant?

--=20
Best Regards,
Artem Bityutskiy

--=-kBgH08TUbCV5FE9LGYs4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJYBAAoJECmIfjd9wqK0SkcP/2Fwf4lSs3QEywzIoVAViRtp
GpcupMo92kuO+2Wjdd/ilrR5AHjU/b154fdRKwpXoscOw93KzklI+40HPk+dq5wF
EipWNg8WYmMT+yy8TYRqfySGmz9P9xLDyQmCD/78SEiMq3wl08/GFcIDt4BI0R4r
arL9qL1Mgr6abqP8ZhfGcbZa0lqHp6MX1AM3bPkXt53KA9D8aeqdXLfIfraIsf8u
TYQL5RPr+rw8u4+fZA7dXdZUK7oaihx/SoV5XYa/vC6Ovjhz9ZkfS/DvQia5prlS
x7gRyR7OkGOhrOO2VJAsdwtgbLV5o4ZnCX68V33hjypmKSJgCWnMpgpRb/xQ4xF4
H6BOgVaFCuNOpxYEAhmCeYVIiLBuzXEUy1R5IeVWedIDkCgUcu0FhP1GqfG1ik1F
H0FbglAGQEjejG1XVac0oJxbuqJqK96m+45ACdHgCvvsc1JNWG8zBKl5rBDH6zVX
Pt8xraHdgrDMpSmO4Ws1xWcXD+SxBMXzmNDQflas81HMQ1keCXHbD3TEFCgrvv2s
1wHbJNKY66N2oqEkFbhCcQnfBrY1O0URv0veGJGxyhUMk0oLAu3tB57tkU+nJg6U
BKsxQboci6INlqDRq7Xga5JCSThz7/eBH7jSSebd7F2ETtWPs8k7BEXTz8p6GzFy
VhuhnvhR2VWnLTf3X1ay
=2oU5
-----END PGP SIGNATURE-----

--=-kBgH08TUbCV5FE9LGYs4--
