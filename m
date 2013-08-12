Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8viN-0007rI-1O
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 17:15:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 00/14] pxa3xx-nand patches to support mvebu builds
Date: Mon, 12 Aug 2013 14:14:45 -0300
Message-Id: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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

This patchset is part of the work I'm doing to enable the pxa3xx-nand
driver to support the NAND controller in Armada 370/XP. While this is
work in progress, here's a subset of patches I consider good enough
for mainline.

Since pxa3xx has a mach-specific DMA API, I'm including a few patches to
ifdef such pxa-specific code in non PXA/MMP platforms.
This is only an ugly workaround and should be removed once the specific
DMA API is replaced by dmaengine.

Daniel Mack is already working on that, so it's expected this removal
will happen soon.

Other than that, the rest of the patchset is just assorted cleanups
and minor fixes.

This patchset is based in today's Artem's l2-mtd master branch.

This series has been tested by Daniel Mack in pxa3xx boards
and no regressions have been reported (thanks Daniel!).

If at all possible and if no regressions are reported I'd like to see
this queued for v3.12.

Changes from v3:
  This new version has some very minor differences from the previous one:
  * Dropped patch "mtd: nand: pxa3xx: Increase data buffer size".
    This will be re-worked following a suggestion from Brian.

  * Fix commit message for patch "mtd: nand: pxa3xx: Support command buffer #3"
    and add some comments to clarify the command buffer loading behavior.

Changes from v2:

  * Remove ifdef CONFIG_OF from the driver as suggested by Brian Norris.

  * Rework patch 01/15: "mtd: nand: pxa3xx: Introduce 'marvell,armada370...",
    according to the above change.

Changes from v1:

  * Use __maybe_unused instead of inline keyword for a symbol
    that's maybe unused. Suggested by Brian Norris.

  * As Daniel Mack reported, the PXA nand controller (NFCv1)
    lacks an NDBC3 register and it's access is undefined.
    This means we need a way to distinguish between the two
    controllers (NFCv1 and NFCv2).

    We introduce a new 'marvell,armada370-nand' compatible
    string to distinguish the newer controller (NFCv2).


Ezequiel Garcia (14):
  mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF
  mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible
    string
  mtd: nand: pxa3xx: Handle ECC and DMA enable/disable properly
  mtd: nand: pxa3xx: Allow to set/clear the 'spare enable' field
  mtd: nand: pxa3xx: Support command buffer #3
  mtd: nand: pxa3xx: Use 'length override' in ONFI paramater page read
  mtd: nand: pxa3xx: Add a local loop variable
  mtd: nand: pxa3xx: Remove hardcoded mtd name
  mtd: nand: pxa3xx: Remove uneeded internal cmdset
  mtd: nand: pxa3xx: Move cached registers to info structure
  mtd: nand: pxa3xx: Make dma code dependent on dma capable platforms
  mtd: nand: pxa3xx: Add __maybe_unused keyword to enable_int()
  mtd: nand: pxa3xx: Allow devices with no dma resources
  mtd: nand: Allow to build pxa3xx_nand on Orion platforms

 drivers/mtd/nand/Kconfig                      |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                | 277 ++++++++++++++++----------
 include/linux/platform_data/mtd-nand-pxa3xx.h |  13 --
 3 files changed, 173 insertions(+), 119 deletions(-)

-- 
1.8.1.5
