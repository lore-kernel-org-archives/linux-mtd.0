From: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <broonie@kernel.org>, <michal.simek@xilinx.com>,
 <soren.brinkmann@xilinx.com>, <zajec5@gmail.com>, <ben@decadent.org.uk>,
 <marex@denx.de>, <b32955@freescale.com>, <knut.wohlrab@de.bosch.com>,
 <juhosg@openwrt.org>, <beanhuo@micron.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <harinik@xilinx.com>, <punnaia@xilinx.com>, Ranjit Waghmode
 <ranjit.waghmode@xilinx.com>
Subject: [LINUX RFC v2 0/4] spi: add dual parallel mode support in Zynq MPSoC
 GQSPI controller
Date: Wed, 26 Aug 2015 11:56:03 +0530
Message-ID: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
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

This series adds dual parallel mode support for Zynq Ultrascale+
MPSoC GQSPI controller driver.

What is dual parallel mode?
---------------------------
ZynqMP GQSPI controller supports Dual Parallel mode with following functionalities:
1) Supporting two SPI flash memories operating in parallel. 8 I/O lines.
2) Chip selects and clock are shared to both the flash devices
3) This mode is targeted for faster read/write speed and also doubles the size
4) Commands/data can be transmitted/received from both the devices(mirror),
   or only upper or only lower flash memory devices.
5) Data arrangement:
   With stripe enabled,
   Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
   Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.

This series also updated MTD layer files for adding parallel mode support.

1) Added Support for two flashes
2) Support to enable/disable data stripe as and when required.
3) Added required parameters to spi_nor structure. Initialized all
   added parameters in spi_nor_scan()
4) Added support for dual parallel in spi_nor_read/write/erase functions by:
   a) Increasing page_size, sector_size, erase_size and toatal flash size
      as and when required.
   b) Dividing address by 2
   c) Updating spi->master->flags for qspi driver to change CS
5) Updated read_sr() to get status of both flashes
6) Also updated read_fsr() to get status of both flashes

These all are very high level changes and expected to make an idea clear.
Comments and suggestions are always welcomed

---
V2 Changes:
a) Splitted patches based on logical changes
b) Added error handling for newly added APIs in SPI core
---

Ranjit Waghmode (4):
  spi: add support of two chip selects & data stripe
  mtd: add spi_device instance to spi_nor struct
  spi-nor: add dual parallel mode support
  spi: zynqmp: gqspi: add support for dual parallel mode configuration

 drivers/mtd/devices/m25p80.c   |  1 +
 drivers/mtd/spi-nor/spi-nor.c  | 91 +++++++++++++++++++++++++++++++++---------
 drivers/spi/spi-zynqmp-gqspi.c | 24 ++++++++++-
 drivers/spi/spi.c              |  8 ++++
 include/linux/mtd/spi-nor.h    |  3 ++
 include/linux/spi/spi.h        | 11 +++++
 6 files changed, 118 insertions(+), 20 deletions(-)

--
2.1.2
