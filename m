Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1csq08-00086K-4V
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 12:13:30 +0000
Date: Tue, 28 Mar 2017 14:13:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, marek.vasut@gmail.com, computersforpeace@gmail.com,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 dinguyen@kernel.org, artem.bityutskiy@linux.intel.com,
 grmoore@opensource.altera.com, ejo@pengutronix.de,
 chuanxiao.dong@intel.com, mhiramat@kernel.org, jaswinder.singh@linaro.org,
 robh@kernel.org
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170328141304.4cb681c3@bbrezillon>
In-Reply-To: <20170328101720.GW7909@n2100.armlinux.org.uk>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
 <20170327100039.480b8d8d@bbrezillon>
 <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
 <20170328095907.76d02ce9@bbrezillon>
 <20170328101720.GW7909@n2100.armlinux.org.uk>
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

On Tue, 28 Mar 2017 11:17:20 +0100
Russell King - ARM Linux <linux@armlinux.org.uk> wrote:

> On Tue, Mar 28, 2017 at 09:59:07AM +0200, Boris Brezillon wrote:
> > Having non-cache line aligned buffers is definitely more dangerous,
> > but, AFAIU, it's not impossible.
> > 
> > Let's consider this case:
> > 
> > 
> > |        cache line        |        cache line        | ... |
> > -------------------------------------------------------------
> > | nand_buffers size |                    data               |
> > 
> > 
> > If you call dma_map_single(dev, data, size, DMA_TO_DEVICE), the first
> > cache line will be flushed (content written back to memory), and
> > assuming you don't touch nand_buffers content between dma_map_single()
> > and dma_unmap_single() you shouldn't have any problem (the cache line
> > cannot magically turn dirty and thus cannot be flushed in the
> > background).  
> 
> In the DMA_TO_DEVICE case, you're not going to be modifying the data
> to be DMA'd.  The DMA certainly is not going to modify the data it's
> supposed to be reading.
> 
> So, reality is that reading and writing the "data" part including the
> overlapping cache line should cause no problem to the DMA activity,
> even if that cache line gets written back - the part that overlaps
> the DMA data should _not_ modify that data.
> 
> More of an issue is the DMA_FROM_DEVICE case...
> 
> > For the DMA_FROM_DEVICE direction, the cache line is invalidated when
> > dma_unmap_single() is called, which means your nand_buffers content
> > might be updated with what is present in SDRAM, but it shouldn't have
> > changed since nand_buffers is only touched at initialization time (when
> > the buffer is created).  
> 
> This is exactly where it matters.  When mapping for DMA from the device,
> we obviously have to ensure that we aren't going to have any writebacks
> from the cache into the DMA area.  Since we don't know whether the
> overlapping cache lines contain important data, we write those back, but
> invalidate the rest of the buffer when mapping it.
> 
> Reading from those cache lines while DMA is in progress is pretty benign,
> just like the DMA_TO_DEVICE case.  However, writing to those cache lines
> while DMA is in progress is disasterous, because we end up with a choice:
> 
> 1. if we invalidate the overlapping cache lines, we lose updates that
>    the CPU has made.
> 
> 2. if we write-back the overlapping cache lines, we lose updates that
>    the DMA has made.
> 
> So either way, there is a data loss risk - there's no getting away from
> that.  I've chosen to implement (2) in the ARM code, but either is
> equally valid.  (I note in your description above that you think (1)
> applies...)

Okay, got it.

> 
> The only solution to that is to avoid all writes to these cache lines
> while DMA from the device is in progress.

And we are in that case: the nand_buffers object will never be modified
between dma_map() and dma_unmap().

> 
> > So, for our use case where nand_buffers is never modified between
> > dma_map_single() and dma_unmap_single(), it should be safe to have
> > non-cache line aligned buffers.  
> 
> Correct, with the exception of what happens at unmap.

Now I'm lost again :-). Didn't you say it was safe to have overlapping
cache lines if nothing writes to these cache lines during the whole time
the buffer is DMA-mapped?
IIUC, the only case where unmap() will write-back cache lines is when
these cache entries are dirty (i.e. when they've been modified through
CPU accesses between map and unmap). Am I missing something?
