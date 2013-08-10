Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8825-0004lf-Lb
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 12:12:34 +0000
Date: Sat, 10 Aug 2013 09:12:09 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/14] pxa3xx-nand patches to support mvebu builds
Message-ID: <20130810121208.GA3080@localhost>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, Artem:

On Wed, Aug 07, 2013 at 09:31:05AM -0300, Ezequiel Garcia wrote:
> Hello everyone!
> 
> This patchset is part of the work I'm doing to enable the pxa3xx-nand
> driver to support the NAND controller in Armada 370/XP. While this is
> work in progress, here's a subset of patches I consider good enough
> for mainline.
> 
> Since pxa3xx has a mach-specific DMA API, I'm including a few patches to
> ifdef such pxa-specific code in non PXA/MMP platforms.
> This is only an ugly workaround and should be removed once the specific
> DMA API is replaced by dmaengine.
> 
> Daniel Mack is already working on that, so it's expected this removal
> will happen soon.
> 
> Other than that, the rest of the patchset is just assorted cleanups
> and minor fixes.
> 
> This patchset is based in Artem's l2-mtd master branch.
> 
> If at all possible and if no regressions are reported I'd like to see
> this queued for v3.12.
> 
> Changes from v1:
> 
>   * Use __maybe_unused instead of inline keyword for a symbol
>     that's maybe unused. Suggested by Brian Norris.
> 
>   * As Daniel Mack reported, the PXA nand controller (NFCv1)
>     lacks an NDBC3 register and it's access is undefined.
>     This means we need a way to distinguish between the two
>     controllers (NFCv1 and NFCv2).
> 
>     We introduce a new 'marvell,armada370-nand' compatible
>     string to distinguish the newer controller (NFCv2).
> 
> Ezequiel Garcia (14):
>   mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible
>     string
>   mtd: nand: pxa3xx: Handle ECC and DMA enable/disable properly
>   mtd: nand: pxa3xx: Allow to set/clear the 'spare enable' field
>   mtd: nand: pxa3xx: Support command buffer #3
>   mtd: nand: pxa3xx: Use 'length override' in ONFI paramater page read
>   mtd: nand: pxa3xx: Add a local loop variable
>   mtd: nand: pxa3xx: Remove hardcoded mtd name
>   mtd: nand: pxa3xx: Remove uneeded internal cmdset
>   mtd: nand: pxa3xx: Move cached registers to info structure
>   mtd: nand: pxa3xx: Make dma code dependent on dma capable platforms
>   mtd: nand: pxa3xx: Add __maybe_unused keyword to enable_int()
>   mtd: nand: pxa3xx: Allow devices with no dma resources
>   mtd: nand: pxa3xx: Increase data buffer size
>   mtd: nand: Allow to build pxa3xx_nand on Orion platforms
> 
>  drivers/mtd/nand/Kconfig                      |   2 +-
>  drivers/mtd/nand/pxa3xx_nand.c                | 269 ++++++++++++++++----------
>  include/linux/platform_data/mtd-nand-pxa3xx.h |  13 --
>  3 files changed, 171 insertions(+), 113 deletions(-)
> 

Is there anything to review on this series?

Otherwise, I'd like this to be queued for v3.12 -if at all possible.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
