Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbC0o-0007sN-W6
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 15:14:51 +0000
Message-ID: <1353510932.2701.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/5] MTD: bcm63xxpart: small code cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 21 Nov 2012 17:15:32 +0200
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lw36Izge8cLPfJwzFs7p"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Florian Fainelli <florian@openwrt.org>,
 Maxime Bizon <mbizon@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lw36Izge8cLPfJwzFs7p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-12 at 10:52 +0100, Jonas Gorski wrote:
> Here is a bunch of small code cleanups. No functional changes.
>=20
> Jonas Gorski (5):
>   MTD: bcm63xxpart: remove unused variable
>   MTD: bcm63xxpart: merge sparelen calculation
>   MTD: bcm63xxpart: make fixed part length calculation more generic
>   MTD: bcm63xxpart: move the last curpart++ to its correct place
>   MTD: bcm63xxpart: use correct printk format for partitions

Pushed the series to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-lw36Izge8cLPfJwzFs7p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrPAUAAoJECmIfjd9wqK0fIwP/iJr1VUi6mcy3FrF0rhBk/RI
nzE6ALJ7g+KjjZ4rdBGZrIQz0DtsYLa0rDdOcwSaJ+obXWxqlVhVEP/TlTrypzhU
Ng55442WAx1OAN/UH3vLecDGxdT/iuYrrn98fFYJtNJ0HtO8cDnOhGMARI6kIm/e
C+YZB6r+c6VHGGExMgay16naJSV5/h5T48DLevI9+hDWAQepmdPHcsA8ttLtxwbU
5anbX0OO4gXL6JpMKqXVvhIhY0iBmnzrPwj3e4hIs+Au10/gAzgA7jsoJAvEOLeR
w91ulQSK98HagX5kj6DGYE5B95iF0k6dco1yFbnxSPeSXqJXpTcrG2PbrLoQf7yO
lUV0agAdpXNDzH2JWljnk5w8L2C8hzOBslgZORE7WFqZfCQQtySnPh0sUvWTEseD
S71KHmWtbiq4zK6aErnXbJjfPPieKL6wsNOK/Hpd+Nell9kJGP7Kf8MUGt6VGbx5
E+TBCQQRvCZIDfDP3rA+pC2KB4PAtgr4o4qGpNq5TjfpefOMGG794lr2d52cpj4t
U2mEk1SrA7AKUizQhXmFTNpkN8cZYZGx9Xy+GtwM1hAsdfJo30JSamWIG8JYHHb7
T9zEThW3QWIJU486TXTUfAtSmq52K0bI0hWioj2hhitl03AKPmnVf3qtcA2IU5Z8
xN1gyRE6eeOHQinJFud4
=8zsG
-----END PGP SIGNATURE-----

--=-lw36Izge8cLPfJwzFs7p--
