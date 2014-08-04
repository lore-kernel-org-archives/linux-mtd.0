Date: Mon, 4 Aug 2014 15:25:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20140804142507.GP30458@sirena.org.uk>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-4-git-send-email-b32955@freescale.com>
 <20140730050843.GE11952@brian-ubuntu>
 <20140730064413.GA15547@shldeISGChi005.sh.intel.com>
 <20140730074500.GF11952@brian-ubuntu>
 <20140730104607.GQ17528@sirena.org.uk>
 <20140802020617.GS3711@ld-irv-0074>
 <CAMuHMdWxzKG1TTUVgYqfRP0Prp85HPwVxH7NQp7S-pNeLfFqjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ltihE5wS63FR6l1A"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWxzKG1TTUVgYqfRP0Prp85HPwVxH7NQp7S-pNeLfFqjA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] mtd: spi-nor: add DDR quad read support
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ltihE5wS63FR6l1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 02, 2014 at 11:09:09AM +0200, Geert Uytterhoeven wrote:
> On Sat, Aug 2, 2014 at 4:06 AM, Brian Norris
> > On Wed, Jul 30, 2014 at 11:46:07AM +0100, Mark Brown wrote:

> >> I don't know what DDR is in this context, sorry.

> > I think it's just the ability to latch data on both the rising and
> > falling edges of the SPI clock. For SPI flash, it seems to be used for
> > the data portion of the opcode/address/data sequence.

> > Yeah, I suppose it could be wedged in later if drivers/spi/ ever adopts
> > a solution.

> I think this can just be another SPI_* spi_device.mode flag.

Sounds like it yes - I was wondering if this might be one of the modes
with extra clock cycles that I've heard mentioned before which might be
a little more fun.

> Do we need bindings for this in
> Documentation/devicetree/bindings/spi/spi-bus.txt?
> Unlike Quad SPI transfer support, this doesn't need special wiring, so DDR
> capability is an intrinsic property of the SPI slave, and the mode bit can just
> be set in the SPI slave driver, without any DT magic?

Right, unless we run into things like board design issues causing
constraints this is something that can be enabled by the two drivers
without needing DT configuration.

--ltihE5wS63FR6l1A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT35e5AAoJELSic+t+oim9v7oP/14Fi6f3pZRNyWiweEg5TIa9
dIqLJtpNOnrG8lVdoQNScYA5Z3rlNtUzI+iQWf/z6nNGl494XhH05fZ8sJr33NW8
bF3a9VXoFVmsQN1GBq3LAlPQgIf4q1C+N3Dn0PUmU3Klt2+XZEuYVj11P/AxFroo
dZHAwSjf1w+LIQ6IPYOiMNNpxgnUuqYz9nGfG1MEP1zYd+7dO6j2RzmZF3bjxgem
1eg8J+G/qg0LZxFdEEEFUOz65Q41onT9sPaNRSwYNLfKBa9v4dPCXHPJowOWfDWr
ULKZBb+eJgCxPvpflr2JtbxM7yvvGCjupHVPNc0PVd1B4qWxJfyX7V6/jwMhHrUW
E4oenAalLQwWBncptgKASXbNoIBP4LUuz96t6jB0mbYuDHHCL/uHDW179riVwbjy
gaqQUEaWKm6OL2B6bQ5cJXPPacRRnltzkmp4ls2fiJU3qtDlObOEXPDUuvP18O5d
hFfJBofkknXwoKZUqTYlXp7Hm3FXTFGxqX6T/QAcdA5cyGwmLEks8ZEZZzlNTRB5
2qZDPBtc3sYyopBYChvay80x6rp7sGW2esRaehQ3KKoSSbGOQcNzbJhnTxc6eXJ/
ADpztiLyAUcr2igvo5gzmRZwDqoOtyEy2mAyB5mXmg4ftSoNCpvka/XJ8wlXQTSm
fgyLqXqimL13PQ5CEZf9
=37w8
-----END PGP SIGNATURE-----

--ltihE5wS63FR6l1A--
