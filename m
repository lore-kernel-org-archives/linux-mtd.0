Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eakbS-0002Za-G7
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 15:53:49 +0000
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.16
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <13f60855-0108-3ecd-fabe-9e74e25f9150@wedev4u.fr>
Date: Sun, 14 Jan 2018 16:52:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

this is the spi-nor pull request for 4.16.

Best regards,

Cyrille

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.16

for you to fetch changes up to 23bae78e8a57f0249ed9e3f9c3f40fc1499ce0d4:

  mtd: mtk-nor: modify functions' name more generally (2018-01-14 16:14:06 +0100)

----------------------------------------------------------------
This pull-request contains the following notable changes:

Core changes:
* Add support to new ISSI and Cypress/Spansion memory parts.
* Fix support of Micron memories by checking error bits in the FSR.
* Fix update of block-protection bits by reading back the SR.
* Restore the internal state of the SPI flash memory when removing the
  device.

Driver changes:
* Maintenance for Freescale, Intel and Metiatek drivers.
* Add support of the direct access mode for the Cadence QSPI controller.

----------------------------------------------------------------
Aaron Sierra (1):
      mtd: spi-nor: Check that BP bits are set properly

Angelo Dureghello (1):
      mtd: spi-nor: add support for ISSI is25lp128

Bean Huo (beanhuo) (1):
      mtd: spi-nor: check FSR error bits for Micron memories

Fabio Estevam (1):
      dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names

Guochun Mao (1):
      mtd: mtk-nor: modify functions' name more generally

Hou Zhiqiang (2):
      mtd: spi-nor: add an API to restore the status of SPI flash chip
      mtd: m25p80: restore the status of SPI flash when exiting

Julia Lawall (1):
      mtd: fsl-quadspi: account for const type of of_device_id.data

Mika Westerberg (1):
      spi-nor: intel-spi: Remove unused preopcodes field

Rafael Gago (1):
      mtd: spi-nor: Add support for s25fl128l and s25fl256l

Romain Porte (1):
      mtd: spi-nor: Add ISSI is25lp080d support

Sean Nyekjaer (2):
      mtd: spi-nor: add support for is25lq040b
      mtd: spi-nor: indent issi section

Vignesh R (2):
      mtd: spi-nor: cadence-quadspi: Refactor indirect read/write sequence.
      mtd: spi-nor: cadence-quadspi: Add support for direct access mode

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt |   2 +-
 Documentation/mtd/spi-nor.txt                         |   3 ++
 drivers/mtd/devices/m25p80.c                          |   9 ++++++
 drivers/mtd/spi-nor/cadence-quadspi.c                 |  55 ++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/fsl-quadspi.c                     |   8 ++---
 drivers/mtd/spi-nor/intel-spi.c                       |   6 ----
 drivers/mtd/spi-nor/mtk-quadspi.c                     | 240 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------
 drivers/mtd/spi-nor/spi-nor.c                         |  75 +++++++++++++++++++++++++++++++++++++----------
 include/linux/mtd/spi-nor.h                           |  12 +++++++-
 9 files changed, 246 insertions(+), 164 deletions(-)
 
