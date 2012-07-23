Received: from opensource.wolfsonmicro.com ([80.75.67.52])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StNdi-0005DI-0s
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 18:45:54 +0000
Date: Mon, 23 Jul 2012 19:45:50 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
Message-ID: <20120723184550.GB12438@opensource.wolfsonmicro.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk>
 <1343067861.19880.30.camel@hornet>
 <20120723183230.GA12438@opensource.wolfsonmicro.com>
 <1343068929.19880.36.camel@hornet>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <1343068929.19880.36.camel@hornet>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 07:42:09PM +0100, Pawel Moll wrote:
> On Mon, 2012-07-23 at 19:32 +0100, Mark Brown wrote:

> > The thing that's particularly bad here is that your change will just
> > silently ignore the error which is far from awesome, at the very least
> > it ought to complain (though I don't think that's a good idea).

> I know, I don't like that myself - that's probably why I don't mind
> dropping that change. Particularly that non-DT boards can always pass
> set_vpp via platform data. And that's what will probably have to happen
> here.

The MMC subsystem went down that path initially but has recently
converted to using regulators more normally.  It provides an explict
callback but uses regulators otherwise IIRC which seems sensible.

> > It shouldn't be that hard to find the in-tree users...

> It was in case of SMSC ethernet drivers ;-)

I think that's more a case of the submitters not looking than anything
else TBH.

> > Well, in the DT case it'll probably start returning -ENODEV soon if
> > there's no supply binding set up (which would get you back to your
> > current case),=20

> This would be perfect. Will it happen for 3.7? If so, I'll drop the
> non-OF patch and make the OF one rely on -ENODEV.

It'll happen if anyone does the work; I've not currently got any useful
systems that run DT and don't have a particularly large amount of spare
time.  People were muttering about it, though, for much the reasons you
mentioned.

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQDZvUAAoJEBus8iNuMP3do2kP/1wa+xIkgwczFxx2IrXfM8DN
D1eSy4rznJUHnPtIlxmU7T3gPf+1r5XhD7a5hzV9oIc1F9Bwfs+y3/rAmDKjT7jp
2plLqp6XeuBFyrQsufiOv61EW9MrPzdj4AOUzDPOTqJvyNDg/2LLdC+z5bTuB2Gr
LBW+hRiafyrOSSh3ZK+SkaanCGGs29CliJ8jRf8q9cmdghAh9WgdTi3uGZjE1rP3
vnudFbkfjqmJI+Ts8JUAm05A8m/txH5pjTwZ07s6yfJjniwjW1/CzTrOXSfo6M8W
OKXV07/vF7FfC32qtD3KGt70eyBQGRup72aZ6QyXMX3UE9HsoplIAXKgEXl+qxL0
9fi4YKTNlEw/jBn8Gdys4+koa40gfySiK4rJhZqtHavQhamfTveYkrqtOsSsMDX/
1Z6C8aGyYJXe+UmmavN7M97JfMNlT38kzKan1O7QySxbz/AAQIZSa6WDivGTpVw6
WxdTnhr0+N/9o8gJseyYW/2rRak5TZl2GVw4Ej/Ai3HoG6M6pFzON9MsSnr7jNnM
C4M7lCjv0TEdkfYzFfn0Cb0TX579atGgFDzn+P4v6EWHNPziE73DuU7XVAjafHXn
QL6egkC+Or4kfIk848LQAwsepDOBItn6AZHzeteR/okEQ4Q8j4fdd7tpYO54h5dk
hw/NlPAUEgEF8FwbUb6a
=atre
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
