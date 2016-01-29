From: Yunhui Cui <B56489@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yao.yuan@nxp.com>
Subject: [PATCH 0/3] mtd:fsl-quadspi:add support for the flash on LS1021ATWR
Date: Fri, 29 Jan 2016 19:41:06 +0800
Message-ID: <1454067669-35274-1-git-send-email-B56489@freescale.com>
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

This patch set depend on the patch:
{
https://patchwork.ozlabs.org/patch/545926/

LS1021a also support Freescale Quad SPI controller.
Add fsl-quadspi support for ls1021a chip and make SPI_FSL_QUADSPI
selectable for LS1021A SOC hardwares.
}

There is a N25Q128 flash on LS1021ATWR.
This patch test on this flash on LS1021ATWR board.
