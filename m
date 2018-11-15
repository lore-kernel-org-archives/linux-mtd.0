Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNNl9-0003Kr-BE
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 19:57:04 +0000
Date: Thu, 15 Nov 2018 11:56:40 -0800
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Vignesh R <vigneshr@ti.com>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Piotr Bugalski <bugalski.piotr@gmail.com>
Subject: Re: [PATCH v3 0/7] spi: spi-mem: Add a direct mapping API
Message-ID: <20181115195640.GP2089@sirena.org.uk>
References: <20181106160536.13415-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gbLSGltGDiWAAjZc"
Content-Disposition: inline
In-Reply-To: <20181106160536.13415-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gbLSGltGDiWAAjZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2018 at 05:05:29PM +0100, Boris Brezillon wrote:
> Hello,
>=20
> Here is a v3 addressing the comment I received from Yogesh on the
> m25p80 modifications. Note that this part is still untested (I only
> tested on a spinand device so far), so that'd be great if someone
> could test it.

The SPI bits are all fine FWIW, leaving for a bit longer for testing but
I could also just apply those bits immediately and send a branch as I
think it's the MTD bits that really need the testing?

--gbLSGltGDiWAAjZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvtz3cACgkQJNaLcl1U
h9ADfgf/QL1xgnd6jTbOPn5LJ1fKcx/lVRNbwwD7H8MlI2XRTY2ozKTavuJ4H4XU
0+WWgvbC7q4FbyEk+M9GukzMr0jlxY1efTqXH+tmQzgRTyuu+Rw1NG9uNPr+z/hP
8RRzUmDQNSbLqU6XDO3o1BpkEltGDSEf5XXcB7SLHZPa04wzuRNp8nop3NlNrCFI
o5F2MrEiv6rgy4zelTQPQJrRFWXgccgT4OKWqVnHLvwh9ZdkSrbl4CARHhm8SYuZ
g1LQVxXyXmnEmdV8savJXNMZeAbJ9568qbIhqV6xUUqMz4Q/f1E/rMETqVr2EE3Y
9GUs1Qw0KRoVSlajHo8Fc1KfOW7ghA==
=P+G2
-----END PGP SIGNATURE-----

--gbLSGltGDiWAAjZc--
