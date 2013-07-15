Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UykCW-0006ij-VZ
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2013 14:56:33 +0000
From: Pekon Gupta <pekon@ti.com>
To: <dedekind1@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH v1 0/5] optimize and clean-up of OMAP NAND and ELM driver
Date: Mon, 15 Jul 2013 20:25:47 +0530
Message-ID: <1373900152-26885-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: arnd@arndb.de, tony@atomide.com, avinashphilipk@gmail.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 benoit.cousson@linaro.org, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series builds the base for adding support for newer H/W based ECC
schemes for NAND flash. This patch cleans-up redundant code among various
ECC schemes and improves scalability and readability.
This patch affects following data-paths: 
[PATCH 1/5] NAND chip->ecc.correct(): Detects and corrects ECC errors on read accesses.
[PATCH 2/5] NAND chip->ecc.calculate(): Calculates and fetches ECC syndrome from controller.
[PATCH 3/5] NAND chip->ecc.hwctl(): Configures H/W controller for Read/Write data acccesses.
[PATCH 4/5] ELM  add checks and updates code for scalability.
[PATCH 5/5] NAND code clean-up to improve readability.


Pekon Gupta (5):
  mtd: nand: omap: optimized chip->ecc.correct() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.calculate() for H/W ECC schemes
  mtd: nand: omap: optimize chip->ecc.hwctl() for H/W ECC schemes
  mtd: devices: elm: add checks ELM H/W constrains, driver code cleanup
  mtd: nand: omap: code clean-up and white-space fixes

 drivers/mtd/devices/elm.c         | 114 ++---
 drivers/mtd/nand/omap2.c          | 906 ++++++++++++++------------------------
 include/linux/platform_data/elm.h |   6 +-
 3 files changed, 411 insertions(+), 615 deletions(-)

-- 
1.8.1
