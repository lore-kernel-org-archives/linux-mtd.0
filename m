Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TePAK-0006N3-Ui
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:53:57 +0000
Message-ID: <1354276486.30168.104.camel@sauron.fi.intel.com>
Subject: Re: [TRIVIAL PATCH] ubi: Remove spurious comment
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Fri, 30 Nov 2012 13:54:46 +0200
In-Reply-To: <1353512772-2649-1-git-send-email-elezegarcia@gmail.com>
References: <1353512772-2649-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+OSnVVrZtvA3OADZgCyF"
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


--=-+OSnVVrZtvA3OADZgCyF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 12:46 -0300, Ezequiel Garcia wrote:
> This line of comment looks completely bogus.
>=20
> It was introduced in:
> commit d99383b00eba9c6ac3dea462d718b2849012ee03
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date:   Wed May 18 14:47:34 2011 +0300
>=20
>     UBI: change the interface of a debugging check function
>=20
> Remove it.

Pushed to linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+OSnVVrZtvA3OADZgCyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJ6GAAoJECmIfjd9wqK0R2EP/iTGOz7hjXm38klEVADvkVzE
TAN1+9Y3x+LuGobL9teJNpc1FXVwNwicQGXuPchT1Vs4MXrvKjhT4zRLpjcUxzEV
KaeiC9cVTo7VoRmf9en2VdlYb0w/6Ex1eojsnx4rTIy0Fedu91tpudWC70+LmwFq
vnvJm5rf99pm+/r/uf6ZaubBjJlJjS2FldR4nfG7neFOpgqB9WO/8A2hLatzebtG
A9VdJzxqC9e0NICeOobsBjgb/5cxjXjnZRL3qjv+yiZqCHw8+dysmfOoXfNBPyTy
Pq2ucE7YyNer+B7xxXSu+mkHxmDcs0dWvz4Fh/V6jfMiJsP8efXZ8OvCGFOxhtRK
Bmmk6MuRTgoMueBCQL+CeNt4ouNUBcaNwjTi7sQUyYVaRlsOpjWP+kyN+16GHjPs
N4Y9YpL+TfxQl35gEJn9KDuVbO88Jz5wlvLcMMvdx2U1j456cRUfQSQViJL85Vos
kY7Tskdrb9qppb4Dzcz6V+3dyqM3dSbpSX0r1KWjap/2hJJcot457l+ueHxxpkw5
J7lHGpLe63mIcp2Yk/RlIDclrSjkFh1VUIVqiMKMQhvzcxbG/0ve5YEYzCDrp55+
DACGceCwuFT/UzYtibmfI3PrIGxWNRJWWsDIQPLKjQV5NAnWLP0988GZXinsqQ/U
jXj6rTrYiqW0okOtL5Ap
=mAzV
-----END PGP SIGNATURE-----

--=-+OSnVVrZtvA3OADZgCyF--
