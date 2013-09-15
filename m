Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLDAP-0006d9-V4
 for linux-mtd@lists.infradead.org; Sun, 15 Sep 2013 14:19:15 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Sun, 15 Sep 2013 16:18:51 +0200
References: <522062B4.4080709@digi.com> <522755DC.4000301@digi.com>
 <52281E4B.5030901@freescale.com>
In-Reply-To: <52281E4B.5030901@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201309151618.52045.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Hector Palacios <hector.palacios@digi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8804=E6=97=A5 23:46, Hector Palacios =E5=
=86=99=E9=81=93:
> > Dear Marek,
> >=20
> > On 09/04/2013 04:38 PM, Marek Vasut wrote:
> >> Dear Huang Shijie,
> >>=20
> >>> On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
> >>>> Dear Huang Shijie,
> >>>> How come hector was then able to write his JFFS2 partition ?
> >>>=20
> >>> If he uses the gpmi, he should not write the JFFS2, since the gpmi
> >>> does not support the jffs2. He will get the failure in the end.
> >>=20
> >> Hector, can you comment on this?
> >=20
> > I don't think I'm following these comments. The facts are:
> > 1) A JFFS2 filesystem image written with nandwrite (mtd-utils v1.5.0)
> > a) does not mount on kernel v3.10
> > b) mounts OK on linux-next kernel (v3.12) with the patchset [1] from
> > Huang
> > (actually I didn't use linux-next but instead a v3.10 where I merged
> > all the commits done to MTD in linux-next, which are a lot).
> >=20
> > 2) A JFFS2 filesystem image written with U-Boot v2013.01
> > a) mounts OK on old FSL kernel 2.6.35
> > b) does not mount on kernel v3.10 (neither on v3.8, I believe).
> > c) does not mount on linux-next with the patchset [1]
>=20
> The gpmi driver in FSL kernel 2.6.35 is different from the linux-next or
> linux v3.10.
>=20
> We have abandoned the old gpmi driver, and we use the same gpmi code in
> current FSL kernel.
>=20
> Since we swtich to the upstream gpmi code, and it could not support the
> jffs2,
>=20
> and that's why you mount always failed.

With the patchset, mounting the jffs should work again, no? If mounting the=
 jffs=20
works with the patchset AND it only works with jffs written using the new=20
driver, you will need to introduce soem compatibility option or something a=
long=20
that.

> > [1]
> > http://lists.infradead.org/pipermail/linux-mtd/2013-August/048360.html
> >=20
> > Marek, could you please confirm 2b on your side, just in case I'm
> > doing anything wrong in my custom U-Boot?
> >=20
> >>>>> So the jffs2 support is compatiable all the time.
> >>>>=20
> >>>> Is the old Freescale 2.6.35 GPMI NAND format compatible with the one
> >>>> after applying this patchset?
> >>>=20
> >>> Not compatible.
> >>>=20
> >>> This patch set is still underreview.
> >>=20
> >> So this patch breaks compatiblity with FSL kernel release? This needs
> >> fixing,
> >> otherwise it's impossible to do a drop-in replacement for the ancient
> >> FSL
> >> kernel.
> >>=20
> >>>>>> that I could mount with Linux 3.7 and earlier?
> >>>>>=20
> >>>>> I think the mount can be succeeded.
> >>>>=20
> >>>> Ok, does that mean that we need this patchset in U-Boot in order to
> >>>> properly write JFFS2 onto GPMI NAND there? Is that the message you
> >>>> wanted to relay to us?
> >>>=20
> >>> Besides this patchset, the u-boot needs more patches to sync with the
> >>> kernel mtd code. Such as the full-id features.
> >>=20
> >> Can you elaborate on this more? This is very vague, I would like to
> >> know what
> >> exactly is missing.
>=20
> 92a2645 mtd: add 4 Toshiba nand chips for the full-id case
> ec6e87e mtd: add the support to parse out the full-id nand type

Do these really have any impact?

> f22d5f6 mtd: add new fields to nand_flash_dev{}
> 2febcdf mtd: gpmi: set the BCH's geometry with the ecc info
> d1048aa mtd: add the ecc info for some full-id nand chips
> 5721934 mtd: parse out the ECC info for the full-id nand chips
> 2dc0bdd mtd: add ECC info for nand_flash_dev{}
> e2985fc mtd: replace the hardcode with the onfi_feature()
> 6dcbe0c mtd: get the ECC info from the Extended Parameter Page
> 5b40db6 mtd: add a helper to get the supported features for ONFI nand
> 5138a98 mtd: add data structures for Extended Parameter Page
> 10c86ba mtd: get the ECC info from the parameter page for ONFI nand
> 4cfeca2 mtd: add datasheet's ECC information to nand_chip{}

Hector, can you inspect those patches ?

> > Yes, please, we need more details. This seems to be related with how
> > the MTD drivers (in Linux and in U-Boot) access the OOB area to store
> > the JFFS2 cleanmarkers, right?
> >=20
> > The error I'm receiving from the kernel is at fs/jffs2/wbuf.c
> >=20
> > if (!oinfo || oinfo->oobavail =3D=3D 0) {
> > pr_err("inconsistent device description\n");
> > return -EINVAL;
> > }
>=20
> Before apply the patches above, the gpmi will use all the oob, so
> "oinfo->oobavail =3D=3D 0" becomes true.
>=20
> After apply the patches, the gpmi will not use all the oob for the ONFI
> SLC nand or the full-id nand,
> and it can supports the jffs2 when you apply the other SLC/MLC patchset.

So the patches you listed above are not enough?

Best regards,
Marek Vasut
