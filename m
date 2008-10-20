Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrpdG-0004AZ-6P
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 07:56:54 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m9K7upwO013172 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 00:56:51 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id m9K7unnY005096
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 02:56:50 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 15:56:46 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F505187166DCB@zch01exm21.fsl.freescale.net>
In-Reply-To: <1224488640.6770.1524.camel@macbook.infradead.org>
References: <200810191535.05617.david-b@pacbell.net>
	<1224488403.6770.1517.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DB8@zch01exm21.fsl.freescale.net>
	<1224488640.6770.1524.camel@macbook.infradead.org>
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
> Sent: 2008?10?20? 15:44
> To: Chen Gong-B11801
> Cc: David Brownell; linux-mtd@lists.infradead.org
> Subject: RE: goofy mtd m25p80 patches in GIT ...
>=20
> On Mon, 2008-10-20 at 15:42 +0800, Chen Gong-B11801 wrote:
> >=20
> > > > Could we get a fix that provides the correct name for the=20
> > > operations?
> > > > Having real block commands, and this new thing, is at=20
> the very least
> > > > confusing...
> > >=20
> > > Makes sense. Chen Gong?
> >=20
> > I agree with you.
>=20
> I was hoping for a response in 'diff -up' form... :)

I'm not sure whether I catch your word. Frankly I agree that we need a
chip-erase
command but in fact current MTD doesn't support this kind of interface
(only one erase interface),
so I can't give you a new patch :-(
