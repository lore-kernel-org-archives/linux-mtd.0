Received: from mta.songnetworks.no ([62.73.241.56] helo=mta.tdcsong.no)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUlXl-00054r-9i
	for linux-mtd@lists.infradead.org; Sun, 17 Aug 2008 16:55:53 +0000
Received: from wpr01.wprmedical.local (unknown [80.239.107.60])
	by mta.tdcsong.no (Postfix) with ESMTP id 25DBA4018
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Aug 2008 18:55:51 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: SV: SV: SV: SV: Jffs2 crach in 2.6.25.6.atmel.1
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Date: Sun, 17 Aug 2008 18:59:40 +0200
Message-ID: <6B5648EA2E2C2D42AF2FF7691522AD92417C8F@wpr01.wprmedical.local>
In-Reply-To: <1218992056.3184.321.camel@pmac.infradead.org>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
	<1218877876.3184.185.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
	<1218979060.3184.291.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8E@wpr01.wprmedical.local>
	<1218992056.3184.321.camel@pmac.infradead.org>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Opprinnelig melding-----
> Fra: David Woodhouse [mailto:dwmw2@infradead.org]
> Sendt: 17. august 2008 18:54
> Til: Eirik Aanonsen
> Kopi: Haavard Skinnemoen; linux-mtd@lists.infradead.org;
kernel@avr32linux.org
> Emne: Re: SV: SV: SV: Jffs2 crach in 2.6.25.6.atmel.1
>=20
> On Sun, 2008-08-17 at 18:50 +0200, Eirik Aanonsen wrote:
> > After checking a little more it seems like the error only occurs
when I
> > have the ubi module loaded.
> > I load the modules with modporbe ubi mtd=3D5 (mtd5 is a 2GB nand =
flash
)
> >
> > I'am starting to suspect a memory leak that could be related to the
ubi.
>=20
> Do you have slab debugging enabled?
>=20
> --
> David Woodhouse                            Open Source Technology
Centre
> David.Woodhouse@intel.com                              Intel
Corporation
>=20
>=20

I have :
CONFIG_SLUB_DEBUG=3Dy
# CONFIG_SLAB is not set
CONFIG_SLUB=3Dy
# CONFIG_SLOB is not set
____________________________________________________
=20
Eirik Aanonsen
SW Developer
E-mail: eaa@wprmedical.com=20
Phone: +47 90 68 11 92
Fax: +47 37 03 56 77
____________________________________________________
