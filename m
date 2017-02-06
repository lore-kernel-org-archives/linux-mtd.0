Received: from mezzanine.sirena.org.uk ([106.187.55.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1camRX-0002R0-B5
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 16:47:09 +0000
Date: Mon, 6 Feb 2017 16:46:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marex@denx.de>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Message-ID: <20170206164634.awi4oe5e4o4w2kmj@sirena.org.uk>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-4-git-send-email-kdasu.kdev@gmail.com>
 <20170204112555.p77votp5m7klygbe@sirena.org.uk>
 <CAC=U0a0o21taio6jYzTCx1ix85aFNtikXHs=O99OW1pChbG4TA@mail.gmail.com>
 <11cfd6da-c537-eca9-5c50-7789d5b672dd@atmel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3gfo2cq3tygaroym"
Content-Disposition: inline
In-Reply-To: <11cfd6da-c537-eca9-5c50-7789d5b672dd@atmel.com>
Subject: Re: [PATCH v1 3/5] spi: Added way to check for pm support for flash
 devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--3gfo2cq3tygaroym
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2017 at 11:44:09AM +0100, Cyrille Pitchen wrote:
> Le 04/02/2017 =E0 21:47, Kamal Dasu a =E9crit :

> >> What is "flash pm" and how would a client use it given that no API for
> >> actually managing power is being added here?  Someone looking at the A=
PI
> >> needs to be able to figure these things out and right now I can't see
> >> how they'd do that...o

> > The flash_pm function just indicates if  m25p80 resume op that does a
> > spi_nor_pm_rescan() is needed, and by default will do nothing for
> > other platforms. So the basic idea of the patches was to execute the
> > only necessary spi_nor_pm_rescan() on resume when flash parts are
> > reset on suspend. So from controller perspective there is no

I can't tell what this means, sorry, and writing this e-mail does not
address the incomprehensibility of the API.  Why would the controller
driver have anything to do with whatever this spi_nor_pm_rescan()
operation does?

> I don't understand why we extend in the SPI framework API to add power
> management features but only for SPI flashes. I guess concerning the power
> management, there is nothing special about SPI flashes: they are just SPI
> devices like others. So why not extend the SPI framework, if needed, with
> something working for all SPI devices, not just for SPI flashes.

It's already possible for SPI devices to do runtime PM.

--3gfo2cq3tygaroym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliYqGkACgkQJNaLcl1U
h9DtBwf8COlSE1A9lZBZw+8PUhaBp2LRJn6Vl5D5qQey+MtvioKGx8P+ffYIDy1g
+/rTon2HaJpKMAwmjb/5UbU1wmfCumi6XclcPIP8sfS1wJ9+AqAqvEuWBpSeHPMN
GxoTir/2OG8GdIlpmHSGg3bM1tV8Y3Zs+n5VFk9TbEN2DW4gt6X+b1rIgqq7rKQO
bbXpyPpu5e0TDl9a0J3HqpKydsCZayVB/vAdlft4rZs1Cs/PNNwDMdNfXkGxbvr0
aEgDMu/O4R07lIUVRXYDt/+j99v7I93PJkO9jsbI8eAE1hn0qwTOJqFQ3uhqrWSq
07xdcpBwxqdxTxvva8Pg3q6de1dogQ==
=wjUW
-----END PGP SIGNATURE-----

--3gfo2cq3tygaroym--
