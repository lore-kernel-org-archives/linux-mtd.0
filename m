Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M24NL-0001BC-Fu
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 14:15:10 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>
Date: Thu, 7 May 2009 09:13:24 -0500
Subject: RE: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
	<200905070016.52356.david-b@pacbell.net>
In-Reply-To: <200905070016.52356.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave,

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Thursday, May 07, 2009 3:17 AM
> To: Narnakaje, Snehaprabha
> Cc: davinci-linux-open-source@linux.davincidsp.com; linux-
> mtd@lists.infradead.org; dwmw2@infradead.org; tglx@linutronix.de;
> akpm@linux-foundation.org
> Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large
> page NAND chips
>=20
> I'm glad to see this patch is so small ... basically, just
> adding a special case for 2K pages, and keeping the core of
> this NAND driver the same.  Not needing to change the 4-bit
> ECC support from the patch I sent earlier seems a good sign.

Yes, I had to use the .calculate in the new read_page handler to stop the E=
CC though.

>=20
> Two comments though:  (a) the board-dm355-evm.c file isn't
> yet in mainline, so the MTD folk can't take this patch as-is;

Sorry, I didn't realize this. I will separate the board-dm355-evm.c from th=
is patch and submit the patch #3 for board-dm355-evm.c to go to davinci-lin=
ux-open-source.

> (b) as noted elsewhere, there are still issues with 4K pages
> and the NAND core infrastructure.

Yes, this is still an issue, if we make the read_page handler use .eccpos[]=
 for positioning the ECC bytes in the OOB area. If we had fixed prepad+ecc =
nand_ecclayout we would avoid using eccpos[] (This is what my initial set o=
f 4-bit ECC patches did to support 4K). But this is not a generic solution.

The main problem is with nand_ooblayout structure that is not extendable fo=
r large pages 4K or more, without breaking the userspace IOCTLs that is dep=
endent on the size of this structure.=20

Question to linux-mtd list: Are there plans in the linux-mtd to address thi=
s generic issue, now that NAND manufacturers are coming up NAND chips > 4K =
page size?

>=20
> This patch is sufficient to support development boards for
> the dm355, dm357, and dm365 ... right?  They all have 2 GByte
> NAND chips, ISTR with 2K pages, and haven't yet had to switch
> to more current parts with 4K pages.
>=20
>=20
> On Wednesday 06 May 2009, nsnehaprabha@ti.com wrote:
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -500,6 +500,21 @@ static struct nand_ecclayout hwecc4_small
> __initconst
> > =3D { },
> > =A0};
> >
> > +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash=
,
> > + * storing ten ECC bytes plus the manufacturer's bad block marker byte=
,
> > + * and not overlapping the default BBT markers.
> > + */
> > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > +=A0=A0=A0=A0=A0=A0=A0.eccbytes =3D 10,
>=20
> Not ".eccbytes =3D 40"?  This is 4 chunks, 10 ecc bytes each...

No, .eccbytes is for each chips->ecc.steps. And all nand read/write APIs, w=
e handle ecc.steps (for loop). There is chips->ecc.total that is initialize=
d as (chips->ecc.steps * chips->ecc.bytes).

It is strange that .eccbytes is for each chunk, while eccpos[] and .oobfree=
[] have to handle/cover all chunks.

>=20
>=20
> > +=A0=A0=A0=A0=A0=A0=A0.eccpos =3D { 0, 1, 2, 3, 4, 6, 7, 8, 9, 10,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A011, 12, 13, 14, 15, 24, 2=
5, 26, 27, 28,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A029, 30, 31, 32, 33, 34, 3=
5, 36, 37, 38,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A039, 40, 41, 42, 43, 44, 4=
5, 46, 47, 48, },
> > +=A0=A0=A0=A0=A0=A0=A0.oobfree =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{.offset =3D 16, .length =
=3D 8, },
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0{.offset =3D 49, },
>=20
> Comments would be good, highlighting (a) byte 5 is reserved,
> it's the manufacturer bad block marker, (b) 8 bytes @16 are
> expected by JFFS2.  Not everyone will "just know" those.

OK, will add in the next patch.

>=20
>=20
> > +=A0=A0=A0=A0=A0=A0=A0},
> > +};
> >
> > =A0static int __init nand_davinci_probe(struct platform_device *pdev)
> > =A0{
>=20
> > @@ -690,6 +705,13 @@ static int __init nand_davinci_probe(struct
> platform_device *pdev)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0info->mtd.oobsize - 16;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0goto syndrome_done;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (chunks =3D=3D 4) {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
nfo->ecclayout =3D hwecc4_2048;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
nfo->ecclayout.oobfree[1].length =3D
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0info->mtd.oobsize - 49;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0i=
nfo->chip.ecc.mode =3D NAND_ECC_HW_OOB_FIRST;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0g=
oto syndrome_done;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* For large page chips=
 we'll be wanting to use a
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * not-yet-implemented =
mode that reads OOB data
>=20
> You should update that comment ... that not-yet-implemented mode
> is now called "NAND_ECC_HW_OOB_FIRST", from patch 1/2 ... ;)

Yes, but will have a comment about 4K though.

Thanks
Sneha

>=20
