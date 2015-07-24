Received: from mail-bn1on0141.outbound.protection.outlook.com
 ([157.56.110.141] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIiSP-0003LS-A0
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:16:33 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH v3 0/8] mtd: spi-nor: fsl-quadspi fix and added i.mx7d and
 i.mxul support
Date: Sat, 25 Jul 2015 02:06:20 +0800
Message-ID: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
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

From: Frank Li <Frank.Li@freescale.com>

rebase to l2-mtd/next

Resend whole serial patch

Allen Xu (2):
  mtd: spi-nor: fsl-qspi: dynamically map memory space for AHB read
  mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the random QSPI access
    failed issue

Frank Li (5):
  mtd: spi-nor: fsl-quadspi: add imx7d support
  mtd: spi-nor: fsl-quadspi: add i.mx6ul support
  mtd: spi-nor: fsl-quadspi: workaround qspi can't wakeup from wait mode
  mtd: spi-nor: fsl-quadspi: reset the module in the probe
  mtd: spi-nor: fsl-quadspi: fix unsupported cmd when run flash_erase

Han Xu (1):
  mtd: spi-nor: fsl-quadspi: use quirk to distinguish different qspi
    version

 drivers/mtd/spi-nor/fsl-quadspi.c | 230 ++++++++++++++++++++++++++++++--------
 1 file changed, 183 insertions(+), 47 deletions(-)

-- 
1.9.1
