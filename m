Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zp1Nf-0007uI-VO
 for linux-mtd@lists.infradead.org; Wed, 21 Oct 2015 21:57:12 +0000
Received: by vkgy127 with SMTP id y127so37088439vkg.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Oct 2015 14:56:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445463608-5836-7-git-send-email-b45815@freescale.com>
References: <1445463608-5836-1-git-send-email-b45815@freescale.com>
 <1445463608-5836-7-git-send-email-b45815@freescale.com>
Date: Wed, 21 Oct 2015 16:56:50 -0500
Message-ID: <CA+EcR20tw0a116zLH0k-kfSDXU5dz1f-p7FsBLRo7bCX9_Z9Mw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: nand: gpmi: support NAND on i.MX6UL
From: Han Xu <xhnjupt@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: Huang Shijie <shijie.huang@arm.com>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 boris.brezillon@free-electrons.com, Vinod Koul <vinod.koul@intel.com>,
 linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicholas Mc Guire <hofrat@osadl.org>,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 Brian Norris <computersforpeace@gmail.com>,
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

Sorry for sending the wrong patch series, please kindly ignore all
patch series v4 and only check the series v5.

On Wed, Oct 21, 2015 at 4:40 PM, Han Xu <b45815@freescale.com> wrote:
> support GPMI NAND on i.MX6UL
>
> Signed-off-by: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 4 +++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index e038258..ed4e874 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d = {
>         .max_chain_delay = 12,
>  };
>
> +static const struct gpmi_devdata gpmi_devdata_imx6ul = {
> +       .type = IS_MX6UL,
> +       .bch_max_ecc_strength = 40,
> +       .max_chain_delay = 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>         struct gpmi_nand_data *this = cookie;
> @@ -2016,6 +2022,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>                 .compatible = "fsl,imx6sx-gpmi-nand",
>                 .data = &gpmi_devdata_imx6sx,
>         }, {
> +               .compatible = "fsl,imx6ul-gpmi-nand",
> +               .data = (void *)&gpmi_devdata_imx6ul,
> +       }, {
>                 .compatible = "fsl,imx7d-gpmi-nand",
>                 .data = (void *)&gpmi_devdata_imx7d,
>         }
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> index 149a442..331f98e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -126,6 +126,7 @@ enum gpmi_type {
>         IS_MX6QP,
>         IS_MX6SX,
>         IS_MX7D,
> +       IS_MX6UL,
>  };
>
>  struct gpmi_devdata {
> @@ -310,8 +311,9 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX6QP(x)       ((x)->devdata->type == IS_MX6QP)
>  #define GPMI_IS_MX6SX(x)       ((x)->devdata->type == IS_MX6SX)
>  #define GPMI_IS_MX7D(x)                ((x)->devdata->type == IS_MX7D)
> +#define GPMI_IS_MX6UL(x)       ((x)->devdata->type == IS_MX6UL)
>
>  #define GPMI_IS_MX6(x)         (GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
> -          || GPMI_IS_MX6SX(x))
> +          || GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))
>  #define GPMI_IS_MX7(x)         (GPMI_IS_MX7D(x))
>  #endif
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
