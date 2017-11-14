Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEj53-0004b4-92
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 21:49:19 +0000
Date: Tue, 14 Nov 2017 13:48:53 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v4 00/16] OMAP2+ OneNAND driver update
Message-ID: <20171114214853.GH28152@atomide.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171111211206.465pgorrjp3eyix6@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Ladislav Michl <ladis@linux-mips.org> [171111 21:13]:
> Hi there,
> 
> this patch serie updates OMAP2+ OneNAND driver to the present times, making
> it fully DT configurable, using libgpio and dmaengine apis.
> 
> Please note that unlike previous driver version, which basically ignored
> DT specified timings, this one relies on it, so it is important to get
> it right in your DT (dumping it from previous kernel version).
> 
> In case synchronous timings is requested, it is okay to specify timings
> for the slowest chip ever used for you board as it is evetually optimized
> after chip probe.
> 
> Original driver used DMA only if user specified r/b gpio in platform
> data, now DMA is used unconditionally and PIO mode is used as fallback.
> 
> In case anyone wants to give it a try, few DT related changes are needed:
> - onenand node needs 'ti,omap2-onenand' compatible (for mailine boards this is
>   done in patch 2)
> - to use R/B pin, rb-gpios needs to be specified (for n900 and n8x0 this is
>   done in patch 16, however patch lacks pinmux configuration.
> 
> Most notable changes from previous version:
> - added dmaengine patches by Peter Ujfalusi
> - added dt bindings documentation
> - added cleanup patches
> - DMA enabled by default
> 
> Also note that driver will fail probe OneNAND chip after patch 13 and start
> working again after patch 14.
> 
> Testing and benchmarking very welcome.
> 
> Depends on "memory: omap-gpmc: Make 'bank-width' property optional"
> https://patchwork.kernel.org/patch/10043259/

Thanks for doing this. I'm adding Aaro to Cc here, maybe he can test
n8x0 as my n800 in my rack is not currently booting.

I've tested this series briefly on n900 by writing a 10MB file to
onenand and comparing it to the original, and it seems to work so
for patches 1 to 15 you can add:

Tested-by: Tony Lindgren <tony@atomide.com>

The last patch has a build error for n8x0, and in general we really
should test this series on n8x0 before merging as the configuration
is a little bit different. So I'd say we need an ack from Aaro there.

I've also acked the mach-omap2 touching patches so when others are
happy this can be merged as a single set via the MTD tree.

Regards,

Tony
