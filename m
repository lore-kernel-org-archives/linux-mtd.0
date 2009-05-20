Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6mRq-0001pK-KH
	for linux-mtd@lists.infradead.org; Wed, 20 May 2009 14:07:17 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Date: Wed, 20 May 2009 09:06:09 -0500
Subject: RE: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C01138180CF@dlee02.ent.ti.com>
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
	<4A11F5FC.40709@boundarydevices.com>
In-Reply-To: <4A11F5FC.40709@boundarydevices.com>
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

Troy,

Thank you for reviewing these patches.

> -----Original Message-----
> From: Troy Kisky [mailto:troy.kisky@boundarydevices.com]
> Sent: Monday, May 18, 2009 7:58 PM
> To: Narnakaje, Snehaprabha
> Cc: linux-mtd@lists.infradead.org; davinci-linux-open-
> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
> akpm@linux-foundation.org
> Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
> page NAND chips
>=20
> nsnehaprabha@ti.com wrote:
> > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> >
> > This patch adds 4-bit ECC support for large page NAND chips using the
> new ECC
> > mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has
> been
> > adjusted to use this mode.
> >
> > The patches have been verified on DM355 device with 2K Micron devices
> using
> > mtd-tests and JFFS2. Error correction upto 4-bits has also been verifie=
d
> using
> > nandwrite/nanddump utilities.
> >
> > Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
> > Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> > ---
> >  drivers/mtd/nand/davinci_nand.c |   37 +++++++++++++++++++++++++++++++=
-
> -----
> >  1 files changed, 31 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/davinci_nand.c
> b/drivers/mtd/nand/davinci_nand.c
> > index ba6940d..4557b8d 100644
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -500,6 +500,24 @@ static struct nand_ecclayout hwecc4_small
> __initconst =3D {
> >  	},
> >  };
> >
> > +/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash=
,
> > + * storing ten ECC bytes plus the manufacturer's bad block marker byte=
,
> > + * and not overlapping the default BBT markers.
> > + */
> > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > +	.eccbytes =3D 40,
> > +	.eccpos =3D { 0, 1, 2, 3, 4,
> > +		/* offset 5 holds the badblock marker */
>=20
> I don't see any bad block overrides to move it from bytes 0,1
> to byte 5 in this patch. What am I missing?

We are making sure we are not overwriting offset 5, that holds the badblock=
 marker from nand manufacturer. Thus offset 5 is skipped in the eccpos.

>=20
>=20
> > +		6, 7, 8, 9, 10,	11, 12, 13, 14, 15,
> > +		/* 8 bytes at offset 16 hold JFFS2 clean markers */
> > +		24, 25, 26, 27, 28,
> > +		29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
> > +		39, 40, 41, 42, 43, 44, 45, 46, 47, 48, },
> > +	.oobfree =3D {
> > +		{.offset =3D 16, .length =3D 8, },
> > +		{.offset =3D 49, },
> > +	},
> > +};
> >
> >  static int __init nand_davinci_probe(struct platform_device *pdev)
> >  {
> > @@ -689,15 +707,22 @@ static int __init nand_davinci_probe(struct
> platform_device *pdev)
> >  				info->mtd.oobsize - 16;
> >  			goto syndrome_done;
> >  		}
> > +		if (chunks =3D=3D 4) {
> > +			info->ecclayout =3D hwecc4_2048;
> > +			info->ecclayout.oobfree[1].length =3D
> > +				info->mtd.oobsize - 49;
>=20
> - info->ecclayout.oobfree[1].offset instead of 49 would look better.
> or move the .offset =3D 49 here too.

OK, info->ecclayout.oobfree[1].offset can be used. I would like to keep the=
 .offset =3D 49 in the nand_ecclayout structure, so that it relates to the =
eccpos.

Thanks
Sneha

>=20
> > +			info->chip.ecc.mode =3D NAND_ECC_HW_OOB_FIRST;
> > +			goto syndrome_done;
> > +		}
> >
> > -		/* For large page chips we'll be wanting to use a
> > -		 * not-yet-implemented mode that reads OOB data
> > -		 * before reading the body of the page, to avoid
> > -		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
> > -		 * (and preserve manufacturer badblock markings).
> > +		/* 4K page chips are not yet supported. The eccpos from
> > +		 * nand_ecclayout cannot hold 80bytes and change to eccpos[]
> > +		 * breaks userspace ioctl interface with mtd-utils. Once we
> > +		 * resolve this issue, NAND_ECC_HW_OOB_FIRST mode can be used
> > +		 * for the 4K page chips.
> >  		 */
> >  		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
> > -				"for large page NAND\n");
> > +				"for 4K page NAND\n");
> >  		ret =3D -EIO;
> >  		goto err_scan;
> >
>=20
