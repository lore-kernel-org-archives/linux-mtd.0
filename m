Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Nz3-0006yE-9U
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 20:52:07 +0000
Received: by mail-wm0-x241.google.com with SMTP id m72so21454368wmc.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 13:51:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011032621.26979-5-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-5-nicolas.pitre@linaro.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Oct 2017 22:51:43 +0200
Message-ID: <CAFLxGvwURAc=x1Feka+ArMGv5OCC8SGuXeNac1jDowp1jV4jbQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] MTD: implement mtd_get_unmapped_area() using the
 point method
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
> The mtd->_point method is a superset of mtd->_get_unmapped_area.
> Especially in the NOR flash case, the point method ensures the flash
> memory is in array (data) mode and that it will stay that way which
> is precisely what callers of mtd_get_unmapped_area() would expect.
>
> Implement mtd_get_unmapped_area() in terms of mtd->_point now that all
> drivers that provided a _get_unmapped_area method also have the _point
> method implemented.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  drivers/mtd/mtdcore.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e7ea842ba3..ecb0380158 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1022,11 +1022,18 @@ EXPORT_SYMBOL_GPL(mtd_unpoint);
>  unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
>                                     unsigned long offset, unsigned long flags)
>  {
> -       if (!mtd->_get_unmapped_area)
> -               return -EOPNOTSUPP;
> -       if (offset >= mtd->size || len > mtd->size - offset)
> -               return -EINVAL;
> -       return mtd->_get_unmapped_area(mtd, len, offset, flags);
> +       size_t retlen;
> +       void *virt;
> +       int ret;
> +
> +       ret = mtd_point(mtd, offset, len, &retlen, &virt, NULL);
> +       if (ret)
> +               return ret;
> +       if (retlen != len) {
> +               mtd_unpoint(mtd, offset, retlen);
> +               return -ENOSYS;
> +       }
> +       return (unsigned long)virt;
>  }
>  EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
