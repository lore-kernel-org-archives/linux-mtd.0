Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qc99c-0001g5-7V
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 04:47:05 +0000
Date: Thu, 30 Jun 2011 06:46:55 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC controller
	driver
Message-ID: <20110630044655.GA19841@pengutronix.de>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110629100658.GE1992@pengutronix.de>
	<20110629103337.GF1992@pengutronix.de>
	<4E0B0296.6060902@freescale.com>
	<20110629122942.GH1992@pengutronix.de>
	<20110629140038.GB25931@S2100-06.ap.freescale.net>
	<20110629141557.GK1992@pengutronix.de>
	<20110629143701.GC25931@S2100-06.ap.freescale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20110629143701.GC25931@S2100-06.ap.freescale.net>
Cc: dedekind1@gmail.com, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

> > > I would suggest leave this gpmi specific quirk to gpmi driver to sort
> > > out.  With the following mxs-dma change, it should work if gpmi driver
> > > can pass the valid gpmi irq number for only one gpmi channel, and -1
> > > for all others.
> >=20
> > ...which brings us right into the 'NO_IRQ is 0' discussion :)
> >=20
> Though I do not know what it means exactly, number 0 is an valid IRQ
> on both mx23 and mx28 (see mx23.h and mx28.h).

It could be remapped. It is a looong story. Start here if you are intereste=
d:

http://lkml.org/lkml/2005/11/21/221
http://yarchive.net/comp/linux/no_irq.html

Currently, it's a can of worms. Hopefully, irq_desc might help somewhen.

> > Other than that, [thinking loud] this will help if all irq-sharing
> > channels are handled by the same driver. If not, we would just add
> > IRQF_SHARED (hopefully this will never be needed). Yup, sounds
> > reasonable to me. Will give it a second thought later, though.
> >=20
> GPMI is the only mxs-dma user that gets irq-sharing.  So yes, all
> irq-sharing channels are handled by the same driver, gpmi-nfc :)

Currently, yes. But we have to make it future-proof.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk4L/78ACgkQD27XaX1/VRskowCdE4K8m4rGxV/YzaHVZhaa5Rl5
tF0AnRUK25MMh7+zyihYk5M36+ImUmet
=sdBp
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
