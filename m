Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Nvb-0004It-Rc
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 20:48:33 +0000
Received: by mail-wm0-x241.google.com with SMTP id 196so21350807wma.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 13:48:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011032621.26979-3-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-3-nicolas.pitre@linaro.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Oct 2017 22:48:08 +0200
Message-ID: <CAFLxGvx0o+qwD5S+YiHo2GtDjauPVZpiQ8TxEF-fifUS=JcSDg@mail.gmail.com>
Subject: Re: [PATCH 2/5] MTD: chips/map_ram.c: implement point and unpoint
 methods
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 11, 2017 at 5:26 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  drivers/mtd/chips/map_ram.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
> index afb43d5e17..c3939dd230 100644
> --- a/drivers/mtd/chips/map_ram.c
> +++ b/drivers/mtd/chips/map_ram.c
> @@ -22,6 +22,9 @@ static void mapram_nop (struct mtd_info *);
>  static struct mtd_info *map_ram_probe(struct map_info *map);
>  static unsigned long mapram_unmapped_area(struct mtd_info *, unsigned long,
>                                           unsigned long, unsigned long);
> +static int mapram_point (struct mtd_info *mtd, loff_t from, size_t len,
> +                        size_t *retlen, void **virt, resource_size_t *phys);
> +static int mapram_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
>
>
>  static struct mtd_chip_driver mapram_chipdrv = {
> @@ -69,7 +72,9 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
>         mtd->_read = mapram_read;
>         mtd->_write = mapram_write;
>         mtd->_panic_write = mapram_write;
> +       mtd->_point = mapram_point;
>         mtd->_sync = mapram_nop;
> +       mtd->_unpoint = mapram_unpoint;
>         mtd->flags = MTD_CAP_RAM;
>         mtd->writesize = 1;
>
> @@ -96,6 +101,25 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
>         return (unsigned long) map->virt + offset;
>  }
>
> +static int mapram_point(struct mtd_info *mtd, loff_t from, size_t len,
> +                       size_t *retlen, void **virt, resource_size_t *phys)
> +{
> +       struct map_info *map = mtd->priv;
> +
> +       if (!map->virt)
> +               return -EINVAL;
> +       *virt = map->virt + from;
> +       if (phys)
> +               *phys = map->phys + from;
> +       *retlen = len;
> +       return 0;
> +}
> +
> +static int mapram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       return 0;
> +}
> +

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
