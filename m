Date: Fri, 4 Sep 2015 16:37:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin Sperl <martin@sperl.org>
Cc: Ranjit Waghmode <ranjit.waghmode@xilinx.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, michal.simek@xilinx.com,
 soren.brinkmann@xilinx.com, zajec5@gmail.com, ben@decadent.org.uk,
 marex@denx.de, b32955@freescale.com, knut.wohlrab@de.bosch.com,
 juhosg@openwrt.org, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 harinik@xilinx.com, punnaia@xilinx.com
Message-ID: <20150904153718.GO5313@sirena.org.uk>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
 <20150903121232.GW12027@sirena.org.uk>
 <E4C1DE94-773C-498F-9CD5-639FBEEE3139@sperl.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="44EoV7tf2AX9r8hV"
Content-Disposition: inline
In-Reply-To: <E4C1DE94-773C-498F-9CD5-639FBEEE3139@sperl.org>
Subject: Re: [LINUX RFC v2 1/4] spi: add support of two chip selects & data
 stripe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--44EoV7tf2AX9r8hV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2015 at 02:35:52PM +0200, Martin Sperl wrote:
> > On 03.09.2015, at 14:12, Mark Brown <broonie@kernel.org> wrote:

> > This isn't saying that the controller supports more than one chip, it's
> > saying that the controller supports asserting more than one chip select
> > at once which isn't the same thing.  I'm also not entirely sure that
> > this makes sense as a separate feature to the data striping one - I'm
> > struggling to think of a way to use this sensibly separately to that.

> Well - there is one use-case that I can think of:
> fbtft has the requirement for some devices to control a GPIO to
> differentiate between command and data getting transferred
> - sort of 9 bit.

That's another thing again, isn't it?  It's one device switching between
two different control interfaces at runtime rather than two devices
controlled in lockstep.

--44EoV7tf2AX9r8hV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV6bqtAAoJECTWi3JdVIfQSWAH/RyMGYvMDGzkghmldJhBGlIe
znV2if8kHCD8A+HmG0ARvY/7DWz0qX3SAJoiGXhacIIN/cGBIdvzpeQ9JJQfH6oM
vnY7BZHZTP399C15beITAHiX7f4IlEnvlwbCOKDRKAhd4h4Aq1BhiKjM2ZvTmxH1
q5eI0cc7CHRPt1eMczPhh64tvYlA81L/N2+zqDedWjDf+ddGdoUv/3JwRTgTUClX
53atP1Jh7wYLRrao5T0SAwlkYz/JQRvxxwf1lah3dpB1bmFyHfRUBW1N/NG66fnn
Ca9dDuXEu+AZ+Ph/sUbqs3vitGZ0cdAqm3EpV4M9iDOKz/J/s7auV+zWuG++Kr8=
=eRVV
-----END PGP SIGNATURE-----

--44EoV7tf2AX9r8hV--
