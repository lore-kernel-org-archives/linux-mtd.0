Received: from de01egw01.freescale.net ([192.88.165.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrpPX-00028b-Qf
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 07:42:44 +0000
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m9K7gdRG027902 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 00:42:39 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id m9K7gbSG014901
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 02:42:38 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 15:42:34 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F505187166DB8@zch01exm21.fsl.freescale.net>
In-Reply-To: <1224488403.6770.1517.camel@macbook.infradead.org>
References: <200810191535.05617.david-b@pacbell.net>
	<1224488403.6770.1517.camel@macbook.infradead.org>
From: "Chen Gong-B11801" <G.Chen@freescale.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"David Brownell" <david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]=20
> Sent: 2008?10?20? 15:40
> To: David Brownell
> Cc: Chen Gong-B11801; linux-mtd@lists.infradead.org
> Subject: Re: goofy mtd m25p80 patches in GIT ...
>=20
> On Sun, 2008-10-19 at 15:35 -0700, David Brownell wrote:
> > [resend cc'ing linux-mtd, sorry]
> >=20
> > I noticed a couple goofy patches in MTD GIT, while poking around
> > wondering what happened to some patches that I expected would
> > already have gotten upstream.  Details below.
>=20
> Did you find the patches you expected to be going upstream?
>=20
> > First:
> >=20
> > =20
> http://git.kernel.org/?p=3Dlinux/kernel/git/dwmw2/mtd-2.6.git;a=3D
> commitdiff;h=3Dfaff37508a104e9ec5285d5adecaab7e8dde472a
> >=20
> > That patch is goofy because the command in question is *NOT* a block
> > erase command.  It's a chip-erase command ... entirely unlike the
> > existing *real* block erase commands used in the driver.
> >=20
> > Could we get a fix that provides the correct name for the=20
> operations?
> > Having real block commands, and this new thing, is at the very least
> > confusing...
>=20
> Makes sense. Chen Gong?

I agree with you.

>=20
> >=20
> > Second:
> >=20
> > =20
> http://git.kernel.org/?p=3Dlinux/kernel/git/dwmw2/mtd-2.6.git;a=3D
> commitdiff;h=3D75d0ee2202b5740e94e913d8a52f91c6557c4c81
> >=20
> > That's just plain wrong ... the original code is correct, but the
> > patch changed it to be incorrect.  (DMA from the stack is never
> > legal.)
>=20
> Ah, so spi_write() uses DMA, but spi_write_then_read() does not?=20
> Not entirely intuitive :)
>=20
> --=20
> David Woodhouse                            Open Source=20
> Technology Centre
> David.Woodhouse@intel.com                              Intel=20
> Corporation
>=20
>=20
