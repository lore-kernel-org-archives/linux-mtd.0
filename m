Date: Mon, 20 Jun 2016 10:56:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: wens@csie.org, boris.brezillon@free-electrons.com, robh+dt@kernel.org,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Message-ID: <20160620085608.GK26668@lukather>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
 <20160620044838.56904-2-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="rnP2AJ7yb1j09OW/"
Content-Disposition: inline
In-Reply-To: <20160620044838.56904-2-icenowy@aosc.xyz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--rnP2AJ7yb1j09OW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 12:48:38PM +0800, Icenowy Zheng wrote:
> The NAND controller on some sun8i chips needs its reset line to be
> deasserted before they can enter working state.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--rnP2AJ7yb1j09OW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXZ6+oAAoJEBx+YmzsjxAgREcP/3eO52PJYKD1lU5KjhGtc3v1
v6qUgwH8J/R5fvQlc1oK5nH4mHXIqmA7m348wEaeW6dRQ5uKcnPyoUuY9b+VwO5j
aLqkevl85L6Kpquy8LFQQ/Fmv9vUa2FRticYBhlivAJLd3g/yDcV7uSC4OfA0d97
7sW00OdjlRP6Q7l0RrwfGzgLqI+ASqlwkHhEmj0hnqZ3z2E6tPiyjXUhmyvrs4bs
rHyA5EEz8h2oCGjPYul1CW7s0PbLp/cRXo3T2nl6ljF/60aKO6jE4+2NtV+GwFV1
QJD9EhvuB+59V/aEmWlbFtlc/0Q7ijkHcLc+d7ZKT8CPJimF36GuXwTMtvLPhfsN
6OVG61NpWgJ1p7fewst1GrI0bc2xn/9/pebME9gTof6GPlhGGdQxjp4NcYHYlqUU
GIVUume3euRp7+8H72WJ4Z+JXFG1oi4CaY1zoimPZxzt/+dABAXmlNMuBYOWxn10
fd421tAKZ4NFYal0tc4b6i0+hPN7DXlCnbtjapl4Bta0QgvY2F7DJC+O9G3Iwp0t
a1eN+fR1UAA0mXgOEgXPXu/fDYDio5WFCZA7OuHVsYBfwI3Rzf58hi9/1qLhpZ8y
xXIQgKDAM87uzPimRq9ysBJZqr6iNHOr8OGZ4Eemce0aRWjKoEbX5uRIHQJINkuM
n6u4icae0XsKJ6TvzykX
=kFh1
-----END PGP SIGNATURE-----

--rnP2AJ7yb1j09OW/--
