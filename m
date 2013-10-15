Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW6wg-0004jI-VG
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 15:54:09 +0000
Date: Tue, 15 Oct 2013 16:53:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131015155339.GR2443@sirena.org.uk>
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+gja40GB6TecLxwr"
Content-Disposition: inline
In-Reply-To: <525D41E2.30206@ti.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Cc: Peter Korsgaard <peter@korsgaard.com>, Trent Piepho <tpiepho@gmail.com>,
 balbi@ti.com, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--+gja40GB6TecLxwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2013 at 06:53:46PM +0530, Sourav Poddar wrote:

> Not sure, if free buf is needed as devm_* variant is used to allocate that
> memory.

I would expect the buffer to only be requested by the flash driver when
actively in use.  This will enable the SPI controller driver to save
power (by stopping the clock for example as in your case) when the flash
isn't actively being used.

--+gja40GB6TecLxwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXWUAAAoJELSic+t+oim9Rt0P/3sPGfTTi+Az4QoLH1W1/bIY
xP4dti1UHEuZFeYOtJErXtkwManOJCoFSF0mYFKm/MXQ/RoUHZEqq5SSkmhP84Bk
HvWjtrHcJTly4iET65ZWAjxAU72o/9Wq4VtAXOYfp6sQhBBrBpTW9UPcf20MLjbY
VU08Lzb/9iYJ8HKZ/u1WI842lQxM4aImXzKbU0eI8hDagSWiRnQw3K14wKSyI1Vb
8T6GQZflnYBQQOW3JSGxnErTyqBrif7p0Or8TXZj71qtMjIEBxvbOBJKCn8PAU7z
b+4c1b/hsuC32tyjUUstow1rxa+DAIvNVMg/8d3ADHXQejTbE7JSpH/cNOAqmlwQ
M+9NGp9gD4HekdL1SvndwfS2iZmm8By+MyfmN6W6XXIJBi0ZWBdKIeO9VlvkZqGi
aXBU+XTPRP3Yjvdtj4A0JcIiADGZUQMmq2mblpqMFwEFCPSLkfymfCir+kwrdL5T
AlcG2HwsmhEECM5277mUNYypknF0+2O8hl6eV3Jqi7/bi7jUVvnfTk2mKHBocAEw
aXicW8XUO9acY+BJHsjBkAfnMVPsMzNwvr3gQ+yOxz9VzGaPkWHAODuJ7GqosH3z
8Jj0RmudS4p8vYwQinob665lc1X7l97UjLadqjSLozY5JKPdOfvgUiydEPMj9kCf
vts0eo4EEH47MFszDAkF
=yvS7
-----END PGP SIGNATURE-----

--+gja40GB6TecLxwr--
