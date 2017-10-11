Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Nue-0003up-D7
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 20:47:34 +0000
Received: by mail-wm0-x243.google.com with SMTP id k4so8210137wmc.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 13:47:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011032621.26979-2-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-2-nicolas.pitre@linaro.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Oct 2017 22:47:09 +0200
Message-ID: <CAFLxGvynd+dtgPUbXAm7PZVw85=RoR+LfJEghAZLVmfAOVNjQA@mail.gmail.com>
Subject: Re: [PATCH 1/5] MTD: mtdram: properly handle the phys argument in the
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
> When the phys pointer is non null, the point method is expected to return
> the physical address for the pointed area. In the case of the mtdram
> driver we have to retrieve the physical address for the corresponding
> vmalloc area. However, there is no guarantee that the vmalloc area is
> made of physically contiguous pages. In that case we simply limit retlen
> to the actually contiguous pages.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  drivers/mtd/devices/mtdram.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index cbd8547d7a..7dbee8e62f 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -13,6 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/ioport.h>
>  #include <linux/vmalloc.h>
> +#include <linux/mm.h>
>  #include <linux/init.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/mtdram.h>
> @@ -69,6 +70,27 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
>  {
>         *virt = mtd->priv + from;
>         *retlen = len;
> +
> +       if (phys) {
> +               /* limit retlen to the number of contiguous physical pages */
> +               unsigned long page_ofs = offset_in_page(*virt);
> +               void *addr = *virt - page_ofs;
> +               unsigned long pfn1, pfn0 = vmalloc_to_pfn(addr);
> +
> +               *phys = __pfn_to_phys(pfn0) + page_ofs;
> +               len += page_ofs;
> +               while (len > PAGE_SIZE) {
> +                       len -= PAGE_SIZE;
> +                       addr += PAGE_SIZE;
> +                       pfn0++;
> +                       pfn1 = vmalloc_to_pfn(addr);
> +                       if (pfn1 != pfn0) {
> +                               *retlen = *virt - addr;
> +                               break;
> +                       }
> +               }
> +       }
> +
>         return 0;
>  }

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
