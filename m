Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P42Sa-0006m5-RP
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 02:13:26 +0000
Received: from mail12-db3 (localhost.localdomain [127.0.0.1])	by
	mail12-db3-R.bigfish.com (Postfix) with ESMTP id 04EC01A70521	for
	<linux-mtd@lists.infradead.org>; Fri,  8 Oct 2010 02:13:22 +0000 (UTC)
Received: from DB3EHSMHS001.bigfish.com (unknown [10.3.81.249])	by
	mail12-db3.bigfish.com (Postfix) with ESMTP id 890AC1118053	for
	<linux-mtd@lists.infradead.org>; Fri,  8 Oct 2010 02:13:21 +0000 (UTC)
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o982D1Yb013090	for
	<linux-mtd@lists.infradead.org>; Thu, 7 Oct 2010 19:13:02 -0700 (MST)
Received: from zmy16exm20.fsl.freescale.net (zmy16exm20.ap.freescale.net
	[10.211.3.23])	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id
	o982T19R018874	for <linux-mtd@lists.infradead.org>;
	Thu, 7 Oct 2010 21:29:02 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH v3 6/7] mtd: m25p80: add a read function to read page by
	page
Date: Fri, 8 Oct 2010 10:13:08 +0800
Message-ID: <73839B4A0818E747864426270AC332C3057F6134@zmy16exm20.fsl.freescale.net>
In-Reply-To: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
References: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
From: Hu Mingkai-B21284 <B21284@freescale.com>
To: David Brownell <david-b@pacbell.net>, <linuxppc-dev@ozlabs.org>,
	<spi-devel-general@lists.sourceforge.net>, <linux-mtd@lists.infradead.org>
Cc: Gala Kumar-B11780 <B11780@freescale.com>,
	Zang Roy-R61911 <R61911@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Thursday, September 30, 2010 6:46 PM
> To: linuxppc-dev@ozlabs.org; spi-devel-general@lists.sourceforge.net; =
linux-
> mtd@lists.infradead.org; Hu Mingkai-B21284
> Cc: Gala Kumar-B11780; Zang Roy-R61911; Hu Mingkai-B21284
> Subject: Re: [PATCH v3 6/7] mtd: m25p80: add a read function to read =
page by
> page
>=20
>=20
> --- On Thu, 9/30/10, Mingkai Hu <Mingkai.hu@freescale.com> wrote:
>=20
> > From: Mingkai Hu <Mingkai.hu@freescale.com>
> > Subject: [PATCH v3 6/7] mtd: m25p80: add a read function to read =
page
> > by page
>=20
> NAK.
>=20
> We went over this before.
>=20
> =A0 The bug is in your SPI master controller driver, and the fix there =
involves
> mapping large reads  into multiple smaller reads.=A0 (Example, 128K =
read as two
> 64K reads instead of one of 128K.
>=20
> It's *NEVER* appropriate to commit to patching all upper level drivers =
in order
> to work around bugs in lower level ones.=A0 The set of such upper =
level drivers
> that may need bugfixing is quite large, most will never be used with =
your buggy
> controller driver, and all such patches will need testing (but the =
test
> resources are probably not available).
>=20
> Whatever SPI controller driver you're working with is clearly buggy =
... but not
> unfixably so.
>=20
> DO NOT head down the path of requiring every SPI device driver to =
include
> workarounds for this odd little SPI master driver bug.
>=20
> - Dave
>=20

Thanks for your comments, the controller driver is the proper place to =
handle this, I'll fix it.

Thanks,
Mingkai
