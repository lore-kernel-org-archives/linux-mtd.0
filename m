Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csoCR-0003sd-2y
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 10:18:07 +0000
Date: Tue, 28 Mar 2017 11:17:20 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, thorsten.christiansson@idquantique.com,
 laurent.monat@idquantique.com, dinguyen@kernel.org,
 artem.bityutskiy@linux.intel.com, grmoore@opensource.altera.com,
 ejo@pengutronix.de, chuanxiao.dong@intel.com, mhiramat@kernel.org,
 jaswinder.singh@linaro.org, robh@kernel.org
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170328101720.GW7909@n2100.armlinux.org.uk>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
 <20170327100039.480b8d8d@bbrezillon>
 <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
 <20170328095907.76d02ce9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328095907.76d02ce9@bbrezillon>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 28, 2017 at 09:59:07AM +0200, Boris Brezillon wrote:
> Having non-cache line aligned buffers is definitely more dangerous,
> but, AFAIU, it's not impossible.
> 
> Let's consider this case:
> 
> 
> |        cache line        |        cache line        | ... |
> -------------------------------------------------------------
> | nand_buffers size |                    data               |
> 
> 
> If you call dma_map_single(dev, data, size, DMA_TO_DEVICE), the first
> cache line will be flushed (content written back to memory), and
> assuming you don't touch nand_buffers content between dma_map_single()
> and dma_unmap_single() you shouldn't have any problem (the cache line
> cannot magically turn dirty and thus cannot be flushed in the
> background).

In the DMA_TO_DEVICE case, you're not going to be modifying the data
to be DMA'd.  The DMA certainly is not going to modify the data it's
supposed to be reading.

So, reality is that reading and writing the "data" part including the
overlapping cache line should cause no problem to the DMA activity,
even if that cache line gets written back - the part that overlaps
the DMA data should _not_ modify that data.

More of an issue is the DMA_FROM_DEVICE case...

> For the DMA_FROM_DEVICE direction, the cache line is invalidated when
> dma_unmap_single() is called, which means your nand_buffers content
> might be updated with what is present in SDRAM, but it shouldn't have
> changed since nand_buffers is only touched at initialization time (when
> the buffer is created).

This is exactly where it matters.  When mapping for DMA from the device,
we obviously have to ensure that we aren't going to have any writebacks
from the cache into the DMA area.  Since we don't know whether the
overlapping cache lines contain important data, we write those back, but
invalidate the rest of the buffer when mapping it.

Reading from those cache lines while DMA is in progress is pretty benign,
just like the DMA_TO_DEVICE case.  However, writing to those cache lines
while DMA is in progress is disasterous, because we end up with a choice:

1. if we invalidate the overlapping cache lines, we lose updates that
   the CPU has made.

2. if we write-back the overlapping cache lines, we lose updates that
   the DMA has made.

So either way, there is a data loss risk - there's no getting away from
that.  I've chosen to implement (2) in the ARM code, but either is
equally valid.  (I note in your description above that you think (1)
applies...)

The only solution to that is to avoid all writes to these cache lines
while DMA from the device is in progress.

> So, for our use case where nand_buffers is never modified between
> dma_map_single() and dma_unmap_single(), it should be safe to have
> non-cache line aligned buffers.

Correct, with the exception of what happens at unmap.

> Russell, please let me know if my reasoning is incorrect.
> Note that I'm not arguing against the new approach where we allocate
> each buffer independently using kmalloc (having cache line aligned
> buffers is definitely safer and does not imply any significant
> overhead), I just want to make sure I understand things correctly.

Cache line aligned buffers is definitely preferable, but at the arch
level it's not something that can be relied upon.  Historically, if
I'd have chosen (1) then various drivers would have broken (like SCSI
drivers DMAing sense data directly into the scsi_cmnd struct, something
that has now been resolved.)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
