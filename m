Received: from mail-sn1nam02on0078.outbound.protection.outlook.com
 ([104.47.36.78] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eM69h-0007SW-Ob
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 05:52:36 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv2 0/2] mtd: m25p80: restore the addressing mode when stop
 using the flash
Date: Tue, 5 Dec 2017 13:33:20 +0800
Message-ID: <20171205053322.35823-1-Zhiqiang.Hou@nxp.com>
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

To be compatible with legacy device, reset the addressing mode
to the default mode. Such as Freescale eSPI boot, it copies the
images from SPI flash without firing a reset signal previously,
so the reboot command will fail without reseting the addressing
mode of SPI flash.

Hou Zhiqiang (2):
  mtd: spi-nor: add an API to restore the status of SPI flash chip
  mtd: m25p80: restore the status of SPI flash when stop using it

 Documentation/mtd/spi-nor.txt |  3 +++
 drivers/mtd/devices/m25p80.c  |  9 +++++++++
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
 include/linux/mtd/spi-nor.h   |  6 ++++++
 4 files changed, 28 insertions(+)

-- 
2.14.1
