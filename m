Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSoVc-00028Q-Bx
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 11:59:49 +0000
Message-ID: <1336737788.2625.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: nand: remove 'sndcmd' parameter of
 'read_oob/read_oob_raw'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 11 May 2012 15:03:08 +0300
In-Reply-To: <20120509130635.32973038@pixies.home.jungo.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WBMUYoWpBwVUfI6UaT3Q"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WBMUYoWpBwVUfI6UaT3Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 13:06 +0300, Shmulik Ladkani wrote:
> As of [mtd: nand: remove autoincrement 'sndcmd' code], the
> NAND_CMD_READ0 command is issued unconditionally.
>=20
> Thus, read_oob/read_oob_raw's 'sndcmd' argument is no longer needed, as
> well as their return code.
>=20
> Remove the 'sndcmd' parameter, and set the return code to 0.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-WBMUYoWpBwVUfI6UaT3Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrP/8AAoJECmIfjd9wqK0gK4QAJW0zExvQuG5H6UXThVNRO8k
aZFzZyBpwFgRs/Pcdl6sEQgWnafMAeFCY6PhygqybC3P3snn8MTLjC6c7q7KNhbC
znYt5bra+kHNmdQFy0aTTApcXDzBYH8cQkp13q3Wq558j+PZ6JWdSkWPFjhQODSc
odtv/+8FIW3knTqjZkbhxa5/vDk9xK1vWLK6PG8rY/CX0J11Z7X8ZVIUZYy5v64O
EtfovUKn1jMQ+nRZ2t/55i37R3WHdDwEALQlQwf7WmjamiEs9Lv7ChgpXuOfg4Hb
bXBCC3tzl34z6fHYKn7Y8fvt9f9Hmb3otHHPHkyDIjX4XuzogrcaVnpBAv9TlX0e
f56YGP3pz/DWVZ+SDNw7bmBMPEwm/wQfBO1IFEvsZdwJvnX9Cn+9U7aDkIE4uP1k
K6xjy1rA9o43JUVQtTGwpP46iV+m4V4WO16ki3WUGcPfR/9UjpsnrUIFKdbWJCOC
41CiL52CV+PTf5+MTuYIXL+gtZSBfNca2mTjCDOuy2bxIjLWXHd0yHCWmay6rdvv
iwjzksE5qqXpbigp8lHEiKL2/c06XDOMRxu1s2Rb/ietQP+jkgxG4g1q5PRQR2Xj
OYCY4730qIYaxU1jQe7CyqBf6b1zbzkPYdcaKFDcowyfvT3DY0KwTNWSbFzb+xzD
FuOPwWJSxSzwhsfd+CyX
=ENH1
-----END PGP SIGNATURE-----

--=-WBMUYoWpBwVUfI6UaT3Q--
