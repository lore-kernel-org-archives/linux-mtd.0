Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9x6Q-0006tQ-0J
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 15:05:38 +0000
Received: by igcsj18 with SMTP id sj18so109232493igc.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2015 08:05:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
Date: Tue, 30 Jun 2015 20:35:15 +0530
Message-ID: <CAM=Q2cverJLnbUBtyR6S3on79W6cmf8doPAd6T22WwbeqTfkTA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-mtd@lists.infradead.org, git@xilinx.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, beanhuo@micron.com,
 David Woodhouse <dwmw2@infradead.org>, computersforpeace@gmail.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 30, 2015 at 4:47 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Micron QUAD mode expects command, address and data on 4 lanes instead of just
> one for command (extended SPI mode). This requires the controller to be in a
> special mode, so check first if the controller could be in that mode. If a
> controller does not have the SPI_TX_QUAD mode set, this setting has no chance
> of being valid at all, so don't try to enable it then, and just keep using
> the extended SPI mode.
>
> Tested on a Zynq 7000 with a n25q256a flash chip, this failed to function
> because of the introduction of:
> "driver:mtd:spi-nor: Add quad I/O support for Micron spi nor"
> This commit sets QUAD mode for most Micron chips without asking the controller
> whether it's possible to do so, and without telling the controller that a
> different mode is required, so it couldn't work.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e8f6131..10ba94f 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
>                 }
>                 return status;
>         case CFI_MFR_ST:
> +               if (!(nor->spi->mode & SPI_TX_QUAD))
> +                       return 0;

Should we return 0 ?

>                 status = micron_quad_enable(nor);
>                 if (status) {
>                         dev_err(nor->dev, "Micron quad-read not enabled\n");
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
