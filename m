Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPCYe-00032c-Gl
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 17:42:36 +0000
Received: by mail-vk0-x234.google.com with SMTP id w127so190541077vkh.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 10:42:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468863377-31862-2-git-send-email-ray.jui@broadcom.com>
References: <1468863377-31862-1-git-send-email-ray.jui@broadcom.com>
 <1468863377-31862-2-git-send-email-ray.jui@broadcom.com>
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Mon, 18 Jul 2016 10:41:58 -0700
Message-ID: <CAGt4E5tyANE-fiRNp=qZHLJLp+XCd0i74E0n2vgedQC5Rb46+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: brcmnand: iProc big endian and ONFI support
To: Ray Jui <ray.jui@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 Prafulla Kota <prafulla.kota@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 July 2016 at 10:36, Ray Jui <ray.jui@broadcom.com> wrote:
> This patch adds big endian and ONFI support for various iProc based
> SoCs that use the core brcmstb NAND controller
>
> This patch was originally implemented by Prafulla Kota
> <prafulla.kota@broadcom.com> and fully tested on iProc based NS2 SVK
>
> Signed-off-by: Prafulla Kota <prafulla.kota@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c   | 12 ++++++------
>  drivers/mtd/nand/brcmnand/brcmnand.h   | 13 ++++++++-----
>  drivers/mtd/nand/brcmnand/iproc_nand.c | 17 +++++++++++++----
>  3 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index b76ad7c..12a1585 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1279,7 +1279,7 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
>                 u32 *flash_cache = (u32 *)ctrl->flash_cache;
>                 int i;
>
> -               brcmnand_soc_data_bus_prepare(ctrl->soc);
> +               brcmnand_soc_data_bus_prepare(ctrl->soc, true);
>
>                 /*
>                  * Must cache the FLASH_CACHE now, since changes in
> @@ -1292,7 +1292,7 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
>                          */
>                         flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
>
> -               brcmnand_soc_data_bus_unprepare(ctrl->soc);
> +               brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
>
>                 /* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
>                 if (host->hwcfg.sector_size_1k)
> @@ -1508,12 +1508,12 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>                 brcmnand_waitfunc(mtd, chip);
>
>                 if (likely(buf)) {
> -                       brcmnand_soc_data_bus_prepare(ctrl->soc);
> +                       brcmnand_soc_data_bus_prepare(ctrl->soc, false);
>
>                         for (j = 0; j < FC_WORDS; j++, buf++)
>                                 *buf = brcmnand_read_fc(ctrl, j);
>
> -                       brcmnand_soc_data_bus_unprepare(ctrl->soc);
> +                       brcmnand_soc_data_bus_unprepare(ctrl->soc, false);
>                 }
>
>                 if (oob)
> @@ -1678,12 +1678,12 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
>                 (void)brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
>
>                 if (buf) {
> -                       brcmnand_soc_data_bus_prepare(ctrl->soc);
> +                       brcmnand_soc_data_bus_prepare(ctrl->soc, false);
>
>                         for (j = 0; j < FC_WORDS; j++, buf++)
>                                 brcmnand_write_fc(ctrl, j, *buf);
>
> -                       brcmnand_soc_data_bus_unprepare(ctrl->soc);
> +                       brcmnand_soc_data_bus_unprepare(ctrl->soc, false);
>                 } else if (oob) {
>                         for (j = 0; j < FC_WORDS; j++)
>                                 brcmnand_write_fc(ctrl, j, 0xffffffff);
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
> index ef5eabb..5c44cd4 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.h
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.h
> @@ -23,19 +23,22 @@ struct dev_pm_ops;
>  struct brcmnand_soc {
>         bool (*ctlrdy_ack)(struct brcmnand_soc *soc);
>         void (*ctlrdy_set_enabled)(struct brcmnand_soc *soc, bool en);
> -       void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
> +       void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare,
> +                                bool is_param);
>  };
>
> -static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc)
> +static inline void brcmnand_soc_data_bus_prepare(struct brcmnand_soc *soc,
> +                                                bool is_param)
>  {
>         if (soc && soc->prepare_data_bus)
> -               soc->prepare_data_bus(soc, true);
> +               soc->prepare_data_bus(soc, true, is_param);
>  }
>
> -static inline void brcmnand_soc_data_bus_unprepare(struct brcmnand_soc *soc)
> +static inline void brcmnand_soc_data_bus_unprepare(struct brcmnand_soc *soc,
> +                                                  bool is_param)
>  {
>         if (soc && soc->prepare_data_bus)
> -               soc->prepare_data_bus(soc, false);
> +               soc->prepare_data_bus(soc, false, is_param);
>  }
>
>  static inline u32 brcmnand_readl(void __iomem *addr)
> diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c b/drivers/mtd/nand/brcmnand/iproc_nand.c
> index 585596c..d98ca0b 100644
> --- a/drivers/mtd/nand/brcmnand/iproc_nand.c
> +++ b/drivers/mtd/nand/brcmnand/iproc_nand.c
> @@ -74,7 +74,8 @@ static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
>         spin_unlock_irqrestore(&priv->idm_lock, flags);
>  }
>
> -static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
> +static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare,
> +                                 bool is_param)
>  {
>         struct iproc_nand_soc *priv =
>                         container_of(soc, struct iproc_nand_soc, soc);
> @@ -86,9 +87,17 @@ static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
>
>         val = brcmnand_readl(mmio);
>
> -       if (prepare)
> -               val |= IPROC_NAND_APB_LE_MODE;
> -       else
> +       /*
> +        * In the case of BE or when dealing with NAND data, alway configure
> +        * the APB bus to LE mode before accessing the FIFO and back to BE mode
> +        * after the access is done
> +        */
> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) || !is_param) {
> +               if (prepare)
> +                       val |= IPROC_NAND_APB_LE_MODE;
> +               else
> +                       val &= ~IPROC_NAND_APB_LE_MODE;
> +       } else /* when in LE accessing the parameter page, keep APB in BE */

The coding guidelines state that if you need braces around one branch
of an if/else combination, you must use them on the other branch,
also, even if the other branch is just one line.

>                 val &= ~IPROC_NAND_APB_LE_MODE;
>
>         brcmnand_writel(val, mmio);
> --
> 2.1.4
>
