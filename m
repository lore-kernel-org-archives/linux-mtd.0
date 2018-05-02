Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDmmp-0004mC-F4
 for linux-mtd@lists.infradead.org; Wed, 02 May 2018 08:06:54 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990404AbeEBIGhPmv6U (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 2 May 2018 10:06:37 +0200
Date: Wed, 2 May 2018 10:06:36 +0200
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Roger Quadros <rogerq@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2] mtd: onenand: omap2: Disable DMA for HIGHMEM buffers
Message-ID: <20180502080636.GA2124@lenoch>
References: <20180416065256.GA24455@lenoch>
 <20180420220134.3021860f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180420220134.3021860f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

(and apologies for delay)

On Fri, Apr 20, 2018 at 10:01:34PM +0200, Boris Brezillon wrote:
> Hi Ladislav,
> 
> On Mon, 16 Apr 2018 08:52:59 +0200
> Ladislav Michl <ladis@linux-mips.org> wrote:
> 
> > dma_map_single doesn't get the proper DMA address for vmalloced area,
> 
> That's not true, it returns the right DMA (physical) address, it's just
> that:

To be honest I used log message from commit dcf08227e964 which is dealing
with the same issue.

> 1/ the memory location is not necessarily physically contiguous
> 2/ in case your arch is VIVT ot VIPT, there may be several entries in
>    the cache pointing to the same physical location, and the cache
>    maintenance operations done by dma_map_single() will only operate on
>    one of these entries.

Well, there are few things suspicious here: DMA is used to transfer data
to system memory from bufferram which is 3kB in size. Nikolaus reported
Internal error: Oops: 805 [#1] PREEMPT SMP ARM
PC is at v7_dma_inv_range+0x30/0x48
LR is at dma_cache_maint_page+0xd0/0xe0
but I do not see how could it happen if it would be caused by 1/ or 2/ above.
Cache issue would cause data inconsistencies which should be caught by upper
MTD layers.

And given that replacing dma_map_single with dma_map_page done in first
version of patch also fixed oops, it is not caused by 1/
CPU is OMAP3630 based on Cortex-A8, D-cache is often described as PIPT but
seems to be VIPT with built-in alias detection mechanism - anyone with
better knowledge will eventually correct me, thank you.

> > so disable DMA in this case.
> > 
> 
> The fix looks good though. Can you rephrase your commit message to make
> it clearer.

Sure, I'd like to, but I do not know what's root cause yet :)

> Thanks,
> 
> Boris
	
Best regards,
	ladis
