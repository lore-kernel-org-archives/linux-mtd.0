Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEj9E-0007jq-5A
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 21:53:37 +0000
Date: Tue, 14 Nov 2017 13:53:12 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
Message-ID: <20171114215312.GI28152@atomide.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <3d33265a-2520-2298-6068-f76a7257bfd0@ti.com>
 <20171110100443.zqk7uzxoaq4eyntk@lenoch>
 <20171110152423.GM28152@atomide.com>
 <20171110213918.pqq3ghblqhp2jwf2@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171110213918.pqq3ghblqhp2jwf2@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ladislav Michl <ladis@linux-mips.org> [171110 21:41]:
> On Fri, Nov 10, 2017 at 07:24:23AM -0800, Tony Lindgren wrote:
> > FYI, the gpio pin for onenand should not be in gpio mode. It should
> > be used as external dma request line to automatically trigger new
> > transfers like we do for tusb6010 dma. But of course it's possible
> > that onenand has other issues too preventing the dma usage.
> 
> Now, after reading dma and interrupt related code again, I still do
> not see how the driver could be using hardware synchronized transfer.
> DMA seems to be used as a memcpy and gpio pin a ready/busy.
> Care to elaborate a bit more?

Well take a look at mux options for the onenand connected pins,
and if there is one that has a mux option for ext_dmareq or similar,
chances are it can be used to retrigger dma transfers.

I could be wrong of course, and it could be it won't even work with
onenand.

Something to look later on for sure if anybody is interested.

Regards,

Tony
