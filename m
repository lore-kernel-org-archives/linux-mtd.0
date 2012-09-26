Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGpcj-0003RD-Eu
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 11:17:50 +0000
Message-ID: <1348658274.24309.72.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 26 Sep 2012 14:17:54 +0300
In-Reply-To: <1348658003.24309.70.camel@sauron.fi.intel.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
 <1348658003.24309.70.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TB24lIIKgcmSTiT0eatO"
Mime-Version: 1.0
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TB24lIIKgcmSTiT0eatO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 14:13 +0300, Artem Bityutskiy wrote:
> From df2a498002498e52025acf51e0b43064d766aa0a Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 26 Sep 2012 14:12:28 +0300
> Subject: [PATCH] UBI: allow for delayed rename
>=20
> Just an experimental patch.
>=20
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This have a lot of chances to work. If we do this, it would need to be
an extention to the existing ioctl, to preserve the original behaviour.
Something like a "delayed" flag, and then we can implement this in
ubirename as a --delayed option. Surely there may be better names for
this.

--=20
Best Regards,
Artem Bityutskiy

--=-TB24lIIKgcmSTiT0eatO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYuRiAAoJECmIfjd9wqK0Cj4QALXT6GyTVXb+OX+0DHxafIsh
TKtXt5JmGPmERW9oGhHYKApTcdovKXfuTcIe2uJ7npDyaPdD6AK1fLOchY78mRwx
GfDhL9ngToRdgOzLW1DZ2Lh3U3iRQHNUcNR+XZK+47B1VKlhIgRQ62CkQrZXXopa
1Wc+8XakdxzHxI8YEKMxqQo5sc9jI/MBUkWKAXA19nbiyH426uebbonbktObG3RD
EIFpI9ajyNFbCtI2Fcam/nXk3rAKXdO7JxkzDNVFos4SOEYGyxFhkdAqN+LFE0um
MoklTU62ic2DfD4vXBoDRZmmhKp+xMWOFRDnTy9ipMt4vWMw+7DIwvUuwkxXamf3
qGO5NxEriqto/ynV7JmXJ+VGg0qSR73Jdr1YIjYjND2Vp/3KCejfZGKxUTZyRkMn
+HpxaHt/GNEysJkNoHa2l9Go0yOtfXfAECuBz4QDsKaKIWUeUIkCSX8xNOv+wntq
maq8uV3xcni3dhpSin3VhpyA5ZGqJY3c5UKo9SUmF2C1Rq3+URWlZb36D1RMvZwL
yixElS28peCbWR57TkOFQj+eKaX/HXzqt9lle2OXNvrjKMGKhXs1anesSGhPduzK
Xd5pulH7MenB5BRUI/x3r6CQIhwJcriGVjKIRObBKlZsYF/draSPjha9MqdLqmCi
9LDzlepRg3Xef+/caouV
=Eln1
-----END PGP SIGNATURE-----

--=-TB24lIIKgcmSTiT0eatO--
