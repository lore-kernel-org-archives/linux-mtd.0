Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDyMs-0005PW-GP
 for linux-mtd@lists.infradead.org; Sat, 11 Jul 2015 17:15:14 +0000
Received: by iecuq6 with SMTP id uq6so213375218iec.2
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jul 2015 10:14:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1436515808-45639-1-git-send-email-haikun.wang@freescale.com>
References: <1436515808-45639-1-git-send-email-haikun.wang@freescale.com>
Date: Sat, 11 Jul 2015 19:14:52 +0200
Message-ID: <CACna6rwo-jMcCtC4kR2CmV7fWf-b2-OSEce=S33SWRYMM5G2cA@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Get mtd_info->name from spi_device as the
 second choice
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Haikun Wang <haikun.wang@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
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

On 10 July 2015 at 10:10, Haikun Wang <haikun.wang@freescale.com> wrote:
> If we can't get "mtd_info->name" form struct flash_platform_data,
> get it from "spi_device".
>
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d313f948b..ebac9e5 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -215,6 +215,8 @@ static int m25p_probe(struct spi_device *spi)
>
>         if (data && data->name)
>                 flash->mtd.name = data->name;
> +       else
> +               flash->mtd.name = dev_name(&spi->dev);

I'm curious. Is this for changing kernel messages to include some nice
name? Can you give us an example of before vs. after?
