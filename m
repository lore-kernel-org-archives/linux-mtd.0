Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9zMW-0004Ur-TK
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 18:34:57 +0000
Date: Mon, 6 Jun 2016 19:34:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>,
 linux-spi@vger.kernel.org
Message-ID: <20160606183426.GJ7510@sirena.org.uk>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
 <20160606182803.GA128439@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SBT+cnFS/G3NVgv4"
Content-Disposition: inline
In-Reply-To: <20160606182803.GA128439@google.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--SBT+cnFS/G3NVgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2016 at 11:28:03AM -0700, Brian Norris wrote:
> On Mon, Jun 06, 2016 at 06:40:03PM +0100, Mark Brown wrote:
> > On Sat, Jun 04, 2016 at 12:22:37AM +0200, Heiner Kallweit wrote:

> > > I'd like to come back to this discussion. You said best would be to fix
> > > the chip driver. To do this and calculate an appropriate value for
> > > max_transfer_size the chip driver would have to know that the spi_device
> > > is a spi-nor device.

> > That doesn't make any sense, the controller hardware doesn't magically
> > change based on what is connected to it.

> I believe Heiner has an (unstated here, but stated elsewhere?)
> assumption that his driver has a maximum *message* size, not *transfer*
> size. So he's explaining how to work around that by implicitly figuring
> out what the message size would be based on a transfer size, I think.

That still wouldn't explain how this could depend on the connected
device, the message size isn't going to change any more than the
transfer size is.

--SBT+cnFS/G3NVgv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXVcIxAAoJECTWi3JdVIfQRwEH/3kCsDYavw1mDv7MetlmF0VL
KRjy/gBjEJqWxZNUwcy7uW6Vir7b4XRpzeg5RXDfVxEYcr1rO8QB4q6Ufawb2lC1
NivYJ/IoYtUfkPa+aK7oANho/nwM9ob39BJ9LHehAgscYs2rU+WxPjLict1GQkZV
cEF6SJirgC2NC0hUnupOlNInHYHTZd+7lfTX8CM0TUib1t2YiFO/AvJd9ICauMv+
cCcFrDxlwleLwSacQtChx3W3Tq5VvOEhKK38KnoKxeo7T0FfpocI3i022kkYb7I+
uNyreF3EhA66WbWqQmm12ZVWBavgJ8/zVBmqRs8gsNJrB9WeKgJ5oWvatwge2p0=
=N+XX
-----END PGP SIGNATURE-----

--SBT+cnFS/G3NVgv4--
