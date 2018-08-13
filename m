Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp78l-0005cq-BK
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 07:19:48 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Jane Wan <Jane.Wan@nokia.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mtd: rawnand: fsl_ifc: fix SRAM initialization for
 newer controller
Date: Mon, 13 Aug 2018 09:18:44 +0200
Message-Id: <20180813071846.9433-1-kurt@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this is version two of

 lkml.kernel.org/r/20180806092137.9287-1-kurt@linutronix.de

Changes since v1:

 - Addressed comments from Miquel Raynal
   - Changed subject
   - Coding style
   - Using timeout constants
   - Moving version check completely into fsl_ifc_sram_init()

Thanks,
Kurt

Kurt Kanzenbach (2):
  mtd: rawnand: fsl_ifc: check result of SRAM initialization
  mtd: rawnand: fsl_ifc: fixup SRAM init for newer ctrl versions

 drivers/mtd/nand/raw/fsl_ifc_nand.c | 36 ++++++++++++++++++++++++++++++++----
 include/linux/fsl_ifc.h             |  2 ++
 2 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.11.0
