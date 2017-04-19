Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0xst-0005ZZ-6o
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 22:15:37 +0000
Date: Thu, 20 Apr 2017 00:15:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170419221507.GA24914@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <20170419231804.5a04ed69@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > We have some problems with fsl_ifc_nand ... in the old kernels, but
> > this one does not seem to be fixed in v4.11, either.
> >=20
> > UBIFS complains:
> >=20
> > UBIFS error (pid 931): ubifs_scan: corrupt empty space at LEB 282:252630
> > UBIFS error (pid 931): ubifs_scanned_corruption: corruption at LEB 282:=
252630
> > UBIFS error (pid 931): ubifs_scanned_corruption: first 1322 bytes from =
LEB 282:252630
> > UBIFS error (pid 931): ubifs_scan: LEB 282 scanning failed
> >=20
> > Possible explanation is here:
> >=20
> > https://e2e.ti.com/support/dsp/davinci_digital_media_processors/f/716/t=
/289605
> >=20
> > # I see on the forum that this issue has been raised before - my
> > # understanding is that the omap2 nand driver does not perform ECC
> > # detection/correction on empty pages so when UBIFS checks the empty
> > # space data and doesn't read all 0xFF then it fails and mounts
> > # read-only. I didn't find any good solution - only a workaround to
> > # remove the UBIFS check..
> >=20
> > So I checked fsl_ifc_nand.c in v4.11-rc, and yes, it seems to have the
> > same problem:
> >=20
> > 			if (errors =3D=3D 15) {
> > 	                        /*
> >                                  * Uncorrectable error.
> >                                  * OK only if the whole page is blank.
> >                                  *
> >                                  * We disable ECCER reporting due to...
> >                                  * erratum IFC-A002770 -- so report it =
now if we
> >                                  * see an uncorrectable error in ECCSTA=
T.
> >                                  */
> >                                 if (!is_blank(mtd, bufnum))
> >                                         ctrl->nand_stat |=3D
> >                                                 IFC_NAND_EVTER_STAT_ECC=
ER;
> >                                 break;
> >                         }
> >=20
> > is_blank() checks for all 0xff's, so single-bit 0xfe in the data will
> > result in_blank() =3D=3D 0 and uncorrectable error being signaled.
> >=20
> > Should the driver be modified somehow?
>=20
> Yep, nand_check_erased_ecc_chunk() [1] is here to help you check this
> case, unfortunately, it's not directly applicable here, because this
> function takes regular pointers and not __iomem ones. You'll either
> have to copy the data in an intermediate buffer before calling
> nand_check_erased_ecc_chunk(), or cast the SRAM region to a void
> pointer (which is usually not a good idea). The last option would be to
> open code nand_check_erased_ecc_chunk(), but I'd really like to avoid
> that (for maintainability concerns).

Ok, thanks a lot for the pointer, that should be doable.

Core of the code is:

1357         for (; len >=3D sizeof(long);
1358              len -=3D sizeof(long), bitmap +=3D sizeof(long)) {
1359                 weight =3D hweight_long(*((unsigned long
*)bitmap));
1360                 bitflips +=3D BITS_PER_LONG - weight;
1361                 if (unlikely(bitflips > bitflips_threshold))
1362                         return -EBADMSG;
1363         }

Someone clearly optimized this code (took care to do long accesses
etc), but afaict hweight is quite a heavy operation:

_GLOBAL(__arch_hweight32)
BEGIN_FTR_SECTION
        b __sw_hweight32
        nop
        nop
        nop
        nop
	nop
	nop
FTR_SECTION_ELSE
  BEGIN_FTR_SECTION_NESTED(51)
	PPC_POPCNTB(R3,R3)
	srdi    r4,r3,16
        add     r3,r4,r3
        srdi    r4,r3,8
	add     r3,r4,r3
	clrldi  r3,r3,64-8
	blr
  FTR_SECTION_ELSE_NESTED(51)
	PPC_POPCNTW(R3,R3)
	clrldi  r3,r3,64-8
	blr
  ALT_FTR_SECTION_END_NESTED_IFCLR(CPU_FTR_POPCNTD, 51)
ALT_FTR_SECTION_END_IFCLR(CPU_FTR_POPCNTB)
EXPORT_SYMBOL(__arch_hweight32)

Would it make sense to only do hweight if *bitmap !=3D ~0ULL ? Would it
make sense to only check for bitflips > bitflips_threshold each 128
bytes or something like that?

Thanks and best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj34WsACgkQMOfwapXb+vKxRACdGnARVz+VVBgbmGziM9phtjZf
OtgAn0A6YtkriRuBZGEdzV2f76AcaKug
=SFNk
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
