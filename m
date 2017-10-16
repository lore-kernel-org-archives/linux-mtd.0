Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e43g2-0007FQ-Ic
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 11:35:25 +0000
Date: Mon, 16 Oct 2017 13:34:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap
 <linux-omap@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: gpmc-nand broken since v4.12
Message-ID: <20171016133457.74b2773f@bbrezillon>
In-Reply-To: <fe579fc6-253d-a734-22b0-de24448dfde9@ti.com>
References: <7eae9266-558f-6578-66d7-7ab0eb659a81@ti.com>
 <20171013145033.5d1d9647@bbrezillon>
 <20171013222458.3f4c103e@bbrezillon>
 <20171013222907.16adf410@bbrezillon>
 <fe579fc6-253d-a734-22b0-de24448dfde9@ti.com>
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

Hi Roger,

On Mon, 16 Oct 2017 13:22:04 +0300
Roger Quadros <rogerq@ti.com> wrote:

> =EF=BB=BF
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/=
Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20
> On 13/10/17 23:29, Boris Brezillon wrote:
> > On Fri, 13 Oct 2017 22:24:58 +0200
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  =20
> >> On Fri, 13 Oct 2017 14:50:33 +0200
> >> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >> =20
> >>> On Fri, 13 Oct 2017 14:57:29 +0300
> >>> Roger Quadros <rogerq@ti.com> wrote:
> >>>    =20
> >>>> =EF=BB=BFHi Boris,
> >>>>
> >>>> NAND on gpmc-omap breaks for me while doing a unmount of a ubi volum=
e since v4.12
> >>>>
> >>>> Behaviour follows through in v4.13 and v4.14-rc as well.
> >>>>
> >>>> Do you have any idea about this?   =20
> >>
> >> More info on what has changed in 4.12: we no longer allocate the
> >> nand_buffer struct + its internal buffer using a single big kmalloc
> >> call, which means the nand_buffer struct is now likely to be allocated
> >> in a small object slab (sizeof(nand_buffers) =3D 12). If you have a
> >> use-after-free bug somewhere in the kernel, it might corrupt the =20
>=20
> Spot on. Problem starts from commit 4d5dea5725f3aa95b9b64e252540e435dd216=
dbc
> "mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset"
>=20
> >=20
> > I meant buffer-overflow, not use-after-free. =20
>=20
> Your analysis seems correct.
>=20
> >  =20
> >> nand_buffers object, which might explain the bug you see here.
> >> =20
> >>>
> >>> Can you try with this patch [1] applied and paste me the values print=
ed
> >>> just before the crash?
> >>>
> >>> [1]http://code.bulix.org/lc8xk0-209746 =20
>=20
> =3D=3D unmounting volume
> [   36.308792] nand: nand_write_subpage_hwecc:2575 ecc_calc =3D   (null) =
oob_poi =3D ed096800
> [   36.317319] mtd_ooblayout_set_bytes:1330 dst =3D ed096802 src =3D   (n=
ull)
> [   36.324162] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000
>=20
>=20
> Running the following patch
> https://hastebin.com/ulogurutuz.php
> shows
>=20
> [   37.260689] nand: nand_write_subpage_hwecc:2547:A ecc_calc =3D ed116e4=
0 oob_poi =3D ed117800
> [   37.260772] nand: nand_write_subpage_hwecc:2556:A1:step 0, ecc_calc =
=3D ed116e40
> [   37.260779] nand: nand_write_subpage_hwecc:2562:A2:step 0, ecc_calc =
=3D ed116e40
> [   37.260834] nand: nand_write_subpage_hwecc:2556:A1:step 1, ecc_calc =
=3D ed116e40
> [   37.260840] nand: nand_write_subpage_hwecc:2567:A3-pre:step 1, ecc_cal=
c =3D ed116e40
> [   37.260846] omap_calculate_ecc_bch
> [   37.260856] nand: nand_write_subpage_hwecc:2570:A3-post:step 1, ecc_ca=
lc =3D   (null)
> [   37.260912] nand: nand_write_subpage_hwecc:2556:A1:step 2, ecc_calc =
=3D   (null)
> [   37.260918] nand: nand_write_subpage_hwecc:2562:A2:step 2, ecc_calc =
=3D   (null)
> [   37.260972] nand: nand_write_subpage_hwecc:2556:A1:step 3, ecc_calc =
=3D   (null)
> [   37.260978] nand: nand_write_subpage_hwecc:2562:A2:step 3, ecc_calc =
=3D   (null)
> [   37.260984] nand: nand_write_subpage_hwecc:2587:B ecc_calc =3D   (null=
) oob_poi =3D ed117800
> [   37.260991] mtd_ooblayout_set_bytes:1330 dst =3D ed117802 src =3D   (n=
ull)
>=20
> which means omap_calculate_ecc_bch() it the culprit.
>=20
> Looks like the function calculates and stores ECC for all sectors even if=
 we just want ECC
> for just one sector (sub-page).

Yes, looks like you find the root cause.

>=20
> Is my understanding correct
> - We should not be hooking the multi-sector ECC calculator omap_calculate=
_ecc_bch() to ecc.calculate
> - provide a new one sector ECC calculator function (for BCH4/8/16) for om=
ap and hook it to ecc.calculate
> OR
> - override nand_read_subpage() and nand_write_subpage() using omap specif=
ic implementation (for BCH4/8/16).

Second solution sounds simpler because the ECC sector information is
not passed to ecc->calculate() hook, which means you'd have to extract
it from the ecc_calc pointer:

	(uintptr_t)(ecc_calc - chip->buffers->ecccalc) / chip->ecc.size

and doing arithmetic on pointers is usually not a good idea.

Anyway, I'd be fine with both solutions, so pick the one you prefer.

Regards,

Boris
