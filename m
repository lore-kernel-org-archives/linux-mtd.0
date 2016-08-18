Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baKOC-0005SP-PZ
 for linux-mtd@lists.infradead.org; Thu, 18 Aug 2016 10:17:35 +0000
Date: Thu, 18 Aug 2016 11:17:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <20160818101700.GO9347@sirena.org.uk>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <69c4ce26-7b41-222e-07b2-92818cedd05f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rHXT7wjifYJhd5Y1"
Content-Disposition: inline
In-Reply-To: <69c4ce26-7b41-222e-07b2-92818cedd05f@gmail.com>
Subject: Re: [PATCH v2 1/3] spi: introduce max_message_size hook in spi_master
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--rHXT7wjifYJhd5Y1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 17, 2016 at 09:08:01PM +0200, Heiner Kallweit wrote:
> Recently a maximum transfer size was was introduced in struct spi_master.
> However there are also spi controllers with a maximum message size, e.g.
> fsl-espi has a max message size of 64KB.
> Introduce a hook max_message_size to deal with such limitations.

This can be pulled as:

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-max-msg-size

for you to fetch changes up to 5090cc6ae2f79ee779e5faf7c8a28edf42b7d738:

  spi: introduce max_message_size hook in spi_master (2016-08-18 11:14:48 +0100)

----------------------------------------------------------------
spi: Add a maximum message size operation

Some controllers handle entire messages themselves and have limits on
the maximum message size, provide a way for clients to query this.

----------------------------------------------------------------
Heiner Kallweit (1):
      spi: introduce max_message_size hook in spi_master

 include/linux/spi/spi.h | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

--rHXT7wjifYJhd5Y1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXtYsbAAoJECTWi3JdVIfQ7VQH/ixXICsFpnjrcmjp4U59iNTb
N03PQWNgt0Rt7u1A3K3KrIoWA0EJF7uTrmeRtTUyChX3OPQQoKxUFFDOtv9/f9He
BvGSKt/OlNS+Ne2Q3z07ttjM/GGnmf1tNJInbGm7Xpa7Olny2SSRRuEGp0gt+odW
gU55hhehrB5hAUONxeZavdYTYiHVfiu2ecJX7lLyQKTpXy3yIYbZui8brvqpsvuJ
VIb4qxlnFp1asVO5zcIIHmFQDnxdunwIhgtxQOrco5Gi95R6zuh/X1/4Gfw30Leb
DED5kwOwWu7JaXQGOSDqsbj701JovZCQm+9U8FP9M6AxtHNXdm3DifAvnFK5ZwY=
=9OjD
-----END PGP SIGNATURE-----

--rHXT7wjifYJhd5Y1--
