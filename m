Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9cE6-0007Jx-B3
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 20:01:47 +0000
Date: Fri, 20 Apr 2018 22:01:34 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Peter Ujfalusi
 <peter.ujfalusi@ti.com>, Roger Quadros <rogerq@ti.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, "H. Nikolaus
 Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2] mtd: onenand: omap2: Disable DMA for HIGHMEM buffers
Message-ID: <20180420220134.3021860f@bbrezillon>
In-Reply-To: <20180416065256.GA24455@lenoch>
References: <20180416065256.GA24455@lenoch>
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

Hi Ladislav,

On Mon, 16 Apr 2018 08:52:59 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> dma_map_single doesn't get the proper DMA address for vmalloced area,

That's not true, it returns the right DMA (physical) address, it's just
that:

1/ the memory location is not necessarily physically contiguous
2/ in case your arch is VIVT ot VIPT, there may be several entries in
   the cache pointing to the same physical location, and the cache
   maintenance operations done by dma_map_single() will only operate on
   one of these entries.

> so disable DMA in this case.
> 

The fix looks good though. Can you rephrase your commit message to make
it clearer.

Thanks,

Boris
