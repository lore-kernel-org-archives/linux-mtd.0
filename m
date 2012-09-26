Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmGC-0005CU-A8
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:42:21 +0000
Message-ID: <1348645345.24309.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 26 Sep 2012 10:42:25 +0300
In-Reply-To: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
References: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hGHWsx1LTnwtpG8zkGYZ"
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


--=-hGHWsx1LTnwtpG8zkGYZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 11:50 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This registers MTD driver for serial flash platform device. Right now it
> supports reading only, writing still has to be implemented.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Can you please confirm that you tested this and the driver works in R/O
mode just fine. If yes, I would also like to add a note that this is R/O
to the Kconfig text. If it does not even work, I am willing to drop it.

--=20
Best Regards,
Artem Bityutskiy

--=-hGHWsx1LTnwtpG8zkGYZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrHhAAoJECmIfjd9wqK07tsQAIOO0g7ZnZsdauRLxMC/RCzC
uZbdhjbVNImUlltXauJktVK/PYHJBNqcyiqSdS4c20846Q3UAVpNtoTikopxAacT
QO5N1S2cBBJ8r40rXBOYTCZfuvhsZQFjI3U1nHGQ/vMiorwDkX1Kdy1gx5vzHKNg
ZJT3QEPjoS5Hn3ywtCQCyQAL2NCKNoOZQcPvNKVWNyoyripbhoZX8+s9m+UAB9uC
/xQnvLc9+yMXLNMV5Kn89GEGat9Kz9LDVekOWogTHExAuhNYjnMEVKlIiMUC8Szq
oqJQIPWClusLk6hV6ZVjYljbpWd1SNOZsOE8AjBU0pjxydezNC7WQNk2v75+HvCG
ayJizl04UDvKwTlZbn2PajEt+5CybHK0xYO7MdLqKaOSNhOwQbRUpiJWy8LkMwye
GrJUf8whHM9W6JzzlavKKvNkJlDWzvSCjR0QWBse0FVCKcrjTj3Iwmr5gcNmb3OS
Dqg7WRIv7JXQbLkYdd0gPRkOBnPco04hwUX5CyQTIfyqODToKQUktyFewZCrXn/Q
NLLhYJcILzcMmPz8FkR7H4CM+JC/tFgDqNUnpmDerz25KhADHz+ggnXIMSS4aDyM
U6GWljkDM3ICRLj/nxiZkrExFV0TnmT4bgyQULD6no1Kpj9vtIe/+wk0zj9RjDyZ
Z3bV0sa+15PQxwxyGoAm
=Pa1W
-----END PGP SIGNATURE-----

--=-hGHWsx1LTnwtpG8zkGYZ--
