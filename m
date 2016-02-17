Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWAi5-0004No-Ho
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2016 22:36:38 +0000
Received: by mail-ob0-x22f.google.com with SMTP id gc3so37498000obb.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Feb 2016 14:36:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <33838116.gL72islO6s@adelgunde>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-7-git-send-email-b45815@freescale.com>
 <20160123230147.GJ24744@localhost> <33838116.gL72islO6s@adelgunde>
Date: Wed, 17 Feb 2016 16:36:16 -0600
Message-ID: <CA+EcR22e-x=N5Qf-127E7hWnU9PF+U9rOw89JrP+Xo=vXdKZ=A@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] mtd: nand: gpmi: correct bitflip for erased NAND
 page
From: Han Xu <xhnjupt@gmail.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Vinod Koul <vinod.koul@intel.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Han Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Huang Shijie <shijie.huang@arm.com>, dan.j.williams@intel.com,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 2, 2016 at 7:28 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> Hi,
>
> On Saturday, January 23, 2016 03:01:47 PM Brian Norris wrote:
>> + Markus Pargmann
>>
>> On Wed, Dec 02, 2015 at 04:47:45PM -0600, Han Xu wrote:
>> > i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
>> > bitflip number for erased NAND page. So for these two platform, set the
>> > erase threshold to ecc_strength and if bitflip detected, GPMI driver will
>> > correct the data to all 0xFF.
>>
>> Looks like Marcus is also trying to add SW correction for the same
>> issue:
>>
>> http://patchwork.ozlabs.org/patch/559557/
>>
>> How do those 2 interact (if at all)?
>
> Thanks for CCing.
>
>>
>> Brian
>>
>> > Signed-off-by: Han Xu <b45815@freescale.com>
>> > ---
>> >  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
>> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
>> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 +++++++++++++++++++++++-
>> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  5 ++++-
>> >  4 files changed, 42 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> > index 53e58bc..a84d72b 100644
>> > --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> > +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
>> > @@ -30,7 +30,13 @@
>> >  #define BM_BCH_CTRL_COMPLETE_IRQ           (1 << 0)
>> >
>> >  #define HW_BCH_STATUS0                             0x00000010
>> > +
>> >  #define HW_BCH_MODE                                0x00000020
>> > +#define BP_BCH_MODE_ERASE_THRESHOLD                0
>> > +#define BM_BCH_MODE_ERASE_THRESHOLD        (0xff << BP_BCH_MODE_ERASE_THRESHOLD)
>> > +#define BF_BCH_MODE_ERASE_THRESHOLD(v)             \
>> > +   (((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD)
>> > +
>> >  #define HW_BCH_ENCODEPTR                   0x00000030
>> >  #define HW_BCH_DATAPTR                             0x00000040
>> >  #define HW_BCH_METAPTR                             0x00000050
>> > @@ -125,4 +131,8 @@
>> >     )
>> >
>> >  #define HW_BCH_VERSION                             0x00000160
>> > +#define HW_BCH_DEBUG1                              0x00000170
>> > +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT    0
>> > +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT            \
>> > +           (0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
>> >  #endif
>> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> > index 1f26a79..0548d84 100644
>> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>> > @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>> >                     | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>> >                     r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>> >
>> > +   /* Set erase threshold to ecc_strength for mx6qp and mx7 */
>> > +   if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
>> > +           writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
>> > +                   r->bch_regs + HW_BCH_MODE);
>
> This is probably different on imx6qp and imx7?!
> On the other imx6 processors, setting this will instruct the BCH engine
> to allow 'ecc_strength' number of bitflips in an erased area without a
> reported ECC error. Unfortunately it does not fix the bitflips.
>
> So what happens on imx6q,dl,s in this case:
> 1) BCH detects bitflips in the erased page, but ignores them due to the
> ERASE_THRESHOLD setting up to 'ecc_strength' bitflips.
> 2) The gpmi driver does not notice any errors as BCH did not set that
> there is any ECC error in the data. So the driver assumes correct data
> and does not fix the existing bitflips in the erased page.
> 3) UBI does not see any ECC errors and does not check the page.
> 4) UBIFS does check the content of erased pages at some points and
> breaks at this point. The filesystem can't be mounted anymore.
>
> This is why I added my patch a software check in case of an
> uncorrectable ECC error. The ERASE_THRESHOLD has to be 0 for this to
> work.
>
> As this patch only affects imx6qp and imx7, I assume that there is a
> better mechanism now.

