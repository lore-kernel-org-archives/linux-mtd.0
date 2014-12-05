Received: from mail-bl2on0054.outbound.protection.outlook.com ([65.55.169.54]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwyiI-0002G2-VU
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 19:38:51 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller
Date: Fri, 5 Dec 2014 13:35:31 -0600
Message-ID: <1417808133-20719-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset provides a driver for the Cadence Quad SPI Flash Controller.
This controller is used on SOCFPGA systems.

The driver was tested on Altera's Cyclone5 and Arria5 dev kits, with
Micron n25q00 and n25q512 flash parts.

Comments from Ezequiel Garcia were incorporated.

Graham Moore (2):
  mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
  mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.

 .../devicetree/bindings/mtd/cadence_quadspi.txt    |   50 +
 drivers/mtd/spi-nor/Kconfig                        |    6 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/cadence-quadspi.c              | 1281 ++++++++++++++++++++
 4 files changed, 1338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c

-- 
1.7.9.5
