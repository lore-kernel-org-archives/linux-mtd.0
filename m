From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: [PATCH 4/4] mtd: nand: omap2: Add data correction support
Date: Thu, 4 Oct 2012 10:22:43 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9B7FDF@DBDE01.ent.ti.com>
References: <1349274589-11389-1-git-send-email-avinashphilip@ti.com>
 <1349274589-11389-5-git-send-email-avinashphilip@ti.com>
 <20121003192044.GB27502@parrot.com>
In-Reply-To: <20121003192044.GB27502@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 04, 2012 at 00:50:45, Ivan Djelic wrote:
> On Wed, Oct 03, 2012 at 03:29:49PM +0100, Philip, Avinash wrote:
> > ELM module can be used for error correction of BCH 4 & 8 bit. Also
> > support read & write page in one shot by adding custom read_page &
> > write_page methods. This helps in optimizing code.
> >=20
> > New structure member "is_elm_used" is added to know the status of
> > whether the ELM module is used for error correction or not.
> >=20
> > Note:
> > ECC layout of BCH8 uses 14 bytes for 512 byte of data to make compatibl=
e
> > with RBL ECC layout, even though the requirement was only 13 byte. This
> > results a common ecc layout across RBL, U-boot & Linux.
> >=20
>=20
> See a few comments below,
>=20
> (...)
> > +static int omap_elm_correct_data(struct mtd_info *mtd, u_char *dat,
> > +                               u_char *read_ecc, u_char *calc_ecc)
> > +{
> > +       struct omap_nand_info *info =3D container_of(mtd, struct omap_n=
and_info,
> > +                       mtd);
> > +       int eccsteps =3D info->nand.ecc.steps;
> > +       int i , j, stat =3D 0;
> > +       int eccsize, eccflag, size;
> > +       struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
> > +       u_char *ecc_vec =3D calc_ecc;
> > +       enum bch_ecc type;
> > +       bool is_error_reported =3D false;
> > +
> > +       /* initialize elm error vector to zero */
> > +       memset(err_vec, 0, sizeof(err_vec));
> > +       if (info->nand.ecc.strength =3D=3D BCH8_MAX_ERROR) {
> > +               size =3D BCH8_SIZE;
> > +               eccsize =3D BCH8_ECC_OOB_BYTES;
> > +               type =3D BCH8_ECC;
> > +       } else {
> > +               size =3D BCH4_SIZE;
> > +               eccsize =3D BCH4_SIZE;
> > +               type =3D BCH4_ECC;
> > +       }
> > +
> > +       for (i =3D 0; i < eccsteps ; i++) {
> > +               eccflag =3D 0;    /* initialize eccflag */
> > +
> > +               for (j =3D 0; (j < eccsize); j++) {
> > +                       if (read_ecc[j] !=3D 0xFF) {
> > +                               eccflag =3D 1;    /* data area is flash=
ed */
>=20
> Just a reminder: this way of checking if a page has been programmed is no=
t robust to bitflips,
> so you may get into trouble with UBIFS on a fairly recent device.
>=20
> (...)
> > @@ -1039,14 +1180,45 @@ static void omap3_enable_hwecc_bch(struct mtd_i=
nfo *mtd, int mode)
> >=20
> >         nerrors =3D info->nand.ecc.strength;
> >         dev_width =3D (chip->options & NAND_BUSWIDTH_16) ? 1 : 0;
> > +#ifdef CONFIG_MTD_NAND_OMAP_BCH
> > +       if (info->is_elm_used) {
> > +               /*
> > +                * Program GPMC to perform correction on (steps * 512) =
byte
> > +                * sector at a time.
> > +                */
> > +               gpmc_enable_hwecc_bch(info->gpmc_cs, mode, dev_width,
> > +                               info->nand.ecc.steps, nerrors);
> > +               return;
> > +       }
> > +#endif
> >         /*
> > -        * Program GPMC to perform correction on one 512-byte sector at=
 a time.
> > -        * Using 4 sectors at a time (i.e. ecc.size =3D 2048) is also p=
ossible and
> > -        * gives a slight (5%) performance gain (but requires additiona=
l code).
> > +        * Program GPMC to perform correction on one 512-byte sector at
> > +        * a time.
>=20
> Why removing the comment about 4-sector perf gain ? :-)

With this patch, support for reading 4 sectors (max 8) is available.
Hence I am removing it.

>=20
> (...)
> > @@ -1146,35 +1402,62 @@ static int omap3_init_bch(struct mtd_info *mtd,=
 int ecc_opt)
> >                 goto fail;
> >         }
> >=20
> > -       /* initialize GPMC BCH engine */
> > -       ret =3D gpmc_init_hwecc_bch(info->gpmc_cs, 1, max_errors);
> > -       if (ret)
> > -               goto fail;
> > -
> > -       /* software bch library is only used to detect and locate error=
s */
> > -       info->bch =3D init_bch(13, max_errors, 0x201b /* hw polynomial =
*/);
> > -       if (!info->bch)
> > -               goto fail;
> > +       info->nand.ecc.size =3D 512;
> > +       info->nand.ecc.hwctl =3D omap3_enable_hwecc_bch;
> > +       info->nand.ecc.mode =3D NAND_ECC_HW;
> > +       info->nand.ecc.strength =3D hw_errors;
> >=20
> > -       info->nand.ecc.size    =3D 512;
> > -       info->nand.ecc.hwctl   =3D omap3_enable_hwecc_bch;
> > -       info->nand.ecc.correct =3D omap3_correct_data_bch;
> > -       info->nand.ecc.mode    =3D NAND_ECC_HW;
> > +       if (info->is_elm_used && (mtd->writesize <=3D 4096)) {
> > +               enum bch_ecc bch_type;
> >=20
> > -       /*
> > -        * The number of corrected errors in an ecc block that will tri=
gger
> > -        * block scrubbing defaults to the ecc strength (4 or 8).
> > -        * Set mtd->bitflip_threshold here to define a custom threshold=
.
> > -        */
> > +               if (hw_errors =3D=3D BCH8_MAX_ERROR) {
> > +                       bch_type =3D BCH8_ECC;
> > +                       info->nand.ecc.bytes =3D BCH8_SIZE;
> > +               } else {
> > +                       bch_type =3D BCH4_ECC;
> > +                       info->nand.ecc.bytes =3D BCH4_SIZE;
> > +               }
> >=20
> > -       if (max_errors =3D=3D 8) {
> > -               info->nand.ecc.strength  =3D 8;
> > -               info->nand.ecc.bytes     =3D 13;
> > -               info->nand.ecc.calculate =3D omap3_calculate_ecc_bch8;
> > +               info->nand.ecc.correct =3D omap_elm_correct_data;
> > +               info->nand.ecc.calculate =3D omap3_calculate_ecc_bch;
> > +               info->nand.ecc.read_page =3D omap_read_page_bch;
> > +               info->nand.ecc.write_page =3D omap_write_page_bch;
> > +               info->elm_dev =3D elm_request(bch_type);
> > +               if (!info->elm_dev) {
> > +                       pr_err("Request to elm module failed\n");
> > +                       goto fail;
> > +               }
> >         } else {
> > -               info->nand.ecc.strength  =3D 4;
> > -               info->nand.ecc.bytes     =3D 7;
> > -               info->nand.ecc.calculate =3D omap3_calculate_ecc_bch4;
> > +
> > +               /* initialize GPMC BCH engine */
> > +               ret =3D gpmc_init_hwecc_bch(info->gpmc_cs, 1, max_error=
s);
> > +               if (ret)
> > +                       goto fail;
> > +
> > +               /*
> > +                * software bch library is only used to detect and
> > +                * locateerrors
>=20
> s/locateerrors/locate errors/

Ok I will correct it.

>=20
> BTW, did you check that your patch does not break the software BCH case (=
i.e. no ELM) ?

I had checked in AM335x-evm software BCH without ELM. So this patch set is =
not breaking
software BCH functionality.

Thanks
Avinash


>=20
> BR,
> --
> Ivan
>=20
