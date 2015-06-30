Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9tju-0004nU-4w
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 11:30:11 +0000
Received: by lagh6 with SMTP id h6so9282148lag.2
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2015 04:29:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
Date: Tue, 30 Jun 2015 16:59:46 +0530
Message-ID: <CAFcVEC+Xq-oE59obYxGGRwE7h9NtuBviD3jpvyt5gEiJsvqb2Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
From: Harini Katakam <harinikatakamlinux@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, git@xilinx.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, beanhuo@micron.com
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

Reviewed-by: Harini Katakam <harinik@xilinx.com>

Regards,
Harini

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
>                 status = micron_quad_enable(nor);
>                 if (status) {
>                         dev_err(nor->dev, "Micron quad-read not enabled\n");
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
