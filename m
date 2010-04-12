Received: from aa011msr.fastwebnet.it ([85.18.95.71])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1MVD-00043T-Uw
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 16:28:50 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
Date: Mon, 12 Apr 2010 18:28:38 +0200
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
	<20100412022458.GB3274@pengutronix.de>
In-Reply-To: <20100412022458.GB3274@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201004121828.38560.fabio.giovagnini@aurion-tech.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Guillaume LECERF <glecerf@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,
I'm very interested to use such a patch; which kernel version Do I need to =
use=20
for appling it successfully?

Regards


In data luned=C3=AC 12 aprile 2010 04:24:58, Wolfram Sang ha scritto:
: > On Thu, Apr 08, 2010 at 11:12:15AM +0200, Wolfram Sang wrote:
> > On Tue, Mar 30, 2010 at 03:35:13PM +0200, Guillaume LECERF wrote:
> > > SST 39VF{16,32}xx chips use the 0x0701 command set, fully compatible
> > > with the AMD one. This patch adds support for detecting them in CFI
> > > mode.
> > >
> > > Based on a patch by Peter Turczaki [1].
> > >
> > > [1] http://www.mail-archive.com/uclinux-dev@uclinux.org/msg05737.html
> > >
> > > Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> > > ---
> > >  drivers/mtd/chips/cfi_cmdset_0002.c |   41
> > > +++++++++++++++++++++++++++++++++++ drivers/mtd/chips/gen_probe.c    =
 =20
> > > |    1 +
> > >  2 files changed, 42 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > b/drivers/mtd/chips/cfi_cmdset_0002.c index de1b4ba..e3e4a94 100644
> > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > @@ -256,6 +256,36 @@ static void fixup_use_atmel_lock(struct mtd_info
> > > *mtd, void *param) mtd->flags |=3D MTD_POWERUP_LOCK;
> > >  }
> > >
> > > +/** While reporting a mostly-correct CFI-Information block
> > > +  * the eraseblock-region information is severely damaged in SST
> > > +  * parts at least those of the 39VF{16,32,64}xxB series.
> > > +  **/
> >
> > Kernel mulit line comments, please.
> >
> > > +static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
> > > +{
> > > +	struct map_info *map =3D mtd->priv;
> > > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > > +
> > > +	/** Although the part claims to have two eraseblock-regions
> > > +	  * these refer to the same region within the flash-array.
> > > +	  * Because a really CFI-Compliant part may only return
> >
> > s/Compliant/compliant/?
> >
> > > +	  * one eraseblock-length per physical memory region
> > > +	  * we pretend the part said it had just one region ;)
> > > +	  **/
> > > +	cfi->cfiq->NumEraseRegions =3D 1;
> > > +	cfi->cfiq->EraseRegionInfo[0] =3D cfi->cfiq->EraseRegionInfo[1];
> >
> > Why is this last line needed? The comment says they are the same?
>=20
> Okay, my remark was rubbish, yet the comment in the source was a bit
>  confusing, too. It is correct, though maybe the term 'region' is a bit
>  overloaded. What about replacing both comments with something a bit
>  simpler like this:
>=20
> /*
>  * These flashes report two seperate eraseblock regions based on the
>  * sector_erase-size and block_erase-size, although they both operate on
>  the * same memory. This is not allowed according to CFI, so we just pick
>  the * sector_erase-size.
>  */
>=20
> This is according to the datasheets. You pick the block-data size here
> (ususally using command 0x50). Why is that? I tried sector_size on a
> SST39WF1601 and it works fine so far, testing with mtd_stresstest.
>  (Sidenote: I have to use JEDEC-probing though, as my flashes don't report
>  0x701 but 0x002 (AMD standard) as their primary command set. But they
>  still need their custom unlock address :( )
>=20
> > > +}
> > > +
> > > +static void fixup_sst39vf(struct mtd_info *mtd, void *param)
> > > +{
> > > +	struct map_info *map =3D mtd->priv;
> > > +	struct cfi_private *cfi =3D map->fldrv_priv;
> > > +
> > > +	fixup_old_sst_eraseregion(mtd);
> > > +
> > > +	cfi->addr_unlock1 =3D 0x5555;
> > > +	cfi->addr_unlock2 =3D 0x2AAA;
> > > +}
> > > +
> > >  static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *para=
m)
> > >  {
> > >  	struct map_info *map =3D mtd->priv;
> > > @@ -278,6 +308,16 @@ static void fixup_s29gl032n_sectors(struct
> > > mtd_info *mtd, void *param) }
> > >  }
> > >
> > > +/* Used to fix CFI-Tables of chips without Extended Query Tables
> > > + */
> > > +static struct cfi_fixup cfi_nopri_fixup_table[] =3D {
> > > +	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602
> > > +	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601
> > > +	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202
> > > +	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201
> > > +	{ 0, 0, NULL, NULL }
> > > +};
> > > +
> > >  static struct cfi_fixup cfi_fixup_table[] =3D {
> > >  	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
> > >  #ifdef AMD_BOOTLOC_BUG
> > > @@ -408,6 +448,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info
> > > *map, int primary) cfi->addr_unlock1 =3D 0x555;
> > >  			cfi->addr_unlock2 =3D 0x2aa;
> > >  		}
> > > +		cfi_fixup(mtd, cfi_nopri_fixup_table);
> > >
> > >  		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {
> > >  			kfree(mtd);
> > > diff --git a/drivers/mtd/chips/gen_probe.c
> > > b/drivers/mtd/chips/gen_probe.c index 991c457..599c259 100644
> > > --- a/drivers/mtd/chips/gen_probe.c
> > > +++ b/drivers/mtd/chips/gen_probe.c
> > > @@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct
> > > map_info *map, int primary) #endif
> > >  #ifdef CONFIG_MTD_CFI_AMDSTD
> > >  	case P_ID_AMD_STD:
> > > +	case P_ID_SST_OLD:
> > >  		return cfi_cmdset_0002(map, primary);
> > >  #endif
> > >  #ifdef CONFIG_MTD_CFI_STAA
> > >
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

=2D-=20
=46abio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
