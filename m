Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWqW0-0006q0-U3
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 15:29:05 +0000
Message-ID: <1352474975.1814.41.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpio-nand: Ability to use driver for
 configurations without RDY-pin
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Fri, 09 Nov 2012 17:29:35 +0200
In-Reply-To: <1350454107-3754-1-git-send-email-shc_work@mail.ru>
References: <1350454107-3754-1-git-send-email-shc_work@mail.ru>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2bu2lRLCv1TiVCYGHXO+"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2bu2lRLCv1TiVCYGHXO+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-17 at 10:08 +0400, Alexander Shiyan wrote:
> In some configurations of "gpio-nand" RDY-pin may be not connected.
> This patch allow to use driver for these configurations. In this case
> we are assume that device always ready.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2bu2lRLCv1TiVCYGHXO+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQnSFfAAoJECmIfjd9wqK0IWkQALVqxhcRY+u3GMZ602AYUxtj
yKutlKhaZsoF37HYv7KQRtJ//uz05hB8/lJb767izIMpVRa08OCV5MbIWl2bzgzH
w9opyHbQ9mK31wArg5G+UQtPkI+RaTBmGF3O5Qr0pmbvy4TSuYcZmYD/TA54h9fe
PxLbbK1TfsaIcO10/thI5pjJ2L/yweh+Le+dSgeWDEq61exRihL1hgbic/3nTFmG
DCLiQxeCF4k2JZ/UhBPkFuvPCaNEWreJdGri1q6RyPhcsmqEsKRECfzmP8pUYUVB
xlrBRuxX3uMURnJB6Mk/Dc7oJerCn4UOyH5Qz9mV1Qiet3du3wSaxDZEVSKK1/BD
/xDDRFW0bQDpjuRnvrdrC0zxiBewl+v0Op+x3HBSa19q6sxgFa/kQmyPM+/B0Tjj
MI17QBqi60dltgH8ktMOCneoBvzFVS+HHXjrA6ebhJroGBkXFSNNo+t+i5JOe0Xz
JiGkAQS23DcoHchAj2q1HoPxBZgT4bZnv6PhVueebqWLMKpIxJhU1yRHJl+ZGoPI
QjkkvQyhxdNVaPA9aXGzL0n0/wJ7xiWc/xWSb6zgJdPWJIP6sqLMot6e16xWVU10
dwqpbnpnYvoEFvcV2qPUyJ/YKJQvB9EOwHFi5XTgMUbZGHTL3S13SZPpP6hPu1V4
yqv7KAca+ilzc6nrUApQ
=dq5j
-----END PGP SIGNATURE-----

--=-2bu2lRLCv1TiVCYGHXO+--
