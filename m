Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX9ng-0002Si-SR
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 13:09:09 +0000
Date: Fri, 18 Oct 2013 14:08:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131018130842.GO2443@sirena.org.uk>
References: <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
 <20131017234230.GZ2443@sirena.org.uk> <5260B3AE.9070308@ti.com>
 <CA+7tXihUBXK61cRDmn3tnY9FM7FUSZrhPpLry2VAfvwWJpJ6gQ@mail.gmail.com>
 <5260D0C7.4000805@ti.com> <5260E2F7.4020404@ti.com>
 <20131018103114.GJ2443@sirena.org.uk> <52611FFF.9080601@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0cnRGJiAylz0AQGh"
Content-Disposition: inline
In-Reply-To: <52611FFF.9080601@ti.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Cc: Peter Korsgaard <peter@korsgaard.com>, Trent Piepho <tpiepho@gmail.com>,
 "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--0cnRGJiAylz0AQGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2013 at 05:18:15PM +0530, Sourav Poddar wrote:
> On Friday 18 October 2013 04:01 PM, Mark Brown wrote:
> >On Fri, Oct 18, 2013 at 12:57:51PM +0530, Sourav Poddar wrote:

> >>3. For filling memory mapped register in qspi controller, we can
> >>pass that information
> >>     from dt rather than hardcoding as macros.

> >Or from the flash driver at runtime...

> No, as for now, its better to keep mtd framework independent of this
> spi controller configuration and pass the information via dt.

> Since we dont have a common protocol, If we start putting this information
> in mtd, it will clutter the mtd space and it may happen that we may end up
> with differnet if defs for all the kind of flash devices.

I thought this was the information for the flash commands that the
driver would need to know anyway for use with SPI controllers without
explicit flash support?  But perhaps I'm misunderstanding.

--0cnRGJiAylz0AQGh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSYTLXAAoJELSic+t+oim9diQP/2XAJ49AscrPbXJGWIlye0LH
TZ4p9NhW3Md0wDecON5t4eq1SaYaf0YuWPF8T3mLTYVy9Ut+dwc4oBVD/MNGLLlk
mhnLbhCVhAFVJmOBXX0gzl8MHNUyaw8M5g7YssDPaovzqKTgjbrYy4kwcY8oC7cQ
9uI8eW3J8hoGpBfHHkYMbnBmWtryY82hzKPP4Jh4FQuk076IMbTXzjldH4ycZPGp
HcSCnr/5mj4n91Gu/rxYfw9XUzP8XRqijhdIjU1a9CpQNT2yQdgnRvkhCepV915R
287q+olFXVX32EW4+sgG7qvNAhsMFokoTUkKZvWEqJZvz+V88zjSXUAg2PJRrvN0
5fmrWxoqMiXqoPT+ttkUiO/20227QygHlfsEg7nKGLECBmWmx2T5XBcVB8/ZNdv/
O/V7zOAv4Y/HlMaQW8JTpT+2tj0I5sEZRy/ibo1kkVi16ML9A57yJupwsjJKsxaC
ipVzMGGCDdyh447M7RivOghvzzU6pTs4cRKnSvop8nwJYWZ1CJfTrXdg6+SsGX+x
2EpR3fgBUmNhv/2A5Nt+sXTjkJVxBx/YMSZr/d5WteVkdjuS/k5pysT7JyuL0VpQ
6dB+vcR59gds4WQfYAzQpVYR8FqtCE/to25Mgd9KnZAZ4r+MHfuZfLELPi6p5FNn
0q5N6oSUcalqUyzq8Udq
=G+Nt
-----END PGP SIGNATURE-----

--0cnRGJiAylz0AQGh--
