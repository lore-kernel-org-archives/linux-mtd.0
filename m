Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRaaO-0007ON-Ba
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 06:41:29 +0000
Date: Tue, 18 Aug 2015 14:40:53 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: nand: gpmi: may use minimum required ecc for
 744 oobsize NAND
Message-ID: <20150818064053.GA10641@free64-pc.asiapac.arm.com>
References: <1439868289-24843-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1439868289-24843-1-git-send-email-b45815@freescale.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 17, 2015 at 10:24:49PM -0500, Han Xu wrote:
> By default NAND driver will choose the highest ecc strength that oob
> could contain, in this case, for some 8K+744 NAND flash, the ecc
> strength will be up to 52bit, which beyonds the i.MX6QDL BCH capability
> (40bit).
>=20
> This patch allows the NAND driver try to use minimum required ecc
> strength if it failed to use the highest ecc, even without explicitly
> claiming "fsl,use-minimum-ecc" in dts.
>=20
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index dfd0ba1..01d24dd 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -136,7 +136,7 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_da=
ta *this)
>   *
>   * We may have available oob space in this case.
>   */
> -static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
> +static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
>  {
>  =09struct bch_geometry *geo =3D &this->bch_geometry;
>  =09struct mtd_info *mtd =3D &this->mtd;
> @@ -145,7 +145,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand=
_data *this)
>  =09unsigned int block_mark_bit_offset;
> =20
>  =09if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
> -=09=09return false;
> +=09=09return -EINVAL;
> =20
>  =09switch (chip->ecc_step_ds) {
>  =09case SZ_512:
> @@ -158,19 +158,19 @@ static bool set_geometry_by_ecc_info(struct gpmi_na=
nd_data *this)
>  =09=09dev_err(this->dev,
>  =09=09=09"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
>  =09=09=09chip->ecc_strength_ds, chip->ecc_step_ds);
> -=09=09return false;
> +=09=09return -EINVAL;
>  =09}
>  =09geo->ecc_chunk_size =3D chip->ecc_step_ds;
>  =09geo->ecc_strength =3D round_up(chip->ecc_strength_ds, 2);
>  =09if (!gpmi_check_ecc(this))
> -=09=09return false;
> +=09=09return -EINVAL;
> =20
>  =09/* Keep the C >=3D O */
>  =09if (geo->ecc_chunk_size < mtd->oobsize) {
>  =09=09dev_err(this->dev,
>  =09=09=09"unsupported nand chip. ecc size: %d, oob size : %d\n",
>  =09=09=09chip->ecc_step_ds, mtd->oobsize);
> -=09=09return false;
> +=09=09return -EINVAL;
>  =09}
> =20
>  =09/* The default value, see comment in the legacy_set_geometry(). */
> @@ -242,7 +242,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand=
_data *this)
>  =09=09=09=09+ ALIGN(geo->ecc_chunk_count, 4);
> =20
>  =09if (!this->swap_block_mark)
> -=09=09return true;
> +=09=09return 0;
> =20
>  =09/* For bit swap. */
>  =09block_mark_bit_offset =3D mtd->writesize * 8 -
> @@ -251,7 +251,7 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand=
_data *this)
> =20
>  =09geo->block_mark_byte_offset =3D block_mark_bit_offset / 8;
>  =09geo->block_mark_bit_offset  =3D block_mark_bit_offset % 8;
> -=09return true;
> +=09return 0;
>  }
> =20
>  static int legacy_set_geometry(struct gpmi_nand_data *this)
> @@ -366,10 +366,12 @@ static int legacy_set_geometry(struct gpmi_nand_dat=
a *this)
> =20
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> -=09if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
> -=09=09&& set_geometry_by_ecc_info(this))
> -=09=09return 0;
> -=09return legacy_set_geometry(this);
> +

Please remove the empty line.

> +=09if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")=
)
> +=09=09=09=09|| legacy_set_geometry(this))
If the legacy_set_geometry() fails, it will print out an error message.
could you please also change the error log?

thanks
Huang Shijie

> +=09=09return set_geometry_by_ecc_info(this);
> +
> +=09return 0;
>  }