IC team add this new feature in i.mx6qp and i.mx7 for bitflip, which
provide a easy way to fix the issue, while we still need some SW check
for other i.mx6 platforms. So these patches don't conflict with
others.

Han Xu

>
> Best Regards,
>
> Markus
>
>> > +
>> >     /* Set *all* chip selects to use layout 0. */
>> >     writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>> >
>> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> > index 9f67f0f..9dea56e 100644
>> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> > @@ -71,6 +71,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6q = {
>> >     .max_chain_delay = 12,
>> >  };
>> >
>> > +static const struct gpmi_devdata gpmi_devdata_imx6qp = {
>> > +   .type = IS_MX6QP,
>> > +   .bch_max_ecc_strength = 40,
>> > +   .max_chain_delay = 12,
>> > +};
>> > +
>> >  static const struct gpmi_devdata gpmi_devdata_imx6sx = {
>> >     .type = IS_MX6SX,
>> >     .bch_max_ecc_strength = 62,
>> > @@ -1010,6 +1016,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >  {
>> >     struct gpmi_nand_data *this = chip->priv;
>> >     struct bch_geometry *nfc_geo = &this->bch_geometry;
>> > +   void __iomem *bch_regs = this->resources.bch_regs;
>> >     void          *payload_virt;
>> >     dma_addr_t    payload_phys;
>> >     void          *auxiliary_virt;
>> > @@ -1018,6 +1025,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >     unsigned char *status;
>> >     unsigned int  max_bitflips = 0;
>> >     int           ret;
>> > +   int flag = 0;
>> >
>> >     dev_dbg(this->dev, "page number is : %d\n", page);
>> >     ret = read_page_prepare(this, buf, nfc_geo->payload_size,
>> > @@ -1050,9 +1058,16 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >     status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
>> >
>> >     for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
>> > -           if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
>> > +           if (*status == STATUS_GOOD)
>> >                     continue;
>> >
>> > +           if (*status == STATUS_ERASED) {
>> > +                   if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
>> > +                           if (readl(bch_regs + HW_BCH_DEBUG1))
>> > +                                   flag = 1;
>> > +                   continue;
>> > +           }
>> > +
>> >             if (*status == STATUS_UNCORRECTABLE) {
>> >                     mtd->ecc_stats.failed++;
>> >                     continue;
>> > @@ -1081,6 +1096,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> >                     nfc_geo->payload_size,
>> >                     payload_virt, payload_phys);
>> >
>> > +   /* if bitflip occurred in erased page, change data to all 0xff */
>> > +   if (flag)
>> > +           memset(buf, 0xff, nfc_geo->payload_size);
>> > +
>> >     return max_bitflips;
>> >  }
>> >
>> > @@ -1990,6 +2009,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>> >             .compatible = "fsl,imx6q-gpmi-nand",
>> >             .data = &gpmi_devdata_imx6q,
>> >     }, {
>> > +           .compatible = "fsl,imx6qp-gpmi-nand",
>> > +           .data = (void *)&gpmi_devdata_imx6qp,
>> > +   }, {
>> >             .compatible = "fsl,imx6sx-gpmi-nand",
>> >             .data = &gpmi_devdata_imx6sx,
>> >     }, {
>> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
>> > index 58b3d69..149a442 100644
>> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
>> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
>> > @@ -123,6 +123,7 @@ enum gpmi_type {
>> >     IS_MX23,
>> >     IS_MX28,
>> >     IS_MX6Q,
>> > +   IS_MX6QP,
>> >     IS_MX6SX,
>> >     IS_MX7D,
>> >  };
>> > @@ -306,9 +307,11 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>> >  #define GPMI_IS_MX23(x)            ((x)->devdata->type == IS_MX23)
>> >  #define GPMI_IS_MX28(x)            ((x)->devdata->type == IS_MX28)
>> >  #define GPMI_IS_MX6Q(x)            ((x)->devdata->type == IS_MX6Q)
>> > +#define GPMI_IS_MX6QP(x)   ((x)->devdata->type == IS_MX6QP)
>> >  #define GPMI_IS_MX6SX(x)   ((x)->devdata->type == IS_MX6SX)
>> >  #define GPMI_IS_MX7D(x)            ((x)->devdata->type == IS_MX7D)
>> >
>> > -#define GPMI_IS_MX6(x)             (GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
>> > +#define GPMI_IS_MX6(x)             (GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
>> > +      || GPMI_IS_MX6SX(x))
>> >  #define GPMI_IS_MX7(x)             (GPMI_IS_MX7D(x))
>> >  #endif
>>
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
