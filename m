Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9O2w-0004LW-Sk
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 02:12:00 +0000
Date: Thu, 17 Dec 2015 02:11:22 +0000
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <fabio.estevam@freescale.com>,
 <hofrat@osadl.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <vinod.koul@intel.com>,
 <dan.j.williams@intel.com>, <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v8 6/7] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Message-ID: <20151217021121.GD631@robwan01-pc.asiapac.arm.com>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-7-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1449096466-18064-7-git-send-email-b45815@freescale.com>
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

On Wed, Dec 02, 2015 at 04:47:45PM -0600, Han Xu wrote:
> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to ecc_strength and if bitflip detected, GPMI driver will
> correct the data to all 0xFF.
>
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 +++++++++++++++++++++++-
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  5 ++++-
>  4 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpm=
i-nand/bch-regs.h
> index 53e58bc..a84d72b 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,13 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ             (1 << 0)
>
>  #define HW_BCH_STATUS0                               0x00000010
> +
>  #define HW_BCH_MODE                          0x00000020
> +#define BP_BCH_MODE_ERASE_THRESHOLD          0
> +#define BM_BCH_MODE_ERASE_THRESHOLD  (0xff << BP_BCH_MODE_ERASE_THRESHOL=
D)
> +#define BF_BCH_MODE_ERASE_THRESHOLD(v)               \
> +     (((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD=
)
> +
>  #define HW_BCH_ENCODEPTR                     0x00000030
>  #define HW_BCH_DATAPTR                               0x00000040
>  #define HW_BCH_METAPTR                               0x00000050
> @@ -125,4 +131,8 @@
>       )
>
>  #define HW_BCH_VERSION                               0x00000160
> +#define HW_BCH_DEBUG1                                0x00000170
> +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT      0
> +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT              \
> +             (0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
>  #endif
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 1f26a79..0548d84 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>                       | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this)=
,
>                       r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>
> +     /* Set erase threshold to ecc_strength for mx6qp and mx7 */
> +     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +             writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> +                     r->bch_regs + HW_BCH_MODE);
> +
>       /* Set *all* chip selects to use layout 0. */
>       writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 9f67f0f..9dea56e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -71,6 +71,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6q =
=3D {
>       .max_chain_delay =3D 12,
>  };
>
> +static const struct gpmi_devdata gpmi_devdata_imx6qp =3D {
> +     .type =3D IS_MX6QP,
> +     .bch_max_ecc_strength =3D 40,
> +     .max_chain_delay =3D 12,
> +};
> +
>  static const struct gpmi_devdata gpmi_devdata_imx6sx =3D {
>       .type =3D IS_MX6SX,
>       .bch_max_ecc_strength =3D 62,
> @@ -1010,6 +1016,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
>  {
>       struct gpmi_nand_data *this =3D chip->priv;
>       struct bch_geometry *nfc_geo =3D &this->bch_geometry;
> +     void __iomem *bch_regs =3D this->resources.bch_regs;
>       void          *payload_virt;
>       dma_addr_t    payload_phys;
>       void          *auxiliary_virt;
> @@ -1018,6 +1025,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
>       unsigned char *status;
>       unsigned int  max_bitflips =3D 0;
>       int           ret;
> +     int flag =3D 0;
>
>       dev_dbg(this->dev, "page number is : %d\n", page);
>       ret =3D read_page_prepare(this, buf, nfc_geo->payload_size,
> @@ -1050,9 +1058,16 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
>       status =3D auxiliary_virt + nfc_geo->auxiliary_status_offset;
>
>       for (i =3D 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -             if ((*status =3D=3D STATUS_GOOD) || (*status =3D=3D STATUS_=
ERASED))
> +             if (*status =3D=3D STATUS_GOOD)
>                       continue;
>
> +             if (*status =3D=3D STATUS_ERASED) {
> +                     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +                             if (readl(bch_regs + HW_BCH_DEBUG1))
> +                                     flag =3D 1;
> +                     continue;
> +             }
> +
>               if (*status =3D=3D STATUS_UNCORRECTABLE) {
>                       mtd->ecc_stats.failed++;
>                       continue;
> @@ -1081,6 +1096,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
>                       nfc_geo->payload_size,
>                       payload_virt, payload_phys);
>
> +     /* if bitflip occurred in erased page, change data to all 0xff */
> +     if (flag)
> +             memset(buf, 0xff, nfc_geo->payload_size);
> +
>       return max_bitflips;
>  }
>
> @@ -1990,6 +2009,9 @@ static const struct of_device_id gpmi_nand_id_table=
[] =3D {
>               .compatible =3D "fsl,imx6q-gpmi-nand",
>               .data =3D &gpmi_devdata_imx6q,
>       }, {
> +             .compatible =3D "fsl,imx6qp-gpmi-nand",
> +             .data =3D (void *)&gpmi_devdata_imx6qp,
> +     }, {
>               .compatible =3D "fsl,imx6sx-gpmi-nand",
>               .data =3D &gpmi_devdata_imx6sx,
>       }, {
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.h
> index 58b3d69..149a442 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -123,6 +123,7 @@ enum gpmi_type {
>       IS_MX23,
>       IS_MX28,
>       IS_MX6Q,
> +     IS_MX6QP,
>       IS_MX6SX,
>       IS_MX7D,
>  };
> @@ -306,9 +307,11 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX23(x)              ((x)->devdata->type =3D=3D IS_MX23)
>  #define GPMI_IS_MX28(x)              ((x)->devdata->type =3D=3D IS_MX28)
>  #define GPMI_IS_MX6Q(x)              ((x)->devdata->type =3D=3D IS_MX6Q)
> +#define GPMI_IS_MX6QP(x)     ((x)->devdata->type =3D=3D IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)     ((x)->devdata->type =3D=3D IS_MX6SX)
>  #define GPMI_IS_MX7D(x)              ((x)->devdata->type =3D=3D IS_MX7D)
>
> -#define GPMI_IS_MX6(x)               (GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x=
))
> +#define GPMI_IS_MX6(x)               (GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x=
)\
> +        || GPMI_IS_MX6SX(x))
>  #define GPMI_IS_MX7(x)               (GPMI_IS_MX7D(x))
>  #endif
> --
> 1.9.1
>
Very good feature.

Acked-by: Huang Shijie <shijie.huang@arm.com>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
