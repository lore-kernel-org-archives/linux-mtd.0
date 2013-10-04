Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSA9G-000422-9G
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 18:30:47 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Daniel Mack <zonque@gmail.com>
Subject: [PATCH 0/2] pxa3xx: Data buffer dynamic allocation
Date: Fri,  4 Oct 2013 15:30:36 -0300
Message-Id: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As part of my work to support the NAND controllers in Armada 370/XP SoC
here's a tiny set of patches to replace the currently data buffer allocation
based in a hardcoded buffer size, into a dynamic scheme.

We first use kmalloc to request a 256 bytes (big enough for the ONFI paramater
page) and then re-allocate (either with kmalloc or using DMA allocators) using
the detected page size.

The first patch is required to perform the initial NAND operations (READID
and friends) using programmable I/O since the DMA buffers are not ready
at such early stage.

The second patch performs to actual dynamic allocation and it's exactly
the same patch I sent a few weeks ago:

  http://patchwork.ozlabs.org/patch/275982/

Daniel: Can you test these two If they look fine we can add them now,
being an improvement to the driver pxa3xx beyond the Armada 370/XP effort.

Thanks!

Ezequiel Garcia (2):
  mtd: nand: pxa3xx: Move DMA I/O enabling
  mtd: nand: pxa3xx: Allocate data buffer on detected flash size

 drivers/mtd/nand/pxa3xx_nand.c | 51 +++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
1.8.1.5
