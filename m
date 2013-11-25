Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkt6q-0001FX-QI
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 10:09:41 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brain Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v4 0/4] optimize and clean-up of OMAP NAND and ELM driver
Date: Mon, 25 Nov 2013 15:38:57 +0530
Message-ID: <1385374141-10934-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


*changes from v3* (feedbacks from Brian Norris <computersforpeace@gmail.com>)
[PATCH 2/4] reverted back macros used for clearing & masking gpmc_ecc_config reg
[PATCH 4/4]
- updated: using 'pr_fmt(fmt)' to suffix DRIVER_NAME to error messages
- removed: local 'eccsteps' in ELM driver, instead using nand_chip->ecc.steps
- cleanup: consitent use of DRIVER_NAME and removed irrelavant white-space changes


*changes from v2 (rebased)*
- rebased on [PATCH v11] mtd:nand:omap2: clean-up of supported ECC schemes
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049410.html


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
[PATCH 1/4] nand_chip->ecc.correct(): Detects and corrects ECC errors on read accesses.
[PATCH 2/4] nand_chip->ecc.calculate(): Calculates and fetches ECC syndrome from controller.
[PATCH 3/4] nand_chip->ecc.hwctl(): Configures H/W controller for Read/Write data acccesses.
[PATCH 4/4] ELM driver: add checks and updates code for scalability.

Pekon Gupta (4):
  mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.calculate() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.hwctl() for H/W ECC schemes
  mtd: devices: elm: add checks ELM H/W constrains, driver code cleanup

 drivers/mtd/devices/elm.c         | 127 ++++---
 drivers/mtd/nand/omap2.c          | 698 +++++++++++++-------------------------
 include/linux/platform_data/elm.h |   6 +-
 3 files changed, 318 insertions(+), 513 deletions(-)

-- 
1.8.1
