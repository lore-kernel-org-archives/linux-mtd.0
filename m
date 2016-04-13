Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqRLd-00064G-9W
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 20:25:14 +0000
Date: Wed, 13 Apr 2016 22:24:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 tony@atomide.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, rogerq@ti.com
Subject: Re: [PATCH v4 6/7] mtd: nand: omap2: Fix high memory dma prefetch
 transfer
Message-ID: <20160413222451.704376b5@bbrezillon>
In-Reply-To: <570EA72C.7000806@ti.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-7-git-send-email-fcooper@ti.com>
 <20160321160443.0a4165d1@bbrezillon> <570EA72C.7000806@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Franklin,

On Wed, 13 Apr 2016 15:08:12 -0500
"Franklin S Cooper Jr." <fcooper@ti.com> wrote:

> 
> 
> On 03/21/2016 10:04 AM, Boris Brezillon wrote:
> > Hi Franklin,
> > 
> > On Thu, 10 Mar 2016 17:56:42 -0600
> > Franklin S Cooper Jr <fcooper@ti.com> wrote:
> > 
> >> Based on DMA documentation and testing using high memory buffer when
> >> doing dma transfers can lead to various issues including kernel
> >> panics.
> > 
> > I guess it all comes from the vmalloced buffer case, which are not
> > guaranteed to be physically contiguous (one of the DMA requirement,
> > unless you have an iommu).
> > 
> >>
> >> To workaround this simply use cpu copy. The amount of high memory
> >> buffers used are very uncommon so no noticeable performance hit should
> >> be seen.
> > 
> > Hm, that's not necessarily true. UBI and UBIFS allocate their buffers
> > using vmalloc (vmalloced buffers fall in the high_memory region), and
> > those are likely to be dis-contiguous if you have NANDs with pages > 4k.
> > 
> > I recently posted patches to ease sg_table creation from any kind of
> > virtual address [1][2]. Can you try them and let me know if it fixes
> > your problem?
> 
> It looks like you won't be going forward with your patchset based on
> this thread [1].

Nope. According to Russell it's unsafe to do that.

> I can probably reword the patch description to avoid
> implying that it is uncommon to run into high mem buffers. Also DMA with
> NAND prefetch suffers from a reduction of performance compared to CPU
> polling with prefetch. This is largely due to the significant over head
> required to read such a small amount of data at a time. The
> optimizations I've worked on all revolved around reducing the cycles
> spent before executing the DMA request. Trying to make a high memory
> buffer able to be used by the DMA adds significant amount of cycles and
> your better off just using the cpu for performance reasons.

Okay.
One comment though, why not using virt_addr_valid() instead of
addr >= high_memory here?

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
