Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krpw3-0007jW-59
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:16:19 +0000
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m9K8GFC0017355 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 01:16:16 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id m9K8GDQS016665
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 03:16:14 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 16:16:12 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F505187166DE0@zch01exm21.fsl.freescale.net>
In-Reply-To: <1224489768.6770.1527.camel@macbook.infradead.org>
References: <200810191535.05617.david-b@pacbell.net>
	<1224488403.6770.1517.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DB8@zch01exm21.fsl.freescale.net>
	<1224488640.6770.1524.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DCB@zch01exm21.fsl.freescale.net>
	<1224489768.6770.1527.camel@macbook.infradead.org>
From: "Chen Gong-B11801" <G.Chen@freescale.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org
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
> Sent: 2008?10?20? 16:03
> To: Chen Gong-B11801
> Cc: David Brownell; linux-mtd@lists.infradead.org
> Subject: RE: goofy mtd m25p80 patches in GIT ...
>=20
> On Mon, 2008-10-20 at 15:56 +0800, Chen Gong-B11801 wrote:
> > I'm not sure whether I catch your word. Frankly I agree=20
> that we need a
> > chip-erase command but in fact current MTD doesn't support=20
> this kind of interface
> > (only one erase interface), so I can't give you a new patch :-(
>=20
> I think the interface is fine -- if you ask it to erase the whole chip
> (start =3D=3D 0, len =3D=3D size), then it'll use a chip erase=20
> command if it has
> one, or fall back to erasing individual blocks.
>=20
> I think David just wanted a cleanup to the nomenclature -- renaming
> 'erase_block' to 'erase_chip', perhaps, and changing the=20
> #define for the
> command?

I prefer to the first opinion -- renaming 'erase_block' to 'erase_chip',
it looks
more straightforward
