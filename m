Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U1JyG-0006mi-U0
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 17:00:14 +0000
Message-ID: <1359738107.2942.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <stefan.roese@gmail.com>
Date: Fri, 01 Feb 2013 19:01:47 +0200
In-Reply-To: <50F9422D.6020500@gmail.com>
References: <1358511005-23258-1-git-send-email-sr@denx.de>
 <50F94122.3000609@gmail.com> <50F9422D.6020500@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-J6t5rJhwzk+28tiYTnFm"
Mime-Version: 1.0
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-J6t5rJhwzk+28tiYTnFm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-18 at 13:38 +0100, Stefan Roese wrote:
> >> Tested with Spanion S29GL512S10THI and Micron JS28F512M29EWx flash
> >> devices.
> >=20
> > Minor nitpick.
> > Isn't it Spansion?
>=20
> Yes, of course. Artem, should I send a new patch version for this
> spelling error?

Fixed the typo and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-J6t5rJhwzk+28tiYTnFm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRC/T8AAoJECmIfjd9wqK0ABwP/2DYjh6wITyxffvDmt8J7kE4
05snsH1SVqhNaCfT5IqqGosqQmk6t+KfFa06pvEbSX0rDCJGpZOBrJ0iQMnHYY7p
fPRdIXeTCRAMutuwUjBgalGXGelBXeD6//sBkZ/udCyPdqprgK9b3YsnTI4hKA79
+2mlZvM/rOteIroiW3EfT00mOXBnrjVOtpS+7R/iUJJN8KYK9uMzfqIq4j7/Ox5d
+cjrX2Zio5PRhjJDCCAqkvZCyix37jJKjkSwHjvamZU1KXMq5J6x2ttxM1T05R0D
kJp1T5aWz06ULSzAGXSU14A4qVmCBM1DrfBpEDXmCZBN1hcy+QlyKC5JtXdGNVXg
DWirevcdCvX4S4j2GeQbYMKhXDgMorVetzqwy969XkwQ4aVTHiJ4H5mkRtF1ieGT
QN5wwIhfrnmUSMwAFYT+OnCVnkx04C1JvR/A0FLXTECeoQGl5t1niMt+PYGqIcsG
xVufVVBtuhHmoRwT1Xc6PCpW5skhGeYdl/W6CdQhVqGm8IM6not/7+vx2LolXBMs
OccS39XqxZYM3V1rf6QdJSVTRlLZF7AoKwSMDWKK4hvIKcgI6zfn5js4wV/cs557
9F6ckyXypzeGJsYOTm1rR0qJcAsKOtPZUlTrFr99aCgbsYwAQmlWMOaC5Cr/arzD
iAXg2LrWrwjcmS2jTU68
=X0OZ
-----END PGP SIGNATURE-----

--=-J6t5rJhwzk+28tiYTnFm--
