Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O19Mk-0007MP-RA
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 02:27:15 +0000
Date: Mon, 12 Apr 2010 04:24:58 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
Message-ID: <20100412022458.GB3274@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <20100408091215.GD21805@pengutronix.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2010 at 11:12:15AM +0200, Wolfram Sang wrote:
> On Tue, Mar 30, 2010 at 03:35:13PM +0200, Guillaume LECERF wrote:
> > SST 39VF{16,32}xx chips use the 0x0701 command set, fully compatible
> > with the AMD one. This patch adds support for detecting them in CFI
> > mode.
> >=20
> > Based on a patch by Peter Turczaki [1].
> >=20
> > [1] http://www.mail-archive.com/uclinux-dev@uclinux.org/msg05737.html
> >=20
> > Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0002.c |   41 +++++++++++++++++++++++++++=
++++++++
> >  drivers/mtd/chips/gen_probe.c       |    1 +
> >  2 files changed, 42 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cf=
i_cmdset_0002.c
> > index de1b4ba..e3e4a94 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -256,6 +256,36 @@ static void fixup_use_atmel_lock(struct mtd_info *=
mtd, void *param)
> >  	mtd->flags |=3D MTD_POWERUP_LOCK;
> >  }
> > =20
> > +/** While reporting a mostly-correct CFI-Information block
> > +  * the eraseblock-region information is severely damaged in SST
> > +  * parts at least those of the 39VF{16,32,64}xxB series.
> > +  **/
>=20
> Kernel mulit line comments, please.
>=20
> > +static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
> > +{
> > +	struct map_info *map =3D mtd->priv;
> > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > +
> > +	/** Although the part claims to have two eraseblock-regions
> > +	  * these refer to the same region within the flash-array.
> > +	  * Because a really CFI-Compliant part may only return
>=20
> s/Compliant/compliant/?
>=20
> > +	  * one eraseblock-length per physical memory region
> > +	  * we pretend the part said it had just one region ;)
> > +	  **/
> > +	cfi->cfiq->NumEraseRegions =3D 1;
> > +	cfi->cfiq->EraseRegionInfo[0] =3D cfi->cfiq->EraseRegionInfo[1];
>=20
> Why is this last line needed? The comment says they are the same?

Okay, my remark was rubbish, yet the comment in the source was a bit confus=
ing,
too. It is correct, though maybe the term 'region' is a bit overloaded. What
about replacing both comments with something a bit simpler like this:

/*
 * These flashes report two seperate eraseblock regions based on the
 * sector_erase-size and block_erase-size, although they both operate on the
 * same memory. This is not allowed according to CFI, so we just pick the
 * sector_erase-size.
 */

This is according to the datasheets. You pick the block-data size here
(ususally using command 0x50). Why is that? I tried sector_size on a
SST39WF1601 and it works fine so far, testing with mtd_stresstest. (Sidenot=
e: I
have to use JEDEC-probing though, as my flashes don't report 0x701 but 0x002
(AMD standard) as their primary command set. But they still need their cust=
om
unlock address :( )

>=20
> > +}
> > +
> > +static void fixup_sst39vf(struct mtd_info *mtd, void *param)
> > +{
> > +	struct map_info *map =3D mtd->priv;
> > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > +
> > +	fixup_old_sst_eraseregion(mtd);
> > +
> > +	cfi->addr_unlock1 =3D 0x5555;
> > +	cfi->addr_unlock2 =3D 0x2AAA;
> > +}
> > +
> >  static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
> >  {
> >  	struct map_info *map =3D mtd->priv;
> > @@ -278,6 +308,16 @@ static void fixup_s29gl032n_sectors(struct mtd_inf=
o *mtd, void *param)
> >  	}
> >  }
> > =20
> > +/* Used to fix CFI-Tables of chips without Extended Query Tables
> > + */
> > +static struct cfi_fixup cfi_nopri_fixup_table[] =3D {
> > +	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602
> > +	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601
> > +	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202
> > +	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201
> > +	{ 0, 0, NULL, NULL }
> > +};
> > +
> >  static struct cfi_fixup cfi_fixup_table[] =3D {
> >  	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
> >  #ifdef AMD_BOOTLOC_BUG
> > @@ -408,6 +448,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *m=
ap, int primary)
> >  			cfi->addr_unlock1 =3D 0x555;
> >  			cfi->addr_unlock2 =3D 0x2aa;
> >  		}
> > +		cfi_fixup(mtd, cfi_nopri_fixup_table);
> > =20
> >  		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {
> >  			kfree(mtd);
> > diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_prob=
e.c
> > index 991c457..599c259 100644
> > --- a/drivers/mtd/chips/gen_probe.c
> > +++ b/drivers/mtd/chips/gen_probe.c
> > @@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_in=
fo *map, int primary)
> >  #endif
> >  #ifdef CONFIG_MTD_CFI_AMDSTD
> >  	case P_ID_AMD_STD:
> > +	case P_ID_SST_OLD:
> >  		return cfi_cmdset_0002(map, primary);
> >  #endif
> >  #ifdef CONFIG_MTD_CFI_STAA
> >=20
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
> --=20
> Pengutronix e.K.                           | Wolfram Sang                |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvChHoACgkQD27XaX1/VRvgEACbBkGoAwOSKHRXAFCgySi9kDhW
VyUAoLztn23yNXjG1pGyxCUkTlfwykKz
=PGQ+
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
