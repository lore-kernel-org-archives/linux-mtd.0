Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bptlO-0004dS-9m
 for linux-mtd@lists.infradead.org; Fri, 30 Sep 2016 09:05:56 +0000
From: linshunquan 00354166 <linshunquan1@hisilicon.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <robh@kernel.org>, <xuejiancheng@hisilicon.com>,
 <cyrille.pitchen@atmel.com>, <ezequiel@vanguardiasur.com.ar>,
 <jteki@openedev.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <howell.yang@hisilicon.com>, <jalen.hsu@hisilicon.com>,
 <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
 <kevin.lixu@hisilicon.com>, <lvkuanliang@hisilicon.com>,
 linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: [PATCH 0/2] Add the HiSilicon Flash Memory Controller driver 
Date: Fri, 30 Sep 2016 16:59:29 +0800
Message-ID: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
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

Brief:
The HiSilicon Flash Memory Controller(FMC) is feature-rich that supports
3 interfaces: SPI Nor, SPI Nand and Parallel Nand, choosed by the different
chipselect and boot media of board, these sub-controllers share the same
register block. The transmission protocol of each interface is different
depends on their own framework.

The HiSilicon Spi Nor framework you can refer to:
drivers/mtd/spi-nor/hisi-sfc.c
Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt

Shunquan Lin (2):
  mfd: Add HiSilicon Flash Memory Controller(FMC) driver
  mtd: spi nor: gets resource from HiSilicon Flash Memory Controller
    driver

 .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  62 ++++++++++++
 drivers/mfd/Kconfig                                |  10 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
 drivers/mtd/spi-nor/hisi-sfc.c                     |  86 ++--------------
 include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
 6 files changed, 280 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
 create mode 100644 drivers/mfd/hisi_fmc.c
 create mode 100644 include/linux/mfd/hisi_fmc.h

-- 
2.3.7
