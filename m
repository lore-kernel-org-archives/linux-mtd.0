Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ej22E-0008EM-Ib
 for linux-mtd@lists.infradead.org; Tue, 06 Feb 2018 12:07:40 +0000
Date: Tue, 6 Feb 2018 12:06:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Chevallier <maxime.chevallier@smile.fr>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180206120650.GE5681@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <20180206104330.35ffb946@smile-e5570>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <20180206104330.35ffb946@smile-e5570>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2018 at 10:43:30AM +0100, Maxime Chevallier wrote:

> As a user, what prevented me from using spi_flash_read is that it
> bypasses the message queue. I have a setup that uses spi_async and I
> have to make sure everything goes in the right order, so I ended up
> using spi_write_then_read instead.

> Is there a way to make so that the message that uses exec_op are issued
> in the correct order regarding messages that are already queued ?

> Maybe we could extend spi_message or spi_transfer to store all
> this opcode/dummy/addr information, so that we would use the standard
> interfaces spi_sync / spi_async, and make this mechanism of exec_op
> transparent from the user ?

Or have the flash read flush out the queue perhaps, might be simpler.
Pushing the memory mapped read operations through the queue does seem to
defeat some of the purpose of having them though I can see it might be
needed, I think the current applications were read only or at least read
mostly.

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp5mloACgkQJNaLcl1U
h9CnTQf/RgIMXDTKX+XvD0iWFt3K/k6hK5BJXNz8tPGFTW0qmm3pFETDPS/xD+m7
nQrmFksa+BP991QIziVJxiavdJC0wuTpz9Zvjt6v6ioPmwOKMoGziv1AnE1ZwkzJ
U3Rbb5uZao00QaH8MEffbUUK8MZ6g80TXQzUMlJEqZzUSiOx6Vkfu8HGve3X0OxH
+WQmTKHNz/S2VY00X4m5Gjlju2szBIo97EQ/X//XzX8AY+GGsI3JU5sSGaACvpqn
3G+hwFsEtuYhU3+HLjuIBmhoz3nqn2ZWGfTakRHHBg8XFIb95YZjdqlXIypzLfv8
ThAkJe4X54RaVLPo+oTxuBXQDdsR/w==
=+CE3
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
