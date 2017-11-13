Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEGaz-0007EU-JO
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 15:24:23 +0000
Date: Mon, 13 Nov 2017 07:23:55 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
Message-ID: <20171113152355.GU28152@atomide.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <3d33265a-2520-2298-6068-f76a7257bfd0@ti.com>
 <20171110100443.zqk7uzxoaq4eyntk@lenoch>
 <20171110152423.GM28152@atomide.com>
 <d498102d-11ff-cdd0-430e-0ea650c2a12b@ti.com>
 <20171113121541.2tlezfjwk5bptakp@lenoch>
 <c13c503c-9435-7e88-7700-40bfcf806231@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13c503c-9435-7e88-7700-40bfcf806231@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [171113 14:37]:
> On 2017-11-13 14:15, Ladislav Michl wrote:
> > Of course, I would love to see my 10+ years old boards running faster,
> > but it seems unrealistic to me to get enough manpower to finish this task.
> 
> Valid point. I would - for now - only do the DMAengine memcpy conversion
> with the GPIO irq and investigate the slave DMA support after that.

Yeah the use of the dmareq line is up to somebody who needs it naturally,
just something we've ben speculating for a while :)

Regards,

Tony
