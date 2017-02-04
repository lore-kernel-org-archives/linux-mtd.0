Received: from mezzanine.sirena.org.uk ([106.187.55.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZyWP-0006uF-Mt
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2017 11:28:51 +0000
Date: Sat, 4 Feb 2017 12:25:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
Message-ID: <20170204112555.p77votp5m7klygbe@sirena.org.uk>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-4-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uhzquobfemza2aic"
Content-Disposition: inline
In-Reply-To: <1486164676-12912-4-git-send-email-kdasu.kdev@gmail.com>
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


--uhzquobfemza2aic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2017 at 06:31:14PM -0500, Kamal Dasu wrote:

> Device drivers can check if the master controller driver has to support
> flash pm. The controller driver indicates this using flash_pm_supported()
> spi master interface.

What is "flash pm" and how would a client use it given that no API for
actually managing power is being added here?  Someone looking at the API
needs to be able to figure these things out and right now I can't see
how they'd do that...

--uhzquobfemza2aic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliVukIACgkQJNaLcl1U
h9CaFwf/fI0j+4+tXplMhLnprqxa06Pm8LD5JMkgsZYszNi3hsu7GTuI6NjMl/Ur
Av9KozbatHQj1X25rl2WOdGMWpFKMDY+CcZjNap14APM+nYjOBzYk57Xn+qBklnB
FMFg6e+4VR7DJxS+Um63zEldVHW4+sBFjU4jojwgUqsAS08dLcbyQFHfmE8yzFG6
gDs1O/bnS0nfTHxQnRxxiIa6whHyJYS7OE5ndksXXFJWvVOkRAflZQyIOtSe4sOr
GXicySd3xXYYa/ZBRrNcGT8ETgsutM9DLABqXMmy0oXge40BV7VlVdLCmJSOesN7
7KRcgneo4+1eK6Uwpy+9Uo6aej61Kg==
=3fGF
-----END PGP SIGNATURE-----

--uhzquobfemza2aic--
