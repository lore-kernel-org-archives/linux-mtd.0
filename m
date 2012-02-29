Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2fEZ-0004hs-2Z
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 08:50:03 +0000
Received: by iaky10 with SMTP id y10so8189009iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Feb 2012 00:50:01 -0800 (PST)
Message-ID: <1330505546.3545.84.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] Fix 'Flash device refused suspend due to active
 operation' message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Wed, 29 Feb 2012 10:52:26 +0200
In-Reply-To: <20120215114834.GG13673@n2100.arm.linux.org.uk>
References: <20120215114834.GG13673@n2100.arm.linux.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sj5cMnIswL+OvS0emPh/"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sj5cMnIswL+OvS0emPh/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-15 at 11:48 +0000, Russell King - ARM Linux wrote:
> From: Russell King <rmk+kernel@arm.linux.org.uk>
>=20
> While debugging on SA11x0, the following message was observed:
>=20
> "Flash device refused suspend due to active operation (state 20)"
>=20
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-sj5cMnIswL+OvS0emPh/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTedLAAoJECmIfjd9wqK01CQQAKbzJ7mw6OJ4Lff4IcRHS4Xz
sREtPiPYcZTW13dPSD+s0olPow28ORvKJKHZGW078D/m1o/UsU+BOZ+2KxHjRt6/
NUN2YLiCuAfkbYlXIuzU+lxoGysXtvdgqYpW0v0xRqL0W9fsSGEycK964BhnNHfF
dDJZ8JUp0YtseduvlVcbVrTQ/yBqQuR/47Lx7HxtnS5LPkhvcPVHxVNXSHyQrJmw
fVeIzYDQBA1FhK3q//dehLa8dfFw3Ibi8/H+eHrQruzqMs5pBYQ+XvWWlp7vs5GC
q+x82A6zlqU0Z5W8pidJvv/1QiPJYvk9WWqyKiraSQww2OYVzA7AEAMclzwYzinc
hIr+8qYCGly1uHZkMLk7sWQImDHKBxpnc6qMtDoDaTbxpN6Lz7MzIkYbcaX3XLQf
Qftmj5c8BsfY560NYBCyYfSdhJhxCvCFvvTNW2Si89ahq36+THpQMgaYFacWAiQJ
+K2zGgIf1yeX6TUDf6WUE4z4E4aExtoY4FIFpPv0FrGDYkGFP13YYGDxHmswtmYg
1vGmZLPpEoeNtGN/+qlirsvmi0iMYdNFzMw7OJgejkw1zVKpIbM79YslCjVtlOg0
llEKw/6tcmcuCtTFhReVwnOsXCOY8GUOTeZKPjs13+k24XYWPRe9W+kJv+AuYcJu
BBq222epD6hj+MJSspMm
=0hpQ
-----END PGP SIGNATURE-----

--=-sj5cMnIswL+OvS0emPh/--
