Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as7oW-0007KB-0T
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 11:58:00 +0000
Date: Mon, 18 Apr 2016 12:57:31 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <20160418115731.GX3217@sirena.org.uk>
References: <1460977843-9426-1-git-send-email-zajec5@gmail.com>
 <20160418112457.GU3217@sirena.org.uk>
 <CACna6rzQfX7SxDoL-CTQp3_Ms5_K54pEa8uaUAiTPjR-un=VOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H7DA0n3a+SnB4bJ2"
Content-Disposition: inline
In-Reply-To: <CACna6rzQfX7SxDoL-CTQp3_Ms5_K54pEa8uaUAiTPjR-un=VOg@mail.gmail.com>
Subject: Re: [PATCH for-next] spi: bcm53xx: add spi_flash_read callback for
 MMIO-based reads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--H7DA0n3a+SnB4bJ2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 01:38:28PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:

> What shall we do if spi_flash_read fails? Should we always fallback to
> the standard SPI flash read? Or should we standarize error codes
> returned by spi_flash_read and fallback on some particular error code
> only?

I'm not sure, probably just fall back all the time.

--H7DA0n3a+SnB4bJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFMuqAAoJECTWi3JdVIfQk6AH/17dNIsYHIOjiN+q3S4LZDeu
8ephxu97hyErGvZUyICt4lIKzVBb95nBrTav4Rg/0uS3SaPdRykYX31uPIfJw87Z
eDVF1CmTghfdGGN3Hh+/ngyO2PteIrE+zntghiJWEAza8cbN6ayIbE2a3NG/YbDE
6XkOnvsZ0gZOEm2uEvBij7BLFvWR917YS8o6Z6C6aZbLJpUMpS9TeJauOb1+TMhT
gd11aEgsm6jvjTHNeFSLJSQMXE7sGAwWm7rFeu0c17ZJSlIcUAHjvrC77ZsAs54+
/OWnAQfHVYISSWvfmLxYkKGL/N0lKZrmERzpqJKheDAI+eVb53qYs2ok67RNAXU=
=EFhm
-----END PGP SIGNATURE-----

--H7DA0n3a+SnB4bJ2--
