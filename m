Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3wnw-00037f-OV
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 23:24:42 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/13] pxa3xx patches to support mvebu builds
Date: Mon, 29 Jul 2013 20:24:10 -0300
Message-Id: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, eric.miao@marvell.com,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone!

This patchset is part of the work I'm doing to enable the pxa3xx-nand
driver to support the NAND controller in Armada 370/XP. While this
work in progress, here's a subet of patches I consider good enough
for mainline.

It's worth noting that using these patches and adding appropriate
DT nodes, the NAND controller in Armada 370/XP SoC can detect
devices that are ONFI-compliant.

It's also worth noting that since pxa3xx has a mach-specific
DMA API, I'm including a few patches to ifdef such pxa-specific
code in non PXA/MMP platforms. This ugly workaround should be
removed once the specific DMA API is replaced by dmaengine.

Since there's no current schedule on when should that move happen,
for now we have no choice but to implement some ifdefs workaround.

Other than that, the rest of the patchset is just assorted cleanups
and minor fixes.

I'm Ccing some past pxa3xx-nand testers and reviewers, with the hope
they can take a look at this new patchset.

Any feedback and testing will be highly appreciated!

Ezequiel Garcia (13):
  mtd: nand: pxa3xx: Handle ECC and DMA enable/disable properly
  mtd: nand: pxa3xx: Allow to set/clear the 'spare enable' field
  mtd: nand: pxa3xx: Support command buffer #3
  mtd: nand: pxa3xx: Use 'length override' in ONFI paramater page read
  mtd: nand: pxa3xx: Add a local loop variable
  mtd: nand: pxa3xx: Remove hardcoded mtd name
  mtd: nand: pxa3xx: Remove uneeded internal cmdset
  mtd: nand: pxa3xx: Move cached registers to info structure
  mtd: nand: pxa3xx: Make dma code dependent on dma capable platforms
  mtd: nand: pxa3xx: Add inline keyword to function enable_int()
  mtd: nand: pxa3xx: Allow devices with no dma resources
  mtd: nand: pxa3xx-nand: Increase data buffer size
  mtd: nand: Allow to build pxa3xx_nand on Orion platforms

 drivers/mtd/nand/Kconfig                      |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                | 229 +++++++++++++++-----------
 include/linux/platform_data/mtd-nand-pxa3xx.h |  13 --
 3 files changed, 132 insertions(+), 112 deletions(-)

-- 
1.8.1.5
