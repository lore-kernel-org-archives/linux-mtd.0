From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: [PATCH 4/4] mtd: nand: omap2: Add data correction support
Date: Fri, 5 Oct 2012 08:51:50 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9B8A65@DBDE01.ent.ti.com>
References: <1349274589-11389-1-git-send-email-avinashphilip@ti.com>
 <1349274589-11389-5-git-send-email-avinashphilip@ti.com>
 <20121003192044.GB27502@parrot.com>
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

On Thu, Oct 04, 2012 at 15:51:03, Philip, Avinash wrote:
> On Thu, Oct 04, 2012 at 00:50:45, Ivan Djelic wrote:
> > On Wed, Oct 03, 2012 at 03:29:49PM +0100, Philip, Avinash wrote:
> > > ELM module can be used for error correction of BCH 4 & 8 bit. Also
> > > support read & write page in one shot by adding custom read_page &
> > > write_page methods. This helps in optimizing code.
> > >=20
> > > New structure member "is_elm_used" is added to know the status of
> > > whether the ELM module is used for error correction or not.
> > >=20
> > > Note:
> > > ECC layout of BCH8 uses 14 bytes for 512 byte of data to make compati=
ble
> > > with RBL ECC layout, even though the requirement was only 13 byte. Th=
is
> > > results a common ecc layout across RBL, U-boot & Linux.
> > >=20
> >=20
> > See a few comments below,
> >=20
> > (...)
> > > +static int omap_elm_correct_data(struct mtd_info *mtd, u_char *dat,
> > > +                               u_char *read_ecc, u_char *calc_ecc)
> > > +{
> > > +       struct omap_nand_info *info =3D container_of(mtd, struct omap=
_nand_info,
> > > +                       mtd);
> > > +       int eccsteps =3D info->nand.ecc.steps;
> > > +       int i , j, stat =3D 0;
> > > +       int eccsize, eccflag, size;
> > > +       struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
> > > +       u_char *ecc_vec =3D calc_ecc;
> > > +       enum bch_ecc type;
> > > +       bool is_error_reported =3D false;
> > > +
> > > +       /* initialize elm error vector to zero */
> > > +       memset(err_vec, 0, sizeof(err_vec));
> > > +       if (info->nand.ecc.strength =3D=3D BCH8_MAX_ERROR) {
> > > +               size =3D BCH8_SIZE;
> > > +               eccsize =3D BCH8_ECC_OOB_BYTES;
> > > +               type =3D BCH8_ECC;
> > > +       } else {
> > > +               size =3D BCH4_SIZE;
> > > +               eccsize =3D BCH4_SIZE;
> > > +               type =3D BCH4_ECC;
> > > +       }
> > > +
> > > +       for (i =3D 0; i < eccsteps ; i++) {
> > > +               eccflag =3D 0;    /* initialize eccflag */
> > > +
> > > +               for (j =3D 0; (j < eccsize); j++) {
> > > +                       if (read_ecc[j] !=3D 0xFF) {
> > > +                               eccflag =3D 1;    /* data area is fla=
shed */
> >=20
> > Just a reminder: this way of checking if a page has been programmed is =
not robust to bitflips,
> > so you may get into trouble with UBIFS on a fairly recent device.

Sorry I missed this point.

Here we were checking data in spare area (only in ecc layout 14*4 for BCH8)=
 is 0xFF. If all data
in spare area is 0xFF, conclude that the page is erased & no need of error =
correction. In case
of bit flip present in spare area, page will be reported as uncorrectable.
But I am not understand understand " trouble with UBIFS on a fairly recent =
device".
Can you little elaborativ

Thanks
Avinash=20
