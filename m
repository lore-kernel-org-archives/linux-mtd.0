Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1VUW-00055F-NY
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 10:08:43 +0000
Date: Fri, 21 Apr 2017 12:08:13 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dipen.Dudhat@freescale.com
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170421100813.GA4332@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
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


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

(Added driver author to the cc list, maybe he can help).

> > Hi!
> >=20
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

Ok, took a look. __iomem is part of a problem, another part is that
nand_check_erased_ecc_chunk() needs to actually write back 0xff's to
undo the corruption, which would probably be bad idea to do in the
iomem, and next one is that blank actually checks arbitrary number of
regions, based on ecc.layout.

So this could be used to simplify the code (if nand_check_erased_buf
was exported; it is not), but it does not fix the problem as we still
need to undo the corruption.

Hints welcome, especially if you know right place where to put this
checking.

(BTW, switching to ecc.mode =3D ECC_SOFT will cause compatibility
problems but should make the problem go away, right?)=20

Thanks,
								Pavel

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nan=
d.c
index d1570f5..df02d4c 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -181,17 +181,15 @@ static int is_blank(struct mtd_info *mtd, unsigned in=
t bufnum)
 	struct mtd_oob_region oobregion =3D { };
 	int i, section =3D 0;
=20
-	for (i =3D 0; i < mtd->writesize / 4; i++) {
-		if (__raw_readl(&mainarea[i]) !=3D 0xffffffff)
-			return 0;
-	}
+	i =3D nand_check_erased_buf(&mainarea[i], mtd->writesize, 0);
+	if (i)
+		return 0;
=20
 	mtd_ooblayout_ecc(mtd, section++, &oobregion);
 	while (oobregion.length) {
-		for (i =3D 0; i < oobregion.length; i++) {
-			if (__raw_readb(&oob[oobregion.offset + i]) !=3D 0xff)
-				return 0;
-		}
+		i =3D nand_check_erased_buf(&oob[oobregion.offset], oobregion.length, 0);
+		if (i)
+			return 0;
=20
 		mtd_ooblayout_ecc(mtd, section++, &oobregion);
 	}




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj52g0ACgkQMOfwapXb+vIbeQCfdOaNXhc080ko5wRDGc0NKqD+
vI8An0nMFMyH1gIfD9ndxYTGYkGFx7IL
=UPnL
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
