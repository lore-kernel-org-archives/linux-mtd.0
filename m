Received: from de01egw02.freescale.net ([192.88.165.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KfUY0-0003qx-Da
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 07:00:28 +0000
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw02.freescale.net (8.12.11/de01egw02) with ESMTP id
	m8G70PRr011238 for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 00:00:25 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id m8G70NjW016115
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 02:00:24 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V2] [MTD] m25p80.c extended jedec support
Date: Tue, 16 Sep 2008 15:00:21 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F5051870D29CB@zch01exm21.fsl.freescale.net>
In-Reply-To: <1221547914.3106.56.camel@macbook.infradead.org>
References: <1221545652-2280-1-git-send-email-g.chen@freescale.com>
	<1221546997.3106.54.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F5051870D29BB@zch01exm21.fsl.freescale.net>
	<1221547914.3106.56.camel@macbook.infradead.org>
From: "Chen Gong-B11801" <G.Chen@freescale.com>
To: "David Woodhouse" <dwmw2@infradead.org>
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
> Sent: 2008?9?16? 14:52
> To: Chen Gong-B11801
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: [PATCH V2] [MTD] m25p80.c extended jedec support
>=20
> On Tue, 2008-09-16 at 14:41 +0800, Chen Gong-B11801 wrote:
> > you mean I should create a patch based that tree, not=20
> torvalds's tree,
> > right ?
>=20
> Yes, please.

sure, but becuase I can't use git protocol in the company and the http
looks can't work either, which reports=20
"error: Could not interpret response from server '<?xml version=3D"1.0"
encoding=3D"utf-8"?>".
I will have this work done when I go back home :-)
>=20
> > >=20
> > > What happens if you call spi_write_then_read(spi, x, x, x, 5) on a
> > > device which is only expecting to return 3 bytes. Does=20
> the call return
> > > failure? Or just pad to 5 bytes with zeroes?
> >=20
> > frankly, I'm not sure to much, but from the datasheet I'v=20
> read, if CS#
> > doesn't be pulled high, it should can read zero or=20
> Hi-Z(maybe some mess data)
>=20
> I would like to be sure that we're not going to break on older chips.
>=20
> --=20
> dwmw2
>=20
>=20
