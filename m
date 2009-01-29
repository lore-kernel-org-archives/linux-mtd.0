Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LSLSn-00082z-6f
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 01:13:03 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU and
	clean up maple bus driver (2/3)
Date: Wed, 28 Jan 2009 20:12:54 -0500
References: <1233186456.6734.16.camel@localhost.localdomain>
	<200901281944.57894.vapier@gentoo.org>
	<1233190170.6734.36.camel@localhost.localdomain>
In-Reply-To: <1233190170.6734.36.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1586976.Qj0ey7Ajbh";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200901282012.56699.vapier@gentoo.org>
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1586976.Qj0ey7Ajbh
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 28 January 2009 19:49:30 Adrian McMenamin wrote:
> On Wed, 2009-01-28 at 19:44 -0500, Mike Frysinger wrote:
> > On Wednesday 28 January 2009 19:09:10 Adrian McMenamin wrote:
> > > +static struct maple_driver vmu_flash_driver = {
> > > +	.function =	MAPLE_FUNC_MEMCARD,
> > > +	.drv = {
> > > +		.name =		"Dreamcast_visual_memory",
> >
> > i thought there was like a 16byte limit or something on this ?
>
> Don't think so, it's just a const char* isn't it?

yeah, looks like.  not sure what i remember.
-mike

--nextPart1586976.Qj0ey7Ajbh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJgQKYAAoJEEFjO5/oN/WBuasQAJyBRG8GcuCDrYc49MXpbpoh
Yf/mR628/d71apzAQACOiIerICXWlKUY/OloGQtUUeByCQJSBPtKRNKjFyVM4t3p
hT9KY6fcmGlD84fQ7cBBCYhj7hiWZOj0r3oKw0Dmo2WjyTDTL3BnXFvuxwSaTGL2
yxfDCvzfin8KU3/2IKOy5wss7pe7RilHrxreW+X3v0X2Zd6eDgHUDcYyU0Cqi7lH
hhjnjMuQHQDI1PSOvZ0mDPsOnoilgFOg79iI9n5MF3D9DwotsXtzqmbJ/Oinvenr
gk74XZ2xsaXM9aYxD8I2mFL6KE+31PhmHFasvhy88l7NSsRk8Tn+SmqVLLz5oAgI
Ytf6nKGGoNJDWsAA7Qq2ALmy4X36IdToq7+QPZmGg8WZqLjznfAxTrdzfdeRd4dT
lkoe8q7MhbEtdbJkhg3ZrNR8Y0058z+zLZGI1wSfZSOc10CUixQV1xCDvppmhEPH
XgIvK96EmPTBP1TTb5ySRmaf6Qd6ZI2yBMA9DsOZUHosDartwdIKaaLI3lDvM9Lt
koXTSaYZ3SzB0xsUy4OzTNjJRw6npPT8M58SgAAXWuaCpNWlbpXI0yzhJX/C29Qn
h/gu2ho1ML2XUNTHDAcT1P8k7GMqj8BHmQ00JZK6c/CwpQXtSt4DXCNCf1jLw43t
49UpsmV13u/4TBNF4XBD
=5Oby
-----END PGP SIGNATURE-----

--nextPart1586976.Qj0ey7Ajbh--
