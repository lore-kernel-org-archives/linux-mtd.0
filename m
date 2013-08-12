Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V91PG-0000YF-Qs
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 23:20:11 +0000
Received: by mail-pb0-f41.google.com with SMTP id rp2so7310345pbb.14
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 16:19:49 -0700 (PDT)
Date: Mon, 12 Aug 2013 16:19:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4 00/14] pxa3xx-nand patches to support mvebu builds
Message-ID: <20130812231946.GB7267@brian-ubuntu>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 02:14:45PM -0300, Ezequiel Garcia wrote:
> This patchset is part of the work I'm doing to enable the pxa3xx-nand
> driver to support the NAND controller in Armada 370/XP. While this is
> work in progress, here's a subset of patches I consider good enough
> for mainline.

[snip]

> If at all possible and if no regressions are reported I'd like to see
> this queued for v3.12.
> 
> Changes from v3:
>   This new version has some very minor differences from the previous one:
>   * Dropped patch "mtd: nand: pxa3xx: Increase data buffer size".
>     This will be re-worked following a suggestion from Brian.
> 
>   * Fix commit message for patch "mtd: nand: pxa3xx: Support command buffer #3"
>     and add some comments to clarify the command buffer loading behavior.
> 
> Changes from v2:
> 
>   * Remove ifdef CONFIG_OF from the driver as suggested by Brian Norris.
> 
>   * Rework patch 01/15: "mtd: nand: pxa3xx: Introduce 'marvell,armada370...",
>     according to the above change.
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
> 
> Ezequiel Garcia (14):
>   mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF
>   mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible
>     string

This series includes an older version of the above patch, without the
Tested-by and with a trivial change in the spacing. I just pulled in the
v3 patch.

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
>   mtd: nand: Allow to build pxa3xx_nand on Orion platforms
> 
>  drivers/mtd/nand/Kconfig                      |   2 +-
>  drivers/mtd/nand/pxa3xx_nand.c                | 277 ++++++++++++++++----------
>  include/linux/platform_data/mtd-nand-pxa3xx.h |  13 --
>  3 files changed, 173 insertions(+), 119 deletions(-)

Pushed the whole series to l2-mtd.git, although I noted one comment in
patch 8. Thanks!

Brian
