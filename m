Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KfUG5-00017E-MM
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 06:42:01 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m8G6fbG1025513 for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2008 23:41:50 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id m8G6faio014963
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 01:41:36 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V2] [MTD] m25p80.c extended jedec support
Date: Tue, 16 Sep 2008 14:41:35 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F5051870D29BB@zch01exm21.fsl.freescale.net>
In-Reply-To: <1221546997.3106.54.camel@macbook.infradead.org>
References: <1221545652-2280-1-git-send-email-g.chen@freescale.com>
	<1221546997.3106.54.camel@macbook.infradead.org>
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
> Sent: 2008?9?16? 14:37
> To: Chen Gong-B11801
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH V2] [MTD] m25p80.c extended jedec support
>=20
> On Tue, 2008-09-16 at 14:14 +0800, Chen Gong wrote:
> > BTW, dave, I don't find any other fixes in this file=20
> recently. What do
> > you mean something has been there in the git tree, which git tree ?
>=20
> http:// or git:// git.infradead.org/mtd-2.6.git
>=20
> Most of your patch is already there (and thus also in linux-next).
> Please could we have an incremental patch?

you mean I should create a patch based that tree, not torvalds's tree,
right ?

>=20
> What happens if you call spi_write_then_read(spi, x, x, x, 5) on a
> device which is only expecting to return 3 bytes. Does the call return
> failure? Or just pad to 5 bytes with zeroes?

frankly, I'm not sure to much, but from the datasheet I'v read, if CS#
doesn't
be pulled high, it should can read zero or Hi-Z(maybe some mess data)

>=20
> --=20
> David Woodhouse                            Open Source=20
> Technology Centre
> David.Woodhouse@intel.com                              Intel=20
> Corporation
>=20
>=20
