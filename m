Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXvoV-0008VX-Ui
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:20:42 +0000
Message-ID: <1352733657.2262.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubiformat: really skip some messages when quiet
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Mon, 12 Nov 2012 17:20:57 +0200
In-Reply-To: <1350745976-1774-1-git-send-email-w.sang@pengutronix.de>
References: <1350745976-1774-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-I4vPy1IE3RN7vyMHmCBG"
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


--=-I4vPy1IE3RN7vyMHmCBG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-10-20 at 17:12 +0200, Wolfram Sang wrote:
> Both logic (only print when not quiet) and the indentation suggest that
> the braces around the block have been forgotten.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-I4vPy1IE3RN7vyMHmCBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRPZAAoJECmIfjd9wqK0lVEQANEp3K7keTTB6XZgDMUHdN4O
HYcX4CyJoxjycmQg9z2OxAISfT+I1dprOtQVB+4HXrhJ94iBaszy96Hz4Yfc7U6H
R9PJEpYn4voPqBjPmFtcA9PbVxopecLMCeIB9Is++yO7cR43yADu43NSRzv7IwC1
05XO9j1w+IH9SfXbbvYCBp9yPVGrUQmOiuknH1G9moDNgYL+5MAwPAc6YeJwTYEK
QTx5ZadsJJ9SJVy7U6LLJgKsIuPFa6t8Z5Tgpc5kASjTTStmohGrJYWsJKwG2i2n
14HwkhY3QFlLWwkin6Tp9fxuIvflSCAdATYf3SFk0uDxahFA+W2T/dNhSe2fOi9c
UTUFjRSSqkRJ4XxLxhp7pf7NbewvPok4P3Y04sBsI8I86l7u301bL2lp+CAfKJ5+
GLqWTHHA36AXe3b0OBQe2/CbFiE2qTtN7tuZJ7+YmjmP6WrrRtdibad5zypx+AFE
V9ONfGjrajr6Kyeo16A9k4TkTzzIKTviJCxHgRkzATvHpoXpkYwucWXGIS4NVeyu
WkuUBGR2opXMFZ5EcStS9Nxk0qYEh9qVWUge0UKMnCmKwzimfLQx+9zJd5BTRiwn
h60e6Hlgwz9RIX9bI3lPpu9JVygrV7g7YrpIlBavdGA+j7X+bKfcDYmf1455wSZK
2l7BVyT0lVHG1wcWRni5
=KnRJ
-----END PGP SIGNATURE-----

--=-I4vPy1IE3RN7vyMHmCBG--
