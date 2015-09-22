Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeIdR-0002ve-Fb
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 08:09:10 +0000
Date: Tue, 22 Sep 2015 10:08:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [RESEND PATCH v3 5/5] mtd: nand: remove custom 'erased check'
 implementation
Message-ID: <20150922100837.0410c3f8@bbrezillon>
In-Reply-To: <20150921232832.GG31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-6-git-send-email-boris.brezillon@free-electrons.com>
 <20150921232832.GG31505@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, 21 Sep 2015 16:28:32 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> + others
>=20
> On Thu, Sep 03, 2015 at 06:03:42PM +0200, Boris Brezillon wrote:
> > Some drivers are manually checking for 'erased pages' while correcting
> > ECC bytes.
> > This logic is now done by the core infrastructure, and can thus be remo=
ved
> > from those drivers.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/davinci_nand.c |  8 --------
> >  drivers/mtd/nand/diskonchip.c   | 32 ++------------------------------
> >  drivers/mtd/nand/jz4740_nand.c  | 18 ------------------
> >  3 files changed, 2 insertions(+), 56 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci=
_nand.c
> > index 816ef53..0d6adbe 100644
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -316,14 +316,6 @@ static int nand_davinci_correct_4bit(struct mtd_in=
fo *mtd,
> >  	unsigned num_errors, corrected;
> >  	unsigned long timeo;
> > =20
> > -	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
> > -	for (i =3D 0; i < 10; i++) {
> > -		if (ecc_code[i] !=3D 0xff)
> > -			goto compare;
> > -	}
> > -	return 0;
> > -
> > -compare:
> >  	/* Unpack ten bytes into eight 10 bit values.  We know we're
> >  	 * little-endian, and use type punning for less shifting/masking.
> >  	 */
> > diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchi=
p.c
> > index 7da266a..eb65769 100644
> > --- a/drivers/mtd/nand/diskonchip.c
> > +++ b/drivers/mtd/nand/diskonchip.c
> > @@ -936,37 +936,9 @@ static int doc200x_correct_data(struct mtd_info *m=
td, u_char *dat,
> >  				calc_ecc[i] =3D ReadDOC_(docptr, DoC_Mplus_ECCSyndrome0 + i);
> >  			else
> >  				calc_ecc[i] =3D ReadDOC_(docptr, DoC_ECCSyndrome0 + i);
> > -			if (calc_ecc[i] !=3D empty_read_syndrome[i])
> > -				emptymatch =3D 0;
> >  		}
> > -		/* If emptymatch=3D1, the read syndrome is consistent with an
> > -		   all-0xff data and stored ecc block.  Check the stored ecc. */
> > -		if (emptymatch) {
> > -			for (i =3D 0; i < 6; i++) {
> > -				if (read_ecc[i] =3D=3D 0xff)
> > -					continue;
> > -				emptymatch =3D 0;
> > -				break;
> > -			}
> > -		}
> > -		/* If emptymatch still =3D1, check the data block. */
> > -		if (emptymatch) {
> > -			/* Note: this somewhat expensive test should not be triggered
> > -			   often.  It could be optimized away by examining the data in
> > -			   the readbuf routine, and remembering the result. */
> > -			for (i =3D 0; i < 512; i++) {
> > -				if (dat[i] =3D=3D 0xff)
> > -					continue;
> > -				emptymatch =3D 0;
> > -				break;
> > -			}
> > -		}
> > -		/* If emptymatch still =3D1, this is almost certainly a freshly-
> > -		   erased block, in which case the ECC will not come out right.
> > -		   We'll suppress the error and tell the caller everything's
> > -		   OK.  Because it is. */
> > -		if (!emptymatch)
> > -			ret =3D doc_ecc_decode(rs_decoder, dat, calc_ecc);
> > +
> > +		ret =3D doc_ecc_decode(rs_decoder, dat, calc_ecc);
> >  		if (ret > 0)
> >  			printk(KERN_ERR "doc200x_correct_data corrected %d errors\n", ret);
> >  	}
>=20
> I see new warnings:
>=20
> drivers/mtd/nand/diskonchip.c: At top level:
> drivers/mtd/nand/diskonchip.c: In function =E2=80=98doc200x_correct_data=
=E2=80=99:
> drivers/mtd/nand/diskonchip.c:915:6: warning: unused variable =E2=80=98em=
ptymatch=E2=80=99 [-Wunused-variable]
>   int emptymatch =3D 1;
>       ^
> drivers/mtd/nand/diskonchip.c:79:15: warning: =E2=80=98empty_read_syndrom=
e=E2=80=99 defined but not used [-Wunused-variable]
>  static u_char empty_read_syndrome[6] =3D { 0x26, 0xff, 0x6d, 0x47, 0x73,=
 0x7a };
>                ^

Oops, I'll fix those warnings.

>=20
> I'd also like test results for these drivers before doing this. And I'm
> not sure how to find good testers for these drivers, even it users still
> exist.

Yep, the goal of this patch was to let people owning boards embedding
those chips test the changes.
If we don't get anyone to test it, maybe we should leave those drivers
unchanged at the expense of doing twice the test in case of bitflips in
erased pages or uncorrectable bitflips (which is really unlikely).

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
