Date: Wed, 7 Aug 2013 16:58:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130807155805.GG6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-16-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="cV8yfgwCnzpki16T"
Content-Disposition: inline
In-Reply-To: <1375889649-14638-16-git-send-email-zonque@gmail.com>
Subject: Re: [PATCH 15/20] ASoC: pxa: pxa-ssp: set dma filter data from
 startup hook
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--cV8yfgwCnzpki16T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2013 at 05:34:04PM +0200, Daniel Mack wrote:
> With the new dmaengine implementation, the filter_data parameter has
> to be set earlier, from pxa_ssp_startup().

Acked-by: Mark Brown <broonie@linaro.org>

--cV8yfgwCnzpki16T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSAm6KAAoJELSic+t+oim9YJwP/0QgiooUDXRH02abCBiVpzIi
9TqJDxvSNkBdbtbMXucuPSrsneaeeAynEmA3khgDdiPhraJJxyaXbv1BKqWVSWdC
9K+ILxnn7mQuz0P2W5l1sZYLs/+LsB12aPQCfroDVEO3SZ2uV+4kRjqBhm20rrmp
hnlslmmDoIzOXqP3kmanteQS7Jcn7V1/K1cYXE9Yul/6TQ6tIKlZjII6fFrvhU+W
DM7nb07nt6nwA46lo3LtkM1b3pUoniHH7pLfm3ue84k9voB1nh5OONTR6SllGzvr
U6dgP0C5u+Uzxu0f2n8HhyAiGq0O7uv62qrieqm8+kAr3WeDYZLKccX18uJLVhk8
QpFWDXErxDgW6T3bflqP+eJe4TQCWDtW7bLdDRizY11BCWTsyEMr2VkaNDSmrazw
YNBue52hxSxHFI6J2eJa1e35PBMjzU0wUqtyOlESO6BH4JOJnm7efMZXaPr0iMtq
sy6yotpdYtzpawqUQzJj4s4fTtjca/8/xDuD2MC/WsBj9adGNaebzjGoKwlSok0n
WcyUl0yDMRSdNbIqh7UdFfnjsdtxtoJZQscX1tU7rhthbtlLgn9xCTeLEufcRIeO
NMe3NUx/1WpJg4yk010Bk/8BN5MSrQIcHz6ixT2lUlr+ih0q2K3IKqA831nRx5+c
oSCx4iQS6ezHQTocM503
=rlzF
-----END PGP SIGNATURE-----

--cV8yfgwCnzpki16T--
