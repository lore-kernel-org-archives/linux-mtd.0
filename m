Received: from e31.co.us.ibm.com ([32.97.110.149])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCIDL-0005PI-Ky
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 18:30:44 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBFITGu3009259
	for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 11:29:16 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mBFIUYgI189638
	for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 11:30:35 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mBFIUYrH003593
	for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 11:30:34 -0700
Date: Mon, 15 Dec 2008 13:30:26 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Trent Piepho <tpiepho@freescale.com>
Subject: Re: [PATCH] POWERPC: MTD: Add cached map support to physmap_of MTD
	driver
Message-ID: <20081215133026.4a86e7f7@zod.rchland.ibm.com>
In-Reply-To: <1229365518-20538-1-git-send-email-tpiepho@freescale.com>
References: <1229365518-20538-1-git-send-email-tpiepho@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Trent Piepho <xyzzy@speakeasy.org>, Trent Piepho <tpiepho@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 Dec 2008 10:25:18 -0800
Trent Piepho <tpiepho@freescale.com> wrote:

> The MTD system supports operation where a direct mapped flash chip is
> mapped twice.  The normal mapping is a standard ioremap(), which is
> non-cached and guarded on powerpc.  The second mapping is used only for
> reads and can be cached and non-guarded.  Currently, only the pxa2xx
> mapping driver makes use of this feature.  This patch adds support to the
> physmap_of driver on PPC32 platforms for this cached mapping mode.
> 
> Because the flash chip doesn't participate in the cache coherency protocol,
> it's necessary to invalidate the cache for parts of flash that are modified
> with a program or erase operation.  This is platform specific, for instance
> the pxa2xx driver uses an ARM specific function.  This patch adds
> invalidate_dcache_icache_range() for PPC32 and uses it.  Because of XIP,
> it's entirely possible that the flash might be in the icache(*), so the
> existing invalidate_dcache_range() function isn't enough.
> 
> Of course, a cached mapping can increase performance if the data is read
> from cache instead of flash.  But less obvious is that it can provide a
> significant performance increase for cold-cache reads that still come from
> flash.  It allows efficient back-to-back reads and if the flash chip &
> controller support page burst mode, it allows that to be used as well.
> 
> The figures are for *cold-cache* read performance, measured on a Freescale
> MPC8572 controlling a Spansion S29GL064N NOR flash chip.  With and without
> the flash being mapped cached and with and without the localbus controller
> being programmed to use page burst mode:
> 
> Non-cached, w/o bursts: 13.61 MB/s
> Non-cached, w/ bursts:  13.61 MB/s
> Cached, w/o bursts:     16.75 MB/s 23% increase
> Cached, w/ bursts:      44.79 MB/s 229% increase!
> 
> Even without any cache hits, the cached mapping provides a significant
> increase in performance via improved bus utilization.  Enabling burst
> transfers is even more significant.
> 
> (*) The MTD device's ->point() method, which is the mechanism for
> supporting mmap and XIP, only allows for mmapping the uncached region.  So
> you can't actually XIP anything in the cache.  But this could be fixed.
> 
> Signed-off-by: Trent Piepho <tpiepho@freescale.com>

Did you actually change anything in this version when compared to the
version you sent out last week?  If not, is there a reason you sent it
again without flagging it as a resend?

(Hint, the MTD community reviews patches slowly.  No comments for a
week is normal.)

josh
