Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEA0X-0007j6-De
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 08:22:20 +0000
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
To: Tony Lindgren <tony@atomide.com>, Ladislav Michl <ladis@linux-mips.org>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <3d33265a-2520-2298-6068-f76a7257bfd0@ti.com>
 <20171110100443.zqk7uzxoaq4eyntk@lenoch> <20171110152423.GM28152@atomide.com>
CC: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>, Roger
 Quadros <rogerq@ti.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <d498102d-11ff-cdd0-430e-0ea650c2a12b@ti.com>
Date: Mon, 13 Nov 2017 10:22:12 +0200
MIME-Version: 1.0
In-Reply-To: <20171110152423.GM28152@atomide.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 2017-11-10 17:24, Tony Lindgren wrote:
>> I run out of time few days ago already, but this looks so good that it is
>> worth to delay other work. I'll include it in next version of patch serie.
>>
>> Also it will allow us to dump 'dma-channel' and use DMA if gpio pin
>> is configured which was intended logic of original driver. 'dma-channel'
>> was introduced during mechanical conversion to DT and fortunately it is
>> not used yet, so we can safely remove it again.
> 
> FYI, the gpio pin for onenand should not be in gpio mode. It should
> be used as external dma request line to automatically trigger new
> transfers like we do for tusb6010 dma. But of course it's possible
> that onenand has other issues too preventing the dma usage.

My conversion to DMAengine is drop in replacement of the existing
implementation: memcpy w/o hardware synchronization event.

But I think it should be possible to use HW sync (slave DMA) with the
src/dst_port_window in a similar way we do with the tusb6010.

But that can be done in a followup series, but what to do in case of old
DT where the dmas/dma-names properties are no there?

Hmm, extending the dma_slave_map in mach-omap1/2/dma.c might work just fine.

Having said that, there might have been a reason why the original
implementation was not using DMA request to trigger the memcpy... The
legacy omap-dma API would have allowed that as you kind of open code
things with much flexibility.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
