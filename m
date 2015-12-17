Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9Nz9-00022B-Pl
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 02:08:04 +0000
Date: Thu, 17 Dec 2015 02:07:28 +0000
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <fabio.estevam@freescale.com>,
 <hofrat@osadl.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <vinod.koul@intel.com>,
 <dan.j.williams@intel.com>, <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v8 7/7] mtd: nand: gpmi: support NAND on i.MX6UL
Message-ID: <20151217020726.GA631@robwan01-pc.asiapac.arm.com>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-8-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1449096466-18064-8-git-send-email-b45815@freescale.com>
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

On Wed, Dec 02, 2015 at 04:47:46PM -0600, Han Xu wrote:
> support GPMI NAND on i.MX6UL
>
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 4 +++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 9dea56e..41d9012 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d =
=3D {
>       .max_chain_delay =3D 12,
>  };
>
> +static const struct gpmi_devdata gpmi_devdata_imx6ul =3D {
> +     .type =3D IS_MX6UL,
> +     .bch_max_ecc_strength =3D 40,
> +     .max_chain_delay =3D 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>       struct gpmi_nand_data *this =3D cookie;
> @@ -2015,6 +2021,9 @@ static const struct of_device_id gpmi_nand_id_table=
[] =3D {
>               .compatible =3D "fsl,imx6sx-gpmi-nand",
>               .data =3D &gpmi_devdata_imx6sx,
>       }, {
> +             .compatible =3D "fsl,imx6ul-gpmi-nand",
> +             .data =3D (void *)&gpmi_devdata_imx6ul,
> +     }, {
>               .compatible =3D "fsl,imx7d-gpmi-nand",
>               .data =3D (void *)&gpmi_devdata_imx7d,
>       }, { /* sentinel */ }
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.h
> index 149a442..331f98e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -126,6 +126,7 @@ enum gpmi_type {
>       IS_MX6QP,
>       IS_MX6SX,
>       IS_MX7D,
> +     IS_MX6UL,
>  };
>
>  struct gpmi_devdata {
> @@ -310,8 +311,9 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX6QP(x)     ((x)->devdata->type =3D=3D IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)     ((x)->devdata->type =3D=3D IS_MX6SX)
>  #define GPMI_IS_MX7D(x)              ((x)->devdata->type =3D=3D IS_MX7D)
> +#define GPMI_IS_MX6UL(x)     ((x)->devdata->type =3D=3D IS_MX6UL)
>
>  #define GPMI_IS_MX6(x)               (GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x=
)\
> -        || GPMI_IS_MX6SX(x))
> +        || GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))
>  #define GPMI_IS_MX7(x)               (GPMI_IS_MX7D(x))
>  #endif
> --
> 1.9.1
>
Acked-by: Huang Shijie <shijie.huang@arm.com>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
