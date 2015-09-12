Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zaq0S-0006hb-7Q
 for linux-mtd@lists.infradead.org; Sat, 12 Sep 2015 18:58:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 38F3D28C13F
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2015 20:56:52 +0200 (CEST)
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
 [209.85.217.172])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 990E028C11A
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2015 20:56:38 +0200 (CEST)
Received: by lbbmp1 with SMTP id mp1so52986662lbb.1
 for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2015 11:57:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440586128-4325-1-git-send-email-jteki@openedev.com>
References: <1440586128-4325-1-git-send-email-jteki@openedev.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Sat, 12 Sep 2015 20:57:26 +0200
Message-ID: <CAOiHx==cezDeBPDLLo4VU3=J44fVxWAJqQFrKdqNA+Ye9YdP-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: Add clear flag status register
 support
To: Jagan Teki <jteki@openedev.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Hou Zhiqiang <B48286@freescale.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Mingkai.Hu" <Mingkai.Hu@freescale.com>,
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

On Wed, Aug 26, 2015 at 12:48 PM, Jagan Teki <jteki@openedev.com> wrote:
> The clear flag status register operation is required by Micron
> SPI-NOR chips, which support FSR. And if error bits of FSR
> have been set like protection, voltage, erase, and program,
> it must be cleared by executing clear FSR operation.
>
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> Cc: Hou Zhiqiang <B48286@freescale.com>
> Cc: Mingkai.Hu <Mingkai.Hu@freescale.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> Changes for v2:
>         - Write cfsr instead of reading it.
>         - Return -EINVAL instead of -1
>
>  drivers/mtd/spi-nor/spi-nor.c | 23 +++++++++++++++++++----
>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>  2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f954d03..0a77061 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -163,6 +163,18 @@ static inline int write_disable(struct spi_nor *nor)
>         return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
>  }
>
> +/*
> + * The clear flag status register operation is required by Micron
> + * SPI-NOR chips, which support FSR. And if error bits of FSR
> + * have been set like protection, voltage, erase, and program,
> + * it must be cleared by executing clear FSR operation.
> + * Returns negative if error occurred.
> + */
> +static inline int write_cfsr(struct spi_nor *nor)
> +{
> +       return nor->write_reg(nor, SPINOR_OP_WRCFSR, NULL, 0);
> +}
> +
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>         return mtd->priv;
> @@ -209,10 +221,13 @@ static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  {
>         int fsr = read_fsr(nor);
> -       if (fsr < 0)
> -               return fsr;

While it's rather unlikely that read_fsr() will return -EBFONT (which
has neither of the FSR_ERR_MASK bits set), you should keep the check
for negative return value intact.

> -       else
> -               return fsr & FSR_READY;
> +       if (fsr & FSR_ERR_MASK) {

Also the N25Q032 data sheet says that these bits are only valid if
FSR_READY is set. so you should bail out early if it isn't, and check
the error bits only if it is set.

> +               pr_err("flag status(0x%x) error occured\n", fsr);

I suggest using a better error message than "flag status() error
occured" and maybe even decode the error bits, so it's obvious what
kind of error is there without looking at the #defines or a data
sheet. Not sure about a better wording though, "last operation failed
for the following reason:%s%s%s\n", fsr & FSR_ERR_PROT  ? " PROT" :
"", fsr & ...

> +               write_cfsr(nor);

I'm not sure if a is_ready() function should clear the error bits, and
rather the functions that can cause these to be set should be made
aware of it and checking them (and then cleaning them), but maybe that
would require a rewrite how some functions are done.

> +               return -EINVAL;

Also I wonder if there are more appropriate error values here than
-EINVAL, e.g. -EPERM if FSR_ERR_PROT is set, else -EIO if
FSR_ERR_ERASE or FSR_ERR_PROG are set.

> +       }
> +
> +       return fsr & FSR_READY;
>  }


Jonas
