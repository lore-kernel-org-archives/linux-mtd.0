Received: from mail-yk0-x22c.google.com ([2607:f8b0:4002:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XooIr-0006Fs-Ms
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 06:54:50 +0000
Received: by mail-yk0-f172.google.com with SMTP id 10so5148022ykt.31
 for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2014 22:54:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1415634895-3082-2-git-send-email-alison_chaiken@mentor.com>
References: <1415634895-3082-1-git-send-email-alison_chaiken@mentor.com>
 <1415634895-3082-2-git-send-email-alison_chaiken@mentor.com>
Date: Thu, 13 Nov 2014 12:24:27 +0530
Message-ID: <CAD6G_RRdjjim_H_Vm1=_TaVWCW+S8bTV4Q0mWQeG8fmnQXaeRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: m25p80: Add support for serial flash Spansion
 S25FL132K
From: Jagan Teki <jagannadh.teki@gmail.com>
To: alison_chaiken@mentor.com
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 ben@decadent.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 November 2014 21:24,  <alison_chaiken@mentor.com> wrote:
> From: Knut Wohlrab <knut.wohlrab@de.bosch.com>
>
> Signed-off-by: Knut Wohlrab <knut.wohlrab@de.bosch.com>
> Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>
>
> Conflicts:
>
>         drivers/mtd/devices/m25p80.c
> ---
>  drivers/mtd/devices/m25p80.c  | 4 +---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 35e7e98..2783e94 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -252,7 +252,6 @@ static int m25p_remove(struct spi_device *spi)
>         return mtd_device_unregister(&flash->mtd);
>  }
>
> -
>  /*
>   * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
>   * it with spi-nor, because if this is built as a module then modpost
> @@ -279,7 +278,7 @@ static const struct spi_device_id m25p_ids[] = {
>         {"s25fl512s"},  {"s70fl01gs"},  {"s25sl12800"}, {"s25sl12801"},
>         {"s25fl129p0"}, {"s25fl129p1"}, {"s25sl004a"},  {"s25sl008a"},
>         {"s25sl016a"},  {"s25sl032a"},  {"s25sl064a"},  {"s25fl008k"},
> -       {"s25fl016k"},  {"s25fl064k"},
> +       {"s25fl016k"},  {"s25fl064k"},  {"s25fl132k"},
>         {"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
>         {"sst25vf064c"},{"sst25wf512"}, {"sst25wf010"}, {"sst25wf020"},
>         {"sst25wf040"},
> @@ -302,7 +301,6 @@ static const struct spi_device_id m25p_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
>
> -
>  static struct spi_driver m25p80_driver = {
>         .driver = {
>                 .name   = "m25p80",
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index eafaeeb..7b468a6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -559,6 +559,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>         { "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K) },
>         { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
>         { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> +       { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, 0) },
>
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
> --

Reviewed-by: Jagannadha Sutradharudu Teki <jagannadh.teki@gmail.com>

thanks!
-- 
Jagan.
