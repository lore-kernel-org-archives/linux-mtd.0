Date: Thu, 6 Aug 2015 12:23:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: "R, Vignesh" <vigneshr@ti.com>, devicetree <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150806112353.GT20873@sirena.org.uk>
References: <20150731181745.GM20873@sirena.org.uk> <55BEF4AF.5090704@ti.com>
 <20150804155148.GR20873@sirena.org.uk> <55C0FD98.1090107@ti.com>
 <20150805115013.GJ20873@sirena.org.uk>
 <CAOMqctQXwcHyiWBwtugSDSE_k65qrNfrwnhjQMDJkLoJMmGzUw@mail.gmail.com>
 <20150805124412.GN20873@sirena.org.uk>
 <CAOMqctS9Y5FxpUCCJew6+cnjH5iTvbzkH3g-8yrXs4OuS2pSGA@mail.gmail.com>
 <20150806090202.GO20873@sirena.org.uk>
 <CAOMqctQZRZ4zG_yYy=CeX3DX4NVNWN1COP4Q-2YvMun9xYOA7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="62KrrilqlZ2duPAE"
Content-Disposition: inline
In-Reply-To: <CAOMqctQZRZ4zG_yYy=CeX3DX4NVNWN1COP4Q-2YvMun9xYOA7g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--62KrrilqlZ2duPAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2015 at 12:01:37PM +0200, Michal Suchanek wrote:

> However, I am familiar m25p80.c and as I understand it the controller
> is basically supposed to implement m25p80.c in hardware when this flag
> is set.

But what in concrete terms is that supposed to mean?  It's currently
just an essentially undocumented flag on a message rather than something
operating at the level of a flash chip.  That's pretty much where
Russell's comments come from.

> If I was using m25p80.c to talk to anything but an actual flash chip
> it would get me quite worried.

Sure, but at the end of the day it's just emitting standard SPI messages
which don't know anything about flash.  If those messages are a sensible
interface here then why bother with the flag, we can just pattern match
on the format of the message.  If that doesn't work then probably this
isn't a great interface and a separate, application specific interface
makes more sense.

--62KrrilqlZ2duPAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVw0PJAAoJECTWi3JdVIfQlDwH/RoJjV1vtBZvIz6y2rNeg6SY
/EngkfZbUpsCABFhzmUP0eF4uLs6R4JzzRaEbG02wW3XcEjn+l1eFywV4ab9iVuu
QXlEYaxK6jChxAZWps+AGHXXZ8sBOKTc3rEjX1fv5ahCgjikPZ6/q2EsahqliE+L
87r0GR+Vslu5eedlvXytMPQiepzHxLAmoWiIeyA/fRJhpSyeh1VYB/LrUWsf/2tf
B1HTFQeiYkbL2F/83qFZzEC+ODwYF08/7a/aaDQraEZ9dkTimjeLO6r9NxuF90iE
F6ivbguXfkxBSil0BaJRL2PpVf3ZWAfFxOiMbIvr1HudheTnvm+7PLDrawgiux4=
=RTgY
-----END PGP SIGNATURE-----

--62KrrilqlZ2duPAE--
