Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFk9N-0001Zz-Tl
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 15:33:10 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Date: Wed, 22 Jun 2016 18:32:42 +0300
Message-Id: <1466609565-113251-1-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is second version of the series. The first version can be found here:

  https://lkml.org/lkml/2016/6/14/269

This adds support for the Intel SPI serial flash controller found on many
recent Intel CPUs including Baytrail and Braswell. This driver makes it
possible to access the BIOS and other platform data which is stored on the
SPI serial flash. It is also possible to upgrade the BIOS using this driver
if it has not been protected by special hardware bits.

The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
MAX.

Since poking the SPI serial flash can brick the machine, this driver can
only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
unless instructed othwerwise by module parameter.

Changes from v1:

[1/3] spi-nor: Add support for Intel SPI serial flash controller

  * Older hardware does not support 64k erase command so added erase_64k
    flag which is set only for Broxton (BXT).

  * Fix protection range offset for Broxton. Now there is ispi->pregs
    pointing to the start of the protection registers.

  * Change naming of constants from BCR_BYT -> BYT_BCR and so on.

[2/3] mfd: lpc_ich: Add support for SPI serial flash host controller

  * Drop lpc_ich_finalize_spi_cell() and initialize cell directly in
    lpc_ich_init_spi().

  * Use info->type in switch in lpc_ich_init_spi().

  * Add defines for magic numbers used in lpc_ich_init_spi().

  * Use PLATFORM_DEVID_NONE with mfd_add_devices().

[3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC

  * No changes

Mika Westerberg (3):
  spi-nor: Add support for Intel SPI serial flash controller
  mfd: lpc_ich: Add support for SPI serial flash host controller
  mfd: lpc_ich: Add support for Intel Apollo Lake SoC

 Documentation/mtd/intel-spi.txt          |  88 ++++
 drivers/mfd/lpc_ich.c                    | 131 ++++++
 drivers/mtd/spi-nor/Kconfig              |  20 +
 drivers/mtd/spi-nor/Makefile             |   2 +
 drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
 drivers/mtd/spi-nor/intel-spi.c          | 773 +++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.h          |  24 +
 include/linux/mfd/lpc_ich.h              |   3 +
 include/linux/platform_data/intel-spi.h  |  31 ++
 9 files changed, 1129 insertions(+)
 create mode 100644 Documentation/mtd/intel-spi.txt
 create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.h
 create mode 100644 include/linux/platform_data/intel-spi.h

-- 
2.8.1
