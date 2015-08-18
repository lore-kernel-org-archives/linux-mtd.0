Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRaqx-0005Q3-KK
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 06:58:36 +0000
Date: Tue, 18 Aug 2015 14:58:06 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: nand: gpmi: support NAND on i.MX6UL
Message-ID: <20150818065806.GD10641@free64-pc.asiapac.arm.com>
References: <1439868307-24985-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1439868307-24985-1-git-send-email-b45815@freescale.com>
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

On Mon, Aug 17, 2015 at 10:25:07PM -0500, Han Xu wrote:
> support GPMI NAND on i.MX6UL
>=20
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 6 ++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 362cf4c..adadac2 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d =
=3D {
>  =09.max_chain_delay =3D 12,
>  };
> =20
> +static const struct gpmi_devdata gpmi_devdata_imx6ul =3D {
> +=09.type =3D IS_MX6UL,
> +=09.bch_max_ecc_strength =3D 40,
> +=09.max_chain_delay =3D 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>  =09struct gpmi_nand_data *this =3D cookie;
> @@ -2016,6 +2022,9 @@ static const struct of_device_id gpmi_nand_id_table=
[] =3D {
>  =09=09.compatible =3D "fsl,imx6sx-gpmi-nand",
>  =09=09.data =3D &gpmi_devdata_imx6sx,
>  =09}, {
> +=09=09.compatible =3D "fsl,imx6ul-gpmi-nand",
> +=09=09.data =3D (void *)&gpmi_devdata_imx6ul,
> +=09}, {
>  =09=09.compatible =3D "fsl,imx7d-gpmi-nand",
>  =09=09.data =3D (void *)&gpmi_devdata_imx7d,
>  =09}
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.h
> index 36ffeda..8428637 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -125,7 +125,8 @@ enum gpmi_type {
>  =09IS_MX6Q,
>  =09IS_MX6QP,
>  =09IS_MX6SX,
> -=09IS_MX7D
> +=09IS_MX7D,
> +=09IS_MX6UL
>  };
> =20
>  struct gpmi_devdata {
> @@ -310,8 +311,9 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX6QP(x)=09((x)->devdata->type =3D=3D IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)=09((x)->devdata->type =3D=3D IS_MX6SX)
>  #define GPMI_IS_MX7D(x)=09=09((x)->devdata->type =3D=3D IS_MX7D)
> +#define GPMI_IS_MX6UL(x)=09((x)->devdata->type =3D=3D IS_MX6UL)
> =20
>  #define GPMI_IS_MX6(x)=09=09(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
> -=09   || GPMI_IS_MX6SX(x))
> +=09   || GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))
>  #define GPMI_IS_MX7(x)=09=09(GPMI_IS_MX7D(x))
>  #endif
> --=20
Acked-by: Huang Shijie <shijie.huang@arm.com>
