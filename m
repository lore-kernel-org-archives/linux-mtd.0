Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M27xK-0000HW-4D
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 18:04:32 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>
Date: Thu, 7 May 2009 13:02:50 -0500
Subject: RE: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page
	NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C0112FC7082@dlee02.ent.ti.com>
References: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
	<200905070016.52356.david-b@pacbell.net>
	<7A436F7769CA33409C6B44B358BFFF0C0112FC6CF5@dlee02.ent.ti.com>
	<200905071011.06812.david-b@pacbell.net>
In-Reply-To: <200905071011.06812.david-b@pacbell.net>
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



> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Thursday, May 07, 2009 1:11 PM
> To: Narnakaje, Snehaprabha
> Cc: davinci-linux-open-source@linux.davincidsp.com; linux-
> mtd@lists.infradead.org; dwmw2@infradead.org; tglx@linutronix.de;
> akpm@linux-foundation.org
> Subject: Re: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large
> page NAND chips
>=20
> On Thursday 07 May 2009, Narnakaje, Snehaprabha wrote:
>=20
> > > I'm glad to see this patch is so small ... basically, just
> > > adding a special case for 2K pages, and keeping the core of
> > > this NAND driver the same.  Not needing to change the 4-bit
> > > ECC support from the patch I sent earlier seems a good sign.
> >
> > Yes, I had to use the .calculate in the new read_page handler
> > to stop the ECC though.
>=20
> Oh, now I see what you were talking about off-list.  That
> doesn't seem quite right.  I'll take a look.

Looks like you had to implement is_readmode option in the .calculate functi=
on, to use the NAND_ECC_HW mode for small pages. The read_page handler for =
NAND_ECC_HW calls the .calculate function, and in our case we shouldn't be =
doing anything here for read. We use the .calculate function from write_pag=
e.

>=20
>=20
> > > Two comments though:  (a) the board-dm355-evm.c file isn't
> > > yet in mainline, so the MTD folk can't take this patch as-is;
> >
> > Sorry, I didn't realize this. I will separate the board-dm355-evm.c
> > from this patch and submit the patch #3 for board-dm355-evm.c to go
> > to davinci-linux-open-source.
>=20
> Let's wait until we see the previous davinci_nand.c patches get
> queued up somewhere "official" though ... in fact, I don't see
> why they shouldn't merge for 2.6.30-soon.

I was hoping my patch (dependent on your patch set) would at least trigger =
the review/acceptance :-)

>=20
>=20
> > > (b) as noted elsewhere, there are still issues with 4K pages
> > > and the NAND core infrastructure.
> >
> > Yes, this is still an issue, if we make the read_page handler
> > use .eccpos[] for positioning the ECC bytes in the OOB area.
> > If we had fixed prepad+ecc nand_ecclayout we would avoid using
> > eccpos[] (This is what my initial set of 4-bit ECC patches did
> > to support 4K). But this is not a generic solution.
> >
> > The main problem is with nand_ooblayout structure that is not
> > extendable for large pages 4K or more, without breaking the
> > userspace IOCTLs that is dependent on the size of this structure.
> >
> > Question to linux-mtd list: Are there plans in the linux-mtd to
> > address this generic issue, now that NAND manufacturers are
> > coming up NAND chips > 4K page size?
>=20
> They've been doing it for a while now, actually.  :)
>=20
> And it wouldn't be an issue here ... *IF* this 4-bit ECC didn't
> need to use 80 bytes (8 chunks of 512 bytes, 10 bytes ECC per
> chunk) from a 64 byte field.  Doesn't fit.
>=20
> Maybe the ecclayout stuff should migrate to sysfs, and just
> drop the old ioctl stuff for parts that can't use it ... as
> is being done to support chips that are 4 GByte and bigger.

I will explore more on this option.

>=20
>=20
> > > > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > > > +=A0=A0=A0=A0=A0=A0=A0.eccbytes =3D 10,
> > >
> > > Not ".eccbytes =3D 40"?  This is 4 chunks, 10 ecc bytes each...
> >
> > No, .eccbytes is for each chips->ecc.steps.
>=20
> So it's the same as ecc.bytes, which is not exported to userspace.
>=20
>=20
> > And all nand read/write
> > APIs, we handle ecc.steps (for loop). There is chips->ecc.total that
> > is initialized as (chips->ecc.steps * chips->ecc.bytes).
> >
> > It is strange that .eccbytes is for each chunk, while eccpos[] and
> > .oobfree[] have to handle/cover all chunks.
>=20
> Also strange:  when ECC_HW_SYNDROME is in use, nothing even
> looks at the nand_ecclayout to make sure it matches the actual
> layout being used ... which derives entirely from the prepad,
> postpad, and bytes fields of "ecc".  (Except that some of the
> OOB bytes not used for ECC may be hidden, e.g. manufacturer
> bad block markers are usually not listed.)

If you leave enough prepad to cover manufacturer's BB and JFFS2 markers, th=
is mechanism was OK, I guess.

Thanks
Sneha

>=20
> - Dave
>=20
>=20
>=20
