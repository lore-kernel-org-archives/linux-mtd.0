Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeNev-0007RD-KN
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 14:03:19 +0000
Subject: Re: [PATCH v4 0/7] mtd: nand: Fix support for NAND DMA prefetch
To: Franklin S Cooper Jr <fcooper@ti.com>, <nsekhar@ti.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <tony@atomide.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <56E2CFF3.3030009@ti.com>
Date: Fri, 11 Mar 2016 16:02:27 +0200
MIME-Version: 1.0
In-Reply-To: <1457654203-20856-1-git-send-email-fcooper@ti.com>
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

Franklin,

On 11/03/16 01:56, Franklin S Cooper Jr wrote:
> NAND DMA prefetch has been broken for awhile and seems to have only
> worked for SDMA based devices
> 
> This patchset fixes DMA prefetch to work on both EDMA and SDMA devices
> 
> Test on:
> am335x gp evm
> am437x gp evm
> am37x gp evm
> 
> This rev is pretty much the same as v2 which was blocked due to
> dependencies to Roger's update GPMC/NAND rework.
> 
> This updated rev removes this dependency.
> 
> Also it fixes an issue that was introduced when the eDMA driver was
> recently updated.
> 
> Links to rev 3 patchset:
> https://patchwork.ozlabs.org/patch/595631/
> https://patchwork.ozlabs.org/patch/595626/
> https://patchwork.ozlabs.org/patch/595628/
> https://patchwork.ozlabs.org/patch/595630/
> https://patchwork.ozlabs.org/patch/595627/
> https://patchwork.ozlabs.org/patch/595629/
> 
> Links to rev 2 patchset:
> https://patchwork.kernel.org/patch/7408691/
> https://patchwork.kernel.org/patch/7408681/
> https://patchwork.kernel.org/patch/7408661/
> https://patchwork.kernel.org/patch/7408641/
> https://patchwork.kernel.org/patch/7408621/
> 
> Franklin S Cooper Jr (7):
>   ARM: OMAP2+: gpmc-nand: Set omap2-nand's parent dev to GPMC dev
>   ARM: dts: am33xx: Fix GPMC dma properties
>   ARM: dts: am437x: Fix GPMC dma properties

Can you please fix the gpmc nodes in dm816x.dtsi and dm814x.dtsi as well?
You can use linux-next tree or [1] to see the latest changes to these files
that will end up in v4.6 and base your changes on that.

[1] Tony's omap-for-v4.6/dt
https://git.kernel.org/cgit/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v4.6/dt


>   mtd: nand: omap2: Support parsing dma channel information from DT
>   mtd: nand: omap2: Start dma request before enabling prefetch
>   mtd: nand: omap2: Fix high memory dma prefetch transfer
>   ARM: OMAP2+: Update GPMC and NAND DT binding documentation
> 
>  Documentation/devicetree/bindings/bus/ti-gpmc.txt  |  7 +++++-
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 +-
>  arch/arm/boot/dts/am33xx.dtsi                      |  2 +-
>  arch/arm/boot/dts/am4372.dtsi                      |  2 +-
>  arch/arm/mach-omap2/gpmc-nand.c                    | 16 ++++++++++++-
>  drivers/mtd/nand/omap2.c                           | 27 +++++++++-------------
>  6 files changed, 35 insertions(+), 21 deletions(-)
> 

cheers,
-roger
