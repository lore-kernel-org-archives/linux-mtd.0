Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM1s-0008Ni-8V
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:16 +0000
Received: by wyb28 with SMTP id 28so3113364wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:13 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/9] Support for MMIO based Denali NAND controller
Date: Fri,  6 May 2011 15:28:54 +0100
Message-Id: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali block found in the Intel Moorestown platform can also be found in
some SoC devices on a simple bus rather than PCI.  This series refactors the
PCI based driver so that it can either be registered as either a PCI device or
a platform_device.

This series also incorporates a couple of small cleanups and support for MTD
partitioning.

This is an early RFC as the silicon with the device in isn't back yet and I
don't have a Moorestown platform to test against, but I'd appreciate any
feedback.

Jamie Iles (9):
  nand/denali: convert to generic DMA API
  nand/denali: remove nearly-duplicated register definitions
  nand/denali: detect the number of banks
  nand/denali: split the generic driver and PCI layer
  nand/denali: convert to dev_() printk helpers
  nand/denali: add an mmio driver
  nand/denali: annotate pci init/exit functions with correct section
  nand/denali: allow the number of ECC bits to be set by pdata
  nand/denali: support MTD partitioning

 drivers/mtd/nand/Kconfig             |   21 ++-
 drivers/mtd/nand/Makefile            |    2 +
 drivers/mtd/nand/denali.c            |  500 ++++++++++++----------------------
 drivers/mtd/nand/denali.h            |  379 +++++---------------------
 drivers/mtd/nand/denali_mmio.c       |  145 ++++++++++
 drivers/mtd/nand/denali_pci.c        |  143 ++++++++++
 include/linux/platform_data/denali.h |   25 ++
 7 files changed, 576 insertions(+), 639 deletions(-)
 create mode 100644 drivers/mtd/nand/denali_mmio.c
 create mode 100644 drivers/mtd/nand/denali_pci.c
 create mode 100644 include/linux/platform_data/denali.h

-- 
1.7.4.4
