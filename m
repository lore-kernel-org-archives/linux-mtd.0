Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAvTu-0003Kw-GW
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 10:47:32 +0000
Date: Tue, 24 Apr 2018 11:47:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-spi <linux-spi@vger.kernel.org>, Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v3 3/9] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180424104706.GB22073@sirena.org.uk>
References: <20180422183522.11118-1-boris.brezillon@bootlin.com>
 <20180422183522.11118-4-boris.brezillon@bootlin.com>
 <CAHp75VfNzxGoSk==sdnOzp7LhuHVuanWAHOQk0eQC_g3Y3miQA@mail.gmail.com>
 <20180424000805.6c015a40@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <20180424000805.6c015a40@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 12:10:04AM +0200, Boris Brezillon wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > > +#if IS_ENABLED(CONFIG_SPI_MEM) =20

> > IS_BUILTIN().
> > You defined it as boolean, IS_ENABLE() is superfluous.

> Sorry but I don't see the problem here. Yes, IS_BUILTIN() would work,
> but IS_ENABLED() works fine too and has not impact on runtime perfs
> (and probably near zero impact on compilation time). Anyway, I'll let
> Mark decide if this is important enough to send a new version.

Yeah, I'm fine with IS_ENABLED() - if nothing else it's defensive
programming.

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrfCykACgkQJNaLcl1U
h9Dvgwf/aCAPgQAIuDErJSTKWoa17nty96zVEfvsVOcVrXCjjc8RsXaO38Vt6ulQ
WdYo7vH+3dTt3/SLVS9Y8JmvmxTk7IoypaFblEYpI8CwzXbVfFG39iUQuoczs71X
SDqhvrs46kDCbpwKGbLx15SUv4m0kRrmv/NX7qigGsYPYfdAYb0raDvmJImoUdkX
w2HXiqKdlzitoHVto6cMie3f53Hb9Rqhib8a2prtT3CdNZvwi0mSvNi26LJleJ4u
GY3SJn9n3aDbPcu7b/wHPhT7fa27tcOr9s7OpiyHFmQXKDeCS/hzVSHgZ03ATjsO
Kpl/I0j/b3anYYWAdnPEDRX9APUYew==
=5/f0
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
