Message-ID: <1337088703.2528.208.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: LPC32xx SLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Tue, 15 May 2012 16:31:43 +0300
In-Reply-To: <4FB25837.2050603@antcom.de>
References: <1336829386-23301-1-git-send-email-stigge@antcom.de>
 <1337068543.2528.143.camel@sauron.fi.intel.com>
 <4FB2109A.2080505@freescale.com> <4FB25837.2050603@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1nvlbCi5fHtBZBbOcXOt"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, Lars-Peter Clausen <lars@metafoo.de>,
 linux-doc@vger.kernel.org, Lei Wen <leiwen@marvell.com>,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dwmw2@infradead.org, Bastian Hecht <hechtb@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1nvlbCi5fHtBZBbOcXOt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 15:20 +0200, Roland Stigge wrote:
> >> while ((readl(...))&&  timeout-->  0)
> >>     cpu_relax();
>=20
> As I understand loops_per_jiffy, this loop will take much longer than
> the 100 ms you defined above?

Not sure about much, but longer. The idea is that this is about the
error path so if we report -EIO with a slight delay - no problem.

--=20
Best Regards,
Artem Bityutskiy

--=-1nvlbCi5fHtBZBbOcXOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPslq/AAoJECmIfjd9wqK0jhMP/RCFaFYJfic5PE4Ovi1LyDfH
6FVingHAa0fiByhax5GSYvzH367D6cyFmPe0aBTNRsmxeCgJwH/q4pZ/4KWYQufv
v6mPhHEA9RjSMfZBzujYHEFpxGbLXmlyE5RW+eHmmO1jKOi+kkbI0D49I4qtTnaK
HccwgskpWqUz5sHW3Fm7rOIRggZ/7yxStlM7HRbsN6z9xYmlCZW3yX9ZDGgH0w0k
/zBLywZZCrlhJEH7QM0TkYM/frMx/TAOu2wSwgb1FtF64tNpTMLLcZmexQ+UkkQO
C7hna2j65kr5LVQjSnFAEFvWp09bkfkSV4alMiyIn7E0Ck8dOaTROn49lmBy+U47
dqfQJtZE6e3hm+ciM5dBSW3OAd1tPANjg5hVyTPN+HYqY1+veOnGL0uC5+UuM8Tr
Lw93OPi8Ie6/KrWZ0eBnYU7pIVd8PZ/KcfZ6RUlO8qnd3EhpWTZ7Ow5ww+Y/EFWw
dM81Fo8C18mHfZBVIepilnu3jcwCEZjztNcGE6TBXlWlSmPH2vPY+X+fLinkBcDq
WlJon//YYEhiYDDWYvME2t3ilUaPLxU1wgKeBnQv7uMG7Df7GEr/VS3yx762RP41
haU7xuHYx7+3EqXX0pPEygS6uW6paZcrmB0RBlPcQFndMpW+FV+fJyefiCDCYnyw
05q5VQFAMGuxFh0mdrAC
=sZe1
-----END PGP SIGNATURE-----

--=-1nvlbCi5fHtBZBbOcXOt--
