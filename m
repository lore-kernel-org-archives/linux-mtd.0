Date: Wed, 16 Sep 2015 16:24:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Jagan Teki <jteki@openedev.com>
Cc: devicetree@vger.kernel.org, hramrach@gmail.com,
 Russell King <linux@arm.linux.org.uk>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-omap@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Benoit Cousson <bcousson@baylibre.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150916152421.GL11268@sirena.org.uk>
References: <1441355402-6837-1-git-send-email-vigneshr@ti.com>
 <1441355402-6837-2-git-send-email-vigneshr@ti.com>
 <CAD6G_RT8Q+Uyp1ZjzHf54Tno1wHm0SmLKEwRAe2gkdp772FD9A@mail.gmail.com>
 <20150914183553.GE12027@sirena.org.uk>
 <CAD6G_RQOazkS7KHrG75wgMXx1cH_pKjx43Mve6fz1qOJGPpq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BFVE2HhgxTpCzM8t"
Content-Disposition: inline
In-Reply-To: <CAD6G_RQOazkS7KHrG75wgMXx1cH_pKjx43Mve6fz1qOJGPpq9w@mail.gmail.com>
Subject: Re: [PATCH 1/5] spi: introduce mmap read support for spi flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--BFVE2HhgxTpCzM8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2015 at 06:16:55PM +0530, Jagan Teki wrote:
> On 15 September 2015 at 00:05, Mark Brown <broonie@kernel.org> wrote:

> > There seem to be a reasonable number of SPI controllers out there which
> > have as an extension the ability to do memory mapped reads but are
> > otherwise perfectly normal SPI controllers and which rely on that for
> > everything except reads.

> This is true, but exposing direct spi-nor arguments or features like
> read_opcode, addr_width or dummy_byte to spi layer isn't fine? because
> for spi layer there is a spi to flash transition mtd m25p80.c is there
> to handle is it?

The m25p80 driver is a generic, SPI level piece of code not a driver for
specific controller hardware.  The controller hardware drivers live in
the SPI subsystem.  In order to support this memory mapped feature we
need the controller drivers to expose an interface for controlling it.

--BFVE2HhgxTpCzM8t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+YmkAAoJECTWi3JdVIfQHf0IAIACpwZyIQQHENTwLqckYkld
Dh8gtSVtQ5ONVXG6fKdztQivwKTFw4Kh/BcmQYMUv6Glf/dhPHOA5dhDF+AmbRUb
Ld7f06b6n4aAk3URhR2EEFJSlCpHGcz099t6VONILlPss+N7/x4kZcHbGEs6DQvu
omKwGZN3UsLJiSKcibZiJjCzbBFcyf0rtv1RA6PzbO7jt4TeDHZ/4fM8wZ81jc89
onYapT+fWg8i7A8EwAeWSaPi3rQny1dZZ/MiCZqEZnrHFcTd7zMPI08TK6r4hsHN
CI6iVWgwxGgZX1XGUP9hMR6tDLu0CwAoK7N/RlMrZFI2gkggs8he3c4dbmDLM2s=
=F3z7
-----END PGP SIGNATURE-----

--BFVE2HhgxTpCzM8t--
