Received: from mail-sn1nam01on0066.outbound.protection.outlook.com
 ([104.47.32.66] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMQ8h-0006fL-CO
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 03:12:53 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv3 0/2] mtd: m25p80: restore the addressing mode when exiting
Date: Wed, 6 Dec 2017 10:53:40 +0800
Message-ID: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
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

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Restore the status to be compatible with legacy devices.
Take Freescale eSPI boot for example, it copies (in 3 Byte
addressing mode) the RCW and bootloader images from SPI flash
without firing a reset signal previously, so the reboot command
will fail without reseting the addressing mode of SPI flash.

Hou Zhiqiang (2):
  mtd: spi-nor: add an API to restore the status of SPI flash chip
  mtd: m25p80: restore the status of SPI flash when exiting

 Documentation/mtd/spi-nor.txt |  3 +++
 drivers/mtd/devices/m25p80.c  |  9 +++++++++
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
 include/linux/mtd/spi-nor.h   |  6 ++++++
 4 files changed, 28 insertions(+)

-- 
2.14.1
