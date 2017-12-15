Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePp2n-0004Qk-SD
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 12:24:52 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990408AbdLOMYZkDTWE (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Fri, 15 Dec 2017 13:24:25 +0100
Date: Fri, 15 Dec 2017 13:24:22 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Roger Quadros <rogerq@ti.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/16] dt-bindings: mtd: gpmc-onenand: Update
 properties description
Message-ID: <20171215122422.GA17105@lenoch>
References: <20171115162306.2o2w2yrf7wucroxd@lenoch>
 <20171115162458.rtompijrsaobdemk@lenoch>
 <20171130112544.5509ca1b@bbrezillon>
 <20171130130907.GA16809@lenoch>
 <23d7ad3c-e6cd-3ba6-269a-1788371d13c3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d7ad3c-e6cd-3ba6-269a-1788371d13c3@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Roger,

On Fri, Dec 15, 2017 at 12:18:59PM +0200, Roger Quadros wrote:
> Ladislav,
> 
> On 30/11/17 15:09, Ladislav Michl wrote:
> > On Thu, Nov 30, 2017 at 11:25:44AM +0100, Boris Brezillon wrote:
> >> +Rob and the DT ML
> >>
> >> On Wed, 15 Nov 2017 17:24:58 +0100
> >> Ladislav Michl <ladis@linux-mips.org> wrote:
> >>
> >>> Compatible property is required for OMAP2+ mtd driver. Also
> >>> add INT pin gpio description and delete unused dma-channel
> >>> property.
> >>>
> >>> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> >>> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> >>> Acked-by: Roger Quadros <rogerq@ti.com>
> >>> ---
> >>>
> >>> Changes in v5:
> >>> - renamed R/B pin to INT pin
> >>>
> >>> Changes in v4:
> >>> - new patch
> >>>
> >>> Changes in v3: None
> >>> Changes in v2: None
> >>>
> >>>  Documentation/devicetree/bindings/mtd/gpmc-onenand.txt | 6 ++++--
> >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> >>> index b6e8bfd024f4..e9f01a963a0a 100644
> >>> --- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> >>> +++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
> >>> @@ -9,13 +9,14 @@ Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> >>>  
> >>>  Required properties:
> >>>  
> >>> + - compatible:		"ti,omap2-onenand"
> >>
> >> Don't you break backward compat by adding this new requirement?
> > 
> > I was told it is okay in this case as OneNAND conversion to DT is unfinished.
> > There was compat fixup code in earlier versions of patchset and it was dropped
> > later. If others see it opposite way I can add it back.
> > 
> 
> If it is possible not to break backward compatibility then we shouldn't.
> Only if things are getting real messy because of the poor way the earlier DT
> implementation was done we can consider it as an exception.

Well, it is possible to reintroduce fixup. Based on other posts on linux-omap
mailing list, it seems that n900, etc. support is still under heavy development,
so people are updating both kernel and dtb. That's why I happily agreed on
removing fixup.

Of course I'd like to hear opinion from n8x0 and n900 people and also would be
very happy if someone could finally test on OMAP2 device.

> I thought we rely on GPMC timings entirely from the DT now and so things don't
> work with older DT nodes?

Well, they do work as long as DT contains correct timings. Mainline driver just
ignores them a does calculations on its own, so it works even with wrong DT
timings as long as bootloader configured something reasonable (otherwise it
doe not work at all).

This is no longer the case. Now, driver is expecting reasonable timings, enough
good to get device probed. Driver then calculates optimized timings based on
actual OneNAND chip ised.

Thank you,
	ladis
