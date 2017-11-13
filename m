Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEDep-0004jB-GL
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 12:16:11 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990425AbdKMMPmuwwWG (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Mon, 13 Nov 2017 13:15:42 +0100
Date: Mon, 13 Nov 2017 13:15:41 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
Message-ID: <20171113121541.2tlezfjwk5bptakp@lenoch>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <3d33265a-2520-2298-6068-f76a7257bfd0@ti.com>
 <20171110100443.zqk7uzxoaq4eyntk@lenoch>
 <20171110152423.GM28152@atomide.com>
 <d498102d-11ff-cdd0-430e-0ea650c2a12b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d498102d-11ff-cdd0-430e-0ea650c2a12b@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 13, 2017 at 10:22:12AM +0200, Peter Ujfalusi wrote:
> 
> On 2017-11-10 17:24, Tony Lindgren wrote:
> > FYI, the gpio pin for onenand should not be in gpio mode. It should
> > be used as external dma request line to automatically trigger new
> > transfers like we do for tusb6010 dma. But of course it's possible
> > that onenand has other issues too preventing the dma usage.
> 
> My conversion to DMAengine is drop in replacement of the existing
> implementation: memcpy w/o hardware synchronization event.
> 
> But I think it should be possible to use HW sync (slave DMA) with the
> src/dst_port_window in a similar way we do with the tusb6010.

How do you want to synchronize it from OneNAND side?

> But that can be done in a followup series, but what to do in case of old
> DT where the dmas/dma-names properties are no there?

These will not work anyway as they do not have compatible property.
Also note, that DMA is currently not used, yet nobody complained.

> Hmm, extending the dma_slave_map in mach-omap1/2/dma.c might work just fine.
> 
> Having said that, there might have been a reason why the original
> implementation was not using DMA request to trigger the memcpy... The
> legacy omap-dma API would have allowed that as you kind of open code
> things with much flexibility.

That's mainly problem of OneNAND driver itself, not oma-dma. But do we
really want to invest more time to this obsolete technology?

Of course, I would love to see my 10+ years old boards running faster,
but it seems unrealistic to me to get enough manpower to finish this task.

	ladis
