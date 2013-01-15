Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv218-000896-Sc
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 08:37:11 +0000
Message-ID: <1358239116.2731.105.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubiformat: fix error path
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Tue, 15 Jan 2013 10:38:36 +0200
In-Reply-To: <1355416874-23907-1-git-send-email-w.sang@pengutronix.de>
References: <1355416874-23907-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eU4wux3h3SEI3suJ1wVB"
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


--=-eU4wux3h3SEI3suJ1wVB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-13 at 17:41 +0100, Wolfram Sang wrote:
> A few error paths were closing the device, although it was not opened
> yet.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed to mtd-utils, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-eU4wux3h3SEI3suJ1wVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9RWMAAoJECmIfjd9wqK04dgP/jJgmTnmbjKuKRxjaQVNib+o
ncrxWfgNp7X6shKh6P9JsMRrk6mwjFaOOAuOBN9C5zzFcqgkSXxmpNfW1oxhfD32
hRJhT9cgbfh+xg+Cm0TqGKYQf6q1PhGDWAGK3vOf+d9rrbibxzHtcT3g5E2fwCd0
LJYiEIElk9tFoB5+5M596wWokFihW0IjnpQf02dlwjdvF/mhSxu9dg/ptTEQavNf
Wv6PomXM+n/mgAVWC5RRYIvaSdKGW0Yabje6qZeGDBh/daAqnekf4p8TfxV/LfRw
BLcxz3mUwLa1//liVHx/Ka6mu2d4QXsjeetMnSNfOCyuIf/OSn+ICZ1uWgIiinpw
51TKAC8opMJNV9VggdTOEEUUCzMnCDZVubxLe7JZnCKQYXQ7wbo/mBZUn35lK8+L
UPtpPkVtK4iAtEHvUHPpfFw3xv4Nvh9w6T3cszUBcIiKhan+hVCdNczJV9k3d7s1
Az09If3ZqKIOBgu9M3zYwJNnZyyzR15ijHDT9JsmQ8EBLoFbbXcHAv+hlV8A9bzc
1d1j4L696wxEecY8JlPzBhRNoAJTnJov12mVFPY+TPclIQQnkEbnMLVFxHbHmjcj
icSZMGrOHBdCxL1qYM1SBDDHKtxpp9vBfFLiRLfwCmCcSiE1V6l+HLIc4q+krzCW
olmL87lMwQwqrAF5pqO3
=T/nm
-----END PGP SIGNATURE-----

--=-eU4wux3h3SEI3suJ1wVB--
