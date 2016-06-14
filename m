Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCmkn-0000y4-D2
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 11:43:33 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] spi-nor: Add support for Intel SPI serial flash controller
Date: Tue, 14 Jun 2016 14:43:06 +0300
Message-Id: <1465904589-141386-1-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series adds support for the Intel SPI serial flash controller found on
many recent Intel CPUs including Baytrail and Braswell. This driver makes
it possible to access the BIOS and other platform data which is stored on
the SPI serial flash. It is also possible to upgrade the BIOS using this
driver if it has not been protected by special hardware bits.

The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
MAX.

Since poking the SPI serial flash can brick the machine, this driver can
only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
unless instructed othwerwise by module parameter.

Mika Westerberg (3):
  spi-nor: Add support for Intel SPI serial flash controller
  mfd: lpc_ich: Add support for SPI serial flash host controller
  mfd: lpc_ich: Add support for Intel Apollo Lake SoC

 Documentation/mtd/intel-spi.txt          |  87 ++++
 drivers/mfd/lpc_ich.c                    | 134 ++++++
 drivers/mtd/spi-nor/Kconfig              |  20 +
 drivers/mtd/spi-nor/Makefile             |   2 +
 drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
 drivers/mtd/spi-nor/intel-spi.c          | 748 +++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.h          |  24 +
 include/linux/mfd/lpc_ich.h              |   3 +
 include/linux/platform_data/intel-spi.h  |  31 ++
 9 files changed, 1106 insertions(+)
 create mode 100644 Documentation/mtd/intel-spi.txt
 create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.h
 create mode 100644 include/linux/platform_data/intel-spi.h

-- 
2.8.1
