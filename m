Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deQE6-0003hF-0n
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 18:24:36 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH 0/3] Altera ASMI Parallel II IP Core
Date: Sun,  6 Aug 2017 11:24:01 -0700
Message-Id: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

This patch set adds a spi-nor flash driver for the Altera ASMI Parallel II 
IP Core.  This driver was created based on feedback from Marek Vasut,
Cyrill Pitchen, and Michal Suchanek regarding Version 2 of the Altera
Quadspi Controller: https://lkml.org/lkml/2017/6/26/518

The overall problem with Version 2 of the Altera Quadspi Controller and 
its driver was the fact that there was much duplication of code and logic
with the spi-nor framework.  This new combination of fpga hardware and 
software "gets out of the way" of the spi-nor framework.  The result is a
much simpler driver with the spi-nor framework performing the bulk of the work.

Patch 1 contains the device tree bindings for the driver for
the Altera ASMI-Parallel II IP Core.

Patch 2 contains the driver code for the Altera ASMI-Parallel II IP Core.
This driver supports being configured via a device tree or with platform
data.  In the later case, the memory for the registers has been remapped.
This later case is intended for cases where the Altera ASMI-Parallel II
driver is child of a pcie driver that has already mapped the BAR memory
(See Patch 3).

Patch 3 is for informational purposes only.  The patch is against the
intel-fpga PCIe driver currently being reviewed linux-fpga mailing list.
It shows how a PCIe driver might create an instance of the Altera
ASMI Parallel II spi-nor driver.

Matthew Gerlach (3):
  dt-bindings: mtd: Altera ASMI Parallel II IP Core
  mtd: spi-nor: Altera ASMI Parallel II IP Core
  fpga: intel: Add QSPI FPGA Management Entity Feature

 .../devicetree/bindings/mtd/altera-asmip2.txt      |  22 +
 MAINTAINERS                                        |   7 +
 drivers/mtd/spi-nor/Kconfig                        |   6 +
 drivers/mtd/spi-nor/Makefile                       |   3 +-
 drivers/mtd/spi-nor/altera-asmip2.c                | 474 +++++++++++++++++++++
 include/linux/mtd/altera-asmip2.h                  |  24 ++
 6 files changed, 535 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
 create mode 100644 drivers/mtd/spi-nor/altera-asmip2.c
 create mode 100644 include/linux/mtd/altera-asmip2.h

-- 
2.7.4
