Date: Fri, 23 Aug 2013 12:30:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <20130823113058.GA23465@sirena.org.uk>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-4-git-send-email-b32955@freescale.com>
 <20130822193453.GB10038@ld-irv-0074.broadcom.com>
 <20130822195559.GU26118@sirena.org.uk> <52174640.701@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <52174640.701@gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 b44548@freescale.com, dedekind1@gmail.com, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2013 at 04:23:44AM -0700, Brian Norris wrote:
> On 08/22/2013 12:55 PM, Mark Brown wrote:

> >That bit does need to be fixed in this driver, yes.  The SPI core now
> >has quad mode support.

> Where? Perhaps I'm missing the obvious, but I don't see SPI core
> quad support in linux-next or in Linus' tree.

It went in yesterday, -next doesn't seem to have been updated today (I
suspect Stephen may be on vacation, I'd need to check his announcement
mail from yesterday to confirm).  The SPI tree is:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSF0fvAAoJELSic+t+oim90g0P/i14e7u8toHBkOI7t5/+y0B9
nYEQT6X2ASMtBCm8B57CNROEqCQktqM8O5q+UwoVRFISlM484P+FR4W13GtkchRG
h7Xtbvr1ymjrdpxW8X/f3CVAykIceYKCz4y+Y8qpFWtz8UK3zKL3ZkJOi91UOLqD
hww72xAd6hltvWFC1NKI3dKF8fjpqDi3OyK/Yrcdbgx/wypGJ58WJWK1TNecMfw7
9hjbuv9UGoI1PVe0czNOhHjOxtWRJ3OQLZf9k1+hE7p5GZ50zZi93zq7Sul1nCqb
4ur3dmKnvwwcWd8gFdXikGgQ9qwVbrSmdFalbHwWKIvJ5eQ43JnvrCm+NmKlHFGq
DZo9yBXE6bHnxR473OGKi2lMd56O0IAA9EyC57lya9rl8Z/oUUs5YlIkx0ajdqT1
OEGx1ePq17Kue0EMSoIGc+26XV+rR6HoxnccLmLPL6hhM9I/Hmn8L1Y1OOA62DnH
gbD85wrUWKMlzJct/UlndVB4vnCERMDMimNQjD9CnVIcTlWPua4ScGoLp2VFCPgE
fumdp9f87yUoNi49AfeIEb3QU2YZvSpofDenPjwgVzPYhcS8NQwOu13HFTTmGaNU
BT/5AWAz5MKbzsNg5vNKKHQB9ulhUqNvSYwACgozK+rj+Hxsa5TRkhqR6g3Bo8y+
ETX0sQVQdytoRPPHP6HH
=ITpv
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
