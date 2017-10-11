Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2OcX-0004KJ-QS
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:32:56 +0000
Received: by mail-qt0-x22b.google.com with SMTP id f8so9576216qta.5
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:32:31 -0700 (PDT)
Date: Wed, 11 Oct 2017 17:32:28 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/5] MTD: mtdram: properly handle the phys argument in
 the point method
In-Reply-To: <CAFLxGvynd+dtgPUbXAm7PZVw85=RoR+LfJEghAZLVmfAOVNjQA@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1710111729390.6870@knanqh.ubzr>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-2-nicolas.pitre@linaro.org>
 <CAFLxGvynd+dtgPUbXAm7PZVw85=RoR+LfJEghAZLVmfAOVNjQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Oct 2017, Richard Weinberger wrote:

> On Wed, Oct 11, 2017 at 5:26 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > When the phys pointer is non null, the point method is expected to return
> > the physical address for the pointed area. In the case of the mtdram
> > driver we have to retrieve the physical address for the corresponding
> > vmalloc area. However, there is no guarantee that the vmalloc area is
> > made of physically contiguous pages. In that case we simply limit retlen
> > to the actually contiguous pages.
> >
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> > ---
> >  drivers/mtd/devices/mtdram.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> > index cbd8547d7a..7dbee8e62f 100644
> > --- a/drivers/mtd/devices/mtdram.c
> > +++ b/drivers/mtd/devices/mtdram.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/ioport.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/mm.h>
> >  #include <linux/init.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/mtdram.h>
> > @@ -69,6 +70,27 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
> >  {
> >         *virt = mtd->priv + from;
> >         *retlen = len;
> > +
> > +       if (phys) {
> > +               /* limit retlen to the number of contiguous physical pages */
> > +               unsigned long page_ofs = offset_in_page(*virt);
> > +               void *addr = *virt - page_ofs;
> > +               unsigned long pfn1, pfn0 = vmalloc_to_pfn(addr);
> > +
> > +               *phys = __pfn_to_phys(pfn0) + page_ofs;
> > +               len += page_ofs;
> > +               while (len > PAGE_SIZE) {
> > +                       len -= PAGE_SIZE;
> > +                       addr += PAGE_SIZE;
> > +                       pfn0++;
> > +                       pfn1 = vmalloc_to_pfn(addr);
> > +                       if (pfn1 != pfn0) {
> > +                               *retlen = *virt - addr;

In fact the above should be: *retlen = addr - *virt;

Let me know if I should repost.


Nicolas
