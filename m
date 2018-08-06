Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmbic-0007es-VA
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 09:22:29 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Jane Wan <Jane.Wan@nokia.com>, Jagdish Gediya <jagdish.gediya@nxp.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: nand: fsl-ifc: fix SRAM initialization for newer
 controller
Date: Mon,  6 Aug 2018 11:21:35 +0200
Message-Id: <20180806092137.9287-1-kurt@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the current way of initializing the internal SRAM of the IFC controller only
works for older controller versions. Newer versions require a different
method. So, adding support for it.

Thereby, the result of the SRAM initialization should be checked. If it's not
successful, further commands such as read won't work.

Tested on hardware.

Thanks,
Kurt

Kurt Kanzenbach (2):
  mtd: nand: fsl-ifc: check result of SRAM initialization
  mtd: nand: fsl-ifc: fixup SRAM init for newer ctrl versions

 drivers/mtd/nand/raw/fsl_ifc_nand.c | 35 +++++++++++++++++++++++++++++++----
 include/linux/fsl_ifc.h             |  2 ++
 2 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.11.0
