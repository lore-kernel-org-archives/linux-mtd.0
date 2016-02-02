Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQb1Y-0002Et-1v
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 13:29:42 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <b45815@freescale.com>, shijie.huang@arm.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v8 6/7] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Date: Tue, 02 Feb 2016 14:28:52 +0100
Message-ID: <33838116.gL72islO6s@adelgunde>
In-Reply-To: <20160123230147.GJ24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-7-git-send-email-b45815@freescale.com>
 <20160123230147.GJ24744@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2122256.vT9CF8XZ60";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart2122256.vT9CF8XZ60
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Saturday, January 23, 2016 03:01:47 PM Brian Norris wrote:
> + Markus Pargmann
>=20
> On Wed, Dec 02, 2015 at 04:47:45PM -0600, Han Xu wrote:
> > i.MX6QP and i.MX7D BCH module integrated a new feature to detect th=
e
> > bitflip number for erased NAND page. So for these two platform, set=
 the
> > erase threshold to ecc_strength and if bitflip detected, GPMI drive=
r will
> > correct the data to all 0xFF.
>=20
> Looks like Marcus is also trying to add SW correction for the same
> issue:
>=20
> http://patchwork.ozlabs.org/patch/559557/
>=20
> How do those 2 interact (if at all)?

Thanks for CCing.

>=20
> Brian
>=20
> > Signed-off-by: Han Xu <b45815@freescale.com>
> > ---
> >  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++++=
+-
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  5 ++++-
> >  4 files changed, 42 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/na=
nd/gpmi-nand/bch-regs.h
> > index 53e58bc..a84d72b 100644
> > --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> > +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> > @@ -30,7 +30,13 @@
> >  #define BM_BCH_CTRL_COMPLETE_IRQ=09=09(1 << 0)
> > =20
> >  #define HW_BCH_STATUS0=09=09=09=090x00000010
> > +
> >  #define HW_BCH_MODE=09=09=09=090x00000020
> > +#define BP_BCH_MODE_ERASE_THRESHOLD=09=090
> > +#define BM_BCH_MODE_ERASE_THRESHOLD=09(0xff << BP_BCH_MODE_ERASE_T=
HRESHOLD)
> > +#define BF_BCH_MODE_ERASE_THRESHOLD(v)=09=09\
> > +=09(((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRES=
HOLD)
> > +
> >  #define HW_BCH_ENCODEPTR=09=09=090x00000030
> >  #define HW_BCH_DATAPTR=09=09=09=090x00000040
> >  #define HW_BCH_METAPTR=09=09=09=090x00000050
> > @@ -125,4 +131,8 @@
> >  =09)
> > =20
> >  #define HW_BCH_VERSION=09=09=09=090x00000160
> > +#define HW_BCH_DEBUG1=09=09=09=090x00000170
> > +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT=090
> > +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT=09=09\
> > +=09=09(0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
> >  #endif
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/na=
nd/gpmi-nand/gpmi-lib.c
> > index 1f26a79..0548d84 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *th=
is)
> >  =09=09=09| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
> >  =09=09=09r->bch_regs + HW_BCH_FLASH0LAYOUT1);
> > =20
> > +=09/* Set erase threshold to ecc_strength for mx6qp and mx7 */
> > +=09if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> > +=09=09writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> > +=09=09=09r->bch_regs + HW_BCH_MODE);

This is probably different on imx6qp and imx7?!
On the other imx6 processors, setting this will instruct the BCH engine=

to allow 'ecc_strength' number of bitflips in an erased area without a
reported ECC error. Unfortunately it does not fix the bitflips.

So what happens on imx6q,dl,s in this case:
1) BCH detects bitflips in the erased page, but ignores them due to the=

ERASE_THRESHOLD setting up to 'ecc_strength' bitflips.
2) The gpmi driver does not notice any errors as BCH did not set that
there is any ECC error in the data. So the driver assumes correct data
and does not fix the existing bitflips in the erased page.
3) UBI does not see any ECC errors and does not check the page.
4) UBIFS does check the content of erased pages at some points and
breaks at this point. The filesystem can't be mounted anymore.

This is why I added my patch a software check in case of an
uncorrectable ECC error. The ERASE_THRESHOLD has to be 0 for this to
work.

As this patch only affects imx6qp and imx7, I assume that there is a
better mechanism now.

Best Regards,

Markus

