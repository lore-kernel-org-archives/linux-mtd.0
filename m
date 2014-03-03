Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKQuj-00043W-Eq
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 11:20:06 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Date: Mon, 3 Mar 2014 16:49:19 +0530
Message-ID: <1393845563-7800-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v4 -> v5*
This patch series is split version from earlier series [1].
This series refactors and cleans ELM driver which is used by Hardware
based BCHx ecc-schemes.
 - Undo: introduction of 'struct mtd_info' and 'struct nand_chip'. Instead
         keep ELM driver independent of mtd_info and nand_chip structs and
         pass only required ECC configurations as elm_config() arguments
         elm_config(..., int ecc_steps, int ecc_step_size, int ecc_step_bytes)
 - Undo: re-writing of elm_load_syndrome() ECC register configurations.

*changes v3 -> v4 [1]*
 - in-corporated feedbacks from Brian Norris <computersforpeace@gmail.com>
 - updated: use 'pr_fmt(fmt)' to suffix DRIVER_NAME
 - removed: local 'eccsteps' in ELM driver, instead using nand_chip->ecc.steps
 - undo: irrelavant white-space changes

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-November/050242.html

Pekon Gupta (4):
  mtd: devices: elm: check for hardware engine's design constrains
  mtd: devices: elm: clean elm_load_syndrome
  mtd: devices: elm: configure parallel channels based on ecc_steps
  mtd: devices: elm: update DRIVER_NAME as "omap-elm"

 drivers/mtd/devices/elm.c         | 44 +++++++++++++++++++++++++++++----------
 drivers/mtd/nand/omap2.c          |  9 +++++---
 include/linux/platform_data/elm.h |  3 ++-
 3 files changed, 41 insertions(+), 15 deletions(-)

-- 
1.8.5.1.163.gd7aced9
