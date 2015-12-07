Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a62Fj-0001mC-Jl
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 20:19:20 +0000
Date: Mon, 7 Dec 2015 20:18:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Sperl <martin@sperl.org>
Cc: Michal Suchanek <hramrach@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paM?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20151207201804.GP5727@sirena.org.uk>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
 <20151201231233.GA1929@sirena.org.uk>
 <5FC39638-EEE0-4CFA-B464-0B4743CB6AB6@sperl.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QAdlk5ze2izLk3Ap"
Content-Disposition: inline
In-Reply-To: <5FC39638-EEE0-4CFA-B464-0B4743CB6AB6@sperl.org>
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--QAdlk5ze2izLk3Ap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 03:30:50PM +0100, Martin Sperl wrote:
> > On 02.12.2015, at 00:12, Mark Brown <broonie@kernel.org> wrote:

> > Can we change this to return SIZE_MAX instead (ie, the maximum value for
> > a size_t)?  That way callers don't need to worry if there is a limit, if
> > they want to handle it they can just unconditionally assume that a limit
> > will be provided.

> As I just came across: spi_master.max_dma_len, so I wonder how this=20
> value would differ from the proposed spi_master.max_transfer_size
> on specific HW?

> For all practical purposes I would assume both are identical.

Yeah, we should probably just remove the DMA specific one in time though
it may be useful for some devices with built in DMA engines if they're
oddly limited I'm not sure how practical their DMA would be if it
differed from the overall transfer length.

--QAdlk5ze2izLk3Ap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWZel7AAoJECTWi3JdVIfQjjQH/iy91T7A4JvYs/YwGF+FG0Uj
B8qw/GNfCdVEH3FFCXPO6knkp5FVlHWGRhdnZzt2lWb2FfrZoN5OefDALP+g/PRK
gFzHqoBMCE8lcuPMMRQsJuShGG94N1I+q4RuriA//0DXYXnJuyWms2k/yo0EWtlV
9zK5M6gg4tkTnMJBz1z5+2vzoD5xPK4VzHQSmoPk60E2SZ+987f+fhuCtqwu7t1e
589uV8Ko3XE12QK+ulBlbwQorItX6S6QtyNZC7k9UBnq35QVnROPaQ1VY2ElwIPy
DM5sqtNCGFjVEXVqq1lkuQMkXcx1fqxPLXdzsp6pp+oGzlo05XdbKkomQk6e8GA=
=lDk6
-----END PGP SIGNATURE-----

--QAdlk5ze2izLk3Ap--
