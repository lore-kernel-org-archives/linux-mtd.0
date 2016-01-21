Received: from mail-by2on0128.outbound.protection.outlook.com
 ([207.46.100.128] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMACM-0006qg-SX
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2016 08:02:31 +0000
From: Yuan Yao <yao.yuan@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yao.yuan@nxp.com>
Subject: mtd: spi-nor: fsl-quadspi: add support for ls1021a
Date: Thu, 21 Jan 2016 15:53:53 +0800
Message-ID: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
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

This patch set is used for add the fsl-quadspi support for ls1021a and
ls1043a, so remove the patch:
mtd: spi-nor: fsl-quadspi: extend support for some special requerment.

This patch will be send with anther patch set for add QSPI support on LS2080A.

All the new property are document in anther patch set which is already
send to linux-kernel@vger.kernel.org and devicetree@vger.kernel.org.
Here is the patch name:
0001-Documentation-fsl-quadspi-Add-fsl-ls2080a-dspi-compa.patch
0002-Documentation-fsl-quadspi-Add-fsl-ls2080a-qspi-compa.patch
0003-dts-ls2080a-update-the-DTS-for-QSPI-and-DSPI-support.patch
0004-Documentation-fsl-quadspi-Add-optional-properties.patch

Any extra information you can find them on the patchwork:
https://patchwork.kernel.org/patch/8078931/
https://patchwork.kernel.org/patch/8078951/
https://patchwork.kernel.org/patch/8079091/
https://patchwork.kernel.org/patch/8078941/

Thanks.

Yuan Yao.
