From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <nicolas.ferre@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <marex@denx.de>, <ben@decadent.org.uk>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [linux-next RFC v7 0/6] mtd: spi-nor: improve support of QSPI nor
Date: Tue, 15 Sep 2015 17:27:58 +0200
Message-ID: <cover.1442330503.git.cyrille.pitchen@atmel.com>
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

Hi all,

this series is still a work in progress though it is almost finished.
The support of Macronix dummy code to configure the number of dummy cycles
is still missing...

However I would like some feedbacks to synchronize this work with other
mtd / spi-nor improvements as I see lots of patches on the mailing list.

Best Regards,

Cyrille

Cyrille Pitchen (6):
  mtd: spi-nor: remove unused read_xfer/write_xfer hooks
  mtd: spi-nor: read JEDEC ID with multiple I/O protocols
  mtd: spi-nor: set the read op code and protocol based on the
    manufacturer
  mtd: m25p80: add support of dual and quad spi protocols to all
    commands
  Documentation: atmel-quadspi: add binding file for Atmel QSPI driver
  mtd: atmel-quadspi: add driver for Atmel QSPI controller

 .../devicetree/bindings/mtd/atmel-quadspi.txt      |  29 +
 drivers/mtd/devices/m25p80.c                       | 262 ++++--
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/atmel-quadspi.c                | 880 +++++++++++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  |   2 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |  13 +-
 drivers/mtd/spi-nor/spi-nor.c                      | 603 ++++++++++++--
 include/linux/mtd/spi-nor.h                        |  68 +-
 9 files changed, 1689 insertions(+), 176 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c

-- 
1.8.2.2
