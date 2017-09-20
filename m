Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dujkW-00024Y-JZ
 for linux-mtd@lists.infradead.org; Wed, 20 Sep 2017 18:29:30 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org,
 tien.hock.loh@intel.com, hean.loong.ong@intel.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH v2 0/3] Altera ASMI Parallel II IP Core
Date: Wed, 20 Sep 2017 11:28:56 -0700
Message-Id: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
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

Patch 3 contains a work around for some non-standard behavior of EPCQ flash.

Matthew Gerlach (3):
  dt-bindings: mtd: Altera ASMI Parallel II IP Core
  mtd: spi-nor: Altera ASMI Parallel II IP Core
  mtd: spi-nor: add flag for reading dummy cycles from nv cfg reg

 .../devicetree/bindings/mtd/altera-asmip2.txt      |  15 +
 MAINTAINERS                                        |   7 +
 drivers/mtd/spi-nor/Kconfig                        |   6 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/altera-asmip2.c                | 478 +++++++++++++++++++++
 include/linux/mtd/altera-asmip2.h                  |  27 ++
 6 files changed, 534 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
 create mode 100644 drivers/mtd/spi-nor/altera-asmip2.c
 create mode 100644 include/linux/mtd/altera-asmip2.h

-- 
2.7.4
