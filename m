Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA3fB-00040H-VM
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 23:10:39 +0000
Date: Tue, 7 Jun 2016 00:07:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>,
 linux-spi@vger.kernel.org
Message-ID: <20160606230752.GM7510@sirena.org.uk>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
 <a57adb90-0d80-186f-17d3-6fdf106bfb4a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dp9QYJgVRVEW2bsm"
Content-Disposition: inline
In-Reply-To: <a57adb90-0d80-186f-17d3-6fdf106bfb4a@gmail.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--dp9QYJgVRVEW2bsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2016 at 08:53:10PM +0200, Heiner Kallweit wrote:
> Am 06.06.2016 um 19:40 schrieb Mark Brown:

> > That doesn't make any sense, the controller hardware doesn't=20
> > magically change based on what is connected to it.

> The issue with fsl-espi is that the controller deactivates CS after
> each physical transfer. And a lot of HW designs use the hardware CS,
> therefore the advise to use a GPIO instead doesn't really help.

There's no pinmux to fix the broken behaviour?  The Freescale SPI
controllers really are terrible :(

> In case of SPI NOR CS needs to stay active between command and data

In the case of *all* SPI transactions this needs to happen.  This is
*not* optional, it's not some weird requirement of NOR, it's one of the
most basic requirements for a SPI driver on Linux.

> Well, we could reduce the max_transfer_size exposed by the driver by
> the max length of a m25p80 read command in general.

No!  Apart from anything else this would be a complete and total
abstraction failure.  This is a driver for a SPI controller, not a
driver for a flash controller, which means that it should not have flash
specific hacks in it.

> Then we might be too strict for other SPI devices, but this may
> be acceptable as the current fsl-espi driver is usable with SPI NOR
> devices only anyway.

What makes you say this?  I'm guessing that the driver is just broken
but it would be good to understand the specifics.

--dp9QYJgVRVEW2bsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXVgJIAAoJECTWi3JdVIfQRIQH/j3k2NkoFl6cNNM/qhvIgE1j
hV7p3WASwunVuWkxaThP9vcpCGtAFwD8v9cZvj9shhRQPkybAxRiGd2nZJtU6eQY
5xDZwPgyv385bwrufRGrG0X8hoawireAMesIpAu+bjLYwtciAr52Xwog6vrJBnr7
Li8YZhR9gcgglTLn0wF7XTud8u/DHGtQsuOFejFSfDDiIEInVESqs94hlDuCs3Mn
xxI7IfSZFOEMM7hx7eMERIiFaFNrQVguwOPuCW+n8HxZjn9h/KBH6wYiReOydjK6
+eUavZBXFIvpn3zqcyW6qqp9z0aoenCqE5T3I0EoT2CzQBNSjFFHcSalnfaZGnM=
=oQAZ
-----END PGP SIGNATURE-----

--dp9QYJgVRVEW2bsm--
