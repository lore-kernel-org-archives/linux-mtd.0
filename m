Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSn7C-0005Uy-6L
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 14:16:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 7449728C17C
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 16:14:57 +0200 (CEST)
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
 [209.85.215.41])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 13A292844A3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 16:14:42 +0200 (CEST)
Received: by lagz9 with SMTP id z9so42110278lag.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 07:15:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440148160-14355-1-git-send-email-marex@denx.de>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 21 Aug 2015 16:15:11 +0200
Message-ID: <CAOiHx==Vuc8CCF0rTr5E8A0n31oeAR=UA3PgGhKTwEzi5PH0Jw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
To: Marek Vasut <marex@denx.de>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Aug 21, 2015 at 11:09 AM, Marek Vasut <marex@denx.de> wrote:
> The problem this patch is trying to address is such, that SPI NOR flash
> devices attached to a dedicated SPI NOR controller cannot read their
> properties from the associated struct device_node.
>
> A couple of facts first:
> 1) Each SPI NOR flash has a struct spi_nor associated with it.
> 2) Each SPI NOR flash has certain device properties associated
>    with it, for example the OF property 'm25p,fast-read' is a
>    good pick. These properties are used by the SPI NOR core to
>    select which opcodes are sent to such SPI NOR flash. These
>    properties are coming from spi_nor .dev->device_node .

dev->of_node

>
> The problem is, that for SPI NOR controllers, the struct spi_nor .dev
> element points to the struct device of the SPI NOR controller, not the
> SPI NOR flash. Therefore, the associated dev->device_node also is the

dev->of_node

> one of the controller and therefore the SPI NOR core code is trying to
> parse the SPI NOR controller's properties, not the properties of the
> SPI NOR flash.
>
> Note: The m25p80 driver is not affected, because the controller and
>       the flash are the same device, so the associated device_node
>       of the controller and the flash are the same.
>
> This patch adjusts the SPI NOR core such that the device_node is not
> picked from spi_nor .dev directly, but from a new separate spi_nor .dn
> element. This let's the SPI NOR controller drivers set up a different
> spi_nor .dn element for each SPI NOR flash.
>
> This patch also fixes the controller drivers to be compatible with
> this modification and correctly set the spi_nor .dn element.
>
> This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> mtd: nand: add common DT init code

I know that this commit named it dn for nand, but IMHO "dn" isn't a
very readable member name, so I would suggest using something with
"node" in it (just using of_node as well seems to be common). I see no
place where the name length might become an issue.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c      | 1 +
>  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
>  drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
>  include/linux/mtd/spi-nor.h       | 3 +++
>  4 files changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cd3631..725320f 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -202,6 +202,7 @@ static int m25p_probe(struct spi_device *spi)
>
>         nor->dev = &spi->dev;
>         nor->mtd = &flash->mtd;
> +       nor->dn = &spi->dev.of_node;

drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
drivers/mtd/devices/m25p80.c:221:5: warning: assignment from
incompatible pointer type [enabled by default]

this needs to be ... = spi->dev.of_node;

>         nor->priv = flash;
>
>         spi_set_drvdata(spi, flash);
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index d32b7e0..f918a60 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -1017,6 +1017,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>
>                 nor->mtd = mtd;
>                 nor->dev = dev;
> +               nor->dn = np;
>                 nor->priv = q;
>                 mtd->priv = nor;
>
> diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
> index 9ad1dd0..3ed4564 100644
> --- a/drivers/mtd/spi-nor/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/nxp-spifi.c
> @@ -334,6 +334,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
>         spifi->mtd.priv  = &spifi->nor;
>         spifi->nor.mtd   = &spifi->mtd;
>         spifi->nor.dev   = spifi->dev;
> +       spifi->nor.dn    = np;
>         spifi->nor.priv  = spifi;
>         spifi->nor.read  = nxp_spifi_read;
>         spifi->nor.write = nxp_spifi_write;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 1bf6f11..333999d 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -169,6 +169,7 @@ enum spi_nor_option_flags {
>   * @lock:              [FLASH-SPECIFIC] lock a region of the SPI NOR
>   * @unlock:            [FLASH-SPECIFIC] unlock a region of the SPI NOR
>   * @priv:              the private data
> + * @dn:                        [BOARD-SPECIFIC] device node describing this instance
>   */
>  struct spi_nor {
>         struct mtd_info         *mtd;
> @@ -208,6 +209,8 @@ struct spi_nor {
>         int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>
>         void *priv;
> +
> +       struct device_node *dn;
>  };


Regards
Jonas