> > +
> >  =09/* Set *all* chip selects to use layout 0. */
> >  =09writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
> > =20
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/n=
and/gpmi-nand/gpmi-nand.c
> > index 9f67f0f..9dea56e 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -71,6 +71,12 @@ static const struct gpmi_devdata gpmi_devdata_im=
x6q =3D {
> >  =09.max_chain_delay =3D 12,
> >  };
> > =20
> > +static const struct gpmi_devdata gpmi_devdata_imx6qp =3D {
> > +=09.type =3D IS_MX6QP,
> > +=09.bch_max_ecc_strength =3D 40,
> > +=09.max_chain_delay =3D 12,
> > +};
> > +
> >  static const struct gpmi_devdata gpmi_devdata_imx6sx =3D {
> >  =09.type =3D IS_MX6SX,
> >  =09.bch_max_ecc_strength =3D 62,
> > @@ -1010,6 +1016,7 @@ static int gpmi_ecc_read_page(struct mtd_info=
 *mtd, struct nand_chip *chip,
> >  {
> >  =09struct gpmi_nand_data *this =3D chip->priv;
> >  =09struct bch_geometry *nfc_geo =3D &this->bch_geometry;
> > +=09void __iomem *bch_regs =3D this->resources.bch_regs;
> >  =09void          *payload_virt;
> >  =09dma_addr_t    payload_phys;
> >  =09void          *auxiliary_virt;
> > @@ -1018,6 +1025,7 @@ static int gpmi_ecc_read_page(struct mtd_info=
 *mtd, struct nand_chip *chip,
> >  =09unsigned char *status;
> >  =09unsigned int  max_bitflips =3D 0;
> >  =09int           ret;
> > +=09int flag =3D 0;
> > =20
> >  =09dev_dbg(this->dev, "page number is : %d\n", page);
> >  =09ret =3D read_page_prepare(this, buf, nfc_geo->payload_size,
> > @@ -1050,9 +1058,16 @@ static int gpmi_ecc_read_page(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> >  =09status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
> > =20
> >  =09for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> > -=09=09if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_E=
RASED))
> > +=09=09if (*status =3D=3D STATUS_GOOD)
> >  =09=09=09continue;
> > =20
> > +=09=09if (*status =3D=3D STATUS_ERASED) {
> > +=09=09=09if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> > +=09=09=09=09if (readl(bch_regs + HW_BCH_DEBUG1))
> > +=09=09=09=09=09flag =3D 1;
> > +=09=09=09continue;
> > +=09=09}
> > +
> >  =09=09if (*status =3D=3D STATUS_UNCORRECTABLE) {
> >  =09=09=09mtd->ecc_stats.failed++;
> >  =09=09=09continue;
> > @@ -1081,6 +1096,10 @@ static int gpmi_ecc_read_page(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> >  =09=09=09nfc_geo->payload_size,
> >  =09=09=09payload_virt, payload_phys);
> > =20
> > +=09/* if bitflip occurred in erased page, change data to all 0xff =
*/
> > +=09if (flag)
> > +=09=09memset(buf, 0xff, nfc_geo->payload_size);
> > +
> >  =09return max_bitflips;
> >  }
> > =20
> > @@ -1990,6 +2009,9 @@ static const struct of_device_id gpmi_nand_id=
_table[] =3D {
> >  =09=09.compatible =3D "fsl,imx6q-gpmi-nand",
> >  =09=09.data =3D &gpmi_devdata_imx6q,
> >  =09}, {
> > +=09=09.compatible =3D "fsl,imx6qp-gpmi-nand",
> > +=09=09.data =3D (void *)&gpmi_devdata_imx6qp,
> > +=09}, {
> >  =09=09.compatible =3D "fsl,imx6sx-gpmi-nand",
> >  =09=09.data =3D &gpmi_devdata_imx6sx,
> >  =09}, {
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/n=
and/gpmi-nand/gpmi-nand.h
> > index 58b3d69..149a442 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> > @@ -123,6 +123,7 @@ enum gpmi_type {
> >  =09IS_MX23,
> >  =09IS_MX28,
> >  =09IS_MX6Q,
> > +=09IS_MX6QP,
> >  =09IS_MX6SX,
> >  =09IS_MX7D,
> >  };
> > @@ -306,9 +307,11 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_of=
f,
> >  #define GPMI_IS_MX23(x)=09=09((x)->devdata->type =3D=3D IS_MX23)
> >  #define GPMI_IS_MX28(x)=09=09((x)->devdata->type =3D=3D IS_MX28)
> >  #define GPMI_IS_MX6Q(x)=09=09((x)->devdata->type =3D=3D IS_MX6Q)
> > +#define GPMI_IS_MX6QP(x)=09((x)->devdata->type =3D=3D IS_MX6QP)
> >  #define GPMI_IS_MX6SX(x)=09((x)->devdata->type =3D=3D IS_MX6SX)
> >  #define GPMI_IS_MX7D(x)=09=09((x)->devdata->type =3D=3D IS_MX7D)
> > =20
> > -#define GPMI_IS_MX6(x)=09=09(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
> > +#define GPMI_IS_MX6(x)=09=09(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
> > +=09   || GPMI_IS_MX6SX(x))
> >  #define GPMI_IS_MX7(x)=09=09(GPMI_IS_MX7D(x))
> >  #endif
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2122256.vT9CF8XZ60
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWsK8aAAoJEEpcgKtcEGQQ0+0P/RtSfbO+ndcw2Fv+2vPuqgpT
790sa6KytsDyVGJY0CFznEN9HRs5LCpqgdFe52+n4t/3DwbVGdlUorXsqDOH3+EZ
ETY+tFtMFmlrPSXiCc9zEDeu7sVwf+vEbbsY0zsk2moWoJzilsm2rA4XSeKejmTm
rrr8+9+l5fJzwxmN8AkWpj2jJrZ4VIUSAhvrZtOWy+Yz9M0JwUSVllqqxxyHgba+
EOjIMXcqaz4jGWr+SefhdwpIphTjMxUPSQpOM5RMkuyO2SNXOQuE0FphPxtRH6hs
Vh3ph/53hXccQZSdGNQBdIggdKFqi5zc13VzfvoYykprwbjLAkfoSClwFpbPAjg/
TnAm2x6/jSiLjTZUgcbyn068BCp0S49nJXc4r1ZUR+vrwuY6td6slUgh5UmmrYOa
BalkpiG2W5rlXwR9jSYgXp8aKNfbdfmdiPhKISVao/uddIpy+VZubGXT6JvYL+Et
+xcmgf7Wciu3Cn9r6nW4PAfvQ9cdQVDJnh4JexAJ9FmrdHR1nL0PFlniILIZBPxE
f8XofhIr9UCjyBmeRBl/ZkHLScBBqTC2YblsG9OGvH67MgD5FxDhFmhqpywQFQie
lmqAhYJTNap3/+OmQ73Grif87afMEmM754u0+QMe7jA7ETwAMILXpYDsADyI5Qt1
5gJmqnHizIrkqUWXqKlQ
=wIbZ
-----END PGP SIGNATURE-----

--nextPart2122256.vT9CF8XZ60--
