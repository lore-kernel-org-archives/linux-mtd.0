Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDTqa-0002XT-MP
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 12:26:27 +0000
Date: Fri, 19 Oct 2018 13:25:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Vignesh R <vigneshr@ti.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Julien Su <juliensu@mxic.com.tw>,
 Mason Yang <masonccyang@mxic.com.tw>, zhengxunli@mxic.com.tw,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH RFC 00/18] mtd: spi-nor: Proposal for 8-8-8 mode support
Message-ID: <20181019122527.GJ5895@sirena.org.uk>
References: <20181012084825.23697-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sT9gWZPUZYhvPS56"
Content-Disposition: inline
In-Reply-To: <20181012084825.23697-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--sT9gWZPUZYhvPS56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 12, 2018 at 10:48:07AM +0200, Boris Brezillon wrote:

> First question that might come to mind is why should we support such
> stateful modes? If you think about it, the gain of transmitting the
> opcode on 8 IO lines is rather small compared to the pain it is to
> teach the SPI NOR framework how to deal with that. The problem is,
> some SPI NOR manufacturers (Macronix for instance) only implement 1-1-1
> and 8-8-8 (or 8D-8D-8D), and they want to be able to use their NORs in
> 8-8-8 mode when the controller supports it.

The SPI framework changes definitely look OK to me, if everyone agrees
that this is a good way to go from a MTD point of view I'm happy to
apply them.  I have no strong opinion on the MTD bits of the series.

--sT9gWZPUZYhvPS56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvJzTYACgkQJNaLcl1U
h9AHxgf+KPJafqQ5ZnA02BlSPDiXCiC0dgf/Ee+Vj5GA+bFoZ0CXyiYCBhX9wh2o
xK06Xd+OomhhMDFV7SX3yfR4s84xgS/x2mXtXTE+t5ED161LTi6frnRQWOQ/vAum
CceDRf41Hoj9QK75oBF/CYNJo2xrYrWXKHoRafZx/4gVTPz67KfykIvYAQ878hWf
p7cFCyFTXfrupDORGFZqo5XUBnPCFsgTchH2qg/TaxOlquaQYNVnYqozlWM+4VlL
EWaI6q+p+CPhk6fZe14Hxl+WyQfDhnmVzX8/Nys/36Wbzej1Re95ZSZ7bjz1AwBq
QCu0a3ARqjBqTUjlDOk+kYQgRcX9wg==
=qu6u
-----END PGP SIGNATURE-----

--sT9gWZPUZYhvPS56--
