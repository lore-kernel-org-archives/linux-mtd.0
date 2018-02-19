Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enoFw-0003kq-Tw
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 16:25:34 +0000
Date: Mon, 19 Feb 2018 16:25:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
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
Subject: Re: [RFC PATCH 0/6] spi: Extend the framework to generically support
 memory devices
Message-ID: <20180219162510.GG32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline
In-Reply-To: <20180205232120.5851-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2018 at 12:21:14AM +0100, Boris Brezillon wrote:

> SPI NAND layer): you can register a SPI NOR device directly from the
> dedicated SPI memory controller, or it can be registered through the
> SPI layer if the SPI controller is a generic SPI controller. While
> the generic SPI controller path works fine, the dedicated SPI NOR
> controller path brings its own set of issues:

> * the SPI bus is not represented in sysfs

I'm not sure if this is a big deal or not - at some point it's just an
implementation detail of the hardware rather than something we're aware
of or interested in.

> * because there's no bus, there's no uevent, which means you'll have to
>   select both the SPI NAND and SPI NOR logic as soon as one driver
>   supports both interfaces if you don't want to run into loading
>   dependency issues

This is sounding like we want a class (well, virtual bus in the new
world) for these devices with a SPI based driver sitting on top of that
for use with genuine SPI controllers.  If the intention is as the
comments in the code suggested that controllers implementing the memory
mapping stuff don't use SPI at all then we could have the legacy SPI bus
support be just another driver for this class.  However when I look at
what the drivers are actually doing it seems like that's not the case
and the new API is intended to sit alongside normal SPI support, perhaps
only implementing certain operations and using regular SPI for others.
In that case it makes a lot more sense to have this be bolted on the
side of SPI.

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqK+mUACgkQJNaLcl1U
h9BvQwf7BeSTkVRX01pMMPeDPUstSbnx2rW/lhaOJ0l4D4mv70OnhZStOJlhQYbx
lc2YeHPVR7xyhOXjMGsJ/+Gg4Q3rXohxQ4PP9Wr/USw440vo2S9qMRYNNk0FI2YT
PRBMowLrzA7qN4W806cbByvQMBybtwCnvGcFCyszYE47bJQGF/jiGLq5lCXEKCFz
KxvyoHtxcn6u+Cz+PYFqOjARTvYIiM8bY6E/zml2CZAOA/J3ow5LcWw7SyRBXTvF
0ko70SJHJkPThznGZQwNHq8JIMJSXyP2IPToEtvfTBKbYhnp92sLAmKJsDe5Lk22
fLmUz2kxGLN0q8stSyYHQWuuDI1MRQ==
=P+ey
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
