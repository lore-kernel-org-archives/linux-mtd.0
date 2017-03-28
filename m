Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1csm2M-00082Y-8j
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 07:59:33 +0000
Date: Tue, 28 Mar 2017 09:59:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: <yamada.masahiro@socionext.com>
Cc: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <marek.vasut@gmail.com>, <computersforpeace@gmail.com>,
 <thorsten.christiansson@idquantique.com>, <laurent.monat@idquantique.com>,
 <dinguyen@kernel.org>, <artem.bityutskiy@linux.intel.com>,
 <grmoore@opensource.altera.com>, <ejo@pengutronix.de>,
 <chuanxiao.dong@intel.com>, <mhiramat@kernel.org>,
 <jaswinder.singh@linaro.org>, <robh@kernel.org>, Russell King - ARM Linux
 <linux@armlinux.org.uk>
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170328095907.76d02ce9@bbrezillon>
In-Reply-To: <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
 <20170327100039.480b8d8d@bbrezillon>
 <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Russell to correct me if I'm wrong or give further information.

On Tue, 28 Mar 2017 01:13:10 +0000
<yamada.masahiro@socionext.com> wrote:

> Hi Boris,
>=20
>=20
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> > Sent: Monday, March 27, 2017 5:01 PM
> > To: Yamada, Masahiro/=E5=B1=B1=E7=94=B0 =E7=9C=9F=E5=BC=98 <yamada.masa=
hiro@socionext.com>
> > Cc: linux-mtd@lists.infradead.org; David Woodhouse
> > <dwmw2@infradead.org>; Marek Vasut <marek.vasut@gmail.com>; Brian Norris
> > <computersforpeace@gmail.com>; thorsten.christiansson@idquantique.com;
> > laurent.monat@idquantique.com; Dinh Nguyen <dinguyen@kernel.org>; Artem
> > Bityutskiy <artem.bityutskiy@linux.intel.com>; Graham Moore
> > <grmoore@opensource.altera.com>; Enrico Jorns <ejo@pengutronix.de>;
> > Chuanxiao Dong <chuanxiao.dong@intel.com>; Masami Hiramatsu
> > <mhiramat@kernel.org>; Jassi Brar <jaswinder.singh@linaro.org>; Rob
> > Herring <robh@kernel.org>
> > Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers
> > if NAND_OWN_BUFFERS is unset
> >=20
> > Hi Masahiro,
> >=20
> > On Thu, 23 Mar 2017 09:17:59 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  =20
> > > Commit 66507c7bc889 ("mtd: nand: Add support to use nand_base poi
> > > databuf as bounce buffer") fixed the issue that drivers can be
> > > passed with a kmap()'d buffer.  This addressed the use_bufpoi =3D 0
> > > case.
> > >
> > > When use_bufpoi =3D 1, chip->buffers->databuf is used.  The databuf
> > > allocated by nand_scan_tail() is not suitable for DMA due to the
> > > offset, sizeof(*chip->buffers). =20
> >=20
> > As said earlier, I'm fine with the patch content, but I'm not sure
> > about your explanation. Alignment requirements are DMA controller
> > dependent so you're not exactly fixing a bug for all NAND controller
> > drivers, just those that require >4 bytes alignment. =20
>=20
>=20
> We have two contexts when we talk about alignment for DMA:
>=20
> [A] Requirement by CPU architecture  (cache alignment)
> [B] Requirement by the controller's DMA engine
>=20
>=20
> As I will state below, having sizeof(*chip->buffers) in the same cache
> line is no good.  This is the same reason as devm_* is not recommended fo=
r DMA.
> (https://lkml.org/lkml/2017/3/8/693)

Having non-cache line aligned buffers is definitely more dangerous,
but, AFAIU, it's not impossible.

Let's consider this case:


|        cache line        |        cache line        | ... |
-------------------------------------------------------------
| nand_buffers size |                    data               |


If you call dma_map_single(dev, data, size, DMA_TO_DEVICE), the first
cache line will be flushed (content written back to memory), and
assuming you don't touch nand_buffers content between dma_map_single()
and dma_unmap_single() you shouldn't have any problem (the cache line
cannot magically turn dirty and thus cannot be flushed in the
background).

For the DMA_FROM_DEVICE direction, the cache line is invalidated when
dma_unmap_single() is called, which means your nand_buffers content
might be updated with what is present in SDRAM, but it shouldn't have
changed since nand_buffers is only touched at initialization time (when
the buffer is created).

So, for our use case where nand_buffers is never modified between
dma_map_single() and dma_unmap_single(), it should be safe to have
non-cache line aligned buffers.

Russell, please let me know if my reasoning is incorrect.
Note that I'm not arguing against the new approach where we allocate
each buffer independently using kmalloc (having cache line aligned
buffers is definitely safer and does not imply any significant
overhead), I just want to make sure I understand things correctly.

>=20
>=20
> The current situation violates [A].

Do you have a real failure that is proven to be caused by mis cache
line alignment, or are you just speculating?

>=20
> Usually [B] is less than [A].

Yep, it's likely the case.

> So, if we meet [A] (by using kmalloc), [B] will be met as well.

Sure.

>=20
>=20
>=20
> > Regarding the cache line alignment issue, in this case it shouldn't be
> > a problem, because the driver and the core shouldn't touch the
> > chip->buffers object during a DMA transfer, so dma_map/unmap_single()
> > should work fine (they may flush/invalidate one cache line entry that
> > contains non-payload data, but that's not a problem as long as nothing
> > is modified during the DMA transfer). =20
>=20
>=20
> This is related to 52/53:
> http://patchwork.ozlabs.org/patch/742409/
>=20
> Can you also read this?
> https://lkml.org/lkml/2017/3/8/693
>=20
> Your comment is very similar to what was discussed in the thread.

I read it.

>=20
>=20
>=20
> > >
> > > So, drivers using DMA are very likely to end up with setting the
> > > NAND_OWN_BUFFERS flag and allocate buffers by themselves.  Drivers
> > > tend to use devm_k*alloc to simplify the probe failure path, but
> > > devm_k*alloc() does not return a cache line aligned buffer. =20
> >=20
> > Oh, I didn't know that. I had a closer look at the code, and indeed,
> > devm_kmalloc() does not guarantee any alignment.
> >  =20
> > >
> > > If used, it could violate the DMA-API requirement stated in
> > > Documentation/DMA-API.txt:
> > >   Warnings:  Memory coherency operates at a granularity called the
> > >   cache line width.  In order for memory mapped by this API to
> > >   operate correctly, the mapped region must begin exactly on a cache
> > >   line boundary and end exactly on one (to prevent two separately
> > >   mapped regions from sharing a single cache line).
> > >
> > > To sum up, NAND_OWN_BUFFERS is not very convenient for drivers.
> > > nand_scan_tail() can give a separate buffer for each of ecccalc,
> > > ecccode, databuf.  It is guaranteed kmalloc'ed memory is aligned
> > > with ARCH_DMA_MINALIGN. =20
> >=20
> > Maybe I'm wrong, but AFAIU, kmalloc&co do not guarantee cache line
> > alignment for small buffers (< cache line), so even kmalloc can return
> > a buffer that is not cache line aligned.
> > This being said, we should be good because most NAND controllers are
> > only manipulating the page buffer (->databuf) which is large enough to
> > be cache line aligned. =20
>=20
>=20
> In my understanding kmalloc() returns cache aligned address even for 1 by=
te memory.

After digging into the SLAB code I found the calculate_alignment()
function [1] which is used to calculate the required alignment of
objects provided by a SLAB cache. For kmalloc caches SLAB_HWCACHE_ALIGN
is set, but if you look at the code, if the object size is smaller
than half a cache line the alignment constraint is relaxed, meaning that
elements smaller than cache_line/2 are not guaranteed to be aligned on
a cache line.

I didn't test, but that should be pretty easy to verify (kmalloc a
bunch of 1byte bufs and check their alignment).

[1]http://lxr.free-electrons.com/source/mm/slab_common.c#L301
