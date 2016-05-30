Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7JDA-0007VM-2I
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 09:10:12 +0000
Date: Mon, 30 May 2016 11:09:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, rogerq@ti.com, tony@atomide.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH v2 0/2] mtd: nand: omap2: Add EDMA support for NAND DMA
 prefetch
Message-ID: <20160530110950.29ac7a43@bbrezillon>
In-Reply-To: <1462386884-16380-1-git-send-email-fcooper@ti.com>
References: <1462386884-16380-1-git-send-email-fcooper@ti.com>
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

Hi Franklin,

On Wed,  4 May 2016 13:34:42 -0500
Franklin S Cooper Jr <fcooper@ti.com> wrote:

> This patchset includes the required patches to enable NAND DMA prefetch
> support when using the EDMA.
> 
> This patchset depends on my previous patchset to enable NAND DMA prefetch
> using the SDMA and Roger's GPMC and NAND rework. Both of these patchsets
> are apart of Boris' NAND next patch. Therefore, these patches are also
> built on top of this branch.
> 
> Also the following patches that fixes GPMC's DMA property are required
> and pulled into other trees but are not currently apart of the above
> branch:
> https://patchwork.ozlabs.org/patch/596014/
> https://patchwork.ozlabs.org/patch/596012/

Applied.

Thanks,

Boris

> 
> Version 2 changes:
> Switched to the new dma_request_chan api which is now preferred.
> Add performance numbers to the commit.
> 
> Franklin S Cooper Jr (2):
>   mtd: nand: omap2: Support parsing dma channel information from DT
>   ARM: OMAP2+: Update GPMC and NAND DT binding documentation
> 
>  Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
>  Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
>  drivers/mtd/nand/omap2.c                                           | 7 ++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
