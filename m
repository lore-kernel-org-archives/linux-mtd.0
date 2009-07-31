Received: from smtp3.netcologne.de ([194.8.194.66])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWyWW-0003xJ-8e
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 20:16:20 +0000
Date: Fri, 31 Jul 2009 21:47:10 +0200
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de> (from
	w.sang@pengutronix.de on Fri Jul 17 14:39:23 2009)
Message-Id: <1249069643.3687.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-6wC/KUIJ0WEPnkpS4mA1"
Cc: devicetree-discuss@ozlabs.org, Vitaly Wool <vwool@ru.mvista.com>,
	Artem Bityutskiy <dedekind@infradead.org>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ken MacLeod <ken@bitsko.slc.ut.us>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-6wC/KUIJ0WEPnkpS4mA1
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 17.07.09 14:39 schrieb(en) Wolfram Sang:
> Use physmap_of to access RAMs as mtd and add documenation for it. =20
> This approach is a lot less intrusive as adding an of-wrapper around =20
> plat-ram.c. As most extensions of plat-ram.c (e.g. custom =20
> map-functions) can't be mapped to the device tree anyhow, extending =20
> physmap_of seems to be the cleanest approach.

The patch works nicely on a custom (roughly Icecube) based 5200B board, =20
with a Renesas static ram, no partitions and a jffs2 file system on =20
it.  I had to add some more tweaks to physmap_of.c as to work around =20
the 5200's limitations accessing chips in 16-bit mode through the local =20
bus, which is a lot easier and cleaner with this patch than with the =20
old one (of 05 June 09).

Acked-by: Albrecht Dre=DF <albrecht.dress@arcor.de>

--=-6wC/KUIJ0WEPnkpS4mA1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKc0pLn/9unNAn/9ERAndaAJ46tL+3fxURYv2K1m+v4Z9UJ00B2QCcCv19
sk5JUodhOC7jIvauB43/ImU=
=kGsX
-----END PGP SIGNATURE-----

--=-6wC/KUIJ0WEPnkpS4mA1--
