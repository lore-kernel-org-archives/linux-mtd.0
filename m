Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTvZ-0001EQ-MM
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:39:59 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v5 0/6] Introduction to SPI NAND framework
Date: Mon, 10 Apr 2017 15:51:47 +0800
Message-ID: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First of all, thank Boris, Marek and Cyrille for your comments
on v4 and thank Arnaud for your testing on v4. Since I'm quite
busy last week, I failed to reply all the comments, I'm really
sorry for that.

According to Boris's suggestion, I rebased my patches on nand/next
branch with Boris's generic NAND patches. This time I only send
my SPI NAND patches out since it's the focus.

I created my own branch for convenience[3]. You can find both
my SPI NAND patches and Boris's generic NAND framework patches.

This series introductes a SPI NAND framework.
SPI NAND is a new NAND family device with SPI protocol as
its interface. And its command set is totally different
with parallel NAND.

Our first attempt was more than 2 years ago[1]. At that
time, I didn't make BBT shareable and there were too many
duplicate code with parallel NAND, so that serie stoped.
But the discussion never stops. Now Boris has a plan to
make a generic NAND framework which can be shared with
both parallel and SPI NAND. Now the first step of the
new generic NAND framework is finished. And it is waiting
for a user. After discussion with Boris. We both think it's
time to rebuild SPI NAND framework based on the new NAND
framework and send out for reviewing.

This series is based on Boris's nand/generic branch[2], which
is on 4.11-rc1. In this serie, BBT code is totally shared.
Of course SPI NAND can share more code with parallel, this
requires to put more in new NAND core (now only BBT included).
I'd like to send this serie out first, then we can decide
which part should be in new NAND core.

This series only supports basic SPI NAND features and uses
generic spi controller for data transfer, on-die ECC for data
correction. Support advanced features and specific SPI NAND
controller with hardware ECC is the next step.

This series is tested on Xilinx Zedboard with Micron
MT29F2G01ABAGDSF SPI NAND chip.


v5 changes:
- rebase patch on nand/next with Boris's generic NAND framework patches[3]
- replace pr_xxx() with dev_xxx()
- replace kzalloc()i/kfree() with devm_kzalloc()/devm_kfree()
- rename spinand_op_init() to spinand_init_op() for consistency
- remove command opcode in function comments
- use BIT(n) instead (1 << n) in macro
- remove manufactures.c and put spinand_manufacturers table in core.c
- change spinand_write_reg() u8 *buf argument to u8 value,
  since the length is always 1
- remove spinand_manufacture->detect() check, since it is always != NULL
- alloc spinand_ecc_engine struct in vendor.c when using on-die ECC
  (for hardware ECC, it should be in controllers/*.c)
- add comment header for struct spinand_op
- fix timeout bug in spinand_wait(), thanks for Arnaud's debug
- make spinand_manufacturers const
- add ecc_engine_ops pointer in struct micron_spinand_info
- make controller->cap assignment right with SPI_TX/RX_QUAD/DUAL flag

v4 changes:
- initialize struct mtd_oob_ops to 0 in bbt.c
- rename new added helper in nand.h to nand_check_xxxx()
- add struct mtd_oob_ops consistency check in nand_check_oob_ops()
- add dataleft in struct nand_page_iter instead of offs
- remove spinand_manufacturers->ops->detect() check since it is mandatory
- remove spinand_set_manufacturer_ops() and do the job in
  spinand_manufacturer_detect()
- move .priv out of struct spinand_controller
- add spinand_alloc/free/register/unregister() and make
  spinand_detect/init() static
- make BBT be configured by device tree
- chip->id.data stores raw ID directly
- refine device info print message after detect success
- add struct mtd_layout_ops pointer in struct micron_spinand_info
- remove micron_spinand_init() and do its job in micron_spinand_detect()
- fix BBT block cannot be erased bug

v3 changes:
- rebase patch on 4.11-rc1[2]
- change read ID method. read 4 bytes ID out then let ->detect() of each
  manufacutre driver to decode ID and detect the device.
- make SPI NAND id table private to each manufacutre driver
- fix coding style to make checkpatch.pl happy
- update the MAINTAINERS file for spi nand code
- add nand_size() helper in nand.h
- use nand_for_each_page() helper in spinand_do_read/write_ops()
- create helper to check boundaries in generic NAND code and use it
  in SPI NAND core
- rename spinand_base.c to core.c
- manufactures' drivers expose spinand_manufacturer struct instead of
  spinand_manufacturer_ops struct to keep Manufacture ID macro in
  manufactures' drivers and rename spinand_ids.c to manufacture.c
- rename spinand_micron.c to micron.c
- rename chips/ directory to controllers/
- rename generic_spi.c to generic-spi.c
- replace ->build_column_addr() and ->get_dummy() hooks with ->prepare_op() in
  spinand_manufacturer_ops struct
- rename __spinand_erase() to spinand_erase()
- rename spinand_erase() to spinand_erase_skip_bbt()
- rename spinand_scan_ident() to spinand_detect()
- rename spinand_scan_tail() to spinand_init()
- move non detect related code from spinand_detect() to spinand_init()
- remove spinand_fill_nandd, assign nand->ops in spinand_detect()
- merge v2 patch 3(bad block support) and patch 4(BBT support)
- drop getchip parameter, remove spinand_get/remove_device(), take the lock
  by caller directly
- fix function comment headers
- use nand_bbt_is_initialized() helper
- replace spinand_ecc_engine and spinand_controller object in spinand_device
  struct with pointer
- replace struct spinand_manufacturer_ops pointer in spinand_device struct
  with spinand_manufacturer struct

v2 changes:
- replace "spi_nand" with "spinand".
- rename spi nand related structs for better understanding.
- introduce spi nand controller, manufacturer and ecc_engine struct.
- add spi nand manufacturer initialization function refer to Boris's
  manuf-init branch.
- remove NAND_SKIP_BBTSCAN from series. Add it later when enabling HW ECC.
- reorganize series according to Boris's suggestion.


[1]http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
[2]https://github.com/bbrezillon/linux-0day/tree/nand/generic
[3]https://github.com/peterpansjtu/linux/tree/nand/spinand


Peter Pan (6):
  nand: spi: add basic blocks for infrastructure
  nand: spi: add basic operations support
  nand: spi: Add bad block support
  nand: spi: add Micron spi nand support
  nand: spi: Add generic SPI controller support
  MAINTAINERS: Add SPI NAND entry

 MAINTAINERS                                    |    9 +
 drivers/mtd/nand/Kconfig                       |    1 +
 drivers/mtd/nand/Makefile                      |    1 +
 drivers/mtd/nand/spi/Kconfig                   |    7 +
 drivers/mtd/nand/spi/Makefile                  |    3 +
 drivers/mtd/nand/spi/controllers/Kconfig       |    5 +
 drivers/mtd/nand/spi/controllers/Makefile      |    1 +
 drivers/mtd/nand/spi/controllers/generic-spi.c |  159 +++
 drivers/mtd/nand/spi/core.c                    | 1522 ++++++++++++++++++++++++
 drivers/mtd/nand/spi/micron.c                  |  254 ++++
 include/linux/mtd/spinand.h                    |  261 ++++
 11 files changed, 2223 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
 create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
 create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c
 create mode 100644 drivers/mtd/nand/spi/core.c
 create mode 100644 drivers/mtd/nand/spi/micron.c
 create mode 100644 include/linux/mtd/spinand.h

-- 
1.9.1
