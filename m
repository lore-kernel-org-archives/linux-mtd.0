Date: Thu, 4 Jun 2015 10:42:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20150604094248.GA14071@sirena.org.uk>
References: <cover.1433364398.git.hramrach@gmail.com>
 <305830ebf9c0ae98c4f6e0ebbdec7414d6762b36.1433364398.git.hramrach@gmail.com>
 <20150604091634.GY14071@sirena.org.uk>
 <CAMuHMdWHPm6exq4O3CNvVuiZOgLHuxyCrR548BFmbOPikvNRLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="988dVgVOOB5COf1N"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWHPm6exq4O3CNvVuiZOgLHuxyCrR548BFmbOPikvNRLw@mail.gmail.com>
Subject: Re: [PATCH 10/11] spi: add more debug prints in s3c64xx
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Marek Vasut <marex@denx.de>, Michal Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Han Xu <han.xu@freescale.com>, Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--988dVgVOOB5COf1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2015 at 11:30:15AM +0200, Geert Uytterhoeven wrote:
> On Thu, Jun 4, 2015 at 11:16 AM, Mark Brown <broonie@kernel.org> wrote:
> >> --- a/drivers/spi/spi-s3c64xx.c
> >> +++ b/drivers/spi/spi-s3c64xx.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/interrupt.h>
> >>  #include <linux/delay.h>
> >>  #include <linux/clk.h>
> >> +#include <linux/clk-provider.h>

> > Whatever you're doing here this indicates that there's a very big
> > abstraction problem going on.

> I guess it's needed for __clk_get_name(), which can be avoided by using
> the "%pC" printf format specifier instead.

Right, or by adding an externally usable API - the point is that using
internal functions in a client driver is a big red flag.

--988dVgVOOB5COf1N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVcB2YAAoJECTWi3JdVIfQO6EH/2yX1CkVIi3J13r7qH1fI02p
U4vHVMtnfVXqaWbob/bIt1vn/L8D8L5ojQ5l5p6AoRrXkb9p3XwMOTV4no8JuS1/
+F28Qy6+RFDcYGWcc8E5KvpNLWIreXEYx3J0NTvjtxzl1UIYHVs5RVlYflh2kmqj
qn2Jsmy13TcGcohUAbQGFSG662iGeV+KdAsWwD2rql+awInCYJT1lwvUqkujEXJ9
eM+MxZn8ZgEUWoqEBzfGDZaahs/ORdgx9XgAOwPsimAsqYbTeN95L6o90x/TL5ZM
IG3t6XBCgGwIWNLz0T/WzYO2n1T3d8TOH+ShqGbtpmMvTpyZ4Rt/XruByI00BO8=
=qp8l
-----END PGP SIGNATURE-----

--988dVgVOOB5COf1N--
