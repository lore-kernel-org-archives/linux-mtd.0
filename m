Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abuYQ-0000ci-NE
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 18:34:23 +0000
Received: by mail-ob0-x231.google.com with SMTP id rt7so57425068obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 10:34:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
Date: Fri, 4 Mar 2016 10:34:01 -0800
Message-ID: <CAPcyv4gmgE1=REbvWfv8Q61pLOJp9Vjf_qxbX5GQ82o=7aVtGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] fix memremap on ARM
From: Dan Williams <dan.j.williams@intel.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 4, 2016 at 1:48 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> This is something I ran into while working on support for the UEFI
> memory attributes and ESRT tables. In both cases, these tables are
> passed to the kernel in memory which is guaranteed to be below 4 GB,
> but may be outside of the kernel direct mapping. (UEFI typically
> attempts to allocate from the top down, which means such tables are
> highly likely to be in highmem for any system with more than 760 MB
> of system RAM)
>
> The recently introduced memremap() is a very useful abstraction for
> accessing such tables, because it is generic, and already attempts to
> do the right thing with respect to regions that may already have been
> mapped directly. However, it falls back to ioremap_cache() for mapping
> high memory, which is not allowed on ARM for system RAM, and also results
> in the region to be mapped with different attributes depending on whether
> it is covered by lowmem or not.
>
> So instead, create an arch specific hook 'arch_memremap_wb(), and
> implement it for ARM using the same memory attributes used for the
> linear mapping. Note that memremap will only call this hook for regions
> that are not already mapped permanently.
>
> Since this change results in memremap() to use attributes different from
> the ones used by ioremap_cache(), revert the change to pxa2xx-flash that
> moved it to memremap.
>
> Changes since v2:
> - add patch to bring back ioremap_cached() on ARM
> - switch pxa2xx-flash back to ioremap_cached() not ioremap_cache()
> - use arch_ioremap_caller not __arm_ioremap_caller() in patch #4
> - deal with __iomem annotation of arch_ioremap_caller (patch #4)
>
> Changes since v1/rfc:
> - new patch #1 that reverts the ioremap_cache->memremap conversion for the
>   pxa2xx-flash driver
> - added Dan's ack to patch #2
>
> Ard Biesheuvel (4):
>   ARM: reintroduce ioremap_cached() for creating cached I/O mappings
>   mtd: pxa2xx-flash: switch back from memremap to ioremap_cached
>   memremap: add arch specific hook for MEMREMAP_WB mappings
>   ARM: memremap: implement arch_memremap_wb()
>
>  arch/arm/include/asm/io.h       | 12 ++++++++++++
>  arch/arm/mm/ioremap.c           | 16 ++++++++++++++--
>  drivers/mtd/maps/pxa2xx-flash.c |  6 +++---
>  kernel/memremap.c               | 11 ++++++++---
>  4 files changed, 37 insertions(+), 8 deletions(-)
>

For the series:

Acked-by: Dan Williams <dan.j.williams@intel.com>
