Received: from mail-by2nam01on062a.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::62a]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eIBD1-0001wK-2l
 for linux-mtd@lists.infradead.org; Fri, 24 Nov 2017 10:27:48 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <marek.vasut@gmail.com>,
 <richard@nod.at>, <cyrille.pitchen@wedev4u.fr>
CC: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCH 0/2] mtd: m25p80: restore the addressing mode when stop using
 the flash
Date: Fri, 24 Nov 2017 18:08:46 +0800
Message-ID: <20171124100848.1828-1-Zhiqiang.Hou@nxp.com>
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
  mtd: spi-nor: add a API to restore the addressing mode
  mtd: m25p80: restore the addressing mode when stop using the flash

 drivers/mtd/devices/m25p80.c  | 8 ++++++++
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 include/linux/mtd/spi-nor.h   | 1 +
 3 files changed, 17 insertions(+)

-- 
2.14.1
