Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7iHZ-00078X-2j
	for linux-mtd@lists.infradead.org; Sat, 23 May 2009 03:52:31 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
Date: Fri, 22 May 2009 22:51:52 -0500
Subject: RE: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C01153456AA@dlee02.ent.ti.com>
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
	<200905201738.24479.david-b@pacbell.net>
In-Reply-To: <200905201738.24479.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I will be coming up with an updated patch for this (3/3) early next week to=
 address -
1. Corrections to eccpos[]
2. Comments from Troy

Thanks
Sneha

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Wednesday, May 20, 2009 8:38 PM
> To: davinci-linux-open-source@linux.davincidsp.com; Narnakaje, Snehaprabh=
a
> Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org;
> tglx@linutronix.de; akpm@linux-foundation.org
> Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
> page NAND chips
>=20
> Minor comment:  $SUBJECT should say it adds this "for DaVinci".  ;)
>=20
> To recap other discussion (I hope), this needs to be reissued since:
>=20
> On Monday 18 May 2009, nsnehaprabha@ti.com wrote:
> > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > +=A0=A0=A0=A0=A0=A0=A0.eccbytes =3D 40,
> > +=A0=A0=A0=A0=A0=A0=A0.eccpos =3D { 0, 1, 2, 3, 4,
>=20
> Byte 0 -- for 8-bit large-page parts which need this patch -- is
> the manufacturer bad block marker, and the idea was to *not* clobber
> it.  Those bytes need to be skipped.
>=20
> Will the 40 bytes of ECC data now be stored at offsets 24..63,
> matching Troy's patches?
>=20
> 	0..1	manufacturer badblock markers
> 	8..11	BBT marker ("free" oob data)
> 	16..23	JFFS2 stuff ("free" oob data)
> 	24..63	ECC data
>=20
> And for 4KB pages, it would be the same -- except that
> there would be 80 bytes of ECC data, from 48..127 (too
> much to fit into the eccpos array).
>=20
>=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* offset 5 holds the bad=
block marker */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A06, 7, 8, 9, 10,=A011, 12,=
 13, 14, 15,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* 8 bytes at offset 16 h=
old JFFS2 clean markers */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A024, 25, 26, 27, 28,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A029, 30, 31, 32, 33, 34, 3=
5, 36, 37, 38,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A039, 40, 41, 42, 43, 44, 4=
5, 46, 47, 48, },
> > +=A0=A0=A0=A0=A0=A0=A0.oobfree =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{.offset =3D 16, .length =
=3D 8, },
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{.offset =3D 49, },
> > +=A0=A0=A0=A0=A0=A0=A0},
> > +};
>=20
>=20
