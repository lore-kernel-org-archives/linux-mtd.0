Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBLqp-0002BN-PI
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 13:20:08 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [GIT PULL] mtd: spi-nor: updates for 4.10
To: Brian Norris <computersforpeace@gmail.com>
CC: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>, <cyrille.pitchen@atmel.com>
Message-ID: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
Date: Mon, 28 Nov 2016 14:19:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

this is my very first PR so let me know whether I should change something.

Best regards,

Cyrille

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://github.com/spi-nor/linux.git tags/spi-nor/for-4.10

for you to fetch changes up to dfce0cd943fe0554f5f79d5b29624064dafb18cd:

  mtd: spi-nor: constify fsl_qspi_devtype_data (2016-11-26 17:45:06 +0100)

----------------------------------------------------------------
This pull request contains the following notable changes:
- add support to new memory parts.
- fix of spansion_quad_enable().
- fix of the Candence QSPI driver.
- constify some structure instances of the Freescale QSPI driver.

----------------------------------------------------------------
Ash Benz (1):
      mtd: spi-nor: add Macronix mx25u25635f to list of known devices.

Dan Carpenter (2):
      mtd: spi-nor: Off by one in cqspi_setup_flash()
      mtd: spi-nor: Fix some error codes in cqspi_setup_flash()

Heiner Kallweit (1):
      mtd: spi-nor: fix flags for s25fl128s

IWAMOTO Masahiko (1):
      mtd: spi-nor: Add support for mr25h40

Jagan Teki (1):
      mtd: spi-nor: Add at25df321 spi-nor flash support

Joël Esponde (1):
      mtd: spi-nor: fix spansion quad enable

LABBE Corentin (1):
      mtd: spi-nor: constify fsl_qspi_devtype_data

Moritz Fischer (1):
      mtd: spi-nor: Add support for N25Q016A

Sean Nyekjaer (1):
      mtd: spi-nor: add support for s25fl208k

 drivers/mtd/spi-nor/cadence-quadspi.c |  6 ++++--
 drivers/mtd/spi-nor/fsl-quadspi.c     |  8 ++++----
 drivers/mtd/spi-nor/spi-nor.c         | 14 +++++++++++++-
 3 files changed, 21 insertions(+), 7 deletions(-)
