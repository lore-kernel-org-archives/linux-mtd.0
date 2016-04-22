Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atX97-0008SQ-3s
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:13:05 +0000
Date: Fri, 22 Apr 2016 11:12:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, tony@atomide.com,
 rogerq@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: nand: omap2: Fix SDMA support for NAND DMA
 prefetch
Message-ID: <20160422111243.68de7cb0@bbrezillon>
In-Reply-To: <1460752139-12742-1-git-send-email-fcooper@ti.com>
References: <1460752139-12742-1-git-send-email-fcooper@ti.com>
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

On Fri, 15 Apr 2016 15:28:57 -0500
Franklin S Cooper Jr <fcooper@ti.com> wrote:

> NAND DMA prefetch for SDMA based devices has been broken for awhile. This
> patchset fixes it so SOCs that use the SDMA can make use of the NAND
> DMA prefetch.
> 
> I've decided to split this patchset from the slightly larger patchset that
> included EDMA support. Adding EDMA support will be added in a later
> patchset.
> 
> Tested using the latest master on:
> am37 gp evm
> 
> Due to a silicon issue Dra7 SoCs are unable to use NAND DMA prefetch.

Applied, thanks.

Boris

> 
> Cooper Jr., Franklin (2):
>   mtd: nand: omap2: Start dma request before enabling prefetch
>   mtd: nand: omap2: Fix high memory dma prefetch transfer
> 
>  drivers/mtd/nand/omap2.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
