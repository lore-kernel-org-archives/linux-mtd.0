Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvoHi-0007qF-NH
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 12:09:31 +0000
Message-ID: <1358424659.2731.237.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <stefan.roese@gmail.com>
Date: Thu, 17 Jan 2013 14:10:59 +0200
In-Reply-To: <50F6B90F.8080905@gmail.com>
References: <1355387350-14002-1-git-send-email-sr@denx.de>
 <1358241038.2731.118.camel@sauron.fi.intel.com>
 <50F6B90F.8080905@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lnoui5G9ifLZ6K1/JKtf"
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


--=-lnoui5G9ifLZ6K1/JKtf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-16 at 15:28 +0100, Stefan Roese wrote:
> >=20
> > Please, check allso the timeo warning.
>=20
> Hmmm. I didn't touch do_read_secsi_onechip() with this patch. And I'm
> not able to reproduce this warning. Are you sure this warning is
> introduced by this PPB locking patch?=20

Dunno, my tools sayse it is you. It may be mistaken. I compile with W=3D1,
this is why I see more warnings, I guess?

--=20
Best Regards,
Artem Bityutskiy

--=-lnoui5G9ifLZ6K1/JKtf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9+pTAAoJECmIfjd9wqK0wVcP/1Y51DrxYH3FlRMOI305gT4B
kjalCXA9uK67yxA+frc+xxELZrdjkGqAmjIpCzYswSYcYHpYXAY6mp6AV/pcRcW3
iJQLEerF6iyOTUOSDBkQz8W9DlwuJW8fcl3nZLVjzyNqKm5ZVizDdb4nZvxT9miJ
sax269qgcLn2sy5E0qQl8gAi730CtvHwMFfwKxc6cGoRMQTbfJXwD5QOPoEBgfhp
3Z8pKfQ5aH4cWW/j9IGYaPEz5N2JwqWDWqdjgNVDlU6xMY6pag9GTZftlmCkBtv5
p1S85E5dbXt7W6VG+oKzXIQmRYLBccVIS6IvnRiLDAjrVESdZVxfqS8VmIWgWKwA
bx0AYAFnKfsbiIa5rb+v+ag3mjrtM0pGT3Bb1S+03mYqE5DGagWVLjp8xDVqXzkm
PVjpgEkzUWLMt7FZ8W4GxyV/h4JixB/9YJ+ZK62PDBfKpG1X0ZSZKNRoqu4oFPzC
1P9EJzoUVlA5DEsW2SfYWqXgCOFijYdzHal7xWzVo9CAi1k3LwlHKDDOSCo6EYdO
nPOb1SG0b2YLFjCSdeGsiZ56U9WEfX0ZO6UXmZVspH+4LnWIx3a55vVKPNmJaObi
GPLm0Iko4NWC13Xiy4eP4Y1EyXdAW9N5rFAmPujyCq9aROe8Qk38lvpPX0CGY2rv
LKZ7AYPnLYUC6OmFKiOl
=dV7J
-----END PGP SIGNATURE-----

--=-lnoui5G9ifLZ6K1/JKtf--
