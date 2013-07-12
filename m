Received: from mms2.broadcom.com ([216.31.210.18])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxX4L-0001Rv-7X
 for linux-mtd@lists.infradead.org; Fri, 12 Jul 2013 06:43:05 +0000
From: "Kamlakant Patel" <kamlakant.patel@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] MTD: Micron SPINAND Driver support
Date: Fri, 12 Jul 2013 12:21:06 +0530
Message-ID: <1373611867-23700-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Kamlakant Patel <kamlakant.patel@broadcom.com>,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch is an updated version of the patch http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html posted by Mona Anonuevo <manonuevo@micron.com>. The driver has been cleaned up and updated for latest kernel.

Summary of the changes to the original driver:
 1. The Micron driver used custom framework in spinand_mtd.c, this file is removed
    and driver now uses standard NAND framework.
 2. Added Device tree support to the driver, flash partitions can be defined
    through device tree.
 3. Removed spinand_get_info, and provide the device specific entries to nand_flash_ids(nand_ids.c).
 4. Added nand_scan to scan the NAND device, flash ID and setup the MTD fields accordingly.
 5. Updated coding style and fixed compilation errors and issues reported by checkpatch.

This driver is tested with Micron SPINAND MT29F1G01ZACH4 chip on kernel 3.10 on the Netlogic XLP platform.

Mona Anonuevo: I have retained your sign-offs from the original patch, please review the patch and let me know if you have any issues with this.

Kamlakant Patel (1):
  MTD: Micron SPINAND Driver support

 drivers/mtd/nand/Kconfig       |   16 +
 drivers/mtd/nand/Makefile      |    1 +
 drivers/mtd/nand/nand_ids.c    |    5 +
 drivers/mtd/nand/spinand_lld.c |  915 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  109 +++++
 5 files changed, 1046 insertions(+)
 create mode 100644 drivers/mtd/nand/spinand_lld.c
 create mode 100644 include/linux/mtd/spinand.h

-- 
1.7.9.5
