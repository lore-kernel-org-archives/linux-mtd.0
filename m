Message-ID: <1412043222.9388.81.camel@decadent.org.uk>
Subject: [PATCH v2 0/5] m25p80,spi-nor: Fix module aliases for m25p80; clean
 up chip identification
From: Ben Hutchings <ben@decadent.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 30 Sep 2014 03:13:42 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oEOIIlA0YsDRV4mvNNg2"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oEOIIlA0YsDRV4mvNNg2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first patch in the series restores the module aliases to m25p80, but
it does so by duplicating the list of names.  This should be suitable
for stable, but it isn't viable in the longer term.

The following patches change the spi-nor interface so that this
duplication is no longer necessary.  This includes removing
spi_nor::read_id, but it could be re-added after this with a different
interface, e.g. returning a flash_info structure (which would need to be
defined in spi_nor.h).

v2: Rebase onto l2-mtd/master.
    Put all the flash information into spi-nor.h rather than using an
    elaborate set of macros to validate names in spi-nor.c.

These patches are still untested by me, aside from compiling and
checking that m25p80 has the expected module aliases.

Ben.

Ben Hutchings (5):
  m25p80,spi-nor: Fix module aliases for m25p80
  spi-nor: Remove spi_nor::read_id operation
  spi-nor: Make spi_nor_scan() take a chip type name, not an
    spi_device_id
  spi-nor: Replace struct spi_device_id with struct flash_info
  m25p80,spi-nor: Share the list of supported chip type names again

 drivers/mtd/devices/m25p80.c      |  21 +++-
 drivers/mtd/spi-nor/fsl-quadspi.c |   7 +-
 drivers/mtd/spi-nor/spi-nor.c     | 251 +++++++---------------------------=
----
 include/linux/mtd/spi-nor.h       | 191 ++++++++++++++++++++++++++---
 4 files changed, 232 insertions(+), 238 deletions(-)


--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-oEOIIlA0YsDRV4mvNNg2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCoR3Oe/yOyVhhEJAQoNeg/8DDcl9Pq87vs1wwJTGGQZkHl6dHcUB0hw
OcVhHOLnx2Vl9Ugph11zU24DA9f+g9pwuop+1lDL4cHkoLMRSDuf2IP5tg5uf7YP
Pys3XdlPu2TJlfScKe0R9xf53mHScLBjAcEBQbFYOuVgCa+XfpF2r7C+OyQMRQLK
GVKzxno1ewPiT8CjL/5yF8RkJ8iVFdxGukeGagWRTlk8BpYhz++czO9ANb+uPBFr
QdWYFSe9t/uAiTaSRjzte73YTT6wnQMIwHDISEs2cXOSd7EHiFIAXYAGG+E4Odgp
2jeNbLcHBuWnxN1mwIsGDqNt8LW3obmuWfYQsdygrh4tzVuOL+VJ9x7U5vaydjWv
m45qPKxeTnYi6SdyHkvseAMW3oOrAc6NLOng6XeONCovZDSIYvguEEiXNGUKv/b8
56xvA0KT4Ce4VZh8lS5vRUA7KGY7fZt/hsAg8zV6dXr4FvLSHSvV3ovaU3RLwa94
oCTXi6xJuR77+2+DdVEPi54/Ldc1KUlPbuw52pJ32bz+wLfk2O8H+Ft0IHi/5g73
OP6s3qanl1pIkJ6z+8lWTiT/yq3aKjiZq6ZyS0K7J7HGdtD+4RxVld2i0QVyiaI1
/F5y4OjNAUuJIwBZKpOM0nQFS86hfsqZfl6nhoFda6hBRQISrit19kkB/Y0Lmttt
5dSHzOtixI4=
=sknW
-----END PGP SIGNATURE-----

--=-oEOIIlA0YsDRV4mvNNg2--
