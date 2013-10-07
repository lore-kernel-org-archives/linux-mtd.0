Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT8Tq-0000pJ-3B
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 10:56:02 +0000
From: Pekon Gupta <pekon@ti.com>
To: <computersforpeace@gmail.com>, <dedekind1@gmail.com>
Subject: [PATCH v2 0/4] optimize and clean-up of OMAP NAND and ELM driver
Date: Mon, 7 Oct 2013 16:25:01 +0530
Message-ID: <1381143305-28617-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, avinashphilipk@gmail.com, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes from v1 (minor)*
- rebased for newer version of previous patch-set
	[PATCH v7 0/6] mtd:nand:omap2: clean-up of supported ECC schemes
	http://lists.infradead.org/pipermail/linux-mtd/2013-October/048983.html
- code cleanup and formating updates

*original v1*
This patch series builds the base for adding support for newer H/W based ECC
schemes for NAND flash. This patch series 
- cleans-up redundant code among various
- optimizes ecc calculation and correction paths
- improves scalability and readability, for adding newer ecc-schemes in future.
This patch affects following data-paths: 
[PATCH 1/4] NAND chip->ecc.correct(): Detects and corrects ECC errors on read accesses.
[PATCH 2/4] NAND chip->ecc.calculate(): Calculates and fetches ECC syndrome from controller.
[PATCH 3/4] NAND chip->ecc.hwctl(): Configures H/W controller for Read/Write data acccesses.
[PATCH 4/4] ELM  add checks and updates code for scalability.

Pekon Gupta (4):
  mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.calculate() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.hwctl() for H/W ECC schemes
  mtd: devices: elm: add checks ELM H/W constrains, driver code cleanup

 drivers/mtd/devices/elm.c         | 122 ++++---
 drivers/mtd/nand/omap2.c          | 723 +++++++++++++-------------------------
 include/linux/platform_data/elm.h |   6 +-
 3 files changed, 325 insertions(+), 526 deletions(-)

-- 
1.8.1
