Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7llF-0003t4-Sc
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 16:43:52 +0000
Date: Mon, 8 May 2017 18:43:22 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Hans de Goede <hdegoede@redhat.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Tejun Heo <tj@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508164322.GA9781@amd>
References: <20170507204007.GA25628@atrey.karlin.mff.cuni.cz>
 <1494228094.6528.14.camel@infradead.org>
 <alpine.DEB.2.11.1705080930150.6882@lnxricardw1>
 <1494231215.6528.22.camel@infradead.org>
 <alpine.DEB.2.11.1705081034420.6882@lnxricardw1>
 <1494233673.6528.28.camel@infradead.org>
 <alpine.DEB.2.11.1705081059580.6882@lnxricardw1>
 <7ee84982-cfad-94d7-4e22-4edbeb852b32@redhat.com>
 <1494238390.6528.42.camel@infradead.org>
 <20170508135005.0b9b200b@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20170508135005.0b9b200b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-05-08 13:50:05, Boris Brezillon wrote:
> On Mon, 08 May 2017 11:13:10 +0100
> David Woodhouse <dwmw2@infradead.org> wrote:
>=20
> > On Mon, 2017-05-08 at 11:09 +0200, Hans de Goede wrote:
> > > You're forgetting that the SSD itself (this thread is about SSDs) als=
o has
> > > a major software component which is doing housekeeping all the time, =
so even
> > > if the main CPU gets reset the SSD's controller may still happily be =
erasing
> > > blocks. =20
> >=20
> > We're not really talking about SSDs at all any more; we're talking
> > about real flash with real maintainable software.
>=20
> It's probably a good sign that this new discussion should take place in
> a different thread :-).

Well, you are right.. and I'm responsible.

What I was trying to point out was that storage people try to treat
SSDs as HDDs... and SSDs are very different. Harddrives mostly survive
powerfails (with emergency parking), while it is very, very difficult
to make SSD survive random powerfail, and we have to make sure we
always powerdown SSDs "cleanly".

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkQoCkACgkQMOfwapXb+vKUxACgvaFGVpYm4SwEgpV8cRSEY3kt
NLYAniGZ+Jky3DyZZkKKuDQmD//Q3VYN
=RNt1
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
