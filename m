Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1573WT-0003lA-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 00:12:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: bjornw@axis.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Missing cache flush.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 00:16:47 +0100
Message-ID: <13942.991696607@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The flash mapping driver arch/cris/drivers/axisflashmap.c uses a cached
mapping of the flash chips for bulk reads, but obviously an uncached mapping
for sending commands and reading status when we're actually writing to or
erasing parts of the chip.

However, it fails to flush the dcache for the range used when the flash is 
accessed through the uncached mapping. So after an erase or write, we may 
read old data from the cache for the changed area.

All the mapping driver needs to do is invalidate the dcache for the affected
area before the next copy_from() operation. No need to worry about writeback
in this case, because we never write to flash chips through the cached
mapping.

However, I can't see a cache operation which performs this function.
flush_dcache_page() is defined as a NOP on CRIS as, it seems, it is on most
architectures. On other architectures, there's dma_cache_wback_inv(), but
that also seems to be a NOP on i386, to pick a random example.

I'm aware that some architectures can't handle having both cached and
uncached mappings of the same physical range - so to prevent dismissal of
the question out of hand by people assuming all the world's a PeeCee -
consider the alternative situation where we have ROM or RAM chips in a paged
mapping such that only a 64K 'page' is visible by the CPU at a time
(remember XMS?). Using an uncached mapping is extremely suboptimal - all we
want to do is invalidate the cache when we change the page, or writeback 
and invalidate in the case of RAM.

I would have thought that's the function that dma_cache_wback_inv() is
supposed to perform - but it seems not to do so.

So how is this _supposed_ to be done?

I was pointed at Documentation/DMA-mapping.txt but that doesn't seem very
helpful - it's very PCI-specific, and a quick perusal of pci_dma_sync() on
i386 shows that it doesn't do what's required anyway.

--
dwmw2
