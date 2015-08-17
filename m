Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRNGz-0005n9-6J
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 16:28:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id A0F71281570
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 18:27:18 +0200 (CEST)
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
 [209.85.215.44])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 1264E28C1A9
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 18:27:11 +0200 (CEST)
Received: by lahi9 with SMTP id i9so82234644lah.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 09:27:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439785625-36183-1-git-send-email-B48286@freescale.com>
References: <1439785625-36183-1-git-send-email-B48286@freescale.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Mon, 17 Aug 2015 18:27:36 +0200
Message-ID: <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
Subject: Re: [PATCH V6] mtd: m25p80: Modify the name of mtd_info
To: Zhiqiang Hou <B48286@freescale.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Mingkai.Hu@freescale.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 mike@steroidmicros.com
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

On Mon, Aug 17, 2015 at 6:27 AM, Zhiqiang Hou <B48286@freescale.com> wrote:
> From: Hou Zhiqiang <B48286@freescale.com>
>
> Set the mtd_info's name to a fixed one, so spi flash layouts can
> be specified by "mtdparts=..." in kernel cmdline, because the
> cmdlinepart's parser will match the name of mtd_info with the name
> given in cmdline.
>
> So far, if DT is used, the mtd_info's name will be set to the name
> of spi->dev. It includes spi_master->bus_num, and the bus_num may
> be dynamically allocated. So, replace the component bus_num with
> the physical address of spi controller.

You can easily enforce fixed bus numers in linux using aliases in the
DT, this is supported
by the spi core since v3.9 or so.

Also won't this change break it for everyone relying on the old naming
in their commandline mtdparts?

>
> Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
> ---
> V6:
>         Removed the sentence return error number when allocating the
>         mtd_info's name failed.
> V5:
>         Rebase this patch on the latest l2-mtd tree.
> V4:
>         add check no-NULL for pointer of master's device node, and if it failed
>         to get physcial address of the master, then name the mtd_info by the
>         name of spi->dev.
> V3:
>         Fix a bug, matching unsigned long long with "%llx".
> V2:
>         1. Fix some code style issue.
>         2. Cast physical address to unsigned long long.
>
>  drivers/mtd/devices/m25p80.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d313f948b..35d11c3 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -26,6 +26,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/of_address.h>
>
>  #define        MAX_CMD_SIZE            6
>  struct m25p {
> @@ -183,6 +184,8 @@ static int m25p_probe(struct spi_device *spi)
>         struct spi_nor *nor;
>         enum read_mode mode = SPI_NOR_NORMAL;
>         char *flash_name = NULL;
> +       struct resource res;
> +       struct device_node *mnp = spi->master->dev.of_node;
>         int ret;
>
>         data = dev_get_platdata(&spi->dev);
> @@ -215,6 +218,16 @@ static int m25p_probe(struct spi_device *spi)
>
>         if (data && data->name)
>                 flash->mtd.name = data->name;
> +       else if (mnp) {

Style nitpick: you need do add { } to the first if as well. checkpatch
should have complained.

> +               ret = of_address_to_resource(mnp, 0, &res);
> +               if (!ret)
> +                       flash->mtd.name = kasprintf(GFP_KERNEL, "spi%llx.%d",
> +                                       (unsigned long long)res.start,
> +                                       spi->chip_select);
> +               else
> +                       dev_dbg(&spi->dev,
> +                               "Failed to get spi master resource\n");


Regards
Jonas
