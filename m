Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQXJ9-000525-6J
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 07:22:32 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v7 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Date: Thu, 20 Mar 2014 12:51:54 +0530
Message-ID: <1395300118-32202-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*changes v6 -> v7*
Incorporated feedbacks from Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
 - using dev_err() instead of pr_err()
 - moved un-related addition of info->ecc_steps, info->ecc_step_bytes,
   info->ecc_step_size from [PATCH v6 1/4] into subsequent patches
 - dropped pr_fmt() change


*changes v5 -> v6*
[PATCH 02/04] minor cleanup

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
  mtd: devices: elm: check for hardware engine's design constraints
  mtd: devices: elm: clean elm_load_syndrome
  mtd: devices: elm: configure parallel channels based on ecc_steps
  mtd: devices: elm: update DRIVER_NAME as "omap-elm"

 drivers/mtd/devices/elm.c         | 43 ++++++++++++++++++++++++++++-----------
 drivers/mtd/nand/omap2.c          |  9 +++++---
 include/linux/platform_data/elm.h | 10 ++-------
 3 files changed, 39 insertions(+), 23 deletions(-)

-- 
1.8.5.1.163.gd7aced9
